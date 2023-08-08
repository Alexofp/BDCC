extends Attack

func _init():
	id = "TaviFelineGrace"
	category = Category.Physical
	aiCategory = AICategory.DefensivePain
	
func getVisibleName(_context = {}):
	return "Feline Grace"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):

	var text = "{attacker.name} moves with feline grace, anticipating {receiver.name}'s next move."
	_attacker.addEffect(StatusEffect.Evading, [2, 50])
	return {
		text = text,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(_attacker.hasEffect(StatusEffect.Evading)):
		return false
	
	return true

func getRequirements():
	return [AttackRequirement.FreeLegs, [AttackRequirement.Stamina, 20]]

func canBeDodgedByPlayer(_attacker, _receiver):
	return false
