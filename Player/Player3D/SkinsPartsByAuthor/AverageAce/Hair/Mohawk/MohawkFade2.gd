extends PartSkinBase

func _init():
	id = "hawkfade2"
	partID = "mohawkhair"

func getName():
	return "Fade + Highlights"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/Mohawk/MohawkFade2.png"),
	}
