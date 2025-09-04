extends LootTableBase

func _init():
	id = "engineerstorage"
	loot = [
		[100, [["painkillers", 3, 3]]],
		[100, [["EnergyDrink", 2, 2]]],
		[100, [["restraintkey", 2, 2]]],
		[5, ["painkillers"]],
		[4, ["lube"]],
		[10, [["EnergyDrink", 1, 3]]],
		[10, ["ZiptiesAnkle"]],
		[10, ["ZiptiesWrist"]],
		[10, ["blindfold"]],
		[10, [["restraintkey", 1, 2]]],
		[1, [["Soap", 1, 1]]],
		[100, [["PermanentMarker", 1, 1]]],
	]
	minCredits = 1
	maxCredits = 2
	creditsChance = 20
