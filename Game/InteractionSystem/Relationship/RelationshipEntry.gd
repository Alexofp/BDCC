extends Reference
class_name RelationshipEntry

var affection:float = 0.0
var lust:float = 0.0

func shouldBeRemoved() -> bool:
	return abs(affection) < 0.01 && abs(lust) < 0.01

func saveData():
	return {
		"a": affection,
		"l": lust,
	}

func loadData(_data):
	affection = SAVE.loadVar(_data, "a", 0.0)
	lust = SAVE.loadVar(_data, "l", 0.0)
