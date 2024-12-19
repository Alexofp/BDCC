extends PartSkinBase

func _init():
	id = "fennecearsinnerhighlight"
	partID = "fennecears"

func getName():
	return "Inner Highlight"

func getPatternTexture():
	return {
		"": preload("res://Player/Player3D/SkinsPartsByAuthor/AverageAce/Ear/FennecEar/fennecEars_InnerHighlights.png"),
	}
