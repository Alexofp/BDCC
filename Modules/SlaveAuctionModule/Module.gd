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
	]
	items = []
	events = [
	]

func resetFlagsOnNewDay():
	pass
