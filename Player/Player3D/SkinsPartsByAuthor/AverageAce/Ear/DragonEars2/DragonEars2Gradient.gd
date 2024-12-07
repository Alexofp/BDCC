extends PartSkinBase

func _init():
	id = "dragonears2gradient"
	partID = "dragonears2"

func getName():
	return "Gradient"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/DragonEars2/DragonEars2_Gradient.png"),
	}
