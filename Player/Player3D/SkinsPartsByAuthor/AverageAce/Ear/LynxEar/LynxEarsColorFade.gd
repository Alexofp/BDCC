extends PartSkinBase

func _init():
	id = "lynxearsfade"
	partID = "lynxears"

func getName():
	return "Fade"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/LynxEar/earsLynx_Fade.png"),
	}
