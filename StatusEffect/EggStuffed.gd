extends StatusEffectBase

func _init():
	id = StatusEffect.EggStuffed
	isBattleOnly = false

	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 89
	
func shouldApplyTo(_npc):
	if(_npc.isVisiblyEggStuffed()):
		return true
	return false

func getEffectName():
	return "Egg-Stuffed"

func getEffectDesc():
	var theMenstrualCycle:MenstrualCycle = character.getMenstrualCycle()
	if(!theMenstrualCycle):
		return "You are stuffed with eggs.."
	
	var theTimeUntilEggs:int = theMenstrualCycle.getTimeUntilNextEggLaying()
	var eggAm:int = theMenstrualCycle.bigEggs.size()
	
	var unpluggedHoles:Array = character.getEggStuffedHoles(true)
	var unpluggedHolesTexts:Array = []
	for theHole in unpluggedHoles:
		unpluggedHolesTexts.append(BodypartSlot.getVisibleNameNoCap(theHole))
	var helpfulPlugMessage:String = ""
	if(unpluggedHoles.size() > 0):
		helpfulPlugMessage = " Plug your "+Util.humanReadableList(unpluggedHolesTexts)+" if you don't want that."
	
	if(unpluggedHoles.empty()):
		return "You are stuffed with "+str(eggAm)+" egg"+("s" if eggAm != 1 else "")+"..."
	return "You are stuffed with "+str(eggAm)+" egg"+("s" if eggAm != 1 else "")+".. "+Util.getTimeStringHumanReadable(theTimeUntilEggs)+" left until you will want to lay "+("them." if eggAm != 1 else "it.")+helpfulPlugMessage

func getEffectImage():
	return "res://Images/StatusEffects/mother.png"

func getIconColor():
	return IconColorDarkPurple

func getBuffs():
	return [] #TODO: Debuffs for having many eggs in you?
