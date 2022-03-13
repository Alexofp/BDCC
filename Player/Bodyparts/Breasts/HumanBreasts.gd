extends BodypartBreasts

func _init():
	visibleName = "breasts"
	id = "humanbreasts"
	dollType = ""
	size = BreastsSize.C

# {FOREVER_FLAT = -1, FLAT = 0, A = 1, B = 2, C = 3, D = 4, DD = 5, E = 6, EE = 7, F = 8, FF = 9, G = 10, GG = 11}

func _getDollType():
	if(size <= BreastsSize.FLAT):
		return "Flat"
	if(size <= BreastsSize.A):
		return "Small"
	if(size <= BreastsSize.B):
		return "Medium"
	if(size <= BreastsSize.C):
		return "Curvy"
	return "Big"

func getCompatibleSpecies():
	return [Species.Any]
