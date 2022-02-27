extends Attack

func _init():
	id = "AIHumiliateMommy"
	category = Category.Physical
	aiCategory = AICategory.Lust
	
func getVisibleName():
	return "Mommy humiliation"
	
func getVisibleDesc():
	return "You shouldn't see this"
	
func _doAttack(_attacker, _reciever):
	var _damage = doDamage(_attacker, _reciever, DamageType.Lust, RNG.randi_range(20, 20))
	#_reciever.addEffect(StatusEffect.Bleeding)

	var text = "{attacker.name} teasing had an effect on {receiver.name}."
	
	text += " {receiver.name} received "+str(_damage)+" lust!"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getAnticipationText(_attacker, _reciever):
	var text = "{attacker.name} straightens the posture and puts {attacker.his} hands under {attacker.his} breasts, emphasizing their size."
	text += "\n\n"
	text += _attacker.formatSay("C’mon, quit fighting and let me nurture you with my breasts~. You can call me mommy~")
	text += "\n"
	return text
