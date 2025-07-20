extends StatusEffectBase

func _init():
	id = StatusEffect.PSMilkCafeProduction
	isBattleOnly = false

	#alwaysCheckedForNPCs = true
	#alwaysCheckedForPlayer = true
	priorityDuringChecking = 94
	
func shouldApplyTo(_npc):
	if(GM.main.PS && GM.main.PS.id == "MilkCafe"):
		return true
	return false

func getEffectName():
	return "Frequent Milking"

func getEffectDesc():
	return "Your body is being stress-tested by frequent milking. The lower your stamina is, the less milk/seed you will be producing."

func getEffectImage():
	return "res://Images/StatusEffects/lactation.png"

func getIconColor():
	if(character.getStaminaLevel() <= 0.3):
		return IconColorRed
	return IconColorGray

func getBuffs():
	var theStamina:float = character.getStaminaLevel()
	if(theStamina <= 0.0):
		return [
			buff(Buff.BreastsMilkProductionFinalBuff, [-100]),
			buff(Buff.PenisCumProductionFinalBuff, [-100]),
		]
	if(theStamina <= 0.9):
		return [
			buff(Buff.BreastsMilkProductionFinalBuff, [-100*(1.0 - theStamina)]),
			buff(Buff.PenisCumProductionFinalBuff, [-100*(1.0 - theStamina)]),
		]
	return [
	]
