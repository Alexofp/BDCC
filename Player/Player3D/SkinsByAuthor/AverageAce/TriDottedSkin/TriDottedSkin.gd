extends SkinBase

func _init():
	id = "TriDottedSkin"

func getName():
	return "Tri-Dotted"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/TriDottedSkin/TriDottedSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
