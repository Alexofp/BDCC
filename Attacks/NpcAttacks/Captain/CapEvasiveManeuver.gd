extends Attack

func _init():
	id = "CapEvasiveManeuver"
	category = Category.Physical
	aiCategory = AICategory.DefensivePain
	aiScoreMultiplier = 0.5
	
func getVisibleName(_context = {}):
	return "Evasive Maneuver"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var text = "{attacker.name} spreads {attacker.his} legs and arms more, preparing to evade any incoming attacks."
	
	_attacker.addEffect(StatusEffect.Evading, [2])
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
	return [[AttackRequirement.Stamina, 25]]#[AttackRequirement.FreeArms, AttackRequirement.FreeHands]

func canBeDodgedByPlayer(_attacker, _receiver):
	return false
