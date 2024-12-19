extends PartSkinBase

func _init():
	id = "dragonears2edgehighlight"
	partID = "dragonears2"

func getName():
	return "Edge Highlight"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/DragonEars2/DragonEars2_EdgeHighlight.png"),
	}
