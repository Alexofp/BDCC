extends PartSkinBase

func _init():
	id = "felineearscolorinvert"
	partID = "felineears"

func getName():
	return "Color Invert"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/FelineEar/CatEars_ColorInverted.png"),
	}
