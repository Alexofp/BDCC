extends SkinBase

func _init():
	id = "LynxSkin"

func getName():
	return "Lynx"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/LynxSkin/lynxSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
