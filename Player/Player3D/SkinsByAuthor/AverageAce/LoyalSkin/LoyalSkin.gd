extends SkinBase

func _init():
	id = "LoyalSkin"

func getName():
	return "Loyal"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/LoyalSkin/LoyalSkin_f_s.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
