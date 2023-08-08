extends Attack

func _init():
	id = "TaviSensualScratches"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Sensual Scratches"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver, "scratch")
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver, "scratch")
	
	var text = "{attacker.name} delivers a flurry of tantalizing scratches to {receiver.name}, causing both pain and a hint of arousal."
	if(RNG.chance(50) && _receiver.addEffect(StatusEffect.Bleeding)):
		text += " Sharp claws caused {receiver.name} to start [color=red]bleeding[/color]."
	
	return {
		text = text,
		lust = RNG.randi_range(5, 10),
		pain = RNG.randi_range(40, 50),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} extends {attacker.his} sharp claws as {attacker.he} grins wickedly, ready to leave a mark on you."

	return text

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]
