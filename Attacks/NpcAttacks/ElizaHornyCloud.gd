extends Attack

func _init():
	id = "ElizaHornyCloud"
	category = Category.Lust
	aiCategory = AICategory.Lust
	aiScoreMultiplier = 0.5
	
func getVisibleName(_context = {}):
	return "Horny cloud"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Lust)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Lust)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "The vial breaks under {receiver.name}’s feet and spawns a huge pink cloud! {receiver.name} breathes it in and feels very aroused, it puts {receiver.him} into an artificial heat!"
	_receiver.addEffect(StatusEffect.ArtificialHeat)
	return {
		text = text,
		lust = 25,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} fetches some vial off of {attacker.his} belt and throws it at {receiver.name}!"

func getAttackSoloAnimation():
	return "throw"

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]
