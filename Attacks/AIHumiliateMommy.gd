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
	var _damage = doDamage(_attacker, _receiver, DamageType.Lust, RNG.randi_range(20, 20))
	#_receiver.addEffect(StatusEffect.Bleeding)

	var text = "{attacker.name} teasing had an effect on {receiver.name}. "
	
	text += receiverDamageMessage(DamageType.Lust, _damage)
	
	return text
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} straightens the posture and puts {attacker.his} hands under {attacker.his} breasts, emphasizing their size."
	text += "\n\n"
	text += _attacker.formatSay("C’mon, quit fighting and let me nurture you with my breasts~. You can call me mommy~")
	text += "\n"
	return text

func canSeeAnticipationTextWhenBlind():
	return true
