extends PartSkinBase

func _init():
	id = "Glow"
	partID = "ovipositorpenis"

func getName():
	return "Glow"

func getPatternTexture():
	return {
		"": load("res://Player/Player3D/SkinsParts/Penis/OviPenis/Glow.png"),
		"limp": load("res://Player/Player3D/SkinsParts/Penis/OviPenis/Glow_limp.png"),
	}
	
	 
