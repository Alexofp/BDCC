extends PartSkinBase

func _init():
	id = "dragonearscolorinvert"
	partID = "dragonears"

func getName():
	return "Color Invert"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/DragonEars/DragonEars_ColorInverted.png"),
	}
