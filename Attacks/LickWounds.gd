extends Attack

func _init():
	id = "lickWounds"
	category = Category.Lust
	aiCategory = AICategory.Defensive
	
func getVisibleName():
	return "Lick wounds"
	
func getVisibleDesc():
	return "You shouldn't see this"
	
func _doAttack(_attacker, _reciever):
	var _damage = doDamage(_attacker, _reciever, DamageType.Lust, RNG.randi_range(20, 20))
	
	var texts = [
		"{attacker.name} licks {attacker.his} bruises, it helps to soothe the pain by quite a bit."
	]
	var text = RNG.pick(texts)
	
	_attacker.addPain(-40)
	
	text += " {attacker.name} is feeling better!"
	
	return text

func canBeDodgedByPlayer(_attacker, _reciever):
	return false

func getRequirements():
	return [["stamina", 30]]

