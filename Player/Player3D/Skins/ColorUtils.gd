extends Object
class_name ColorUtils

static func mutateColorRandomly(theColor:Color, similliarChance = 33, complementChance = 33, hugeShiftChance = 33):
	var possible = ["s", "c", "h"]
	var pickedMutation = RNG.pickWeighted(possible, [similliarChance, complementChance, hugeShiftChance])
	if(pickedMutation == "s"):
		var newColor = Color(
			theColor.r + RNG.randf_range(-0.1, 0.1),
			theColor.g + RNG.randf_range(-0.1, 0.1),
			theColor.b + RNG.randf_range(-0.1, 0.1)
		)
		return newColor
	if(pickedMutation == "c"):
		var newColor = Color(
			1.0 - theColor.r,
			1.0 - theColor.g,
			1.0 - theColor.b
		)
		#if(RNG.chance(50)):
		#	return newColor.blend(theColor)
		return newColor
	if(pickedMutation == "h"):
		theColor.h = theColor.h + RNG.randf_range(-0.3, 0.3)
		return theColor
	
	return theColor

static func mutateColorSlightly(theColor:Color):
	return mutateColorRandomly(theColor, 33.0, 0.0, 10.0)

static func generateUnrealisticHairColors():
	var primaryColor = Color(RNG.randf_range(0.0, 0.9), RNG.randf_range(0.0, 0.9), RNG.randf_range(0.0, 0.9)) # Random primary color

	var secondaryColor: Color = mutateColorRandomly(primaryColor)
	var tertiaryColor: Color = mutateColorRandomly(primaryColor)

	return [primaryColor, secondaryColor, tertiaryColor]

static func generateRealisticHairColors():
	var possibleColors = [
		["#000000", "#000000", "#000000"],  # Black
		["#2C1E0A", "#6B4E1D", "#8D6938"],  # Brown
		["#40210C", "#8B5B33", "#B1784A"],  # Dark Brown
		["#8B4513", "#CC9B6D", "#E0B98C"],  # Light Brown
		["#6D4E37", "#AE8762", "#D4BDA0"],  # Auburn
		["#61380B", "#B58229", "#DAA661"],  # Chestnut
		["#8A0808", "#CD3333", "#FF6E6E"],  # Red
		["#5A4D41", "#8B7E66", "#B5A98F"],  # Dirty Blonde
		["#F5DEB3", "#FFE7BA", "#FFF0C6"],  # Blonde
		["#FFF8DC", "#FCE9C4", "#FFF2D9"],  # Light Blonde
		["#D6D6D6", "#EAEAEA", "#FFFFFF"],  # Gray
	]
	
	var randomPalette = RNG.pick(possibleColors)
	return [Color(randomPalette[0]), Color(randomPalette[1]), Color(randomPalette[2])]



