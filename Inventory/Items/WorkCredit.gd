extends ItemBase

func _init():
	id = "WorkCredit"

func getVisibleName():
	return "Credit"
	
func getDescription():
	return "A little chip with some credits. A digital currency with no flaws. Some wonder if it's even real."

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	if(_attacker is Player):
		_attacker.addCredits(getAmount())
	removeXOrDestroy(getAmount())
	return _attacker.getName() + " pushed the credits to their account"

func getPossibleActions():
	return [
		{
			"name": "Credit in",
			"scene": "UseItemLikeInCombatScene",
			"description": "Push the credits to your account",
		},
	]

func getPrice():
	return 1

func getSellPrice():
	return 1

func canSell():
	return true

func canCombine():
	return true

func getItemCategory():
	return ItemCategory.Generic

func getInventoryImage():
	return "res://Images/Items/generic/chip.png"
