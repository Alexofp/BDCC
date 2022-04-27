extends Attack

func _init():
	id = "NpcScratch"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	return "Scratch"
	
func getVisibleDesc():
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} sinks {attacker.his} sharp claws under {receiver.name}’s skin and leaves a deep scratch!"
	var _damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(20, 40))
	text += " " + receiverDamageMessage(DamageType.Physical, _damage)
	
	if(RNG.chance(50)):
		_receiver.addEffect(StatusEffect.Bleeding)
		text += " Sharp claws caused {receiver.name} to start [color=red]bleeding[/color]."
	return text
	
func _canUse(_attacker, _receiver):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} extends {attacker.his} claws and tries to stab {receiver.name}!"
