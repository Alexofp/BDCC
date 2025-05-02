extends SkinBase

func _init():
	id = "SphinxCatSkin"

func getName():
	return "Sphinx"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/SphinxCatSkin/SphinxCatSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 0.1,
	}
