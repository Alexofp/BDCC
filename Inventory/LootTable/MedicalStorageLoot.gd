extends LootTableBase

func _init():
	id = "medicalstorage"
	loot = [
		[30, [["lube", 1, 3]]],
		[100, [["painkillers", 1, 5]]],
		[100, [["AnaphrodisiacPill", 1, 5]]],
		[40, [["EnergyDrink", 1, 3]]],
		[40, [["BirthControlPill", 1, 3]]],
		[40, [["BreederPill", 1, 3]]],
		[40, [["HeatPill", 1, 3]]],
		[40, [["QualityCondom", 1, 10]]],
		[40, [["PregnancyTest", 1, 10]]],
		[40, [["PregnancyTest", 1, 10]]],
	]
	minCredits = 0
	maxCredits = 0
	creditsChance = 0
