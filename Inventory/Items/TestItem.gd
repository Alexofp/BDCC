extends ItemBase

func _init():
	id = "testitem"

func getVisibleName():
	return "Test item"
	
func getVisisbleDescription():
	return "Heals you or something"

func canUseInCombat():
	return true

func useInCombat(_attacker, _reciever):
	_attacker.addPain(-100)
	destroyMe()
	return _attacker.getName() + " drank a potion"

