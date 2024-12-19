extends PartSkinBase

func _init():
	id = "canineearfade"
	partID = "canineears"

func getName():
	return "Fade"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/CanineEar/Canine_Fade.png"),
	}
