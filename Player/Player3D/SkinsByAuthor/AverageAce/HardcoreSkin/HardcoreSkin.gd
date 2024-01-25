extends SkinBase

func _init():
	id = "HardcoreSkin"

func getName():
	return "Hardcore"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/HardcoreSkin/HardcoreSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 0.2,
		SkinType.Scales: 0.2,
		SkinType.SkinAndFur: 1.0,
	}
