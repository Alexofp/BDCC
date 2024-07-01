extends PartSkinBase

func _init():
	id = "ponytail3fade"
	partID = "ponytailhair3"

func getName():
	return "Tail Fade"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/Ponytail3/ponytail3_Fade.png"),
	}
