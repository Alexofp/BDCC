extends PartSkinBase

func _init():
	id = "shorthairfadehighlight"
	partID = "shorthair"

func getName():
	return "Fade + Highlight"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/ShortHair/hairshort_Fade.png"),
	}
