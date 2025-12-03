extends NetworkedComputerBase

func _init():
	id = "TaviEngineeringComputer"
	
	# create local server & files
	var locals = Server.new("",["connect"])
	locals.addFile(newCompFile("readme.txt","Useful shit:\n1[cuss]27.0.69[/cuss] - Server with some porn, I know you would find it eventually, you degenerates\n127.0.10 - bluespace transmitter door, don't touch it unless you were told to\n\nDon't bug me about how to connect to these, RTFM. Or type 'help connect' if you never worked with a terminal before.","",true,1))
	locals.addFile(newCompFile("forum.html","...**[corrupt]corrupted data[/corrupt]**...\n\n<message>Why the fuck are we using such outdated hardware?</message>\n<message>If it works, don't fix it. It's a piece of shit but you're not gonna play doom on it, this machine supports telnet and that's all we need.</message>\n<message>The fuck is telnet?</message>\n<message>It's what we used before bluespace got discovered. Just read the fucking readme already.</message>\n\n...**[corrupt]more corrupted data[/corrupt]**...","",false,2))
	
	# door server
	var doors = Server.new("127.0.10",["mode","disconnect","help"],"Door status: LOCKED\nLast maintenance: [cuss]9999999[/cuss] days ago",false)
	
	# horny server
	var hornys = Server.new("127.0.69",["disconnect"],"Welcome to horny bread's secret lair. We have a strict NO PANTS policy. Please enjoy yourself!\nTo see what commands this server supports type 'help'",true)
	hornys.addFile(newCompFile("porn.png",Util.readFile("res://Images/asciiporn/taviquest/porn.txt"),"res://Fonts/smallconsolefont.tres",true,1))
	hornys.addFile(newCompFile("sex.png",Util.readFile("res://Images/asciiporn/taviquest/sex.txt"),"res://Fonts/smallconsolefont.tres",true,2))
	hornys.addFile(newCompFile("mouwse.png",Util.readFile("res://Images/asciiporn/taviquest/mouwse.txt"),"res://Fonts/smallconsolefont.tres",true,3))
	hornys.addFile(newCompFile("railme.png",Util.readFile("res://Images/asciiporn/taviquest/railme.txt"),"res://Fonts/smallconsolefont.tres",true,4))
	# set servers
	servers = {
		"":locals,
		"127.0.10":doors,
		"127.0.69":hornys,
		}
	
	# set local cmds
	localCmds["mode"] = "Changes the operation mode of the door.\n'mode 0' is normal operation\n'mode 9' is maintenance mode"

func localCmd_mode(_args:Array=[]): # prefix necessary when setting custom cmds for react func
	if(_args.size() == 1):
		var modeStr = _args[0]
		if(modeStr == "0"):
			return "The door is already operating in this mode"
		elif(modeStr == "9"):
			markFinished()
			return "Switching the door to the maintenance mode! Warning, anyone will be able to open it. Switch back to mode 0 when done."
		return "Error, unsupported mode. Type 'help mode' for more information"
	
	return "'mode' command expects 1 argument. Type 'help mode' for more information"

var tutorialData = [
	["*", "This minigame simulates a simple console. If you ever used cmd or bash, you will feel right at home. Otherwise, just follow this tutorial.", "type anything"],
	["help", "Start by getting the list of commands.", "Select 'help' and then press Send"],
	["help ls", "You learned new commands. Use the help command to figure out the 'ls' command", "Select 'help', then select 'ls' and then press Send"],
	["ls", "Now try to execute this command", "Select 'ls' and press Send"],
	["help cat", "Now try to figure out how to use the cat command", "Select 'help', then select 'cat' and press Send"],
	["cat 1", "Use the cat command to output the contents of the first file", "Select 'cat', then switch to the numpad and select '1' before pressing Send"],
	["connect 127.0.10", "Try to connect to the door that leads to the bluespace transmitter", "Select 'connect', then switch to the numpad and use it to type '127.0.10'. Then press Send"],
	["help", "You connected to a new server. Figure out what commands it supports", "Type 'help' and press Send"],
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
