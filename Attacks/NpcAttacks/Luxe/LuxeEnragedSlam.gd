extends Attack

func _init():
	id = "LuxeEnragedSlam"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Enraged Slam"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		addLuxeRage(_attacker, 0.5)
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		addLuxeRage(_attacker, 0.5)
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "With a furious roar, {attacker.name} grabs you by the arm and hurls you into the nearest wall. The impact leaves cracks in the surface as pain explodes through your body, leaving you gasping and disoriented."
	
	if(_receiver.addEffect(StatusEffect.Stunned, [1])):
		text += " [b]You got stunned![/b]"
		
	return {
		text = text,
		pain = 55,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(getLuxeRage(_attacker) < 1.0):
		return false
	
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name}’s glowing fur intensifies, the embers brightening as {attacker.he} loses himself to fury. {attacker.His} fists clench as {attacker.his} chest heaves with rage. This one is gonna hurt.."

	return text

func getRequirements():
	return [AttackRequirement.FreeArms]
	

func getAttackSoloAnimation():
	return "shove"

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 1.0

func addLuxeRage(_attacker, howMuch:float):
	if(_attacker.hasEffect("LuxeRage")):
		_attacker.getEffect("LuxeRage").addRage(howMuch)

func getLuxeRage(_attacker) -> float:
	if(_attacker.hasEffect("LuxeRage")):
		return _attacker.getEffect("LuxeRage").rage
	return 0.0
