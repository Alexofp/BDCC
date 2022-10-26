extends Attack

func _init():
	id = "RebelTaunt"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Rebel taunt"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var text = "Rebel's taunting didn't have any effect on you"
	return {
		text = text,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} flexes {attacker.his} muscles and roars."

	text += "\n\n"
	text += "[say=rebel]"+RNG.pick([
		"Look at these. You are screwed.",
		"Bitch, I will crush you.",
	])+"[/say]"

	return text

func getRequirements():
	return [AttackRequirement.CanTalk]

func canSeeAnticipationTextWhenBlind():
	return true
