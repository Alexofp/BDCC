extends StatusEffectBase

func _init():
	id = StatusEffect.TimedEffects
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 100
	
func shouldApplyTo(_npc):
	if(_npc.timedBuffs.size() > 0):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Timed effects"

func getEffectDesc():
	var theTexts:Array = []
	var theBuffsBySeconds:Dictionary = character.getSortedBuffsDataByTime(character.timedBuffs)
	
	for theTime in theBuffsBySeconds:
		var theBuffs:Array = theBuffsBySeconds[theTime]
		
		var theBuffNames:Array = []
		for theBuff in theBuffs:
			theBuffNames.append(theBuff.getVisibleDescription())
		theTexts.append(Util.join(theBuffNames, ", ")+" expire in "+str(Util.getTimeStringHumanReadable(theTime)))
	
#	var time = character.timedBuffsDurationSeconds
#
#	return "For the next "+Util.getTimeStringHumanReadable(time)+":"
	return Util.join(theTexts, "\n")

func getEffectImage():
	return "res://Images/StatusEffects/overdose.png"

func getIconColor():
	return IconColorBlue

func combine(_args = []):
	pass

func getBuffs():
	return character.getTimedBuffs()
