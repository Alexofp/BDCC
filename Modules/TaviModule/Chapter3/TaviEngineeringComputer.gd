extends ComputerBase

var connectedTo = ""

func _init():
	id = "TaviEngineeringComputer"

func reactToCommand(_command:String, _args:Array, _commandStringRaw:String):
	if(connectedTo == "127.0.10"):
		if(_command == "help"):
			if(_args.size() == 1):
				var tolearn = _args[0]
				
				if(tolearn == "disconnect"):
					return "Closes the connection"
				elif(tolearn == "mode"):
					return "Changes the operation mode of the door.\n'mode 0' is normal operation\n'mode 9' is maintenance mode"
				return "No help found for that command"
			learnCommand("disconnect")
			learnCommand("mode")
			return "Available commands:\ndisconnect\nmode"
		
		if(_command == "disconnect"):
			if(_args.size() == 0):
				connectedTo = ""
				return "Disconnecting... Success"
			else:
				return "'disconnect' command expects 0 arguments"
		
		if(_command == "mode"):
			if(_args.size() == 1):
				var modeStr = _args[0]
				if(modeStr == "0"):
					return "The door is already operating in this mode"
				elif(modeStr == "9"):
					markFinished()
					return "Switching the door to the maintenance mode! Warning, anyone will be able to open it. Switch back to mode 0 when done."
				return "Error, unsupported mode. Type 'help mode' for more information"
			else:
				return "'mode' command expects 1 argument. Type 'help mode' for more information"
		return "Error, unknown command. Use 'help' to list all available commands"
	
	if(connectedTo == "127.0.69"):
		if(_command == "help"):
			if(_args.size() == 0):
				learnCommand("disconnect")
				learnCommand("ls")
				learnCommand("cat")
				return "Available commands:\ndisconnect\nls\ncat"
			else:
				return "'help' command expects 0 arguments. Server owner is too lazy to write descriptions for each command."
		
		if(_command == "disconnect"):
			if(_args.size() == 0):
				connectedTo = ""
				return "Disconnecting... Success"
			else:
				return "'disconnect' command expects 0 arguments"
		
		if(_command == "ls"):
			if(_args.size() == 0):
				return "Found files:\n1 - porn.png\n2 - sex.png\n3 - mouwse.png\n4 - railme.png"
			else:
				return "'ls' command expects 0 arguments"
			
		if(_command == "cat"):
			if(_args.size() == 1):
				var fileToShow = _args[0]
				if(fileToShow in ["1", "porn.png"]):
					return "porn.png\n\n[font=res://Fonts/smallconsolefont.tres]"+Util.readFile("res://Images/asciiporn/taviquest/porn.txt")+"[/font]"
				if(fileToShow in ["2", "sex.png"]):
					return "sex.png\n\n[font=res://Fonts/smallconsolefont.tres]"+Util.readFile("res://Images/asciiporn/taviquest/sex.txt")+"[/font]"
				if(fileToShow in ["3", "mouwse.png"]):
					return "mouwse.png\n\n[font=res://Fonts/smallconsolefont.tres]"+Util.readFile("res://Images/asciiporn/taviquest/mouwse.txt")+"[/font]"
				if(fileToShow in ["4", "railme.png"]):
					return "railme.png\n\n[font=res://Fonts/smallconsolefont.tres]"+Util.readFile("res://Images/asciiporn/taviquest/railme.txt")+"[/font]"
				return "No file found with such index!"
			else:
				return "'cat' command expects 1 argument"
		
		return "Error, unknown command. Use 'help' to list all available commands"
	
	
	
	if(connectedTo == ""):
		if(_command == "connect"):
			if(_args.size() == 1):
				var server = _args[0]
				if(server in ["127.0.69", "127.0.10"]):
					connectedTo = server
					if(server == "127.0.69"):
						return "Connecting to "+server+"... Connected!\nWelcome to horny bread's secret lair. We have a strict NO PANTS policy. Please enjoy yourself!\nTo see what commands this server supports type 'help'"
					if(server == "127.0.10"):
						return "Connecting to "+server+"... Connected!\nDoor status: LOCKED\nLast maintenance: [cuss]9999999[/cuss] days ago"
				else:
					return "Connecting to "+server+"... Connection failed!"
			else:
				return "'connect' expects 1 argument"
		
		if(_command == "ls"):
			if(_args.size() == 0):
				return "Found 2 files:\n1 - readme.txt\n2 - forum.html"
			else:
				return "This command expects 0 arguments"
		if(_command == "cat"):
			if(_args.size() == 1):
				var fileIndex = _args[0]
				if(fileIndex in ["1", "readme.txt"]):
					return "Useful shit:\n1[cuss]27.0.69[/cuss] - Server with some porn, I know you would find it eventually, you degenerates\n127.0.10 - bluespace transmitter door, don't touch it unless you were told to\n\nDon't bug me about how to connect to these, RTFM. Or type 'help connect' if you never worked with a terminal before."
				elif(fileIndex in ["2", "forum.html"]):
					return "...**[corrupt]corrupted data[/corrupt]**...\n\n<message>Why the fuck are we using such outdated hardware?</message>\n<message>If it works, don't fix it. It's a piece of shit but you're not gonna play doom on it, this machine supports telnet and that's all we need.</message>\n<message>The fuck is telnet?</message>\n<message>It's what we used before bluespace got discovered. Just read the fucking readme already.</message>\n\n...**[corrupt]more corrupted data[/corrupt]**..."
				elif(fileIndex in ["tuna", "tunya"]):
					return "cat program thanks you for tunya :3"
				else:
					return "Error. File with such index wasn't found"
			else:
				learnCommand("tunya")
				return "'cat' expects 1 argument (or tunya)"
		
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
				else:
					return "Couldn't find command '"+str(tolearn)+"'. To see all the available commands type 'help'"
				
			elif(_args.size() == 0):
				learnCommand("help")
				learnCommand("ls")
				learnCommand("cat")
				learnCommand("connect")
				return "Available commands are: ls, cat, connect, help.\nTo learn more about a command type 'help <COMMAND>'"
			else:
				learnCommand("help")
				return "'help' expects 0 or 1 arguments"
			
		learnCommand("help")
		return "Error, unknown command. Use 'help' to list all available commands"

