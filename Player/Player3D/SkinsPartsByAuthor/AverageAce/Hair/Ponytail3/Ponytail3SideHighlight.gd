extends PartSkinBase

func _init():
	id = "ponytail3highlight"
	partID = "ponytailhair3"

func getName():
	return "Side Highlight"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Hair/Ponytail3/ponytail3_SideHighlight.png"),
	}
