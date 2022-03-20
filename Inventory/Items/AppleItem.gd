extends ItemBase


func _init():
	id = "appleitem"

# apple is illegal only temporally as a test item
func getVisibleName():
	return "Stolen Apple"
	
func getDescription():
	return "Tasty looking apple. Will remove 20 pain and add 20 stamina"

func canUseInCombat():
	return true

func useInCombat(_attacker, _reciever):
	_attacker.addPain(-20)
	_attacker.addStamina(20)
	removeXOrDestroy(1)
	return _attacker.getName() + " ate an apple"

func getPossibleActions():
	return [
		{
			"name": "Eat one!",
			"scene": "UseItemLikeInCombatScene",
			"description": "Eat the apple",
		},
	]

func getPrice():
	return 5

func canSell():
	return true

func canCombine():
	return true

func getTags():
	return [ItemTag.Illegal]
