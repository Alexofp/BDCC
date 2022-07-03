extends LootTableBase
class_name InmateLoot

func _init():
	id = "inmate"
	loot = [
		[1, ["painkillers"]],
		[5, ["EnergyDrink"]],
	]
	minCredits = 1
	maxCredits = 2
	creditsChance = 10
