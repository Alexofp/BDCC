extends BodypartBreasts

func _init():
	visibleName = "breasts"
	id = "humanbreasts"
	size = BreastsSize.C

# {FOREVER_FLAT = -1, FLAT = 0, A = 1, B = 2, C = 3, D = 4, DD = 5, E = 6, EE = 7, F = 8, FF = 9, G = 10, GG = 11}

func getCompatibleSpecies():
	return [Species.Any]

func getBreastsScale():
	var thesize = getSize()
	if(thesize <= BreastsSize.FLAT):
		return 0.5
	if(thesize <= BreastsSize.A):
		return 0.5
	if(thesize <= BreastsSize.B):
		return 0.6
	if(thesize <= BreastsSize.C):
		return 0.8
	if(thesize <= BreastsSize.D):
		return 1.0
	if(thesize <= BreastsSize.DD):
		return 1.05
	if(thesize <= BreastsSize.E):
		return 1.1
	if(thesize <= BreastsSize.EE):
		return 1.15
	if(thesize <= BreastsSize.F):
		return 1.2
	if(thesize <= BreastsSize.FF):
		return 1.3
	if(thesize <= BreastsSize.G):
		return 1.4
	if(thesize <= BreastsSize.GG):
		return 1.5
	return 1.7

func getDoll3DScene():
	var thesize = getSize()
	if(thesize <= BreastsSize.FLAT):
		return "res://Player/Player3D/Parts/Breasts/BreastsFlat/BreastsFlat.tscn"
	return "res://Player/Player3D/Parts/Breasts/BreastsScaleable/BreastsScaleable.tscn"

#func OLDgetDoll3DScene():
#	var thesize = getSize()
#	if(thesize <= BreastsSize.FLAT):
#		return "res://Player/Player3D/Parts/Breasts/BreastsFlat/BreastsFlat.tscn"
#	if(thesize <= BreastsSize.A):
#		return "res://Player/Player3D/Parts/Breasts/BreastsSmall/BreastsSmall.tscn"
#	if(thesize <= BreastsSize.B):
#		return "res://Player/Player3D/Parts/Breasts/BreastsMedium/BreastsMedium.tscn"
#	if(thesize <= BreastsSize.C):
#		return "res://Player/Player3D/Parts/Breasts/BreastsCurvy/BreastsCurvy.tscn"
#	return "res://Player/Player3D/Parts/Breasts/BreastsBig/BreastsBig.tscn"
