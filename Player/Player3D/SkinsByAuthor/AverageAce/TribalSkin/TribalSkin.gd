extends SkinBase

func _init():
	id = "TribalSkin"

func getName():
	return "Tribal"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/TribalSkin/TribalSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
		SkinType.SkinAndFur: 1.0,
	}
