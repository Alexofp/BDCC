extends SkinBase

func _init():
	id = "ArticSkin"

func getName():
	return "Artic"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/ArticSkin/articSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 0.3,
		SkinType.Scales: 0.3,
	}
