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
	return "You are stuffed with "+str(eggAm)+" egg"+("s" if eggAm != 1 else "")+".. "+Util.getTimeStringHumanReadable(theTimeUntilEggs)+" left until you will want to lay "+("the first one." if eggAm != 1 else "it.")+helpfulPlugMessage

func getEffectImage():
	return "res://Images/StatusEffects/mother.png"

func getIconColor():
	return IconColorDarkPurple

func getBuffs():
	var theMenstrualCycle:MenstrualCycle = character.getMenstrualCycle()
	if(!theMenstrualCycle):
		return []
	var eggAm:int = theMenstrualCycle.bigEggs.size()
	var modifier:float = 1
	if(character.hasPerk(Perk.FertilityBroodmother)): 
		modifier = 0.5
	
	if(eggAm <= 3): # 1 - 3 = nothing
		return []
	if(eggAm <= 6): # 4 - 6
		return [
			buff(Buff.MaxStaminaBuff, [int(-2.0 * eggAm * modifier)]),
		]
	
	# 7 - 20
	var theEggCap:float = float(eggAm) if eggAm < 20 else 20.0
	return [
		buff(Buff.MaxStaminaBuff, [int(-2.0 * theEggCap * modifier)]),
		buff(Buff.DodgeChanceBuff, [int(-1.0 * theEggCap * modifier)]),
	]
