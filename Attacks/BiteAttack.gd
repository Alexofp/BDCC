extends Attack

func _init():
	id = "biteattack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Bite"
	
func getVisibleDesc(_context = {}):
	return "60% chance to do "+scaledDmgRangeStr(DamageType.Physical, 15, 20)+" damage and cause bleeding.\n\nCan't miss if the opponent is on the ground.\n\nVery weak against armored opponents"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical, 0.6)):
		return genericMissMessage(_attacker, _receiver, "bite")
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver, "bite")

	var texts = [
		"{attacker.name} bites {receiver.name}",
		"{attacker.name} pounces at {receiver.name} and bites {receiver.his} neck"
	]
	var text = RNG.pick(texts)
	
	if(!_receiver.hasEffect(StatusEffect.Bleeding)):
		if(_attacker.hasPerk(Perk.SexBiter)):
			if(_receiver.addEffect(StatusEffect.Bleeding, [5])):
				text += " causing {receiver.him} to start [color=red]bleeding[/color]"
		else:
			if(_receiver.addEffect(StatusEffect.Bleeding)):
				text += " causing {receiver.him} to start [color=red]bleeding[/color]"
	
	return {
		text = text,
		pain = RNG.randi_range(15, 20),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} bares {attacker.his} fangs and then suddenly lunges at you!"

func getAttackSoloAnimation():
	return "bite"

func getExperience():
	return [[Skill.Combat, 10]]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	if(_attacker.hasPerk(Perk.SexBiter)):
		return 4.0
	
	return 10.0

func getRequirements():
	return [AttackRequirement.CanBite]
