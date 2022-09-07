extends Module

func getFlags():
	return {
		"Alex_FirstTimeTalked": flag(FlagType.Bool),
	}

func _init():
	id = "PortalPantiesModule"
	author = "Rahi"
	
	scenes = [
			"res://Modules/PortalPantiesModule/AlexRynard/AlexRynardFirstTimeTalk.gd",
		]
	characters = []
	items = []
	events = [
		"res://Modules/PortalPantiesModule/AlexRynard/AlexRynardFirstTalkEvent.gd",
	]
	quests = [

	]

func resetFlagsOnNewDay():
	pass
