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

func getExtraDesc():
	var result = []
	if(has_method("saveData")):
		result.append("[i]Datapack skin[/i] "+str(author))
	if(author != null && author != ""):
		result.append("[i]Created by:[/i] "+str(author))
	if(result.empty()):
		return ""
	return "\n"+Util.join(result, "\n")
