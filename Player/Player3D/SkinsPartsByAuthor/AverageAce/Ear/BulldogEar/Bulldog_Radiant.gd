extends PartSkinBase

func _init():
	id = "bulldogradiant"
	partID = "bulldogears"

func getName():
	return "Radiant"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/BulldogEar/Bulldog_Radiant.png"),
	}
