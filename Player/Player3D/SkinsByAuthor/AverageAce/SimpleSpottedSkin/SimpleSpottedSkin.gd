extends SkinBase

func _init():
	id = "SimpleSpottedSkin"

func getName():
	return "Simple Spotted"

func getPatternTexture():
	return preload("res://Player/Player3D/SkinsByAuthor/AverageAce/SimpleSpottedSkin/SimpleSpottedSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
