extends PartSkinBase

func _init():
	id = "felineearshazard"
	partID = "felineears"

func getName():
	return "Hazard"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/FelineEar/CatEars_Hazard.png"),
	}
