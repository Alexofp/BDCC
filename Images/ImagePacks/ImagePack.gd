extends Reference
class_name ImagePack

var id = "error"
var artist = "Unknown"
var characters = {}
var sceneImages = {}
var sceneImagesWithConditions = {}

# path argument can be a string or an array of strings
# string = will be used as a path to the texture
# array of strings = many textures layered on top of each other (can be used to create little paper dolls)
# so like [".....female_body_base.png", ".....fox_head.png", ".....red_ponytail_hair.png"] or something like that
func addCharacter(characterID:String, variant:Array, path):
	if(!characters.has(characterID)):
		characters[characterID] = {}
		
	var subIndex = "default"
	if(variant.size() > 0):
		variant.sort()
		subIndex = Util.join(variant, "-")
	
	characters[characterID][subIndex] = path

func getGenericCharacterImage(_character:BaseCharacter, _variant:Array, _hashID):
	#if(true):
	#	return EXAMPLE_getGenericCharacterImage(_character, _variant, _hashID)
	return null 

# Example of how to use this function
func EXAMPLE_getGenericCharacterImage(_character:BaseCharacter, _variant:Array, _hashID):
	var _isBald = _character.bodypartHasTrait(BodypartSlot.Hair, PartTrait.HairBald)
	var _hasPonytail = _character.bodypartHasTrait(BodypartSlot.Hair, PartTrait.HairPonytail)
	var _hasOvereye = _character.bodypartHasTrait(BodypartSlot.Hair, PartTrait.HairOvereye)
	# etc
	
	var _isCanine = (_character.getSpecies() == [Species.Canine])
	var _isFeline = (_character.getSpecies() == [Species.Feline])
	# etc
	
	# Probably better than just checking gender
	var _isMale = (_character.getFemininity() < 50)
	
	var _characterType = _character.getCharacterType() 
	var _isInmate = (_characterType == CharacterType.Inmate)
	var _isGuard = (_characterType == CharacterType.Guard)
	var _isEngineer = (_characterType == CharacterType.Engineer)
	# etc
	
	
	# If you have a very specific image you gotta make lots of these checks
	if(_isCanine && _hasPonytail && _isMale && _isEngineer):
		return "res://Images/ImagePacks/Rahi/Characters/alexrynard/alexrynard-naked.png"
		
	# I'm just using images that I already have, replace with your own ^^
	if(_isCanine):
		# pickHashed makes sure the same npc will have the same picture assigned to it
		return RNG.pickHashed([
			"res://Images/ImagePacks/Rahi/Characters/nova/nova-naked.png",
			"res://Images/ImagePacks/Rahi/Characters/alexrynard/alexrynard-naked.png",
			"res://Images/ImagePacks/Rahi/Characters/avy/avy-naked.png",
			"res://Images/ImagePacks/Rahi/Characters/captain/captain-naked.png",
			"res://Images/ImagePacks/Rahi/Characters/jacki/jacki-naked.png",
		], _hashID)
	
	if(_isFeline):
		return RNG.pickHashed([
			"res://Images/ImagePacks/Rahi/Characters/eliza/eliza-naked.png",
			"res://Images/ImagePacks/Rahi/Characters/ferri/ferri-naked.png",
			"res://Images/ImagePacks/Rahi/Characters/kait/kait-naked.png",
			"res://Images/ImagePacks/Rahi/Characters/rahi/rahi-naked.png",
			"res://Images/ImagePacks/Rahi/Characters/risha/risha-naked.png",
			"res://Images/ImagePacks/Rahi/Characters/tavi/tavi-naked.png",
		], _hashID)
	
	# returning null is okay
	return null

func getCharacterImage(characterID: String, variant: Array):
	if(!characters.has(characterID)):
		return null
	
	var subIndex = "default"
	if(variant.size() > 0):
		variant.sort()
		subIndex = Util.join(variant, "-")
		
	if(!characters[characterID].has(subIndex)):
		if(!characters[characterID].has("default")):
			return null
		return characters[characterID]["default"]
	
	return characters[characterID][subIndex]

func getArtist():
	return artist

func addSceneImage(sceneID, sceneState, imagePath, imageHeight = 300.0):
	if(!sceneImages.has(sceneID)):
		sceneImages[sceneID] = {}
	sceneImages[sceneID][sceneState] = {
		imagePath = imagePath,
		imageHeight = imageHeight,
		artist = getArtist(),
		}

func addSceneImageCustomArtist(sceneID, sceneState, imagePath, imageHeight = 300.0, theArtist="Nobody"):
	if(!sceneImages.has(sceneID)):
		sceneImages[sceneID] = {}
	sceneImages[sceneID][sceneState] = {
		imagePath = imagePath,
		imageHeight = imageHeight,
		artist = theArtist,
		}

func addSceneImageWithConditions(sceneID, sceneState, imagePath, conditions, imageHeight = 300.0):
	if(!sceneImagesWithConditions.has(sceneID)):
		sceneImagesWithConditions[sceneID] = {}
	if(!sceneImagesWithConditions[sceneID].has(sceneState)):
		sceneImagesWithConditions[sceneID][sceneState] = []
	
	sceneImagesWithConditions[sceneID][sceneState].append({
		imagePath = imagePath,
		conditions = conditions,
		imageHeight = imageHeight,
		artist = getArtist(),
	})

func getSceneImage(scene):
	var sceneID = scene.sceneID
	var sceneState = scene.getState()
	
	if(sceneImagesWithConditions.has(sceneID) && sceneImagesWithConditions[sceneID].has(sceneState)):
		var variants = sceneImagesWithConditions[sceneID][sceneState]
		for variant in variants:
			#var imagePath = variant["imagePath"]
			var conditions = variant["conditions"]
			
			if(ImageConditions.areTrue(conditions)):
				return variant
	
	if(sceneImages.has(sceneID) && sceneImages[sceneID].has(sceneState)):
		return sceneImages[sceneID][sceneState]
	
	return null
