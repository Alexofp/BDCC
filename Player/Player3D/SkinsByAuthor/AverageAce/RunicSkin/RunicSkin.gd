extends SkinBase

func _init():
	id = "RunicSkin"

func getName():
	return "Runic"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/RunicSkin/RunicSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.SkinAndFur: 1.0,
	}
