extends SkinBase

func _init():
	id = "ArconSkin"

func getName():
	return "Arcon"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/ArconSkin/arconSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
