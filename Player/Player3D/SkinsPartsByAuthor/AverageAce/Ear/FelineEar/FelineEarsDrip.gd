extends PartSkinBase

func _init():
	id = "felineearsdrip"
	partID = "felineears"

func getName():
	return "Drip"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/FelineEar/CatEars_Drip.png"),
	}
