extends StatusEffectBase

func _init():
	id = StatusEffect.Pregnant
	isBattleOnly = false

	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 90
	
func shouldApplyTo(_npc):
	if(_npc.menstrualCycle != null && _npc.menstrualCycle.isVisiblyPregnant()):
		return true
	return false

func getEffectName():
	return "Pregnant"

func getEffectDesc():
	var progress = character.getPregnancyProgress()
	
	var timeLeftText = ""
	if(character.getMenstrualCycle() != null):
		timeLeftText = " "+Util.getTimeStringHumanReadable(character.getMenstrualCycle().getTimeUntilReadyForBirth())+" until ready for birth."
	
	var addText = ""
	if(progress <= 0.33):
		addText = "First trimester. You have a slight belly, your body slowly adjusts."+timeLeftText
	elif(progress <= 0.66):
		addText = "Second trimester. Breasts are swollen, belly is very pronounced."+timeLeftText
	elif(character.isReadyToGiveBirth()):
		addText = "Third trimester. You experience shortness of breath, you feel like you are ready to give birth."
	else:
		addText = "Third trimester. Lactation. You experience shortness of breath, your belly is really dragging you down."+timeLeftText
	
	var hasFirstPerk = GM.pc.hasPerk(Perk.FertilityBellySize)
	var hasSecondPerk = GM.pc.hasPerk(Perk.BreedExtraTooltipInfo)
	if((hasFirstPerk || hasSecondPerk) && character.getMenstrualCycle() != null):
		var kidAmount = character.getMenstrualCycle().getRoughLitterEstimateString(hasFirstPerk && hasSecondPerk)
		addText += "\n\nYou think there are "+str(kidAmount)+" in this belly"
	
	return "You're visible pregnant.. "+addText

func getEffectImage():
	var progress = character.getPregnancyProgress()
	if(progress <= 0.33):
		return "res://Images/StatusEffects/impregnation.png"
	
	return "res://Images/StatusEffects/mother.png"

func getIconColor():
	return IconColorDarkPurple

func getBuffs():
	var progress = character.getPregnancyProgress()
	var modifier = 1
	if(character.hasPerk(Perk.FertilityBroodmother)): 
		modifier = 0.5
		
	if(progress <= 0.0):
		return []
	
	if(progress <= 0.33):
		return [
			
		]
	elif(progress <= 0.66):
		return [
			buff(Buff.MaxStaminaBuff, [-10 * modifier]),
		]
	else:
		return [
			buff(Buff.MaxStaminaBuff, [-30 * modifier]),
			buff(Buff.DodgeChanceBuff, [-20 * modifier]),
		]
