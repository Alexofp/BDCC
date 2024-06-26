extends ComputerBase

var connectedTo = ""
var loggedAsAdmin = false
var downloadedBrute = false
var downloadedBruteV2 = false
var transferredCredits = false

func _init():
	id = "TaviEngineeringSafeComputer"

func reactToCommand(_command:String, _args:Array, _commandStringRaw:String):
	if(connectedTo == "127.0.24"):
		if(_command == "help"):
			if(_args.size() == 1):
				var tolearn = _args[0]
				
				if(tolearn == "disconnect"):
					return "Closes the connection"
				elif(tolearn == "login"):
					return "Allows you to login as an admin. Syntax: login <password>"
				elif(tolearn == "open"):
					return "Opens the safe"
				return "No help found for that command"
			learnCommand("disconnect")
			learnCommand("login")
			learnCommand("open")
			return "Available commands:\ndisconnect\nlogin\nopen"
		
		if(_command == "disconnect"):
			if(_args.size() == 0):
				connectedTo = ""
				loggedAsAdmin = false
				return "Disconnecting... Success"
			else:
				return "'disconnect' command expects 0 arguments"
		
		if(_command == "open"):
			if(loggedAsAdmin):
				markFinished()
				return "Opening the safe..."
			else:
				return "Error, Access denied!"
		
		if(_command == "login"):
			if(loggedAsAdmin):
				return "Already logged in"
			
			if(_args.size() == 1):
				var modeStr = _args[0]
				if(modeStr == "5327"):
					loggedAsAdmin = true
					return "Logged in as admin successfully. Welcome, Bob"
				return "Error, wrong password"
			else:
				return "'login' command expects 1 argument. Type 'help login' for more information"
		return "Error, server doesn't support this command. Use 'help' to list all available commands"
	
	if(connectedTo == "127.0.53"):
		if(_command == "help"):
			if(_args.size() == 1):
				var tolearn = _args[0]
				
				if(tolearn == "disconnect"):
					return "Closes the connection"
				elif(tolearn == "login"):
					return "Allows you to login as an admin. Syntax: login <password>"
				elif(tolearn == "ls"):
					return "This command outputs the contents of your harddrive"
				elif(tolearn == "cat"):
					return "This command outputs file's contents into the console.\nSyntax 'cat <FILE INDEX>' where file index is a [b]number[/b] that can be obtained by using the ls command"
				elif(tolearn == "wget"):
					return "Download a file from the server. Syntax 'wget <FILE INDEX>' where file index is a [b]number[/b] that can be obtained by using the ls command"
				elif(tolearn == "withdraw" && loggedAsAdmin):
					return "Transfers credits to your console where you can withdraw them."
				return "No help found for that command"
			learnCommand("disconnect")
			learnCommand("login")
			learnCommand("ls")
			learnCommand("cat")
			learnCommand("wget")
			if(loggedAsAdmin):
				learnCommand("withdraw")
				return "Available commands:\ndisconnect\nlogin\nls\ncat\nwget\nwithdraw"
			return "Available commands:\ndisconnect\nlogin\nls\ncat\nwget"
		
		if(_command == "withdraw" && loggedAsAdmin):
			if(transferredCredits):
				return "The account is empty, ask people to donate more often or we will go out of bussiness and be forced to close :("
			else:
				transferredCredits = true
				GM.pc.addCredits(10)
				return "Transferring 10 credits to your account.. success!"
		
		if(_command == "disconnect"):
			if(_args.size() == 0):
				connectedTo = ""
				loggedAsAdmin = false
				return "Disconnecting... Success"
			else:
				return "'disconnect' command expects 0 arguments"
		
		if(_command == "login"):
			if(loggedAsAdmin):
				return "Already logged in"
			
			if(_args.size() == 1):
				var modeStr = _args[0]
				if(modeStr == "42069"):
					loggedAsAdmin = true
					return "Logged in as admin successfully. Welcome, xxxDark-Masterxxx"
				return "Error, wrong password"
		
		if(_command == "wget"):
			if(_args.size() == 1):
				var programtodownload = _args[0]
				if(programtodownload in ["2", "forum.html"]):
					return "Error, unable to download html files"
				if(loggedAsAdmin && (programtodownload in ["69", "babe.png", "123", "petplay.png"])):
					return "Error, unable to download png files"
				if(programtodownload in ["1", "brute.exe"]):
					if(downloadedBrute):
						return "You already have this file"
					else:
						downloadedBrute = true
						learnCommand("brute.exe")
						return "Downloading brute.exe... Success!"
				if(programtodownload in ["420", "brutev2.exe"]):
					if(!loggedAsAdmin):
						return "ACCESS DENIED"
					
					if(downloadedBruteV2):
						return "You already have this file"
					else:
						downloadedBruteV2 = true
						learnCommand("brutev2.exe")
						return "Downloading brutev2.exe... Success!"
				return "FILE NOT FOUND"
			else:
				return "This command expects 0 arguments"
		
		if(_command == "ls"):
			if(_args.size() == 0):
				if(loggedAsAdmin):
					return "Found 5 files:\n1 - brute.exe\n2 - forum.html\n69 - babe.png\n123 - petplay.png\n420 - brutev2.exe"
				return "Found 2 files:\n1 - brute.exe\n2 - forum.html"
			else:
				return "This command expects 0 arguments"
	
	
		if(_command == "cat"):
			if(_args.size() == 1):
				var fileIndex = _args[0]
				if(fileIndex in ["1", "brute.exe"]):
					return "Error, unable to display a binary file"
				elif(fileIndex in ["2", "forum.html"]):
					learnCommand("wget")
					return "<message>Guys, how do I use the brute.exe program?</message>\n<message>Super simple. [cuss]Download it from the server[/cuss] using wget [cuss]and then run like so[/cuss] 'brute.exe SERVER_IP'. [cuss]It will try to bruteforce the password[/cuss].</message>"
				elif(loggedAsAdmin && (fileIndex in ["69", "babe.png"])):
					return "babe.png\n\n[font=res://Fonts/smallconsolefont.tres]"+Util.readFile("res://Images/asciiporn/taviquest/babe.txt")+"[/font]"
				elif(loggedAsAdmin && (fileIndex in ["123", "petplay.png"])):
					return "petplay.png\n\n[font=res://Fonts/smallconsolefont.tres]"+Util.readFile("res://Images/asciiporn/taviquest/petplay.txt")+"[/font]"
				else:
					return "Error. File with such index wasn't found"
			else:
				learnCommand("tunya")
				return "'cat' expects 1 argument"
				
		return "Error, server doesn't support this command"
	
	if(connectedTo == ""):
		if(_command == "connect"):
			if(_args.size() == 1):
				var server = _args[0]
				if(server in ["127.0.24", "127.0.53"]):
					connectedTo = server
					if(server == "127.0.24"):
						return "Connecting to "+server+"... Connected!\nSafe server status: Operational.\nDoor status: Closed"
					if(server == "127.0.53"):
						return "Connecting to "+server+"... Connected!\nLogged in as guest. Welcome to our public server, feel free to share anything you want.\nAlso, feel free to donate, we only have 10 credits out of a 100 that we need for hosting"
				else:
					return "Connecting to "+server+"... Connection failed!"
			else:
				return "'connect' expects 1 argument"
		
		if(_command == "brute.exe" && downloadedBrute):
			if(_args.size() == 1):
				var iptohack = _args[0]
				if(iptohack == "127.0.24"):
					return "Connecting... success..\nAttempting to bruteforce the password..\nError, this server has a protection against simple bruteforcing.\n\nSmart bruteforcing required\nBuy our brand new brutev2.exe to be able to hack any server!\nPrice: only 99999 credits\nSend to our dumcoin account [cuss]5329751923[/cuss]\n\nUnable to bruteforce the password.\nShutting down.."
				if(iptohack == "127.0.53"):
					return "Connecting... success..\nAttempting to bruteforce the password..\nSuccess!!! Password is '42069'.\nShutting down.."
				
				return "Error, Unable to connect to this ip"
			else:
				return "Syntax: brute.exe ip"
		
		if(_command == "brutev2.exe" && downloadedBruteV2):
			if(_args.size() == 1):
				var iptohack = _args[0]
				if(iptohack == "127.0.24"):
					return "Connecting... success..\nAttempting to bruteforce the password..\nSuccess!!! Password is '5327'.\nShutting down.."
				if(iptohack == "127.0.53"):
					return "Connecting... success..\nAttempting to bruteforce the password..\nSuccess!!! Password is '42069'.\nShutting down.."
				
				return "Error, Unable to connect to this ip"
			else:
				return "Syntax: brutev2.exe ip"
		
		if(_command == "ls"):
			if(_args.size() == 0):
				return "Found 2 files:\n1 - safe.txt\n2 - forum.html"
			else:
				return "This command expects 0 arguments"
		if(_command == "cat"):
			if(_args.size() == 1):
				var fileIndex = _args[0]
				if(fileIndex in ["1", "safe.txt"]):
					return "The safe has a few credit chips that we confiscated from the inmates. Somehow they found a way to duplicate them which caused all sorts of problems. Hopefully there are no more of them going around.\n\nThe safe's ip is 127.0.24\nYou should know the admin's password. If you forgot it - you will have to hack it.\nGood luck"
				elif(fileIndex in ["2", "forum.html"]):
					return "...**[corrupt]corrupted data[/corrupt]**...\n\n<message>Hey guys. What do I do if I forgot my password to one of the servers and I can't login anymore?</message>\n<message>lol noob</message>\n<message>I had such problem. But I just remembered the password one day</message>\n<message>I heard there is a program that can bruteforce password, check this server 127.0.55</message>\n<message>Thanks for the answers guys, real helpful. And I'm not gonna download some shady crap.</message>\n<message>Oh, btw, the ip's last 2 numbers are [corrupt]53[/corrupt], not 55.</message>\n\n...**[corrupt]more corrupted data[/corrupt]**..."
				elif(fileIndex in ["tuna", "tunya"]):
					return "cat program thanks you for tunya :3"
				else:
					return "Error. File with such index wasn't found"
			else:
				learnCommand("tunya")
				return "'cat' expects 1 argument (or tunya)"
		if(_command == "quit"):
			markFinishedFail()
			return "Shutting down.."
		
		if(_command == "help"):
			if(_args.size() == 1):
				var tolearn = _args[0]
				if(tolearn == "help"):
					return "This command outputs all other commands and can also provide help for certain command by typing 'help <COMMAND>'"
				elif(tolearn == "ls"):
					return "This command outputs the contents of your harddrive"
				elif(tolearn == "cat"):
					return "This command outputs file's contents into the console.\nSyntax 'cat <FILE INDEX>' where file index is a [b]number[/b] that can be obtained by using the ls command"
				elif(tolearn == "connect"):
					return "This command lets you connect to the remote server by using its ip.\nSyntax 'connect <IP>'. An example of an ip is 127.0.1"
				elif(tolearn == "tunya"):
					return "What are you doing? Give the tunya to the cat!"
				elif(tolearn == "quit"):
					return "Shutdown the console"
				else:
					return "Couldn't find command '"+str(tolearn)+"'. To see all the available commands type 'help'"
				
			elif(_args.size() == 0):
				learnCommand("help")
				learnCommand("ls")
				learnCommand("cat")
				learnCommand("connect")
				learnCommand("quit")
				return "Available commands are: ls, cat, connect, help, quit.\nTo learn more about a command type 'help <COMMAND>'"
			else:
				learnCommand("help")
				return "'help' expects 0 or 1 arguments"
			
		learnCommand("help")
		return "Error, unknown command. Use 'help' to list all available commands"

func saveData():
	var data = .saveData()
	
	data["connectedTo"] = connectedTo
	data["loggedAsAdmin"] = loggedAsAdmin
	data["downloadedBrute"] = downloadedBrute
	data["downloadedBruteV2"] = downloadedBruteV2
	data["transferredCredits"] = transferredCredits
	
	return data
	
func loadData(data):
	.loadData(data)
	
	connectedTo = SAVE.loadVar(data, "connectedTo", "")
	loggedAsAdmin = SAVE.loadVar(data, "loggedAsAdmin", false)
	downloadedBrute = SAVE.loadVar(data, "downloadedBrute", false)
	downloadedBruteV2 = SAVE.loadVar(data, "downloadedBruteV2", false)
	transferredCredits = SAVE.loadVar(data, "transferredCredits", false)
