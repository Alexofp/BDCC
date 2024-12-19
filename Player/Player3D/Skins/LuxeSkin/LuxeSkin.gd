extends SkinBase

func _init():
	id = "LuxeSkin"

func getName():
	return "Lux"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/LuxeSkin/luxeSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
