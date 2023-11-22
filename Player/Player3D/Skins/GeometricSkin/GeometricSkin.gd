extends SkinBase

func _init():
	id = "GeometricSkin"

func getName():
	return "Geometric"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/GeometricSkin/geometricSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
