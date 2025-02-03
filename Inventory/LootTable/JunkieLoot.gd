extends LootTableBase
class_name JunkieLoot

func _init():
	id = "junkie"
	loot = [
		[15, [["appleitem", 1, 2]]],
		[7, ["painkillers"]],
		[7, ["AnaphrodisiacPill"]],
		[10, [["EnergyDrink", 1, 4]]],
		[5, [["restraintkey", 1, 2]]],
		[10, ["TFPill"]],
		[2, ["TFPill"]],
		[2, [["BreederPill", 1, 2]]],
		[2, [["HeatPill", 1, 2]]],
		
		[3, ["basketmuzzle"]],
		[3, ["ballgag"]],
		[3, ["ringgag"]],
		[3, ["blindfold"]],
		[3, ["inmateanklecuffs"]],
		[3, ["inmatewristcuffs"]],
		[3, ["ropeharness"]],
	]
	minCredits = 1
	maxCredits = 4
	creditsChance = 10
