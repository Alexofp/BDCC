extends Attack

func _init():
	id = "lickWounds"
	category = Category.Lust
	aiCategory = AICategory.Defensive
	
func getVisibleName(_context = {}):
	return "Lick wounds"
	
func getVisibleDesc(_context = {}):
	return "You shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var _damage = doDamage(_attacker, _receiver, DamageType.Lust, RNG.randi_range(20, 20))
	
	var texts = [
		"{attacker.name} licks {attacker.his} bruises, it helps to soothe the pain by quite a bit."
	]
	var text = RNG.pick(texts)
	
	_attacker.addPain(-40)
	
	text += " {attacker.name} is feeling better!"
	
	return text

func canBeDodgedByPlayer(_attacker, _receiver):
	return false

func getRequirements():
	return [["stamina", 30]]

