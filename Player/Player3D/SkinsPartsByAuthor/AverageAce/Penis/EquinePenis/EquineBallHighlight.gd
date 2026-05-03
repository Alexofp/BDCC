extends PartSkinBase

func _init():
	id = "equinehighlight"
	partID = "equinepenis"

func getName():
	return "Ball Highlight"

func getPatternTexture():
	return {
		"": load("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Penis/EquinePenis/EquineBalls.png"),
		"limp": load("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Penis/EquinePenis/EquineBalls_limp.png"),
	}
	
	 
