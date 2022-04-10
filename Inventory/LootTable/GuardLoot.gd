extends LootTableBase
class_name GuardLoot

func _init():
	loot = [
		[5, ["lube"]],
		[7, ["painkillers"]],
		[10, [["restraintkey", 1, 2]]],
		[0.2, ["sportyBriefs"]],
	]
	minCredits = 1
	maxCredits = 2
	creditsChance = 50
