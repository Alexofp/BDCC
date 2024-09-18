extends SkinBase

func _init():
	id = "DappledSkin"

func getName():
	return "Dappled"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/DappledSkin/Dappled_f_s.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
