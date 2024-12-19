extends PartSkinBase

func _init():
	id = "wolfearspierced"
	partID = "wolfears"

func getName():
	return "Pierced"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/WolfEar/wolfEars_Pierced.png"),
	}
