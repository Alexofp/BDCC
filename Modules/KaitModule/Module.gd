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
			"res://Modules/KaitModule/Chapter1/DomCh1RahiRecScene.gd",
			"res://Modules/KaitModule/Chapter1/DomCh1RahiRecEnsScene.gd",
			"res://Modules/KaitModule/Chapter1/DomCh1RahiBreakIntroScene.gd",
			"res://Modules/KaitModule/Chapter1/DomCh1RahiBreakAfterScene.gd",
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

func incKaitSubmission():
	pass

func incKaitLove():
	pass

func incAvySubmission():
	pass

func incAvyLove():
	pass
