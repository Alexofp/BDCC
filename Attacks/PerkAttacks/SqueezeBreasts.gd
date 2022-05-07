extends Attack

func _init():
	id = "SqueezeBreasts"
	category = Category.Special
	aiCategory = AICategory.Defensive
	
func getVisibleName():
	return "Squeeze Breasts"
	
func getVisibleDesc():
	return "You squeeze your breasts to blind the opponent with your milk for 2 turns and cause "+scaledDmgRangeStr(DamageType.Lust, 10, 20)+" lust damage"
	
func _doAttack(_attacker, _receiver):
	if(checkMissed(_attacker, _receiver, DamageType.Lust)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Lust)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var texts = [
		"{attacker.name} squeezes {attacker.his} breasts tightly until they squirt {attacker.milk} into {receiver.name}'s eyes! "
	]
	var text = RNG.pick(texts)

	_attacker.milk(0.3)
	_receiver.addEffect(StatusEffect.Blindness, [2])
	var damage = doDamage(_attacker, _receiver, DamageType.Lust, RNG.randi_range(10, 20))
	text += receiverDamageMessage(DamageType.Lust, damage)
	
	return text

func getRequirements():
	return [["stamina", 10], ["freearms"], ["hasmilk", 200]]

func getExperience():
	return [[Skill.Milking, 10]]
