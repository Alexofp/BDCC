extends PartSkinBase

func _init():
	id = "jackiinverted"
	partID = "jackihair"

func getName():
	return "Inverted"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/JackiHair/JackiHairInverted.png"),
	}
