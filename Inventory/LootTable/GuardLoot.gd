extends LootTableBase
class_name GuardLoot

func _init():
	id = "guard"
	loot = [
		[2, ["lube"]],
		[7, [["painkillers", 1, 3]]],
		[2, ["AnaphrodisiacPill"]],
		[5, ["EnergyDrink"]],
		[5, [["restraintkey", 1, 2]]],
		[1, ["sportyBriefs"]],
		[1, ["sportyTankTop"]],
		[1, ["sportyTop"]],
		[1, ["HeatPill"]],
		[2, ["BreederPill"]],
		[5, [["Condom", 1, 10]]],
		[4, [["QualityCondom", 1, 5]]],
		[3, ["basketmuzzle"]],
		[3, ["ballgag"]],
		[3, ["ringgag"]],
		[3, ["blindfold"]],
		[3, ["inmateanklecuffs"]],
		[3, ["inmatewristcuffs"]],
		[3, ["ropeharness"]],
		[3, ["vaginalplug"]],
		[3, ["buttplug"]],
		[3, ["bondagemittens"]],
		[3, ["ChastityCage"]],
	]
	minCredits = 1
	maxCredits = 2
	creditsChance = 50
