extends Attack

func _init():
	id = "CapRapidFire"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	aiScoreMultiplier = 1.0
	
func getVisibleName(_context = {}):
	return "Rapid Fire"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var amountOfShots = RNG.randi_range(1, 5) + RNG.randi_range(1, 5)
	
	var text = "{attacker.name} fires off a rapid succession of energy shots, hitting {receiver.name} "+str(amountOfShots)+" times. Each impact sends jolts of pain through {receiver.his} body."
	
	return {
		text = text,
		pain = amountOfShots * 10,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} holds {attacker.his} finger on the trigger of {attacker.his} energy pistol, about to unleash a barrage of shots toward {receiver.name}." 

func getAttackSoloAnimation():
	return "firepistol"

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 0.2
