extends Reference
class_name SkinBase

var id = "error"

func getName():
	return "Error"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/EmptySkin/EmptySkin.png")

func getFittingSkinTypes():
	return {}
