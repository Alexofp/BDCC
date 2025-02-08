extends LootTableBase

func _init():
	id = "junkieWeaponsLocker"
	loot = [
		[50, ["StunBaton"]],
		[20, ["StunBaton"]],
		[50, ["Shiv"]],
		[20, ["Shiv"]],
	]
	minCredits = 1
	maxCredits = 3
	creditsChance = 10
