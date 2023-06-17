extends Reference
class_name SkinBase

var id = "error"
var hasRedChannel = true
var hasBlueChannel = true
var hasGreenChannel = true

func getName():
	return "Error"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/EmptySkin/EmptySkin.png")


func getChannelAmount():
	var result:int = 0
	if(hasRedChannel):
		result += 1
	if(hasBlueChannel):
		result += 1
	if(hasGreenChannel):
		result += 1
	return result
