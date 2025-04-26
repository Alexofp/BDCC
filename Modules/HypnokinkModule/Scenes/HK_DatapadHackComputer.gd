extends ComputerBase

var connectedTo = ""
var plugSpeed = 0
var lastCageCmd = "disconnect"

func _init():
	id = "DatapadHackComputer"
	introText = "ProbY v1.21 localnet device RMI utility\nInformation wants to be free!"

func reactToCommand(_command:String, _args:Array, _commandStringRaw:String):
	if(_command == "skiptut"):
		currentTutorialStep = 9999
		return "Tutorial skipped."
	if(connectedTo == ""):
		return reactToCommandLocalhost(_command, _args, _commandStringRaw)
	elif(connectedTo == "deloxekarat_default"):
		return reactToCommandCage(_command, _args, _commandStringRaw)
	elif(connectedTo == "viplug_m_default"):
		return reactToCommandPlug(_command, _args, _commandStringRaw)
	
func reactToCommandLocalhost(_command: String, _args:Array, _commandStringRaw:String):
	if(_command == "connect"):
		if(_args.size() == 1):
			var device = _args[0]
			if(device in ["grd_radio_3511", "1"]):
				return "Connecting to grd_radio_3511...\nCredentials not found. Connection aborted.\n[Nice try, but no. - Alex]"
			if(device in ["grd_radio_1447", "2"]):
				return "Connecting to grd_radio_1447...\nCredentials not found. Connection aborted.\n[Nice try, but no. - Alex]"
			elif(device in ["deloxekarat_default", "3"]):
				connectedTo = "deloxekarat_default"
				return "Connecting to deloxekarat_default...\nConnected using default login and password for manufacturer/device."
			elif(device in ["viplug_m_default", "4"]):
				connectedTo = "viplug_m_default"
				return "Connecting to viplug_m_default...\nConnected using default login and password for manufacturer/device."
			else:
				return "Connecting to "+device+"...\nDevice not found."
		else:
			return "This command expects 1 argument"
	
	if(_command == "probe"):
		if(_args.size() == 0):
			return "Scanning...\nDone. Found 4 devices.\n1 - grd_radio_3511\n2 - grd_radio_1447\n3 - deloxekarat_default\n4 - viplug_m_default"
		else:
			return "This command expects 0 arguments"
			
	if(_command == "exit"):
		markFinishedFail()
		return "Goodbye, and have a well connected day!"
		
	if(_command == "help"):
		if(_args.size() == 1):
			var tolearn = _args[0]
			if(tolearn == "help"):
				return "This command outputs all other commands and can also provide help for certain command by typing 'help <COMMAND>'."
			elif(tolearn == "probe"):
				return "This command scans for locally available BT devices."
			elif(tolearn == "exit"):
				return "This command exits the program."
			elif(tolearn == "connect"):
				return "This command lets you connect to a remote wireless device by using its BT identifier.\nSyntax 'connect <BT>'"
			else:
				return "Couldn't find command '"+str(tolearn)+"'. To see all the available commands type 'help'."
			
		elif(_args.size() == 0):
			learnCommand("help")
			learnCommand("probe")
			learnCommand("connect")
			learnCommand("exit")
			return "Available commands are: \nconnect\nprobe\nexit\nhelp\nTo learn more about a command type 'help <COMMAND>'"
		else:
			learnCommand("help")
			return "'help' expects 0 or 1 arguments"
			
	learnCommand("help")
	return "Error, unknown command. Use 'help' to list all available commands"
	
const memPosMap = {
			"unlock": "[color=#88FF88][6,8][/color] (5 bytes read)",
			"disconnect": "[color=#88FF88][4,16][/color] (10 bytes read)",
			"monitor": "[color=#88FF88][8,0][/color] (170 bytes read)",
			"help": "[color=#FF8888][17,4][/color] (78 bytes read)",
			"strscan": "[color=#FF8888][external memory][/color] (? bytes read)",
		}
		
const strMap = {
			"1": [" [color=#88FF88][0,8][/color] ", "DeLoxe S3-Karat v1.0.7"],
			"2": [" [color=#88FF88][1,8][/color] ", "SEGFAULT at: %s"],
			"3": [" [color=#88FF88][2,0][/color] ", "Vion"],
			"4": [" [color=#88FF88][2,24][/color]", "locked"],
			"5": [" [color=#88FF88][3,0][/color] ", "unlocked"],
			"6": [" [color=#88FF88][3,12][/color]", "Operating"],
			"7": [" [color=#88FF88][3,24][/color]", "Inactive"],
			"8": [" [color=#88FF88][4,16][/color]", "Disconnecting..."],
			"9": [" [color=#88FF88][5,4][/color] ", "Ready."],
			"10": ["[color=#88FF88][6,0][/color] ", "default"],
			"11": ["[color=#88FF88][6,8][/color] ", "block"],
			"12": ["[color=#88FF88][6,20][/color]", "override"],
			"13": ["[color=#88FF88][7,0][/color] ", "Code "],
			"14": ["[color=#88FF88][7,8][/color] ", "valid."],
			"15": ["[color=#88FF88][7,16][/color]", "invalid."]
		}

