extends ItemBase


func _init():
	id = "appleitem"

func getVisibleName():
	return "Apple"
	
func getVisisbleDescription():
	return "Tasty looking apple. Will remove 20 pain and add 20 stamina"

func canUseInCombat():
	return true

func useInCombat(_attacker, _reciever):
	_attacker.addPain(-20)
	_attacker.addStamina(20)
	destroyMe()
	return _attacker.getName() + " ate an apple"

func getPossibleActions():
	return [
		{
			"name": "Eat it!",
			"scene": "UseItemLikeInCombatScene",
			"description": "Eat the apple",
		},
	]

func getPrice():
	return 5

func canSell():
	return true
