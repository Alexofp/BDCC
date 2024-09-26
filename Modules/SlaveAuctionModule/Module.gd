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
		"res://Modules/SlaveAuctionModule/Luxe.gd",
	]
	items = []
	events = [
	]

func resetFlagsOnNewDay():
	pass
