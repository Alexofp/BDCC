extends Attack

func _init():
	id = "FeralAssault"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Feral Assault"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		if(RNG.chance(50)):
			var text = "{attacker.name} notices {receiver.name} dodging {receiver.his} attack and reaches {attacker.his} claws far out to scratch {receiver.him}!"
			
			_receiver.addEffect(StatusEffect.Bleeding)
			return {
				text = text,
				pain = RNG.randi_range(5, 10),
			}
		
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} charges ferociously, unleashing a relentless barrage of savage strikes upon {receiver.him}, leaving {receiver.him} battered and bruised."
	
	if(RNG.chance(30) && !_receiver.hasEffect(StatusEffect.Collapsed)):
		if(_receiver.addEffect(StatusEffect.Collapsed)):
			text += " The furious attack made {receiver.name} [b]fall[/b]."
	return {
		text = text,
		pain = RNG.randi_range(30, 50),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name}'s eyes turn wild as a surge of uncontrollable rage consumes {attacker.him}."

func getAttackSoloAnimation():
	return "punch"

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]
