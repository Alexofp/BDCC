extends Attack

func _init():
	id = "LuxeViciousLunge"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Vicious Lunge"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		addLuxeRage(_attacker, 0.5)
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		addLuxeRage(_attacker, 0.5)
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "With a deafening roar, {attacker.name} leaps forward, {attacker.his} claws tearing into your shoulder and dragging you down. The sheer weight of {attacker.him} pins you, {attacker.his} claws raking through flesh and muscle with brutal efficiency."
	
	if(_receiver.addEffect(StatusEffect.Bleeding)):
		text += " [b]You begin to bleed![/b]"
	if(_receiver.addEffect(StatusEffect.Collapsed)):
		text += " [b]You collapse![/b]"
		
	return {
		text = text,
		pain = 25,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(getLuxeRage(_attacker) < 0.5):
		return false
	
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name}'s entire body tenses, {attacker.his} sharp claws out on display as {attacker.his} glowing fur radiates like embers in the dark. {attacker.His} growl deepens into a feral snarl."

	return text

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeLegs]
	

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
