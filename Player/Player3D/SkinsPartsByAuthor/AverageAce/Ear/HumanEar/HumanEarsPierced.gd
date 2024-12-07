extends PartSkinBase

func _init():
	id = "humanearspierced"
	partID = "humanears"

func getName():
	return "Pierced"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/HumanEar/HumanEar_Pierced.png"),
	}
