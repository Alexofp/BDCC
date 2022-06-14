extends BodypartBreasts

func _init():
	visibleName = "breasts"
	id = "humanbreasts"
	dollType = ""
	size = BreastsSize.C

# {FOREVER_FLAT = -1, FLAT = 0, A = 1, B = 2, C = 3, D = 4, DD = 5, E = 6, EE = 7, F = 8, FF = 9, G = 10, GG = 11}

func _getDollType():
	var thesize = getSize()
	if(thesize <= BreastsSize.FLAT):
		return "Flat"
	if(thesize <= BreastsSize.A):
		return "Small"
	if(thesize <= BreastsSize.B):
		return "Medium"
	if(thesize <= BreastsSize.C):
		return "Curvy"
	return "Big"

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	var thesize = getSize()
	if(thesize <= BreastsSize.FLAT):
		return "res://Player/Player3D/Parts/Breasts/BreastsFlat/BreastsFlat.tscn"
	if(thesize <= BreastsSize.A):
		return "res://Player/Player3D/Parts/Breasts/BreastsSmall/BreastsSmall.tscn"
	if(thesize <= BreastsSize.B):
		return "res://Player/Player3D/Parts/Breasts/BreastsMedium/BreastsMedium.tscn"
	if(thesize <= BreastsSize.C):
		return "res://Player/Player3D/Parts/Breasts/BreastsCurvy/BreastsCurvy.tscn"
	return "res://Player/Player3D/Parts/Breasts/BreastsBig/BreastsBig.tscn"
