extends Object
class_name TFUtil

static func getRandomColorsForSpecies(species:Array) -> Array:
	if(species.empty()):
		species = [Species.Canine]
	
	if(species.size() > 1 && species.has(Species.Human)):
		species = species.duplicate()
		species.erase(Species.Human)
	
	var skinColors = GlobalRegistry.getSpecies(RNG.pick(species)).generateSkinColors()
	return skinColors
	

static func getRandomSkinForSpecies(species:Array) -> String:
	var possibleSkins:Array = []
	for speciesOne in species:
		var theSpecies = GlobalRegistry.getSpecies(speciesOne)
		var skinType = theSpecies.getSkinType()
		if(species.size() > 1 && speciesOne == Species.Human):
			skinType = SkinType.SkinAndFur
		
		for skinID in GlobalRegistry.getSkinsAllKeys():
			var theSkin = GlobalRegistry.getSkin(skinID)
			var fittingSkinTypes = theSkin.getFittingSkinTypes()
			if(fittingSkinTypes is Dictionary && fittingSkinTypes.has(skinType)):
				possibleSkins.append([skinID, fittingSkinTypes[skinType]])
		
	if(possibleSkins.empty()):
		return "EmptySkin"
	return RNG.pickWeightedPairs(possibleSkins)

static func colorInterpolateStr(col1, col2, weight:float) -> String:
	if(col1 is String):
		col1 = Color(col1)
	if(col2 is String):
		col2 = Color(col2)
	
	#return Color.from_hsv(col1.h*(1.0-weight)+col2.h*weight, col1.s*(1.0-weight)+col2.s*weight, col1.v*(1.0-weight)+col2.v*weight).to_html()
	
	#return col1.linear_interpolate(col2, weight).to_html()
	return Color.from_hsv(col1.h*(1.0-weight)+col2.h*weight, col1.s*(1.0-weight)+col2.s*weight, col1.v*(1.0-weight)+col2.v*weight).linear_interpolate(col1.linear_interpolate(col2, weight), 0.7).to_html()
