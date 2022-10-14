extends Attack

func _init():
	id = "lickWounds"
	category = Category.Lust
	aiCategory = AICategory.Defensive
	aiScoreMultiplier = 0.4
	
func getVisibleName(_context = {}):
	return "Lick wounds"
	
func getVisibleDesc(_context = {}):
	return "You shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var texts = [
		"{attacker.name} licks {attacker.his} bruises, it helps to soothe the pain by quite a bit."
	]
	var text = RNG.pick(texts)
	
	_attacker.addPain(-30)
	
	text += " {attacker.name} is feeling better!"
	
	return {
		text = text,
	}

func canBeDodgedByPlayer(_attacker, _receiver):
	return false

func getRequirements():
	return [[AttackRequirement.Stamina, 50], AttackRequirement.CanBite]

func canSeeAnticipationTextWhenBlind():
	return true
