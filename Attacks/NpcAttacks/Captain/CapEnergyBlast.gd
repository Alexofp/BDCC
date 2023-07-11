extends Attack

func _init():
	id = "CapEnergyBlast"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	aiScoreMultiplier = 0.7
	
func getVisibleName(_context = {}):
	return "Energy Blast"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} fires a precise shot from {attacker.his} laser pistol, hitting {receiver.name} and causing intense pain."
	
	return {
		text = text,
		pain = RNG.randi_range(50, 70),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} charges up energy in {attacker.his} pistol for a single powerful blast before aiming directly at {receiver.name}. This one [b]will[/b] hurt." \
	+ "\n\n"\
	+ "[say=attacker]"+RNG.pick(["I don't wanna kill you. But you crossed the line.", "You went too far. Time for the consequences."])+"[/say]"

func getAttackSoloAnimation():
	return "firepistol"

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 0.1
