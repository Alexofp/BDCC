extends Attack

func _init():
	id = "SentinelHeatGrenade"
	category = Category.Lust
	aiCategory = AICategory.Defensive
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
	
	var text = "You breathe in the pink mist and feel extremely horny, many dirty thoughts pass through your head. Maybe surrendering isn’t such a bad idea.."
	text += "\n\n"
	text += "[say=attacker]"+RNG.pick(["Target is hit.", "Attack successful.", "Intruder is almost ready.", "Lust damage inflicted successfully."])+"[/say]"
	return {
		text = text,
		lust = RNG.randi_range(30, 80),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} pulls out one of the prototype grenades out of {attacker.his} chest cavity! {attacker.He} throws it in your direction. You see a [b]big pink smoke[/b] trail following it in the air!"

func getAttackSoloAnimation():
	return "throw"

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]
