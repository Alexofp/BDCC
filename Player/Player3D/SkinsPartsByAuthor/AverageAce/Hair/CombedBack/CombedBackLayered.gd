extends PartSkinBase

func _init():
	id = "combedlayered"
	partID = "combedbackhair"

func getName():
	return "Layered"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/CombedBack/CombedBackLayered.png"),
	}
