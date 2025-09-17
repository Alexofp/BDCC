extends SkinBase

func _init():
	id = "FerriSkin"

func getName():
	return "Ferocious"

func getPatternTexture():
	return load("res://Player/Player3D/Skins/FerriSkin/ferriSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
