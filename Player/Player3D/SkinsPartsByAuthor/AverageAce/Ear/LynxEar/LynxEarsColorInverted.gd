extends PartSkinBase

func _init():
	id = "lynxearscolorinverted"
	partID = "lynxears"

func getName():
	return "Color Invert"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/LynxEar/earsLynx_ColorInvert.png"),
	}
