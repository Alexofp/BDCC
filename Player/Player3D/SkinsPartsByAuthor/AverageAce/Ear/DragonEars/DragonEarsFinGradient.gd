extends PartSkinBase

func _init():
	id = "dragonearsfingradient"
	partID = "dragonears"

func getName():
	return "Fin Gradient"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/DragonEars/DragonEars_FinGradient.png"),
	}
