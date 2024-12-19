extends PartSkinBase

func _init():
	id = "wolfearscolorinverted"
	partID = "wolfears"

func getName():
	return "Color Invert"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/WolfEar/wolfEars_ColorInvert.png"),
	}
