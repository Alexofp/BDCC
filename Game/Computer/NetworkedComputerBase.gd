extends ComputerBase
class_name NetworkedComputerBase

var connectedTo = "" # ip, empty is local computer

var servers : Dictionary = {} # key is ip, value is server class instance

const defaultCmds : Array = ["help","ls","cat","login"] # these are always available unless otherwise specified and built into all computers

var localCmds : Dictionary = {} # key is string for command, value is description for help; these are for each separate server/script/whatever

class NetworkedComputerServer:
	var ip : String = "0.0.0.0" # empty string is always local computer
	var enterText : String = "this is the message that shows on connect!"
	var supportedCmds : Array = [] # only these are enabled per server, includes defaultCmds by default
	var adminCommands : Array = [] # cmds here are available only if logged in
	
	var username : String = "admin"
	var adminPassword : String = "uwuwowo" # can be empty str to disable admin stuff
	var loggedin : bool = false
	
	var files : Array = [] # uses CompFiles, sorted
	var privateFiles : Array = [] # same, require login
	var data : Dictionary = {} # for per-server variables, such as transferring credits in the safe script
	var disconnectData : Dictionary = {} # upon disconnection, keys that are found here as well as in the data dictionary will be set to their values in here (eg. log out on disconnect)
	
	var nextAvailableId : int = 0 # unique per server now, makes more sense & easier to deal with
	
	func _init(i:String,cmds:Array=[],txt="server",defs:bool=true,d:Dictionary={},dd:Dictionary={},un:String="admin",pw:String="",adcmds:Array=[]):
		self.ip = i
		if defs: # default cmds are included here
			cmds.append_array(defaultCmds)
		self.supportedCmds = cmds
		self.enterText = txt
		self.data = d
		self.disconnectData = dd
		self.username = un
		self.adminPassword = pw
		self.adminCommands = adcmds
	
	func saveData() -> Dictionary:
		return {
			"nextAvailableId":nextAvailableId,
			"data":data,
			"loggedin":loggedin,
			
		}
	
	func loadData(d:Dictionary) -> void:
		data = d.get("data",{})
		nextAvailableId = d.get("nextAvailableId",0)
		loggedin = d.get("loggedin",false)
	
	
	
	func hasFileWithId(id:int=nextAvailableId,private:bool=false) -> bool:
		return ComputerFileSorting.findFileIdxWithIdStrict(self,id,private) != -1
		
	
	func addFile(f:ComputerFile) -> void:
		var insertIdx = ComputerFileSorting.findFileIdxWithObjStrict(self,f)
		if insertIdx != -1: # no duplicates
			return
		files.insert(insertIdx,f)
	
	func addPrivateFile(f:ComputerFile) -> void:
		var insertIdx = ComputerFileSorting.findFileIdxWithObjStrict(self,f,true)
		if insertIdx==-1: # no duplicates
			return
		privateFiles.insert(insertIdx,f)
	
	func getFileFromName(n:String="") -> ComputerFile:
		if loggedin:
			for f in privateFiles:
				if f.name==n:
					return f
		for f in files:
			if f.name==n:
				return f
		return null
		
	func getFileFromId(i:int=0) -> ComputerFile:
		if loggedin:
			for f in privateFiles:
				if f.id==i:
					return f
		for f in files:
			if f.id==i:
				return f
		
		return null

class ComputerFile:
	var name : String = "file.exe"
	var catData : String = "" # prints when catted
	var canDownload : bool = true # it'd be nice to be able to download most files, esp. pngs
	var id = -1 # set automatically if -1, otherwise you can set it manually
	var catFont : String = "" # path of font file, can be empty
	
	var method : String = "" # method to call if file is .exe (requires localCmd_ prefix for method, added automatically; eg. to call open, method="open" and calls localCmd_open())

