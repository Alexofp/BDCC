extends Attack

func _init():
	id = "FerriTaunt"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Ferri taunt"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var text = "Ferri's taunting didn't have any effect on you"
	return {
		text = text,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "Ferri growls at you and swipes her claws in the air."

	text += "\n\n"
	text += "[say=ferri]"+RNG.pick([
		"I won’t stop biting, give up!",
		"My claws are gonna leave some nice scratch marks on your back.",
		"You won’t break me!",
		"You are a brat! Not me!",
		"I won’t stop resisting even if you tie me up and put a vibe to my crotch! Well, maybe I will.. Mew..",
	])+"[/say]"

	return text

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]

func canSeeAnticipationTextWhenBlind():
	return true
