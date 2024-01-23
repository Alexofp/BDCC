extends SkinBase

func _init():
	id = "SmuttySkin"

func getName():
	return "Smutty"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/SmuttySkin/SmuttySkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
