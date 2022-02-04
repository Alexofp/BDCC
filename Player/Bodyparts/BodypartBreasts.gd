extends Bodypart
class_name BodypartBreasts

enum BreastsSize {MALE = -1, FLAT = 0, A = 1, B = 2, C = 3, D = 4, DD = 5, E = 6, EE = 7, F = 8, FF = 9, G = 10, GG = 11}

var size = 0

func _init():
	limbSlot = LimbTypes.Breasts
	
func saveData():
	return {
		"size": size
	}

func loadData(_data):
	size = SAVE.loadVar(_data, "size", 0)

func getSlot():
	return BodypartSlot.Breasts

func getExtraInfoCreation():
	return "size: " + breastSizeToString(size)
	
static func breastSizeToString(bsize):
	if(bsize == BreastsSize.MALE):
		return "Male flat"
	if(bsize == BreastsSize.FLAT):
		return "Flat"
	if(bsize == BreastsSize.A):
		return "A"
	if(bsize == BreastsSize.B):
		return "B"
	if(bsize == BreastsSize.C):
		return "C"
	if(bsize == BreastsSize.D):
		return "D"
	if(bsize == BreastsSize.DD):
		return "DD"
	if(bsize == BreastsSize.E):
		return "E"
	if(bsize == BreastsSize.EE):
		return "EE"
	if(bsize == BreastsSize.F):
		return "F"
	if(bsize == BreastsSize.FF):
		return "FF"
	if(bsize == BreastsSize.G):
		return "G"
	if(bsize == BreastsSize.GG):
		return "GG"
	return "Error?"

func getTooltipInfo():
	return "size: " + breastSizeToString(size) + "\n" + "Gonna be more stuff here"
