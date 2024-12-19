extends PartSkinBase

func _init():
	id = "bulldogcolorinvert"
	partID = "bulldogears"

func getName():
	return "Color Invert"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/BulldogEar/Bulldog_ColorInvert.png"),
	}
