extends Module

func getFlags():
	return {
		# Gym module
		#"Gym_RishaLastDayGotPaid": flag(FlagType.Number),
		#"Gym_BullyGangIntroduced": flag(FlagType.Bool),
		#"Gym_BullyGangPayed": flag(FlagType.Bool),
	}

func _init():
	id = "KaitModule"
	author = "Rahi"
	
	scenes = [
			"res://Modules/KaitModule/Chapter1/DomCh1s1AgreeScene.gd",
		]
	characters = [
	]
	items = []
	events = [
	]
	quests = [
	]

func resetFlagsOnNewDay():
	pass
