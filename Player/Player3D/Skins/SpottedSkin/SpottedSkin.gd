extends SkinBase

func _init():
	id = "SpottedSkin"

func getName():
	return "Spotted"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/SpottedSkin/SpottedSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