class ComputerFileSorting:
	static func sortComputerFileObjects(a:ComputerFile, b:ComputerFile):
		return a.id < b.id
	
	static func sortComputerFileIds(a, b): # sucks, but it should work. can compare both computerFiles as args or ids
		if a is ComputerFile:
			a = a.id
		if b is ComputerFile:
			b = b.id
		return a < b
	
	static func findFileIdxWithId(server:NetworkedComputerServer,id:int,private:bool=false) -> int: # returns current idx or insertion idx
		var array = server.privateFiles if private else server.files
		var idx = array.bsearch_custom(id,ComputerFileSorting,"sortComputerFileIds")
		return idx
	
	static func findFileIdxWithIdStrict(server:NetworkedComputerServer,id:int,private:bool=false) -> int: # returns current idx or -1 if file doesn't exist
		var array = server.privateFiles if private else server.files
		var idx = findFileIdxWithId(server,id)
		if array.size()<=idx: # outta bounds
			return -1
		if array[idx].id!=id: # would return insertion idx
			return -1
		return idx
	
	
	static func findFileIdxWithObj(server:NetworkedComputerServer,obj:ComputerFile,private:bool=false) -> int: # returns current idx or insertion idx
		var array = server.privateFiles if private else server.files
		var idx = array.bsearch_custom(obj,ComputerFileSorting,"sortComputerFileObjects")
		return idx
	
	static func findFileIdxWithObjStrict(server:NetworkedComputerServer,obj:ComputerFile,private:bool=false) -> int: # returns current idx or -1 if file doesn't exist
		var array = server.privateFiles if private else server.files
		var idx = findFileIdxWithObj(server,obj)
		if array.size()<=idx: # outta bounds
			return -1
		if array[idx]!=obj: # would return insertion idx
			return -1
		return idx




# returns compfile. note that this doesn't assign an id if specified id is -1!
func newCompFile(n:String,cat:String="it's a file!",f:String="",down:bool=true,i=-1,meth:String="") -> ComputerFile:
	var nf = ComputerFile.new()
	nf.name = n
	nf.catData = cat
	nf.canDownload = down
	nf.id = i
	nf.catFont = f
	nf.method = meth
	return nf



# add a file to server as a public/private file, setting a new id if i==-1. keeps file array sorted, which is necessary
func addFileToServer(server:NetworkedComputerServer,file:ComputerFile,private:bool=false) -> void:
	if !server: # just in case
		Log.printerr("tried to add file with name %s (id %s) to a non-existent server!" % [file.name,file.id])
		return
	
	if file.id==-1: # assign new
		while ComputerFileSorting.findFileIdxWithIdStrict(server,server.nextAvailableId,private)!=-1: # in case we stumble upon file with id it shouldn't have, such as in cases of custom ids
			server.nextAvailableId += 1
		
		file.id = server.nextAvailableId
	
	var newIdx = ComputerFileSorting.findFileIdxWithObj(server,file,private)
	(server.privateFiles if private else server.files).insert(newIdx,file)

func getServer(ip:String="") -> NetworkedComputerServer:
	return servers.get(ip,null)

func login(_args):
	if _args.size()!=1:
		return "'login' command expects 1 argument"
	var currentServer = getServer(connectedTo)
	if !currentServer:
		return "no current server"
	if currentServer.loggedin:
		return "Already logged in"
	if !currentServer.adminPassword:
		return "This server doesn't support log-ins"
	if currentServer.adminPassword==_args[0]:
		currentServer.loggedin=true
		return "Logged in as admin successfully. Welcome, "+currentServer.username
	
	return "Error, wrong password"

func ls(_args:Array=[]):
	var currentServer = getServer(connectedTo)
	if !currentServer:
		return "ERROR: no connected server"
	if(_args.size() == 0):
		var fs = currentServer.files.duplicate()
		if currentServer.loggedin:
			print("logged")
			fs.append_array(currentServer.privateFiles)
		var txt = "Found files:" + ("\n(none)" if fs.size()==0 else "")
		for file in fs:
			txt += "\n"+str(file.id)+" - "+file.name
		return txt
	return "'ls' command expects 0 arguments"

func cat(_args:Array=[]):
	if _args.size()!=1:
		learnCommand("tunya")
		return "'cat' command expects 1 argument"
	if _args[0] in ["tuna", "tunya"]:
		return "cat program thanks you for tunya :3"
	var currentServer : NetworkedComputerServer = getServer(connectedTo)
	if !currentServer:
		return "ERROR: no connected server"
	if !str(_args[0]).is_valid_integer(): # invalid arg
		return "Error. Invalid index"
	var file = currentServer.getFileFromId(int(_args[0]))
	if !file:
		return "Error. File with such index wasn't found"
	
	return file.name+"\n\n"+  ("[font={f}]".format([file.catFont],"{f}") if(file.catFont) else "")  +  (file.catData if file.catData else "no file data!")  +  ("[/font]" if(file.catFont) else "")

