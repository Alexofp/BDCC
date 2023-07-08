extends Attack

func _init():
	id = "shoveattack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	aiScoreMultiplier = 0.5
	
func getVisibleName(_context = {}):
	return "Shove"
	
func getVisibleDesc(_context = {}):
	return "An attempt to shove the enemy away for "+scaledDmgStr(DamageType.Physical, 5)+" damage. 30% chance to miss. Will cause the opponent to collapse"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical, 0.7, 0.5)):
		return genericMissMessage(_attacker, _receiver, "shove")
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver, "shove")
	
	var texts = [
		"{attacker.name} shoves {receiver.name} away."
	]
	var text = RNG.pick(texts)
	
	if(!_receiver.hasEffect(StatusEffect.Collapsed) && _receiver.addEffect(StatusEffect.Collapsed)):
		text += "\n[b]{receiver.name} loses {receiver.his} balance and collapses onto the floor[/b]"
	
	return {
		text = text,
		pain = 5,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true


func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} frees {attacker.his} arms and tries to shove you"

func getAIScore(_attacker, _receiver):
	if(_receiver.hasEffect(StatusEffect.Collapsed)):
		return 0
	return .getAIScore(_attacker, _receiver)

func getAttackSoloAnimation():
	return "shove"

func getExperience():
	return [[Skill.Combat, 5]]

func getRequirements():
	return [AttackRequirement.FreeArms]
