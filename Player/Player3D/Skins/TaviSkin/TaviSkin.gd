extends SkinBase

func _init():
	id = "TaviSkin"

func getName():
	return "Weird"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/TaviSkin/TaviSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 0.1,
		SkinType.Scales: 0.1,
	}
