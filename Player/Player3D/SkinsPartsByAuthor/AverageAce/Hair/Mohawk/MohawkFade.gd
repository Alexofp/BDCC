extends PartSkinBase

func _init():
	id = "hawkfade"
	partID = "mohawkhair"

func getName():
	return "Fade"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/Mohawk/MohawkFade.png"),
	}
