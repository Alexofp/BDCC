extends PartSkinBase

func _init():
	id = "ponytailtwosided"
	partID = "ponytailhair"

func getName():
	return "two sided"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/Ponytail1/ponytail1_Dual.png"),
	}
