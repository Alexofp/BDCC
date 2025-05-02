extends LootTableBase
class_name JunkieLoot

func _init():
	id = "junkie"
	loot = [
		[5, [["appleitem", 1, 2]]],
		[3, ["painkillers"]],
		[3, ["AnaphrodisiacPill"]],
		[3, [["EnergyDrink", 1, 4]]],
		[2, [["restraintkey", 1, 2]]],
		[3, ["TFPill"]],
		[1, ["TFPill"]],
		[1, [["BreederPill", 1, 2]]],
		[1, [["HeatPill", 1, 2]]],
		
		[1, ["basketmuzzle"]],
		[1, ["ballgag"]],
		[1, ["ringgag"]],
		[1, ["blindfold"]],
		[1, ["inmateanklecuffs"]],
		[1, ["inmatewristcuffs"]],
		[1, ["ropeharness"]],
	]
	minCredits = 1
	maxCredits = 3
	creditsChance = 10
