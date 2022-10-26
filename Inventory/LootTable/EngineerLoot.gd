extends LootTableBase
class_name EngineerLoot

func _init():
	id = "engineer"
	loot = [
		[5, ["painkillers"]],
		[4, ["lube"]],
		[10, [["EnergyDrink", 1, 3]]],
		[10, ["ZiptiesAnkle"]],
		[10, ["ZiptiesWrist"]],
		[10, ["blindfold"]],
		[10, [["restraintkey", 1, 2]]],
	]
	minCredits = 1
	maxCredits = 2
	creditsChance = 20
