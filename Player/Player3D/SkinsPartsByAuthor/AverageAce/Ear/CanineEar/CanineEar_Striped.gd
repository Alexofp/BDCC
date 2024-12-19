extends PartSkinBase

func _init():
	id = "canineearstriped"
	partID = "canineears"

func getName():
	return "Striped"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/CanineEar/Canine_Striped.png"),
	}
