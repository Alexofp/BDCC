extends PartSkinBase

func _init():
	id = "horseearspierceings"
	partID = "horseears"

func getName():
	return "Piercings"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/HorseEar/horseEars_Piercings.png"),
	}
