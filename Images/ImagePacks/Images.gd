extends Object
class_name Images

static func getCharacter(characterID: String, variant: Array):
	var packs = OPTIONS.getImagePackOrder()
	
	for packID in packs:
		var pack = GlobalRegistry.getImagePack(packID)
		if(is_instance_valid(pack)):
			var imagePath = pack.getCharacterImage(characterID, variant)
			if(imagePath != ""):
				return [imagePath, pack.getArtist()]
		
	return []
