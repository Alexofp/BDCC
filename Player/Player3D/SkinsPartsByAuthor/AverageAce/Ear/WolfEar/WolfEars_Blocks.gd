extends PartSkinBase

func _init():
	id = "wolfearsblocks"
	partID = "wolfears"

func getName():
	return "Blocks"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/WolfEar/wolfEars_Blocks.png"),
	}
