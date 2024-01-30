extends Module

func getFlags():
	return {
		"askedWhyWorkHere": flag(FlagType.Bool),
		"touchedPussy": flag(FlagType.Bool),
		
		"ch1HelpedTimes": flag(FlagType.Number),
	}

func _init():
	id = "SocketModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/SocketModule/SocketIntroScene.gd",
		"res://Modules/SocketModule/SocketTalkScene.gd",
		
		"res://Modules/SocketModule/HelpScenes/SocketHelp1Mineshaft.gd",
		]
	characters = [
		"res://Modules/SocketModule/SocketCharacter.gd",
	]
	items = []
	events = [
	]

func resetFlagsOnNewDay():
	pass
