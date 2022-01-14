extends BaseCharacter
class_name Character

var id = "errorerror"

func _ready():
	pass # Replace with function body.

func _init():
	pass
	
func _getName():
	return "Error"
	
func getName():
	return _getName()

func afterFightEnded():
	.afterFightEnded()
	pain = 0
	lust = 0

func saveData():
	var data = {
		"pain": pain,
		"lust": lust,
		"stamina": stamina,
	}
	
	data["statusEffects"] = saveStatusEffectsData()
	
	return data

func loadData(data):
	pain = SAVE.loadVar(data, "pain", 0)
	lust = SAVE.loadVar(data, "lust", 0)
	stamina = SAVE.loadVar(data, "stamina", 100)
	
	loadStatusEffectsData(SAVE.loadVar(data, "statusEffects", {}))
