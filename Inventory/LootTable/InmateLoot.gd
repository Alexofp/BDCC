extends LootTableBase
class_name InmateLoot

func _init():
	id = "inmate"
	loot = [
		[5, ["painkillers"]],
		[5, ["AnaphrodisiacPill"]],
		[10, [["EnergyDrink", 1, 4]]],
		[5, [["Condom", 1, 10]]],
		[2, [["PregnancyTest", 1, 2]]],
		[2, [["BirthControlPill", 1, 2]]],
		[2, ["plainBra"]],
		[2, ["plainBriefs"]],
		[2, ["plainPanties"]],
		[2, ["plainUndershirt"]],
	]
	minCredits = 1
	maxCredits = 4
	creditsChance = 10
