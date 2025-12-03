extends NetworkedComputerBase

func _init():
	id = "TaviEngineeringSafeComputer"
	
	# create local server & files
	var locals = Server.new("",["connect","quit"])
	locals.addFile(newCompFile("safe.txt","The safe has a few credit chips that we confiscated from the inmates. Somehow they found a way to duplicate them which caused all sorts of problems. Hopefully there are no more of them going around.\n\nThe safe's ip is 127.0.24\nYou should know the admin's password. If you forgot it - you will have to hack it.\nGood luck","",true,1))
	locals.addFile(newCompFile("forum.html","...**[corrupt]corrupted data[/corrupt]**...\n\n<message>Hey guys. What do I do if I forgot my password to one of the servers and I can't login anymore?</message>\n<message>lol noob</message>\n<message>I had such problem. But I just remembered the password one day</message>\n<message>I heard there is a program that can bruteforce password, check this server 127.0.55</message>\n<message>Thanks for the answers guys, real helpful. And I'm not gonna download some shady crap.</message>\n<message>Oh, btw, the ip's last 2 numbers are [corrupt]53[/corrupt], not 55.</message>\n\n...**[corrupt]more corrupted data[/corrupt]**...","",true,2))
	
	# create safe server
	var safes = Server.new("127.0.24",["login","open","disconnect","help"],"Safe server status: Operational.\nDoor status: Closed",false,{},{},"Bob","5327")
	
	
	# create public server & files
	var publics = Server.new("127.0.53",["login","wget","disconnect"],"Logged in as guest. Welcome to our public server, feel free to share anything you want.\nAlso, feel free to donate, we only have 10 credits out of a 100 that we need for hosting",true,{"credits":10},{},"xxxDark-Masterxxx","42069",["withdraw"])
	publics.addFile(newCompFile("brute.exe","Error, unable to display a binary file","font",true,1,"brute"))
	publics.addFile(newCompFile("forum.html","<message>Guys, how do I use the brute.exe program?</message>\n<message>Super simple. [cuss]Download it from the server[/cuss] using wget [cuss]and then run like so[/cuss] 'brute.exe SERVER_IP'. [cuss]It will try to bruteforce the password[/cuss].</message>","font",true,2))
	publics.addPrivateFile(newCompFile("babe.png",Util.readFile("res://Images/asciiporn/taviquest/babe.txt"),"res://Fonts/smallconsolefont.tres",true,69))
	publics.addPrivateFile(newCompFile("petplay.png",Util.readFile("res://Images/asciiporn/taviquest/petplay.txt"),"res://Fonts/smallconsolefont.tres",true,123))
	publics.addPrivateFile(newCompFile("brutev2.exe","Error, unable to display a binary file","font",true,420,"brutev2"))
	
	# add servers
	servers = {
		"":locals,
		"127.0.53":publics,
		"127.0.24":safes,
	}
	
	# set cmds
	localCmds["open"]="Opens the safe"
	localCmds["login"]="Allows you to login as an admin. Syntax: login <password>"
	localCmds["withdraw"]="Transfers credits to your console where you can withdraw them."
	localCmds["wget"]="Download a file from the server. Syntax 'wget <FILE INDEX>' where file index is a [b]number[/b] that can be obtained by using the ls command"

func localCmd_wget(_args):
	if(_args.size() != 1):
		return "'wget' command expects 0 arguments"
	if !str(_args[0]).is_valid_integer():
		return "Invalid index"
	var currentServer : Server = getServer(connectedTo)
	if !currentServer:
		return "no current server"
	
	var file : CompFile = currentServer.getFileFromId(int(_args[0]))
	if !file:
		return "File not found in current scope"+(". Try logging in as admin" if(!currentServer.loggedin) else "")
	var blacklist = ["html","png"] # blacklisted extensions
	
	if _args[0].get_extension() in blacklist:
		return "Error, unable to download "+file.get_extension()+" files"
	
	if getServer("").getFileFromName(_args[0]):
		return "You already have this file"
	var nid = getServer("").files.size()+1+getServer("").privateFiles.size() # new id
	var nf = newCompFile(file.name,file.catData,file.catFont,file.canDownload,nid,file.method)
	getServer("").addFile(nf)
	if file.method: # for executables
		learnCommand(file.method)
	return "Downloading "+file.name+"... Success!"

func localCmd_open(_args):
	if _args.size()!=0:
		return "'open' command expects 0 arguments"
	
	var currentServer = getServer(connectedTo)
	if !currentServer:
		return "no current server"
	if currentServer.loggedin:
		markFinished()
		return "Opening the safe..."
	return "Error, Access denied!"

func localCmd_quit(_args):
	markFinishedFail()
	return "Shutting down.."

func localCmd_login(_args):
	if _args.size()!=1:
		return "'login' command expects 1 argument"
	var currentServer = getServer(connectedTo)
	if !currentServer:
		return "no current server"
	if currentServer.loggedin:
		return "Already logged in"
	if currentServer.adminPassword==_args[0]:
		currentServer.loggedin=true
		return "Logged in as admin successfully. Welcome, "+currentServer.username
	else:
		return "Error, wrong password"

func localCmd_brute(_args):
	if(_args.size() == 1):
		var iptohack = _args[0]
		if(iptohack == "127.0.24"):
			return "Connecting... success..\nAttempting to bruteforce the password..\nError, this server has a protection against simple bruteforcing.\n\nSmart bruteforcing required\nBuy our brand new brutev2.exe to be able to hack any server!\nPrice: only 99999 credits\nSend to our dumcoin account [cuss]5329751923[/cuss]\n\nUnable to bruteforce the password.\nShutting down.."
		if(iptohack == "127.0.53"):
			return "Connecting... success..\nAttempting to bruteforce the password..\nSuccess!!! Password is '42069'.\nShutting down.."
		return "Error, Unable to connect to this ip"
	
	return "Syntax: brute.exe <IP>"

func localCmd_brutev2(_args):
	if(_args.size() == 1):
		var iptohack = _args[0]
		if(iptohack == "127.0.24"):
			return "Connecting... success..\nAttempting to bruteforce the password..\nSuccess!!! Password is '5327'.\nShutting down.."
		if(iptohack == "127.0.53"):
			return "Connecting... success..\nAttempting to bruteforce the password..\nSuccess!!! Password is '42069'.\nShutting down.."
		
		return "Error, Unable to connect to this ip"
	return "Syntax: brutev2.exe <IP>"

func localCmd_withdraw(_args):
	if _args.size()!=0:
		return "'withdraw' expects 0 arguments"
	var currentServer = getServer(connectedTo)
	if !currentServer:
		return "no current server"
	
	if !currentServer.loggedin:
		return "Insufficient access"
	
	var creds = currentServer.data.get("credits",0)
	if creds==0:
		return "The account is empty, ask people to donate more often or we will go out of bussiness and be forced to close :("
	else:
		currentServer.data["credits"]=0
		GM.pc.addCredits(creds)
		return "Transferring "+str(creds)+" credits to your account.. success!"