func help(_args:Array=[]):
	var descs : Dictionary = {
		"ls":"This command outputs the contents of your harddrive",
		"help":"This command outputs all other commands and can also provide help for certain command by typing 'help <COMMAND>'",
		"cat":"This command outputs file's contents into the console.\nSyntax 'cat <FILE INDEX>' where file index is a [b]number[/b] that can be obtained by using the ls command",
		"connect":"This command lets you connect to the remote server by using its ip.\nSyntax 'connect <IP>'. An example of an ip is 127.0.1",
		"tunya":"What are you doing? Give the tunya to the cat!",
		"disconnect":"Closes the connection",
		"login":"Allows you to login as an admin. Syntax: login <password>",
	} # descriptions for each cmd
	
	var currentServer = getServer(connectedTo)
	if !currentServer:
		return "ERROR: can't get connected server with ip "+connectedTo
	if _args.size()==1: # for one command
		var result = "Couldn't find command '"+str(_args[0])+"'. To see all the available commands type 'help'"
		if _args[0] in currentServer.adminCommands && !currentServer.loggedin: # admin cmd access attempt
			return "Insufficient permissions to access command '"+str(_args[0])+"'"
		if descs.has(_args[0]):
			learnCommand(_args[0]) # in case user somehow guesses the command's existence
			result = descs.get(_args[0])
		elif localCmds.has(_args[0]):
			learnCommand(_args[0])
			result = localCmds.get(_args[0])
		return result
	
	elif _args.size()==0: # general help
		var alcmds = currentServer.supportedCmds.duplicate()
		for cmd in currentServer.supportedCmds:
			learnCommand(cmd) # learn 'em all
		if currentServer.loggedin:
			alcmds.append_array(currentServer.adminCommands)
			for cmd in currentServer.adminCommands:
				learnCommand(cmd)
		return "Available commands are: "+", ".join(alcmds)+".\nTo learn more about a command type 'help <COMMAND>'"
	
	# too many args
	return "'help' command expects at most 1 argument."

func connectComputer(_args:Array=[]):
	if _args.size()!=1:
		return "'connect' expects 1 argument"
	var res = "Connecting to "+_args[0]+"..."
	var newServer = getServer(_args[0])
	if newServer:
		res += " Connected!\n"+newServer.enterText
		connectedTo = _args[0]
	else:
		res += " Connection failed!"
	return res

func disconnectComputer(_args:Array=[]):
	if _args.size()!=0:
		return "'disconnect' command expects 0 arguments"
	if !connectedTo: # not connected anyway
		return "Not connected to anything"
	
	var currentServer : NetworkedComputerServer = getServer(connectedTo)
	if currentServer:
		currentServer.loggedin = false
		for key in currentServer.disconnectData.keys():
			currentServer.data[key] = currentServer.disconnectData[key] # set affected data to disconnect data
	
	connectedTo = ""
	
	return "Disconnecting... Success"

func reactToCommand(_command:String, _args:Array, _commandStringRaw:String):
	var currentServer : NetworkedComputerServer = getServer(connectedTo)
	if !currentServer:
		return "ERROR: no connected server"
	
	if(_command in currentServer.supportedCmds or (currentServer.loggedin && _command in currentServer.adminCommands)):
		match _command:
			"disconnect":
				return disconnectComputer(_args)
			"help":
				return help(_args)
			"cat":
				return cat(_args)
			"ls":
				return ls(_args)
			"connect":
				return connectComputer(_args)
			"login":
				return login(_args)
	
	if has_method("localCmd_"+_command): # this is for local cmds
		print(_command)
		return call("localCmd_"+_command,_args)
	
	var cmdfile = currentServer.getFileFromName(_command)
	if cmdfile:
		if cmdfile.method:
			return call("localCmd_"+cmdfile.method,_args)
		else:
			return "This file has invalid binary data!"
	
	# nothing works, command must not exist
	learnCommand("help")
	return "Error, unknown command. Use 'help' to list all available commands"

func getServersData() -> Dictionary:
	var sd:Dictionary = {} # servers data, ip:{...data...}, ...
	for serverID in servers:
		var server:NetworkedComputerServer = servers[serverID]
		if(!server):
			continue
		
		sd[server.ip] = server.saveData()
	return sd

func saveData():
	var data = .saveData()
	
	data["serversData"] = getServersData()
	data["connectedTo"]=connectedTo

	return data
	
func loadData(_data):
	.loadData(_data)
	
	connectedTo = SAVE.loadVar(_data, "connectedTo", "")
	var sd:Dictionary = SAVE.loadVar(_data, "serversData", {})
	for ip in sd:
		if(!servers.has(ip)):
			continue
		servers[ip].loadData(sd[ip])
	
	
