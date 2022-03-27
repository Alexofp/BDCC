extends ItemBase

func _init():
	id = "painkillers"

func getVisibleName():
	return "Painkillers"
	
func getDescription():
	return "Help against pain, removes 80 pain"

func canUseInCombat():
	return true

func useInCombat(_attacker, _reciever):
	_attacker.addPain(-80)
	removeXOrDestroy(1)
	return _attacker.getName() + " took painkillers"

func getPossibleActions():
	return [
		{
			"name": "Consume",
			"scene": "UseItemLikeInCombatScene",
			"description": "Take the painkillers",
		},
	]

func getPrice():
	return 1

func canSell():
	return true

func canCombine():
	return true

