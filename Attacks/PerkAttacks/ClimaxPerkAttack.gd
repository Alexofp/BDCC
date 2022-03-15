extends Attack

func _init():
	id = "ClimaxPerkAttack"
	category = Category.Special
	aiCategory = AICategory.Defensive
	
func getVisibleName():
	return "Climax"
	
func getVisibleDesc():
	return "You bring yourself to an orgasm in the middle of the fight. Removes 50 lust and covers the enemy with your cum/girlcum"
	
func _doAttack(_attacker, _reciever):
	var texts = [
		"{attacker.name} cums onto {reciever.name}!"
	]
	var text = RNG.pick(texts)

	
	_attacker.addLust(-50)
	if(_attacker.isPlayer() && _attacker.hasPenis()):
		_reciever.addEffect(StatusEffect.NPCCoveredInCum, [3, "cum"])
	elif(_attacker.isPlayer() && _attacker.hasVagina()):
		_reciever.addEffect(StatusEffect.NPCCoveredInCum, [3, "girlcum"])
	
	text += "\n\n{attacker.name} lost [color="+DamageType.getColorString(DamageType.Lust)+"]"+str(50)+" lust[/color]!"
	
	return text

func canBeDodgedByPlayer(_attacker, _reciever):
	return false

func getRequirements():
	return [["lustabove", 100], ["stamina", 30], ["freearms"]]