const NI = "[color=#FFFF00]|[/color]"
const CR = "[color=#FFAAAA]¬[/color]"
const HI = "[color=#AAAAFF]"
const NO = "[color=#FFFFFF]"

func reactToCommandCage(_command: String, _args:Array, _commandStringRaw:String):
	if(_command == "disconnect"):
		lastCageCmd = _command
		connectedTo = ""
		return "Disconnecting...\nConnection closed by the remote host."
	elif(_command == "monitor"):
		if(_args.size() == 0):
			var lastMem = memPosMap[lastCageCmd]
			var lastCmdStored = lastCageCmd
			lastCageCmd = _command
			return \
				"Status: locked\n"+\
				"Days locked: "+str(GM.main.getDays() + 47)+"\n"+\
				"Electromagnet lock strength: "+str(stepify(rand_range(3200, 3600),0.1))+" N\n"+\
				"Battery charge: "+str(stepify(rand_range(1400, 1500),0.1))+" mAh\n"+\
				"Bioreactor: Operating\n"+\
				"Last memory access at: "+lastMem+" by '[color=#EE88FF]"+lastCmdStored+"[/color]'\n"+\
				"Memory dump (first page): \n[b][font=res://Fonts/smallconsolefont.tres]"+\
				"[color=#AAFFAA]   0        8        16       24      [/color]\n"+\
				"[color=#AAFFAA] 0 [/color]BEEFBEA7 DeLoxe S 3-Karat  v1.0.7"+NI+"_\n"+\
				"[color=#AAFFAA] 1 [/color]00010017 SEGFAULT  at: %s"+NI+" Eo2ZiE93\n"+\
				"[color=#AAFFAA] 2 [/color]Vion"+NI+"___ b1Un374k J0sTIBXF locked"+NI+"_\n"+\
				"[color=#AAFFAA] 3 [/color]unlocked "+NI+"___Oper ating "+NI+"_ Inactive\n"+\
				"[color=#AAFFAA] 4 [/color]"+NI+"___sAxz 38VsDvXT "+(HI if lastCmdStored == "disconnect" else NO)+"Disconne cting... [/color]\n"+\
				"[color=#AAFFAA] 5 [/color]"+NI+"___Read y."+NI+"_DwyM UNz6v4ML B1jowhGw\n"+\
				"[color=#AAFFAA] 6 [/color]default"+NI+" "+(HI if lastCmdStored == "unlock" else NO)+"block[/color]"+NI+"__ ____over ride"+NI+"hl|\n"+\
				"[color=#AAFFAA] 7 [/color]Code "+NI+"__ valid."+NI+"_ invalid. "+NI+"___6521\n"+\
				"[color=#AAFFAA] 8 [/color]"+(HI if lastCmdStored == "monitor" else NO)+"Status:  %s"+CR+"Days  locked:  %d"+CR+"Elect\n"+\
				"[color=#AAFFAA] 9 [/color]romagnet  lock st rength:  %fN"+CR+"Batt\n"+\
				"[color=#AAFFAA]10 [/color]erycharg e: %f mA h"+CR+"Biorea ctor:%s"+CR+"\n"+\
				"[color=#AAFFAA]11 [/color]Last mem ory acce ss at: [ %d,%d] ([/color]\n[/font][/b]"
		else:
			return "This command expects 0 arguments"
	elif(_command == "unlock"):
		lastCageCmd = _command
		if(_args.size() == 1):
			var unlockcode = _args[0]
			if(unlockcode in ["block"]):
				markFinished()
				return "Code valid. Unlocking..."
			else:
				return "Code invalid."
		else:
			return "This command expects 1 argument"
	elif(_command == "help"):
		lastCageCmd = _command
		if(_args.size() == 1):
			var tolearn = _args[0]
			if(tolearn == "help"):
				return "This command outputs all other commands and can also provide help for certain command by typing 'help <COMMAND>'."
			elif(tolearn == "disconnect"):
				return "This command disconnects you from the remote host."
			elif(tolearn == "monitor"):
				return "This command lists hardware diagnostics."
			elif(tolearn == "unlock"):
				return "This command unlocks the electromagnetic lock.\nSyntax 'unlock <unlock code>'"
			elif(tolearn == "strscan"):
				return "This command scans the local device memory for strings. Without a parameter, it simply lists found strings. When provided a string id as a parameter, it will add that string to the memorised commands.\nSyntax 'strscan <string id>'"
			else:
				return "Couldn't find command '"+str(tolearn)+"'. To see all the available commands type 'help'."
			
		elif(_args.size() == 0):
			learnCommand("help")
			learnCommand("monitor")
			learnCommand("unlock")
			learnCommand("disconnect")
			learnCommand("strscan")
			return "Available commands are: \ndisconnect\nmonitor\nunlock\nhelp\nstrscan\nTo learn more about a command type 'help <COMMAND>'\n\n"+\
				"[Amateur firmware. The password's stored in plaintext, directly in memory. Don't waste time trying every option, remember that the unlock function has to access the password to check if it's been given a valid one.\n\nI've also added the strscan utility, in case the keyboard freezes up again. Don't bother with it otherwise.\n - Alex]"
		else:
			learnCommand("help")
			return "'help' expects 0 or 1 arguments"
	elif(_command == "strscan"):
		lastCageCmd = _command
		if(_args.size() == 1):
			var id = _args[0]
			if(id in strMap.keys()):
				learnCommand(strMap[id][1])
				return "String '" + strMap[id][1] + "' added to command buttons."
			else:
				return "Invalid parameter."
		elif(_args.size() == 0):
			var outstr = "This trial version of strscan is limited to only the first 15 results.\n"+\
					"Run strscan again with the id of the string you'd like to add to your command buttons as the first parameter.\n\n[font=res://Fonts/smallconsolefont.tres]"+\
					"[color=#AAFFFF]ID location string[/color]\n"
			for key in strMap:
				outstr += key + " " + strMap[key][0] + ":  '" + strMap[key][1] + "'\n"
			outstr += "[/font]"
			return outstr
		else:
			return "This command expects 1 or 0 arguments"
						
	learnCommand("help")
	return "Error, unknown command. Use 'help' to list all available commands"
	
