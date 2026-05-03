extends PartSkinBase

func _init():
	id = "Veins"
	partID = "ovipositorpenis"

func getName():
	return "Veins"

func getPatternTexture():
	return {
		"": load("res://Player/Player3D/SkinsParts/Penis/OviPenis/Veins.png"),
		"limp": load("res://Player/Player3D/SkinsParts/Penis/OviPenis/Veins_limp.png"),
	}
	
	 
