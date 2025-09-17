extends SkinBase

func _init():
	id = "RockStarSkin"

func getName():
	return "RockStar"

func getPatternTexture():
	return load("res://Player/Player3D/SkinsByAuthor/AverageAce/RockStarSkin/RockStarSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
