extends SkinBase

func _init():
	id = "SpottedGothicSkin"

func getName():
	return "Spotted Gothic"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/SpottedGothicSkin/SpottedGothicSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
