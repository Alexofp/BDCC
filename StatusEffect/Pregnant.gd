extends StatusEffectBase

func _init():
	id = StatusEffect.Pregnant
	isBattleOnly = false

	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 90
	
func shouldApplyTo(_npc):
	if(_npc.isVisiblyPregnant() && _npc.isPregnant(true, false)):
		return true
	return false

func getEffectName():
	return "Pregnant"

func getEffectDesc():
	var progress:float = character.getPregnancyProgress()
	
	var timeLeftText:String = ""
	if(character.getMenstrualCycle() != null):
		timeLeftText = " "+Util.getTimeStringHumanReadable(character.getMenstrualCycle().getTimeUntilReadyForBirth())+" until ready for birth."
	
	var addText:String = ""
	if(progress <= 0.33):
		addText = "First trimester. You have a slight belly, your body slowly adjusts."+timeLeftText
	elif(progress <= 0.66):
		addText = "Second trimester. Breasts are swollen, belly is very pronounced."+timeLeftText
	elif(character.isReadyToGiveBirth()):
		addText = "Third trimester. You experience shortness of breath, you feel like you are ready to give birth."
	else:
		addText = "Third trimester. Lactation. You experience shortness of breath, your belly is really dragging you down."+timeLeftText
	
	var hasFirstPerk:bool = GM.pc.hasPerk(Perk.FertilityBellySize)
	var hasSecondPerk:bool = GM.pc.hasPerk(Perk.BreedExtraTooltipInfo)
	if((hasFirstPerk || hasSecondPerk) && character.getMenstrualCycle() != null):
		var kidAmount:String = character.getMenstrualCycle().getRoughLitterEstimateString(hasFirstPerk && hasSecondPerk)
		addText += "\n\nYou think there are "+str(kidAmount)+" in this belly"
	
	return "You're visibly pregnant.. "+addText

func getEffectImage():
	var progress:float = character.getPregnancyProgress()
	if(progress <= 0.33):
		return "res://Images/StatusEffects/impregnation.png"
	
	return "res://Images/StatusEffects/mother.png"

func getIconColor():
	return IconColorDarkPurple

func getBuffs():
	var progress:float = character.getPregnancyProgress()
	var modifier:float = 1
	if(character.hasPerk(Perk.FertilityBroodmother)): 
		modifier = 0.5
		
	if(progress <= 0.0):
		return []
	
	if(progress <= 0.33):
		return [
			
		]
	elif(progress <= 0.66):
		return [
			buff(Buff.MaxStaminaBuff, [int(-10 * modifier)]),
		]
	else:
		return [
			buff(Buff.MaxStaminaBuff, [int(-30 * modifier)]),
			buff(Buff.DodgeChanceBuff, [int(-20 * modifier)]),
		]
