extends ComputerBase
class_name NetworkedComputerBase

var connectedTo = ""

var nextFreeId = 0

var servers : Dictionary = {} # key is ip, value is server class instance

const defaultCmds : Array = ["help","ls","cat"] # these are always available unless otherwise specified and built into all computers

var localCmds : Dictionary = {} # key is string for command, value is description for help; these are for each separate server/script/whatever

class NetworkedComputerServer:
	var ip : String = "0.0.0.0" # empty string is always local computer
	var enterText : String = "this is the message that shows on connect!"
	var supportedCmds : Array = [] # only these are enabled per server
	var adminCommands : Array = [] # and these if logged in
	
	var username : String = "admin"
	var adminPassword : String = "uwuwowo" # can be empty str to disable admin stuff
	var loggedin : bool = false
	
	var files : Array = [] # uses CompFiles
	var privateFiles : Array = [] # same, require login
	var data : Dictionary = {} # for per-server variables, such as transferring credits in the safe script or setting an admin password
	var disconnectData : Dictionary = {} # upon disconnection, keys that are found here and in data will be set to their values in here (eg. log out on disconnect)
	
	
	
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
	func addFile(f:ComputerFile):
		if files.has(f): # no duplicates
			return
		files.append(f)
	func addPrivateFile(f:ComputerFile):
		if privateFiles.has(f): # no duplicates
			return
		privateFiles.append(f)
	func getFile(f:ComputerFile):
		var idx = -1
		idx = files.find(f)
		if idx==-1:
			if loggedin:
				idx = privateFiles.find(f)
				if idx==-1:
					return null
				return privateFiles[idx]
			else:
				return null
		return files[idx]
	func getFileFromName(n:String=""):
		for f in files:
			if f.name==n:
				return f
		if loggedin:
			for f in privateFiles:
				if f.name==n:
					return f
	func getFileFromId(i:int=0):
		for f in files:
			if f.id==i:
				return f
		if loggedin:
			for f in privateFiles:
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

func newCompFile(n:String,cat:String="it's a file!",f:String="",down:bool=true,i=-1,meth:String="") -> ComputerFile:
	var nf = ComputerFile.new()
	nf.name = n
	nf.catData = cat
	nf.canDownload = down
	if i!=-1:
		nf.id = i
	else:
		nf.id = nextFreeId
		nextFreeId += 1
	nf.catFont = f
	nf.method = meth
	return nf

func getServer(ip:String="") -> NetworkedComputerServer:
	return servers.get(ip,null)

func ls(_args:Array=[]):
	var currentServer = getServer(connectedTo)
	if !currentServer:
		return "ERROR: no connected server"
	if(_args.size() == 0):
		var fs = currentServer.files.duplicate()
		if currentServer.loggedin:
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
		if(!server.data.empty()):
			sd[server.ip] = server.data
	return sd

func saveData():
	var data = .saveData()
	
	data["serversData"] = getServersData()

	return data
	
func loadData(_data):
	.loadData(_data)
	
	var sd:Dictionary = SAVE.loadVar(_data, "serversData", {})
	for ip in sd:
		if(!servers.has(ip)):
			continue
		servers[ip].data = sd[ip]
	
	
