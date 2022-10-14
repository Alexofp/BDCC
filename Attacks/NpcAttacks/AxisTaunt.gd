extends Attack

func _init():
	id = "AxisTaunt"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName(_context = {}):
	return "Axis taunt"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var text = "You feel aroused.."
	return {
		text = text,
		lust = RNG.randi_range(30, 40),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} is flexing {attacker.his} muscles in the clear view of everyone. Wow, {attacker.he} is sexy!"

	text += "\n\n"
	text += "[say=attacker]"+RNG.pick([
		"C’mon, I know you want this.",
		"Your resistance only makes my dick harder.",
		"Sometimes even I wish to be bred by myself.",
	])+"[/say]"

	return text

func getRequirements():
	return [AttackRequirement.CanTalk]

func canSeeAnticipationTextWhenBlind():
	return true
