extends Attack

func _init():
	id = "MirriPistolShot"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	aiScoreMultiplier = 1.5
	
func getVisibleName(_context = {}):
	return "Pistol Shot"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(!_attacker.hasEffect("MirriAmmo")):
		_attacker.addEffect("MirriAmmo")
	var ammoEffect = _attacker.getEffect("MirriAmmo")
	ammoEffect.ammo -= 1
	
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name}’s fires {attacker.his} gun. The bullet tears into you with terrifying accuracy, leaving a gaping hole in its way."
	if(RNG.chance(50) && _receiver.addEffect(StatusEffect.Bleeding)):
		text += " [b]You begin bleeding![/b]"
	
	return {
		text = text,
		pain = 50,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(_attacker.hasEffect("MirriAmmo") && _attacker.getEffect("MirriAmmo").ammo <= 0):
		return false
	
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name}’s aims {attacker.his} gun at you, about to fire!"

	return text

func getRequirements():
	return [AttackRequirement.FreeArms]
	

func getAttackSoloAnimation():
	return ["firepistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 1.0
