extends PartSkinBase

func _init():
	id = "jackitwotips"
	partID = "jackihair"

func getName():
	return "Dual Tips"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/JackiHair/JackiHairTwoTone.png"),
	}
