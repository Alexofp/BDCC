extends SkinBase

func _init():
	id = "WoonaSkin"

func getName():
	return "Anger"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/WoonaSkin/woonaSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
