extends SkinBase

func _init():
	id = "NovaSkin"

func getName():
	return "Soft"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/NovaSkin/novaSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
