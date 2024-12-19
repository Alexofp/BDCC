extends Attack

func _init():
	id = "MirriTease"
	category = Category.Lust
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Tease"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var text = "{attacker.name}'s butt makes you horny."
	
	return {
		text = text,
		lust = 30,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(_receiver.isBlindfolded()):
		return false
	
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name}’s leans seductively, showing off her striped panties."
	text += "\n\n"
	text += "[say=attacker]"+RNG.pick([
		"You don’t really want to fight me, do you?",
		"Do you like my ass?",
		"Isn't my butt cute?",
		"Do you really want to hurt me?",
		"I'm a kitty cat.. I go meow meow meow.."
	])+"[/say]"

	return text

func getRequirements():
	return [AttackRequirement.CanTalk]
	

#func getAttackSoloAnimation():
#	return ["firepistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 1.0
