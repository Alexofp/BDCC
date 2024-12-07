extends PartSkinBase

func _init():
	id = "felineearstriped"
	partID = "felineears"

func getName():
	return "Striped"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/FelineEar/CatEars_Striped.png"),
	}
