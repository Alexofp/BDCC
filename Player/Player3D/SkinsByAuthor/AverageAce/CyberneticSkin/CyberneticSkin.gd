extends SkinBase

func _init():
	id = "CyberneticSkin"

func getName():
	return "Cybernetic"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/CyberneticSkin/CyberneticSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
