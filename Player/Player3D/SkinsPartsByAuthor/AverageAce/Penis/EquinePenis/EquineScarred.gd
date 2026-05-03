extends PartSkinBase

func _init():
	id = "equinescarred"
	partID = "equinepenis"

func getName():
	return "Scarred"

func getPatternTexture():
	return {
		"": load("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Penis/EquinePenis/EquineScarred.png"),
		"limp": load("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Penis/EquinePenis/EquineScarred_limp.png"),
	}
	
	 
