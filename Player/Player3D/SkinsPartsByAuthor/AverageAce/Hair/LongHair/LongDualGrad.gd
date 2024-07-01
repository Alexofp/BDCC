extends PartSkinBase

func _init():
	id = "longhairdualgrad"
	partID = "longhair"

func getName():
	return "Two-Sided"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/LongHair/hairlong_DualGradient.png"),
	}
