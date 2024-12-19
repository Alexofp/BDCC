extends PartSkinBase

func _init():
	id = "humanearsoildcolors"
	partID = "humanears"

func getName():
	return "Solid Colors"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/HumanEar/HumanEar_SolidColors.png"),
	}
