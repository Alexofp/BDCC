extends Object
class_name Images

static func getCharacter(characterID: String, variant: Array):
	var packs = OPTIONS.getImagePackOrder()
	
	for packID in packs:
		var pack = GlobalRegistry.getImagePack(packID)
		if(pack == null):
			continue
		var imagePath = pack.getCharacterImage(characterID, variant)
		if(imagePath != null):
			return [imagePath, pack.getArtist()]
		
	return null

static func getGenericCharacterArt(character, variant: Array):
	if(character == null):
		return null
	
	var packs = OPTIONS.getImagePackOrder()
	
	var hashID = character.getID().hash()
	
	for packID in packs:
		var pack = GlobalRegistry.getImagePack(packID)
		if(pack == null):
			continue
		var imagePath = pack.getGenericCharacterImage(character, variant, hashID)
		if(imagePath != null):
			return [imagePath, pack.getArtist()]
		
	return null

static func getSceneArt(scene):
	var packs = OPTIONS.getImagePackOrder()
	
	for packID in packs:
		var pack = GlobalRegistry.getImagePack(packID)
		if(pack == null):
			continue
		
		var imageData = pack.getSceneImage(scene)
		if(imageData != null):
			return imageData
