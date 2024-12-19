extends PartSkinBase

func _init():
	id = "bulldogspotted"
	partID = "bulldogears"

func getName():
	return "Spotted"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/BulldogEar/Bulldog_Spotted.png"),
	}
