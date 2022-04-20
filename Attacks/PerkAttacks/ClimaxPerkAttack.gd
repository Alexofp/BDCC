extends Attack

func _init():
	id = "ClimaxPerkAttack"
	category = Category.Special
	aiCategory = AICategory.Defensive
	
func getVisibleName():
	return "Climax"
	
func getVisibleDesc():
	return "You bring yourself to an orgasm in the middle of the fight. Removes 50 lust and covers the enemy with your cum/girlcum"
	
func _doAttack(_attacker, _receiver):
	var texts = [
		"{attacker.name} cums onto {receiver.name}!"
	]
	var text = RNG.pick(texts)

	
	_attacker.addLust(-50)
	if(_attacker.isPlayer() && _attacker.hasPenis()):
		_receiver.addEffect(StatusEffect.NPCCoveredInCum, [3, "cum"])
	elif(_attacker.isPlayer() && _attacker.hasVagina()):
		_receiver.addEffect(StatusEffect.NPCCoveredInCum, [3, "girlcum"])
	
	text += "\n\n{attacker.name} lost [color="+DamageType.getColorString(DamageType.Lust)+"]"+str(50)+" lust[/color]!"
	
	return text

func canBeDodgedByPlayer(_attacker, _receiver):
	return false

func getRequirements():
	return [["lustabovepercent", 0.9], ["stamina", 30], ["freearms"]]

