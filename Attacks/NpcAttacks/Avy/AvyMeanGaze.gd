extends Attack

func _init():
	id = "AvyMeanGaze"
	category = Category.Physical
	aiCategory = AICategory.Lust
	
func getVisibleName(_context = {}):
	return "Mean gaze"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var text = "{attacker.name} straightens {attacker.his} posture and spreads {attacker.his} arms wide. {attacker.His} voice is alluring but also increadibly mean."
	text += "\n\n"
	text += "[say=attacker]"+RNG.pick([
		"You're mine to toy with. MINE. I will fuck you raw.",
		"Yeah, bitch, I WILL FUCK YOU UP.",
		"You are so pathetic. I will enjoy BREAKING you so much.",
		"You stupid fucking whore, I will fuck you up."
		])+"[/say]"
	
	return {
		text = text,
		lust = RNG.randi_range(10, 20),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} locks eyes with {receiver.name}, a sadistic pleasure gleaming in {attacker.his} gaze."

func getRequirements():
	return [AttackRequirement.CanTalk]
