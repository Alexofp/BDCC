extends SkinBase

func _init():
	id = "CunningSkin"

func getName():
	return "Cunning"

func getPatternTexture():
	return load("res://Player/Player3D/Skins/CunningSkin/SimpleSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