func reactToCommandPlug(_command: String, _args:Array, _commandStringRaw:String):
	if(_command == "get_speed"):
		return "Invoking...\nReturn value: "+str(plugSpeed)
	elif(_command == "set_speed"):
		var value = 0
		if(_args.size() >= 1):
			value = int(_args[0])
		value = clamp(value, 0, 100)
		plugSpeed = value
		if(value >= 25):
			return "Invoking...\nReturn code 00041: Success, Increased heart rate detected"
		else:
			return "Invoking...\nReturn code 00000: Success"
	elif(_command == "disconnect"):
		connectedTo = ""
		return "Disconnecting...\nConnection closed by the remote host."
	elif(_command == "help"):
		if(_args.size() == 1):
			var tolearn = _args[0]
			if(tolearn == "help"):
				return "This command outputs all other commands and can also provide help for certain command by typing 'help <COMMAND>'."
			elif(tolearn == "disconnect"):
				return "This command disconnects you from the remote host."
			elif(tolearn == "get_speed"):
				return "Returns current speed setting of the vibration motor."
			elif(tolearn == "set_speed"):
				return "Sets the current speed setting of the vibration motor. \nSyntax 'set_speed <value [0 - 100]>'"
			else:
				return "Couldn't find command '"+str(tolearn)+"'. To see all the available commands type 'help'."
			
		elif(_args.size() == 0):
			learnCommand("help")
			learnCommand("get_speed")
			learnCommand("set_speed")
			learnCommand("disconnect")
			return "Available commands are: \ndisconnect\nget_speed\nset_speed\nhelp\nTo learn more about a command type 'help <COMMAND>'"
		else:
			learnCommand("help")
			return "'help' expects 0 or 1 arguments"
						
	learnCommand("help")
	return "Error, unknown command. Use 'help' to list all available commands"

var tutorialData = [
	["*", "Figure out how to work this utility, or use 'skiptut' to skip this tutorial.", "Type anything"],
	["help", "Start by getting the list of commands.", "Select 'help' and then press Send"],
	["help probe", "You learned new commands. Use the help command to figure out the 'probe' command", "Select 'help', then select 'probe' and then press Send"],
	["probe", "Now try to execute this command.", "Select 'probe' and press Send"],
	["help connect", "Now try to figure out how to use the connect command.", "Select 'help', then select 'connect' and press Send"],
	["connect 4", "The viplug_m_default device will serve as an example device for this tutorial. Connect to it.", "Select 'connect', then switch to the numpad and select '4' before pressing Send"],
	["help", "You connected to a device. Figure out what it can do.", "Select 'help' and press Send"],
	["help get_speed", "Figure out what get_speed does.", "Select 'help', then select 'get_speed' and press Send"],
	["get_speed", "Run the get_speed command.", "Select 'get_speed' and press Send"],
	["disconnect", "Nothing more to do here. When you're done experimenting, disconnect from this device.", "Select 'disconnect' and press Send"],
	["*", "You've finished the tutorial. Good luck! Remember you can use the 'probe' command to find the right device.", "Use the 'probe' command again to find the right device."],
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
	data["plugSpeed"] = plugSpeed
	data["lastCageCmd"] = lastCageCmd
	data["currentTutorialStep"] = currentTutorialStep
	data["shouldSpoilHint"] = currentTutorialStep
	
	return data
	
func loadData(data):
	.loadData(data)
	
	connectedTo = SAVE.loadVar(data, "connectedTo", "")
	plugSpeed = SAVE.loadVar(data, "plugSpeed", 0)
	lastCageCmd = SAVE.loadVar(data, "lastCageCmd", "disconnect")
	currentTutorialStep = SAVE.loadVar(data, "currentTutorialStep", 0)
	shouldSpoilHint = SAVE.loadVar(data, "shouldSpoilHint", false)
