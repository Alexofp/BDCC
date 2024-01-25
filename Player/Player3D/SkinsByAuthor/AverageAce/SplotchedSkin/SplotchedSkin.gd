extends SkinBase

func _init():
	id = "SplotchedSkin"

func getName():
	return "Splotched"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/SplotchedSkin/SplotchedSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 0.2,
		SkinType.Scales: 0.2,
		SkinType.SkinAndFur: 1.0,
	}
