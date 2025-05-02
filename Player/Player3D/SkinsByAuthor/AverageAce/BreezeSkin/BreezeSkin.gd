extends SkinBase

func _init():
	id = "BreezeSkin"

func getName():
	return "Breeze"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/BreezeSkin/BreezeSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
