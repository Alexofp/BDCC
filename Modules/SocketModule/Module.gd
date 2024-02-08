extends Module

func getFlags():
	return {
		"askedWhyWorkHere": flag(FlagType.Bool),
		"touchedPussy": flag(FlagType.Bool),
		
		"removedWombImplant": flag(FlagType.Bool),
		"socketWillPunish": flag(FlagType.Bool),
		"punishReason": flag(FlagType.Text), # stuckroughfuck stuckroughassfuck spikeddrink
		
		"ch1HelpedTimes": flag(FlagType.Number),
		
		"h3BeatRisha": flag(FlagType.Bool),
		
		"hasPortalPussy": flag(FlagType.Bool),
	}

func _init():
	id = "SocketModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/SocketModule/SocketIntroScene.gd",
		"res://Modules/SocketModule/SocketTalkScene.gd",
		
		"res://Modules/SocketModule/HelpScenes/SocketHelp1Mineshaft.gd",
		"res://Modules/SocketModule/HelpScenes/SocketHelp2Scene.gd",
		"res://Modules/SocketModule/HelpScenes/SocketHelp3Scene.gd",
		]
	characters = [
		"res://Modules/SocketModule/SocketCharacter.gd",
	]
	items = []
	events = [
	]

func resetFlagsOnNewDay():
	pass
