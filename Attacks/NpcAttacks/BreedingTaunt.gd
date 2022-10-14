extends Attack

func _init():
	id = "BreedingTaunt"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName(_context = {}):
	return "Breeding taunt"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var text = "You feel aroused after thinking about what {attacker.name} said.."
	return {
		text = text,
		lust = RNG.randi_range(40, 50),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} cups and gropes {attacker.his} bulge in {receiver.name}’s view."

	text += "\n\n"
	text += "[say=attacker]"+RNG.pick([
		"If you wanna be bred, just ask.",
		"Just bend over, you will love it.",
		"See this? Quit denying yourself the pleasure.",
	])+"[/say]"

	return text

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]

func canSeeAnticipationTextWhenBlind():
	return true
