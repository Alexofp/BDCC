extends PartSkinBase

func _init():
	id = "Infected"
	partID = "ovipositorpenis"

func getName():
	return "Infected"

func getPatternTexture():
	return {
		"": load("res://Player/Player3D/SkinsParts/Penis/OviPenis/Infected.png"),
		"limp": load("res://Player/Player3D/SkinsParts/Penis/OviPenis/Infected_limp.png"),
	}
	
	 
