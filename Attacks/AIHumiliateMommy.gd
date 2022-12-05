extends Attack

func _init():
	id = "AIHumiliateMommy"
	category = Category.Physical
	aiCategory = AICategory.Lust
	
func getVisibleName(_context = {}):
	return "Mommy humiliation"
	
func getVisibleDesc(_context = {}):
	return "You shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var text = "{attacker.name} teasing had an effect on {receiver.name}."
	
	return {
		text = text,
		lust = RNG.randi_range(20, 20),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} straightens her posture and puts {attacker.his} hands under {attacker.his} breasts, emphasizing their size."
	text += "\n\n"
	text += "[say=attacker]C’mon, quit fighting and let me nurture you with my breasts~. You can call me mommy~[/say]"
	text += "\n"
	return text

func getRequirements():
	return [AttackRequirement.CanTalk]

func canSeeAnticipationTextWhenBlind():
	return true
