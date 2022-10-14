extends Attack

func _init():
	id = "VolkTaunt"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName(_context = {}):
	return "Volk taunt"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(RNG.chance(60)):
		var text = "It's weird but you somehow feel aroused after thinking about what Volk said.."
		return {
			text = text,
			lust = 20,
		}
	else:
		var text = "Volk's weird actions were a turn off for you"
		return {
			text = text,
			lust = -10,
		}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "Volk licks the sharp blade of his weapon and laughs with a very raspy voice."

	text += "\n\n"
	text += "[say=volk]"+RNG.pick([
		"Volk will be gentle with prey.",
		"Wanna know about the scars? I can show you.",
		"You’re stuck here. With me. Afraid yet? Well you should.",
	])+"[/say]"

	return text

func getRequirements():
	return [AttackRequirement.CanTalk]

func canSeeAnticipationTextWhenBlind():
	return true
