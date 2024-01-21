extends Reference
class_name PartSkinBase

var id = "error"
var partID = ""
var author = ""

func getName():
	return "Error"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/EmptySkin/EmptySkin.png")

func getAuthor():
	return author
