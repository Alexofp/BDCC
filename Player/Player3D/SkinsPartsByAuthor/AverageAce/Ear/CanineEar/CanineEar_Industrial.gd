extends PartSkinBase

func _init():
	id = "canineearindustrial"
	partID = "canineears"

func getName():
	return "Industrial"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/CanineEar/Canine_Industrial.png"),
	}
