extends SkinBase

func _init():
	id = "SkinExample"
	hasRedChannel = true
	hasBlueChannel = true
	hasGreenChannel = true

func getName():
	return "Example skin"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/SkinExample/SkinExample.png")
