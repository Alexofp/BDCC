extends Attack

func _init():
	id = "stretchingAttack"
	category = Category.Lust
	aiCategory = AICategory.Defensive
	
func getVisibleName():
	return "Stretching"
	
func getVisibleDesc():
	return "You shouldn't see this"
	
func _doAttack(_attacker, _reciever):
	var _damage = doDamage(_attacker, _reciever, DamageType.Lust, RNG.randi_range(20, 20))
	
	var texts = [
		"{attacker.name} takes {attacker.his} time arching {attacker.his} back and stretching. A few cute moans can be heard from {attacker.name} as {attacker.he} does that."
	]
	var text = RNG.pick(texts)
	
	_attacker.addPain(-30)
	
	text += " {attacker.name} is feeling better! "
	
	text += recieverDamageMessage(DamageType.Lust, _damage)
	
	return text

func canBeDodgedByPlayer(_attacker, _reciever):
	return true

func getAnticipationText(_attacker, _reciever):
	return RNG.pick([
		"Looks like {attacker.name} is about to stretch!",
	])

func getRequirements():
	return [["stamina", 20]]

