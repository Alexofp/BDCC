extends StatusEffectBase

func _init():
	id = "SexObeyDrug"
	isSexEngineOnly = true
	
#func processSexTurn():
#	character.addLust(10)

func getEffectName():
	return "Slave Candy"

func getEffectDesc():
	return "You really want to obey.."

func getEffectImage():
	return "res://Images/StatusEffects/love-injection.png"

func getIconColor():
	return IconColorPurple

func getBuffs():
	return [
		buff(Buff.ForcedObedienceBuff, [100])
	]
