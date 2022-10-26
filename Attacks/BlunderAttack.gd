extends Attack

func _init():
	id = "blunderAttack"
	category = Category.Special
	
func getVisibleName(_context = {}):
	return "Do nothing"
	
func getVisibleDesc(_context = {}):
	return "You shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	return {
		text = "{attacker.name} wasn't able to attack"
		}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func canBeDodgedByPlayer(_attacker, _receiver):
	return false

func getAIScore(_attacker, _receiver):
	return 0.0

func canDoWhileStunned():
	return true
