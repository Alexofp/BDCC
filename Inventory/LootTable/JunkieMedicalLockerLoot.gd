extends LootTableBase

func _init():
	id = "junkieMedicalLocker"
	loot = [
		[70, [["painkillers", 1, 3]]],
		[30, ["painkillers"]],
		[50, [["AnaphrodisiacPill", 1, 2]]],
		[5, ["AnaphrodisiacPill"]],
		[15, [["EnergyDrink", 1, 2]]],
		[5, [["EnergyDrink", 1, 1]]],
		[5, ["TFPill"]],
		[2, ["TFPill"]],
		[2, [["BreederPill", 1, 2]]],
		[2, [["HeatPill", 1, 2]]],
		
	]
	minCredits = 1
	maxCredits = 3
	creditsChance = 10
