extends Attack

func _init():
	id = "aitaunthumiliate"
	category = Category.Humiliation
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	return "Taunt (Humiliate)"
	
func getVisibleDesc():
	return "You shouldn't see this"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var texts = [
		attackerName + " laughs at " + recieverName +" and taunts "+_attacker.formatSay("C'mon, you're too soft to win against me"),
		attackerName + " rubs " + _attacker.hisHer() +" hands together and says "+_attacker.formatSay("You will be kneeling before me and begging for me to touch you~"),
		attackerName + " points at " + recieverName +" and taunts "+_attacker.formatSay("You're so cute, why are you even trying to fight"),
		attackerName + " says "+_attacker.formatSay("Hit me, come on. You're so adorable when you're angry"),
	]
	var text = RNG.pick(texts)
	
	return text

func canBeDodgedByPlayer(_attacker, _reciever):
	return false

func getAIScore(_attacker, _reciever):
	if(_attacker.hasEffect(StatusEffect.Collapsed)):
		return 0.0
	return min(0.5, .getAIScore(_attacker, _reciever) * 0.8)
