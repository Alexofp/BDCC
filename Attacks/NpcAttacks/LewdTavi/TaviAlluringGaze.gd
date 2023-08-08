extends Attack

func _init():
	id = "TaviAlluringGaze"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName(_context = {}):
	return "Alluring Gaze"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var text = "{attacker.name}'s captivating gaze causes a surge of lustful feelings in {receiver.name}."
	if(!_receiver.isDefocusing() && _receiver.addEffect(StatusEffect.Weakness, [1])):
		text += " {receiver.name} feels [b]weak[/b]."
		
	return {
		text = text,
		lust = RNG.randi_range(30, 40),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} locks eyes with {receiver.name}, {attacker.his} gaze intense and alluring."

	return text

func getRequirements():
	return [AttackRequirement.CanSee]

func canSeeAnticipationTextWhenBlind():
	return true
