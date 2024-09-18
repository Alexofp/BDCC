extends SkinBase

func _init():
	id = "AngledSkin"

func getName():
	return "Angled"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/AngledSkin/Angled_f_s.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
