extends PartSkinBase

func _init():
	id = "hawkrebel"
	partID = "mohawkhair"

func getName():
	return "Rebel"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/Mohawk/MohawkRebel.png"),
	}
