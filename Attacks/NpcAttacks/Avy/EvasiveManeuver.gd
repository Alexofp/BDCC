extends Attack

func _init():
	id = "EvasiveManeuver"
	category = Category.Physical
	aiCategory = AICategory.DefensivePain
	aiScoreMultiplier = 0.5
	
func getVisibleName(_context = {}):
	return "Evasive Maneuver"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var text = "{attacker.name} crouches low, preparing to evade any incoming attacks."
	
	_attacker.addEffect(StatusEffect.Evading, [1])
	return {
		text = text,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(_attacker.hasEffect(StatusEffect.Evading)):
		return false
	return true

#func getAttackSoloAnimation():
#	return "punch"

func getRequirements():
	return [[AttackRequirement.Stamina, 15]]#[AttackRequirement.FreeArms, AttackRequirement.FreeHands]

func canBeDodgedByPlayer(_attacker, _receiver):
	return false
