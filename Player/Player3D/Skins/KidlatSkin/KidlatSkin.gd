extends SkinBase

func _init():
	id = "KidlatSkin"

func getName():
	return "Neon kid"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/KidlatSkin/KidlatSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
