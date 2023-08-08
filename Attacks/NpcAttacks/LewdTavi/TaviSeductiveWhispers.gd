extends Attack

func _init():
	id = "TaviSeductiveWhispers"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName(_context = {}):
	return "Seductive Whispers"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver, "whispers")
	
	var text = "{attacker.name} whispers sweet words into {receiver.name}'s ear, sending a shiver down {receiver.his} spine, leaving {receiver.him} feeling aroused and distracted."
	return {
		text = text,
		lust = RNG.randi_range(30, 40),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} leans in, {attacker.his} voice a seductive whisper"

	text += "\n\n"
	text += "[say=attacker]"+RNG.pick([
		"Let me show you pleasure you've never known..",
		"No need to be shy..",
		"Imagine the ecstasy that awaits if you surrender to me, body and soul..",
		"Why resist me? Let go and lets embrace these sensations together..",
		"Wanna touch me? Just promise that you're gonna be a good {receiver.boy}.."
	])+"[/say]"

	return text

func getRequirements():
	return [AttackRequirement.CanTalk]

func canSeeAnticipationTextWhenBlind():
	return true
