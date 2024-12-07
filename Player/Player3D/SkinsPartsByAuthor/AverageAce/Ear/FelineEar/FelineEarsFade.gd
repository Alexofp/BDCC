extends PartSkinBase

func _init():
	id = "felineearsfade"
	partID = "felineears"

func getName():
	return "Fade"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/FelineEar/CatEars_Fade.png"),
	}
