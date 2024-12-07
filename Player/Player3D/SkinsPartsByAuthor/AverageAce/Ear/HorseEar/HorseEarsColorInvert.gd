extends PartSkinBase

func _init():
	id = "horseearscolorinvert"
	partID = "horseears"

func getName():
	return "Color Invert"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/HorseEar/horseEars_ColorInvert.png"),
	}
