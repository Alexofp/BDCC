extends Reference
class_name SkinBase

var id = "error"
var author = ""
var datapackID = ""

func getName():
	return "Error"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/EmptySkin/EmptySkin.png")

func getFittingSkinTypes():
	return {}

func getAuthor():
	return author

func getExtraDesc():
	var result = []
	if(datapackID != null && datapackID != ""):
		result.append("[i]Datapack:[/i] "+str(datapackID))
	if(author != null && author != ""):
		result.append("[i]Created by:[/i] "+str(author))
	if(result.empty()):
		return ""
	return "\n"+Util.join(result, "\n")
