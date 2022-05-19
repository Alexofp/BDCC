extends StatusEffectBase

func _init():
	id = StatusEffect.Pregnant
	isBattleOnly = false

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
	elif(progress <= 0.99):
		addText = "Third trimester. You experience shortness of breath, your belly is really dragging you down."+timeLeftText
	else:
		addText = "Third trimester. You experience shortness of breath, you feel like you are ready to give birth."
	
	return "You're visible pregnant.. "+addText

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/womb3.png"

func getIconColor():
	return IconColorDarkPurple

func getBuffs():
	var progress = character.getPregnancyProgress()
	
	if(progress <= 0.0):
		return []
	
	if(progress <= 0.33):
		return [
			
		]
	elif(progress <= 0.66):
		return [
			buff(Buff.MaxStaminaBuff, [-10]),
		]
	else:
		return [
			buff(Buff.MaxStaminaBuff, [-30]),
			buff(Buff.DodgeChanceBuff, [-20]),
		]
