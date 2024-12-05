extends Attack

func _init():
	id = "LuxeSavageBackhand"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Savage Backhand"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		addLuxeRage(_attacker, 0.25)
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		addLuxeRage(_attacker, 0.25)
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name}'s massive paw slams into the side of your head with bone-crushing force, claws slicing into your skin as the world spins violently. Blood spatters against the floor as the pain roars through your skull."
	
	if(RNG.chance(50) && _receiver.addEffect(StatusEffect.Bleeding)):
		text += " [b]You begin to bleed![/b]"
		
	return {
		text = text,
		pain = 30,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(getLuxeRage(_attacker) < 0.5):
		return false
	
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} bares {attacker.his} teeth, a growl rumbling deep in {attacker.his} chest as {attacker.he} raises a clawed hand. {attacker.His} glowing fur pulsates faintly with {attacker.his} rising fury."

	return text

func getRequirements():
	return [AttackRequirement.FreeArms]
	

func getAttackSoloAnimation():
	return "punch"

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 1.0

func addLuxeRage(_attacker, howMuch:float):
	if(_attacker.hasEffect("LuxeRage")):
		_attacker.getEffect("LuxeRage").addRage(howMuch)

func getLuxeRage(_attacker) -> float:
	if(_attacker.hasEffect("LuxeRage")):
		return _attacker.getEffect("LuxeRage").rage
	return 0.0
