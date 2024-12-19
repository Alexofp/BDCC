extends PartSkinBase

func _init():
	id = "fennecearscolorinvert"
	partID = "fennecears"

func getName():
	return "Color Invert"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/FennecEar/fennecEars_ColorInvert.png"),
	}
