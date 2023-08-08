extends StatusEffectBase

func _init():
	id = StatusEffect.Naked
	isBattleOnly = false
	
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 95
	
func shouldApplyTo(_npc):
	if(_npc.isFullyNaked() || _npc.getExposedPrivates().size() > 0):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	if(!character.isPlayer()):
		return "Naked"
	
	if(character.isFullyNaked()):
		return "Naked"
	return "Exposed"

func getEffectDesc():
	if(!character.isPlayer()):
		return "Not wearing anything"
	
	

	
	var exposedBodyparts = character.getExposedPrivates()
	var visiblePartsNames = []
	for bodypartID in exposedBodyparts:
		if(!character.hasBodypart(bodypartID)):
			continue
		var bodypart = character.getBodypart(bodypartID)
		visiblePartsNames.append(bodypart.getName())
		
	if(visiblePartsNames.size() > 0):
		if(character.isFullyNaked()):
			if(character.hasPerk(Perk.NakedNoShame)):
				return "You are completely naked and it feels good\n[color=red]Exposed: "+Util.humanReadableList(visiblePartsNames)+"[/color]"
			
			return "You are completely naked, be ready for some extra attention\n[color=red]Exposed: "+Util.humanReadableList(visiblePartsNames)+"[/color]"
		else:
			return "Some of your privates are exposed and visible for everyone who glances at you. Be ready for some extra attention\n[color=red]Exposed: "+Util.humanReadableList(visiblePartsNames)+"[/color]"
	
	if(character.hasPerk(Perk.NakedNoShame)):
		return "You are completely naked and it feels good"
	return "You are completely naked, be ready for some extra attention"

func getEffectImage():
	return "res://Images/StatusEffects/nudity.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass

func getBuffs():
	if(character.hasPerk(Perk.NakedNoShame)):
		return [
			buff(Buff.LustDamageBuff, [10]),
			buff(Buff.ExposureBuff, [50]),
		]
	
	return [
		buff(Buff.LustDamageBuff, [10]),
		buff(Buff.ReceivedLustDamageBuff, [10]),
		buff(Buff.ExposureBuff, [50]),
	]
