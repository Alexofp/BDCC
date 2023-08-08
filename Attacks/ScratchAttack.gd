extends Attack

func _init():
	id = "scratchattack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Scratch"
	
func getVisibleDesc(_context = {}):
	return "You scratch the enemy for "+scaledDmgRangeStr(DamageType.Physical, 5, 15)+" damage. May cause bleeding with 50%"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver, "scratch")
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver, "scratch")
	
	var texts = [
		"{attacker.name} sinks {attacker.his} claws into {receiver.name} and leaves a few good scratch marks",
		"{attacker.name} scratches {receiver.name} using {attacker.his} claws",
	]
	var text = RNG.pick(texts)
	if(RNG.chance(50) && !_receiver.hasEffect(StatusEffect.Bleeding) && _receiver.addEffect(StatusEffect.Bleeding)):
		text += " causing  {receiver.him} to start [color=red]bleeding[/color]"
	
	return {
		text = text,
		pain = RNG.randi_range(5, 15),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAttackSoloAnimation():
	return "punch"

func getExperience():
	return [[Skill.Combat, 10]]

func getRequirements():
	return [AttackRequirement.FreeArms]
