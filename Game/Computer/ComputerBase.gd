extends Reference
class_name ComputerBase

var id = "error"
var learnedCommands = []
var lastCommand = ""
var introText = "AlphaOS Console [Version 0.9.7601]\n(C) AlphaCorp, All rights reserved"
var lastOutput = ""
var isIntro = true
var ended = false
var endedFail = false
var endedArgs = []

func learnCommand(command):
	if(!learnedCommands.has(command)):
		learnedCommands.append(command)

func getCommands():
	return learnedCommands

func getTutorial():
	return ""

func progressTutorial():
	pass

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
	if(lastOutput == null):
		lastOutput = ""
	progressTutorial()
	return lastOutput

func reactToCommand(_command:String, _args:Array, _commandStringRaw:String):
	return "Hello world"

func markFinished(theargs = []):
	ended = true
	endedArgs = theargs

func markFinishedFail(theargs = []):
	endedFail = true
	endedArgs = theargs

func hasEndedFailed():
	return endedFail

func hasEnded():
	return ended

func hasEndedOrFailed():
	return ended || endedFail

func getEndedArgs():
	return endedArgs

func saveData():
	#var data = .saveData()
	
	#data["waitTimer"] = waitTimer

	return {
		"learnedCommands": learnedCommands,
		"lastOutput": lastOutput,
		"lastCommand": lastCommand,
		"isIntro": isIntro,
		"ended": ended,
		"endedFail": endedFail,
		"endedArgs": endedArgs,
	}
	
func loadData(_data):
	learnedCommands = SAVE.loadVar(_data, "learnedCommands", [])
	lastOutput = SAVE.loadVar(_data, "lastOutput", "")
	lastCommand = SAVE.loadVar(_data, "lastCommand", "")
	isIntro = SAVE.loadVar(_data, "isIntro", false)
	ended = SAVE.loadVar(_data, "ended", false)
	endedFail = SAVE.loadVar(_data, "endedFail", false)
	endedArgs = SAVE.loadVar(_data, "endedArgs", null)
	#.loadData(data)
	
	#waitTimer = SAVE.loadVar(data, "waitTimer", 0)
	pass
