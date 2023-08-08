extends Attack

func _init():
	id = "AttackFury"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Attack Fury"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		if(RNG.chance(50)):
			var text = "{receiver.name} dodges the attack but {attacker.name}'s lightning-fast reflexes allow {attacker.her} to catch {receiver.name} anyway and throw {receiver.him} into the ground!"
			
			_receiver.addEffect(StatusEffect.Collapsed)
			return {
				text = text,
				pain = RNG.randi_range(5, 10),
			}
		
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} lunges forward with lightning speed, delivering a powerful series of strikes on {receiver.name}'s body."
	
	if(RNG.chance(30) && _receiver.addEffect(StatusEffect.Bleeding)):
		text += " Sharp claws caused {receiver.name} to start [color=red]bleeding[/color]."
	return {
		text = text,
		pain = RNG.randi_range(20, 40),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name}'s eyes narrow as {attacker.he} readies {attacker.his} devastating strike."

func getAttackSoloAnimation():
	return "punch"

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]
