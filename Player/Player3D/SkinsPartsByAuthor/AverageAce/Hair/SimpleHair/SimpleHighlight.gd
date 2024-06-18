extends PartSkinBase

func _init():
	id = "simplehairhighlight"
	partID = "simplehair"

func getName():
	return "Highlight"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/SimpleHair/hairsimple_Highlight.png"),
	}
