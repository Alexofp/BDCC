extends PartSkinBase

func _init():
	id = "wolfearstribal"
	partID = "wolfears"

func getName():
	return "Tribal"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/WolfEar/wolfEars_Tribal.png"),
	}
