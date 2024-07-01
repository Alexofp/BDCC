extends PartSkinBase

func _init():
	id = "hawkwild"
	partID = "mohawkhair"

func getName():
	return "Wild"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/Mohawk/MohawkWild.png"),
	}
