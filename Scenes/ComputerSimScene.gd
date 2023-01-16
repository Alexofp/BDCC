extends "res://Scenes/SceneBase.gd"

var computer:ComputerBase
var computerID = "error"
var currentCommand = []
var inputMode = "buttons" # buttons, numpad or keyboard

func _initScene(_args = []):
	if(_args.size() > 0):
		if(_args[0] is String):
			computerID = _args[0]
		else:
			computer = _args[0]
			computerID = computer.id
	
	if(computer == null):
		computer = GlobalRegistry.createComputer(computerID)

func _init():
	sceneID = "ComputerSimScene"

func _run():
	if(state == ""):
		if(computer.getLastCommand() != ""):
			saynn("> "+computer.getLastCommand())
		saynn(computer.getOutput())
		
		if(inputMode == "keyboard"):
			say(">")
			addTextbox("textcommand")
			addButtonAt(0, "SEND", "Send the command", "sendkeyboard")
			addButtonAt(14, "COMMANDS", "Switch to the commands", "buttons")
		
		if(inputMode == "buttons"):
			saynn("> "+getCurrentCommandString())
			
			if(currentCommand.size() > 0):
				addButtonAt(0, "SEND", "Send the command", "send")
				addButtonAt(9, "CLEAR", "Clear the command", "clearcommand")
			addButtonAt(13, "NUMPAD", "Switch to the numpad", "numpad")
			addButtonAt(14, "KEYBOARD", "Switch to the keyboard that lets you type in the full command yourself", "keyboard")
			
			var words = computer.getCommands()
			if(words.size() == 0):
				addButton("Type gibberish", "Type something", "inputfull", ["asdasdf"])
			for command in words:
				addButton(command, "Type this", "add", [command])
			
		if(inputMode == "numpad"):
			saynn("> "+getCurrentCommandString())
			
			addButtonAt(1, "7", "Type this", "addnumpad", ["7"])
			addButtonAt(2, "8", "Type this", "addnumpad", ["8"])
			addButtonAt(3, "9", "Type this", "addnumpad", ["9"])
			addButtonAt(6, "4", "Type this", "addnumpad", ["4"])
			addButtonAt(7, "5", "Type this", "addnumpad", ["5"])
			addButtonAt(8, "6", "Type this", "addnumpad", ["6"])
			addButtonAt(11, "1", "Type this", "addnumpad", ["1"])
			addButtonAt(12, "2", "Type this", "addnumpad", ["2"])
			addButtonAt(13, "3", "Type this", "addnumpad", ["3"])
			addButtonAt(10, "0", "Type this", "addnumpad", ["0"])
			addButtonAt(5, ".", "Type this", "addnumpad", ["."])
			
			if(currentCommand.size() > 0):
				addButtonAt(0, "SEND", "Send the command", "send")
				addButtonAt(9, "CLEAR", "Clear the command", "clearcommand")
			addButtonAt(14, "COMMANDS", "Switch to the commands", "buttons")
			

		#addButton("Leave", "Job well done", "endthescene")

func getCurrentCommandString():
	var result = []
	for stuff in currentCommand:
		result.append(stuff[0])
	
	return Util.join(result, " ")

func _react(_action: String, _args):
	if(_action == "send"):
		computer.inputCommand(getCurrentCommandString())
		currentCommand.clear()
		if(inputMode == "numpad"):
			inputMode = "buttons"
		return
	
	if(_action == "sendkeyboard"):
		computer.inputCommand(getTextboxData("textcommand"))
		currentCommand.clear()
		return
	
	if(_action == "clearcommand"):
		currentCommand.clear()
		return
	
	if(_action == "inputfull"):
		computer.inputCommand(_args[0])
		currentCommand.clear()
		return
	
	if(_action == "numpad"):
		inputMode = "numpad"
		return
	
	if(_action == "buttons"):
		inputMode = "buttons"
		return
		
	if(_action == "keyboard"):
		inputMode = "keyboard"
		return
		
	if(_action == "addnumpad"):
		if(currentCommand.size() == 0):
			currentCommand.append([str(_args[0]), "num"])
		else:
			if(currentCommand.back()[1] == "num"):
				currentCommand.back()[0] = currentCommand.back()[0] + str(_args[0])
			else:
				currentCommand.append([str(_args[0]), "num"])
		return
	
	if(_action == "add"):
		currentCommand.append([_args[0], "word"])
		return
	
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["computerID"] = computerID
	data["computerData"] = computer.saveData()
	data["currentCommand"] = currentCommand
	data["inputMode"] = inputMode
	
	return data
	
func loadData(data):
	.loadData(data)
	
	computerID = SAVE.loadVar(data, "computerID", "error")
	computer = GlobalRegistry.createComputer(computerID)
	computer.loadData(SAVE.loadVar(data, "computerData", {}))
	currentCommand = SAVE.loadVar(data, "currentCommand", [])
	inputMode = SAVE.loadVar(data, "inputMode", "buttons")
