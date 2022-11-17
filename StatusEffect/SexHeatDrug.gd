extends StatusEffectBase

func _init():
	id = StatusEffect.SexHeatDrug
	isSexEngineOnly = true
	
func processSexTurn():
	character.addLust(10)

func getEffectName():
	return "Heat pill"

func getEffectDesc():
	return "You are incredibly lusty"

func getEffectImage():
	return "res://Images/StatusEffects/love-injection.png"

func getIconColor():
	return IconColorPurple
