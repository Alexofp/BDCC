extends PartSkinBase

func _init():
	id = "wolfearsindustrial"
	partID = "wolfears"

func getName():
	return "Industrial"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/WolfEar/wolfEars_Industrial.png"),
	}
