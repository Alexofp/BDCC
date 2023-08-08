extends Attack

func _init():
	id = "SentinelLatexRegeneration"
	category = Category.Physical
	aiCategory = AICategory.DefensivePain
	aiScoreMultiplier = 0.8
	
func getVisibleName(_context = {}):
	return "Latex Regeneration"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} manages to coil {attacker.his} whip around {receiver.name}'s body and pull {receiver.him} close! {attacker.name}'s latex layer rapidly regenerates using {receiver.name}'s stamina!"
	if(_receiver.getStamina() > 0):
		_attacker.addPain(-30)
		_attacker.addStamina(30)
	return {
		text = text,
		pain = 5,
		stamina = 30,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = " {attacker.name} morphs {attacker.his} hand into a latex whip and tries to strike you with it!"

	return text

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]
	

func getAttackSoloAnimation():
	return "shove"

#func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
#	return 0.0
