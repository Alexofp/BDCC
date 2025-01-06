extends LootTableBase
class_name MedicalLoot

func _init():
	id = "medical"
	loot = [
		[15, [["painkillers", 1, 2]]],
		[15, [["AnaphrodisiacPill", 1, 3]]],
		[3, [["EnergyDrink", 1, 2]]],
		[10, [["QualityCondom", 1, 3]]],
		[10, [["PregnancyTest", 1, 2]]],
		[10, [["BirthControlPill", 1, 2]]],
		[10, ["TFUndoPill"]],
		
		[5, ["HeatPill"]],
		[5, ["lube"]],
		[5, ["BreederPill"]],
		[2, ["LaceBra"]],
		[2, ["LacePanties"]],
		[5, ["basketmuzzle"]],
		[5, ["LatexStraitjacket"]],
	]
	minCredits = 1
	maxCredits = 2
	creditsChance = 30
