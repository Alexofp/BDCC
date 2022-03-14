extends StatusEffectBase

func _init():
	id = StatusEffect.Naked
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Naked"

func getEffectDesc():
	if(!character.isPlayer()):
		return "Not wearing anything"
	
	
	if(character.isFullyNaked()):
		return "You're completely naked, be ready for some extra attention\n[color=green]Lust damage +10%[/color]"
	
	var exposedBodyparts = character.getExposedPrivates()
	var visiblePartsNames = []
	for bodypartID in exposedBodyparts:
		if(!character.hasBodypart(bodypartID)):
			continue
		var bodypart = character.getBodypart(bodypartID)
		visiblePartsNames.append(bodypart.getName())
		
	if(visiblePartsNames.size() > 0):
		return "Some of your privates are exposed and visible for everyone who glances at you. Be ready for some extra attention\n[color=red]Exposed: "+Util.humanReadableList(visiblePartsNames)+"[/color]\n[color=green]Lust damage +10%[/color]"
	
	return "You're not wearing anything"

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/nudity.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass

func getDamageMultiplierMod(_damageType):
	if(_damageType == DamageType.Lust):
		return 0.1
	return 0.0
