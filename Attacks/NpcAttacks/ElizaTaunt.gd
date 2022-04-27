extends Attack

func _init():
	id = "ElizaTaunt"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName():
	return "Eliza taunt"
	
func getVisibleDesc():
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver):
	var text = "You feel aroused after thinking about what Eliza said.."
	var _damage = doDamage(_attacker, _receiver, DamageType.Lust, 20)
	text += " " + receiverDamageMessage(DamageType.Lust, _damage)
	return text
	
func _canUse(_attacker, _receiver):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} stops fighting for a moment and offers you a cunning smile instead."

	text += "\n\n"
	text += "[say=eliza]"+RNG.pick([
		"I can make you feel pleasure like you never did, you gonna cum so much that you will forget everything else~",
		"I see that you don’t like this place, I can turn it into a better one with a gas mask and one special gas, just quit fighting~",
		"So many prototypes to try, don’t deny yourself the opportunity to feel good, raise your hands up~.",
		"I can give you a true purpose, to produce milk, like a good cow. It will feel so-o good, I promise~. And I get better coffee in the mornings~.",
	])+"[/say]"

	return text
