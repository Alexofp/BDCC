extends PartSkinBase

func _init():
	id = "sockethairoverlap"
	partID = "sockethair"

func getName():
	return "Overlap"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/SocketHair/sockethair_Overlap.png"),
	}
