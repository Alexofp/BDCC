extends StatusEffectBase

func _init():
	id = StatusEffect.Intoxicated
	isBattleOnly = false
	
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 101
	
func shouldApplyTo(_npc):
	if(_npc.getIntoxicationLevel() >= 0.01):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Intoxicated"

func getEffectDesc():
	if(!character.isPlayer()):
		return "You're intoxicated"
	
	var intoxication: float = character.getIntoxicationLevel()

	var text = "You are "+str(round(intoxication*100.0))+"% intoxicated."
	
	if(intoxication >= 0.7):
		text += " You can barely stand on your feet."
	elif(intoxication >= 0.4):
		text += " You feel drunk."
	
	return text

func getEffectImage():
	return "res://Images/StatusEffects/chemical-drop.png"

func getIconColor():
	return IconColorRed

func combine(_args = []):
	pass

func getBuffs():
	var intoxication: float = character.getIntoxicationLevel()
	
	if(intoxication >= 0.7):
		if(character.hasPerk(Perk.SexIntoxicationBonus)):
			return [
				buff(Buff.ExposureBuff, [100]),
				buff(Buff.ReceivedLustDamageBuff, [20]),
				buff(Buff.LustDamageBuff, [10]),
			]
		return [
			buff(Buff.ExposureBuff, [100]),
			buff(Buff.ReceivedLustDamageBuff, [40]),
			buff(Buff.AccuracyBuff, [-5]),
			buff(Buff.DodgeChanceBuff, [-5]),
		]
	
	if(intoxication >= 0.4):
		return [
			buff(Buff.ExposureBuff, [50]),
		]
	
	return [
	]
