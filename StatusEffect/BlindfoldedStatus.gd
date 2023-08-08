extends StatusEffectBase

func _init():
	id = StatusEffect.Blindfolded
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 99
	
func shouldApplyTo(_npc):
	if(_npc.isBlindfolded()):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Blindfolded"

func getEffectDesc():
	if(character.hasPerk(Perk.BDSMBlindfold)):
		return "You're blind but not entirely helpless"
	
	return "You can't see. Hitting anything will be very hard"

func getEffectImage():
	return "res://Images/StatusEffects/blind.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass

func getBuffs():
	if(character.hasPerk(Perk.BDSMBlindfold)):
		return [
			buff(Buff.AccuracyBuff, [-15])
		]
	
	return [
		buff(Buff.AccuracyBuff, [-50])
	]
