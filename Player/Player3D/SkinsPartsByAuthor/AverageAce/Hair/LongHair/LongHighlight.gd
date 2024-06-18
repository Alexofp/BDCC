extends PartSkinBase

func _init():
	id = "longhairhighlight"
	partID = "longhair"

func getName():
	return "Highlight"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/LongHair/hairlong_Highlight.png"),
	}
