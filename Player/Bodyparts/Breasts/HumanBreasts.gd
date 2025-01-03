extends BodypartBreasts

func _init():
	visibleName = "breasts"
	id = "humanbreasts"
	size = BreastsSize.C

func getTraits():
	return {
		PartTrait.BreastsFemale: true,
	}

# {FOREVER_FLAT = -1, FLAT = 0, A = 1, B = 2, C = 3, D = 4, DD = 5, E = 6, EE = 7, F = 8, FF = 9, G = 10, GG = 11}

func getCompatibleSpecies():
	return [Species.Any]

func getBreastsScale():
	var thesize = getSize()
	return BreastsSize.breastSizeToBoneScale(thesize)

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

func generateDataFor(_dynamicCharacter):
	size = RNG.pick([
		BreastsSize.A, BreastsSize.B, BreastsSize.C, BreastsSize.D, BreastsSize.DD, BreastsSize.DDD,
	])

func getVulgarName() -> String:
	return "female breasts"

func getAVulgarName() -> String:
	return getVulgarName()
