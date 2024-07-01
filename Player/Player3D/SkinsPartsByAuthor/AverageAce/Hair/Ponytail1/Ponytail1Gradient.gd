extends PartSkinBase

func _init():
	id = "ponytailgradient"
	partID = "ponytailhair"

func getName():
	return "Gradient"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/Ponytail1/ponytail1_Gradient.png"),
	}
