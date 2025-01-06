extends LootTableBase

func _init():
	id = "medicalstorage"
	loot = [
		[20, [["lube", 1, 3]]],
		[100, [["painkillers", 1, 5]]],
		[100, [["AnaphrodisiacPill", 1, 5]]],
		[20, [["EnergyDrink", 1, 3]]],
		[20, [["BirthControlPill", 1, 3]]],
		[20, [["BreederPill", 1, 3]]],
		[20, [["HeatPill", 1, 3]]],
		[20, [["QualityCondom", 1, 5]]],
		[20, [["PregnancyTest", 1, 3]]],
		[100, [["TFUndoPill", 1, 2]]],
	]
	minCredits = 0
	maxCredits = 0
	creditsChance = 0
