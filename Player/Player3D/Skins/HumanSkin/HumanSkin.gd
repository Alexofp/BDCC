extends SkinBase

func _init():
	id = "HumanSkin"

func getName():
	return "Human Skin"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/HumanSkin/HumanSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.SkinHuman: 1.0,
	}
