extends SkinBase

func _init():
	id = "SkinExample"

func getName():
	return "Example skin"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/SkinExample/SkinExample.png")
