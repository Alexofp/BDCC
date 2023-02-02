extends Attack

func _init():
	id = "HeatGrenade"
	category = Category.Lust
	aiCategory = AICategory.Lust
	aiScoreMultiplier = 0.8
	
func getVisibleName(_context = {}):
	return "Heat grenade"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Lust)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Lust)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "You breathe in the pink mist and feel hornier, many dirty thoughts pass through your head. Maybe surrendering isn’t such a bad idea.."
	return {
		text = text,
		lust = 30,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} pulls out some kind of grenade and pulls the pin. Then {attacker.he} throws it in your direction. You see a [b]pink smoke[/b] trail following it in the air!"

func getAttackSoloAnimation():
	return "throw"

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]
