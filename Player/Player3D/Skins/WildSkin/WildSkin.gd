extends SkinBase

func _init():
	id = "WildSkin"

func getName():
	return "Wild"

func getPatternTexture():
	return load("res://Player/Player3D/Skins/WildSkin/WildSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
