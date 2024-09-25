extends Module

func getFlags():
	return {
		#"socketIntroduced": flag(FlagType.Bool),
	}

func _init():
	id = "SlaveAuctionModule"
	author = "Rahi"
	
	scenes = [
		]
	characters = [
		"res://Modules/SlaveAuctionModule/Mirri.gd",
	]
	items = []
	events = [
	]

func resetFlagsOnNewDay():
	pass
