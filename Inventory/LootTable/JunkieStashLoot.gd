extends LootTableBase

func _init():
	id = "junkieStash"
	loot = [
		[20, [["appleitem", 1, 3]]],
		[10, ["painkillers"]],
		[5, ["painkillers"]],
		[10, ["AnaphrodisiacPill"]],
		[5, ["AnaphrodisiacPill"]],
		[15, [["EnergyDrink", 1, 2]]],
		[5, [["EnergyDrink", 1, 1]]],
		[5, [["restraintkey", 1, 2]]],
		[5, [["restraintkey", 1, 2]]],
		[2, [["restraintkey", 1, 2]]],
		[5, ["TFPill"]],
		[2, ["TFPill"]],
		[2, [["BreederPill", 1, 2]]],
		[2, [["HeatPill", 1, 2]]],
		[5, ["StunBaton"]],
		[10, ["Shiv"]],
		
	]
	minCredits = 1
	maxCredits = 4
	creditsChance = 30
