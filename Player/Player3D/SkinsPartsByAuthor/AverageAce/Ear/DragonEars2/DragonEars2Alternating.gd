extends PartSkinBase

func _init():
	id = "dragonearsalternating"
	partID = "dragonears2"

func getName():
	return "Alternating"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/DragonEars2/DragonEars2_Alternating.png"),
	}
