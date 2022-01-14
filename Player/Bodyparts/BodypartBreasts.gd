extends Bodypart
class_name BodypartBreasts

enum BreastsSize {FLAT = 0, A = 1, B = 2, C = 3, D = 4, DD = 5, E = 6, EE = 7, F = 8, FF = 9, G = 10, GG = 11}

var size = 0

func _init():
	pass
	
func saveData():
	return {
		"size": size
	}

func loadData(_data):
	size = SAVE.loadVar(_data, "size", 0)
