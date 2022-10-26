extends Attack

func _init():
	id = "stretchingAttack"
	category = Category.Lust
	aiCategory = AICategory.Defensive
	aiScoreMultiplier = 0.5
	
func getVisibleName(_context = {}):
	return "Stretching"
	
func getVisibleDesc(_context = {}):
	return "You shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var texts = [
		"{attacker.name} takes {attacker.his} time arching {attacker.his} back and stretching. A few cute moans can be heard from {attacker.name} as {attacker.he} does that."
	]
	var text = RNG.pick(texts)
	
	_attacker.addPain(-30)
	
	text += " {attacker.name} is feeling better!"
	
	return {
		text = text,
		lust = RNG.randi_range(20, 20),
	}

func canBeDodgedByPlayer(_attacker, _receiver):
	return true

func getAnticipationText(_attacker, _receiver):
	return RNG.pick([
		"Looks like {attacker.name} is about to stretch!",
	])

func getRequirements():
	return [[AttackRequirement.Stamina, 20]]