var tutorialData = [
	["*", "This minigame simulates a simple console. If you ever used cmd or bash, you will feel right at home. Otherwise, just follow this tutorial.", "type anything"],
	["help", "Start by getting the list of commands.", "Select 'help' and then press Send"],
	["help ls", "You learned new commands. Use the help command to figure out the 'ls' command", "Select 'help', then select 'ls' and then press Send"],
	["ls", "Now try to execute this command", "Select 'ls' and press Send"],
	["help cat", "Now try to figure out how to use the cat command", "Select 'help', then select 'cat' and press Send"],
	["cat 1", "Use the cat command to output the contents of the first file", "Select 'cat', then switch to the numpad and select '1' before pressing Send"],
	["connect 127.0.10", "Try to connect to the door that leads to the bluespace transmitter", "Select 'connect', then switch to the numpad and use it to type '127.0.10'. Then press Send"],
	["help", "You connected to a new server. Figure out what commands it support", "Type 'help' and press Send"],
	["help mode", "Figure out how to use the mode command", "Select 'help', then select 'mode' and press Send"],
	["mode 9", "Switch the door to the maintenance mode", "Select 'mode', then switch to the numpad and select 9 before pressing Send"],
]
var currentTutorialStep = 0
var shouldSpoilHint = false

func getTutorial():
	if(currentTutorialStep >= tutorialData.size()):
		return
	
	var currentTutStep = tutorialData[currentTutorialStep]
	
	var currentText = currentTutStep[1]
	#var currentExpectedCommand = currentTutStep[0]
	if(shouldSpoilHint && currentTutStep.size() > 2):
		currentText += " ("+currentTutStep[2]+")"

	return currentText

func progressTutorial():
	if(currentTutorialStep >= tutorialData.size()):
		return
	var currentTutStep = tutorialData[currentTutorialStep]
	var currentExpectedCommand = currentTutStep[0]
	
	if(lastCommand != ""):
		if(lastCommand == currentExpectedCommand || currentExpectedCommand == "*"):
			currentTutorialStep += 1
			shouldSpoilHint = false
		else:
			shouldSpoilHint = true

func saveData():
	var data = .saveData()
	
	data["connectedTo"] = connectedTo
	data["currentTutorialStep"] = currentTutorialStep
	data["shouldSpoilHint"] = currentTutorialStep
	
	return data
	
func loadData(data):
	.loadData(data)
	
	connectedTo = SAVE.loadVar(data, "connectedTo", "")
	currentTutorialStep = SAVE.loadVar(data, "currentTutorialStep", 0)
	shouldSpoilHint = SAVE.loadVar(data, "shouldSpoilHint", false)
