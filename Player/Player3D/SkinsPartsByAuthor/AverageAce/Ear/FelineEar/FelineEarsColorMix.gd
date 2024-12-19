extends PartSkinBase

func _init():
	id = "felineearscolormix"
	partID = "felineears"

func getName():
	return "Color Mix"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/FelineEar/CatEars_ColorMix.png"),
	}
