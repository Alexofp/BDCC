extends Reference
class_name ImagePack

var id = "error"
var artist = "Unknown"
var characters = {}

func addCharacter(characterID:String, variant:Array, path:String):
	if(!characters.has(characterID)):
		characters[characterID] = {}
		
	var subIndex = "default"
	if(variant.size() > 0):
		variant.sort()
		subIndex = Util.join(variant, "-")
	
	characters[characterID][subIndex] = path

func getCharacterImage(characterID: String, variant: Array):
	if(!characters.has(characterID)):
		return ""
	
	var subIndex = "default"
	if(variant.size() > 0):
		variant.sort()
		subIndex = Util.join(variant, "-")
		
	if(!characters[characterID].has(subIndex)):
		if(!characters[characterID].has("default")):
			return ""
		return characters[characterID]["default"]
	
	return characters[characterID][subIndex]

func getArtist():
	return artist
