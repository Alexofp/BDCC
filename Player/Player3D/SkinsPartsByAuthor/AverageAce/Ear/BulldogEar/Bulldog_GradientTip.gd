extends PartSkinBase

func _init():
	id = "bulldoggradienttip"
	partID = "bulldogears"

func getName():
	return "Tip Gradient"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/BulldogEar/Bulldog_GradientTip.png"),
	}
