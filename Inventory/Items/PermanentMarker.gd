extends ItemBase

func _init():
	id = "PermanentMarker"

func getVisibleName():
	return "Permanent marker"
	
func getDescription():
	return "A single-use marker that is loaded with special ink that is almost impossible to remove."

#func canUseInCombat():
#	return true
#
#func useInCombat(_attacker, _receiver):
#	removeXOrDestroy(getAmount())

#func getPossibleActions():
#	return [
#		{
#			"name": "Credit in",
#			"scene": "UseItemLikeInCombatScene",
#			"description": "Push the credits to your account",
#		},
#	]

func getPrice():
	return 30

func getSellPrice():
	return 5

func canSell():
	return true

func canCombine():
	return true

func getItemCategory():
	return ItemCategory.Generic

func getInventoryImage():
	return "res://Images/Items/generic/chip.png"
