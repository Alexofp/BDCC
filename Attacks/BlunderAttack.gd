extends Attack

func _init():
	id = "blunderAttack"
	category = Category.Special
	
func getVisibleName():
	return "Do nothing"
	
func getVisibleDesc():
	return "You shouldn't see this"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()

	return attackerName + " couldn't figure out what to do and skipped "+_attacker.hisHer()+" turn"
	
func _canUse(_attacker, _reciever):
	return true

func canBeDodgedByPlayer(_attacker, _reciever):
	return false

func getAIScore(_attacker, _reciever):
	return 0.0
