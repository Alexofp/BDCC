extends Reference
class_name ComputerBase

var id = "error"
var learnedCommands = []
var lastCommand = ""
var introText = "AlphaOS Console [Version 0.9.7601]\n(C) AlphaCorp, All rights reserved"
var lastOutput = ""
var isIntro = true

func learnCommand(command):
	if(!learnedCommands.has(command)):
		learnedCommands.append(command)

func getCommands():
	return learnedCommands

func getOutput():
	if(isIntro):
		return introText
	return lastOutput

func getLastCommand():
	return lastCommand

func inputCommand(_commandString:String):
	isIntro = false
	lastCommand = _commandString
	var splitted = _commandString.split(" ", false)
	var command = ""
	if(splitted.size() > 0):
		command = splitted[0]
		splitted.remove(0)
	
	lastOutput = reactToCommand(command, splitted, _commandString)
	return lastOutput

func reactToCommand(_command:String, _args:Array, _commandStringRaw:String):
	return "Hello world"

func saveData():
	#var data = .saveData()
	
	#data["waitTimer"] = waitTimer

	return {
		"learnedCommands": learnedCommands,
		"lastOutput": lastOutput,
		"lastCommand": lastCommand,
		"isIntro": isIntro,
	}
	
func loadData(_data):
	learnedCommands = SAVE.loadVar(_data, "learnedCommands", [])
	lastOutput = SAVE.loadVar(_data, "lastOutput", "")
	lastCommand = SAVE.loadVar(_data, "lastCommand", "")
	isIntro = SAVE.loadVar(_data, "isIntro", false)
	#.loadData(data)
	
	#waitTimer = SAVE.loadVar(data, "waitTimer", 0)
	pass