static func generateGenericFurryColors():
	var strategies = ["Toxic", "BrownColorColor", "WhiteGrayColor"]
	var pickedStrategy = RNG.pick(strategies)
	if(pickedStrategy == "WhiteGrayColor"):
		var primaryColor = Color(RNG.randf_range(0.9, 1.0), RNG.randf_range(0.9, 1.0), RNG.randf_range(0.9, 1.0))
		var secondaryColor = Color(RNG.randf_range(0.6, 0.8), RNG.randf_range(0.6, 0.8), RNG.randf_range(0.6, 0.8))
		var tertiaryColor = Color.from_hsv(RNG.randf_range(0.0, 1.0), RNG.randf_range(0.6, 0.8), RNG.randf_range(0.3, 0.8))
		primaryColor.h = tertiaryColor.h
		secondaryColor.h = tertiaryColor.h
		if(RNG.chance(50)):
			var copyColor = secondaryColor
			secondaryColor = tertiaryColor
			tertiaryColor = copyColor
		return [primaryColor, secondaryColor, tertiaryColor]
	elif(pickedStrategy == "WhiteBlackColor"):
		var primaryColor = Color(RNG.randf_range(0.8, 1.0), RNG.randf_range(0.8, 1.0), RNG.randf_range(0.8, 1.0))
		var secondaryColor = Color(RNG.randf_range(0.1, 0.25), RNG.randf_range(0.1, 0.25), RNG.randf_range(0.1, 0.25))
		var tertiaryColor = generateRandomPleasingFurColor().linear_interpolate(Color.from_hsv(RNG.randf_range(0.0, 1.0), RNG.randf_range(0.6, 1.0), RNG.randf_range(0.9, 1.0)), RNG.randf_range(0.0, 1.0))
		primaryColor.s /= 4.0
		secondaryColor.s /= 4.0
		if(RNG.chance(50)):
			secondaryColor.h = tertiaryColor.h
		else:
			secondaryColor.h = primaryColor.h
		if(RNG.chance(50)):
			var copyColor = secondaryColor
			secondaryColor = primaryColor
			primaryColor = copyColor
		if(RNG.chance(50)):
			var copyColor = secondaryColor
			secondaryColor = tertiaryColor
			tertiaryColor = copyColor
		return [primaryColor, secondaryColor, tertiaryColor]
	elif(pickedStrategy == "Toxic"):
		var primaryColor = Color(RNG.randf_rangeX2(0.05, 0.2), RNG.randf_rangeX2(0.05, 0.2), RNG.randf_rangeX2(0.05, 0.2))
		if(RNG.chance(50)):
			primaryColor = primaryColor.inverted()
		if(primaryColor.v < 0.3):
			primaryColor.v = 0.3
		#var secondaryColor = Color.from_hsv(RNG.randf_range(0.0, 1.0), RNG.randf_range(0.6, 1.0), RNG.randf_range(0.9, 1.0))
		var secondaryColor = generateRandomPleasingFurColor()
		if(RNG.chance(30)):
			secondaryColor = Color.from_hsv(RNG.randf_range(0.0, 1.0), RNG.randf_range(0.6, 1.0), RNG.randf_range(0.9, 1.0))
		primaryColor.h = secondaryColor.h
		var tertiaryColor = primaryColor.linear_interpolate(secondaryColor, RNG.randf_rangeX2(0.2, 0.5))
		
		return [primaryColor, secondaryColor, tertiaryColor]
	elif(pickedStrategy == "BrownColorColor"):
		var primaryColor = generateRandomPleasingFurColor()#generateRandomBrownishFurColor()#Color(RNG.randf_range(0.0, 0.9), RNG.randf_range(0.0, 0.9), RNG.randf_range(0.0, 0.9)) # Random primary color
		var secondaryColor: Color = primaryColor
		var tertiaryColor: Color = primaryColor
		secondaryColor.v -= RNG.randf_range(0.1, 0.3)
		tertiaryColor.s -= RNG.randf_range(0.1, 0.3)
		tertiaryColor.v += RNG.randf_range(0.1, 0.3)
		
		#if(RNG.chance(30)):
		#	primaryColor = mutateColorRandomly(primaryColor)
		
		#if(RNG.chance(10)):
		#	secondaryColor.h += 0.33
		#elif(RNG.chance(30)):
		#	secondaryColor.h += RNG.randf_range(-0.1, 0.1)
			
		#if(RNG.chance(10)):
		#	tertiaryColor.h += 0.66
		#elif(RNG.chance(30)):
		#	tertiaryColor.h += RNG.randf_range(-0.1, 0.1)

		#secondaryColor = mutateColorSlightly(secondaryColor)
		#tertiaryColor = mutateColorSlightly(tertiaryColor)
		
		return [primaryColor, secondaryColor, tertiaryColor]
	return [Color.white, Color.lightgray, Color.darkgray]

static func generateGenericHumanSkinColors():
	var tones = [
		["#FDF1DE", "#E5C9A8", "#FFEDBF"],  # Very pale
		["#FCE8D3", "#D9BFA8", "#FFDFB2"],  # Pale
		["#FBD6B0", "#CFA686", "#FFCE9D"],  # Light
		["#F8C39D", "#B99573", "#FFC19E"],  # Medium-Light
		["#E3A684", "#9B7259", "#EBAE93"],  # Medium
		["#C87D52", "#7E5439", "#FF9C7C"],  # Medium-Dark
		["#A2532E", "#612E19", "#FF8062"],  # Dark
		["#5F2910", "#3E1C0E", "#E05137"],  # Very dark
	]
	
	var randomSkinTone = RNG.pick(tones)
	return [Color(randomSkinTone[0]), Color(randomSkinTone[1]), Color(randomSkinTone[2])]

static func generateRandomBrownishFurColor():
	var brownish_colors = [
		"#8B4513", "#964B00", "#A0522D", "#CD853F", "#D2691E",
		"#8B7D6B", "#B8860B", "#8B6914", "#DAA520", "#BC8F8F"
	]
	return Color(RNG.pick(brownish_colors))

static func generateRandomPleasingFurColor():
	return Color.from_hsv(RNG.randf_rangeX2(-0.1, 0.2), RNG.randf_rangeX2(0.2, 0.8), RNG.randf_rangeX2(0.2, 0.8))

static func generateRandomVibrantColor():
	return Color.from_hsv(RNG.randf_range(0.0, 1.0), RNG.randf_range(0.6, 1.0), RNG.randf_range(0.9, 1.0))

static func generate3ColorsFromMainColor(primaryColor: Color):
	var secondaryColor: Color = primaryColor
	var tertiaryColor: Color = primaryColor
	secondaryColor.v -= RNG.randf_range(0.1, 0.3)
	tertiaryColor.s -= RNG.randf_range(0.1, 0.3)
	tertiaryColor.v += RNG.randf_range(0.1, 0.3)
	
	return [primaryColor, secondaryColor, tertiaryColor]
