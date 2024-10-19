extends SkinBase

func _init():
	id = "BlockedSkin"

func getName():
	return "Blocked"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/BlockedSkin/BlockedSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
