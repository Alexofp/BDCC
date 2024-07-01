extends PartSkinBase

func _init():
	id = "sockethairtopbottom"
	partID = "sockethair"

func getName():
	return "Roots and Ends"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/SocketHair/sockethair_TopAndBottom.png"),
	}
