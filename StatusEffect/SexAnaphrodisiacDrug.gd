extends StatusEffectBase

func _init():
	id = StatusEffect.SexAnaphrodisiacDrug
	isSexEngineOnly = true
	
func processSexTurn():
	character.addLust(-20)

func getEffectName():
	return "Anaphrodisiac pill"

func getEffectDesc():
	return "You can't get lusty anymore"

func getEffectImage():
	return "res://Images/StatusEffects/shattered-heart.png"

func getIconColor():
	return IconColorRed
