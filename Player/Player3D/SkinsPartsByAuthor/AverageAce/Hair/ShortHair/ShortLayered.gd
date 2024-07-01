extends PartSkinBase

func _init():
	id = "shorthairlayered"
	partID = "shorthair"

func getName():
	return "Layered"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/ShortHair/hairshort_Layered.png"),
	}
