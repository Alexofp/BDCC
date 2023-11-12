extends SkinBase

func _init():
	id = "VerySpiky"

func getName():
	return "Very Spiky"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/VerySpiky/veryspiky.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
