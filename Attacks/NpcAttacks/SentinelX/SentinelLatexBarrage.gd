extends Attack

func _init():
	id = "SentinelLatexBarrage"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Latex Barrage"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} unleashes a rapid barrage of strikes, each hit infused with {attacker.his} adhesive latex, causing repeated pain and discomfort to {receiver.name}."
	return {
		text = text,
		pain = 40,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} assumes a rapid striking position, {attacker.his} latex-coated limbs poised for a flurry of attacks."

	return text

func getRequirements():
	return [AttackRequirement.FreeArms]
	

func getAttackSoloAnimation():
	return "punch"

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 3.0
