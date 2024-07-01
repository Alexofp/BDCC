extends Control

var currentCharacter = null
var characters = {}

onready var nameLabel = $VBoxContainer2/Control/MarginContainer/VBoxContainer/NameLabel
onready var textureRect = $VBoxContainer2/Control/TextureRect
onready var textureRect2 = $VBoxContainer2/Control/TextureRect2
onready var textureRect3 = $VBoxContainer2/Control/TextureRect3
onready var characterStatusGrid = $VBoxContainer2/CharacterStatusGrid
onready var nextCharacterButton = $VBoxContainer2/Control/MarginContainer/VBoxContainer/HBoxContainer/NextButton

func _ready():
	clear()
	
	#addCharacter("rahi", [])
	#addCharacter("tavi", [])
	#addCharacter("risha", [])
	pass
	
func clear():
	characters.clear()
	textureRect.textures = null
	textureRect2.textures = null
	textureRect3.textures = null
	currentCharacter = null
	updateMainCharacter()
	
func addCharacter(charID:String, variant:Array):
	var data = {}
	
	var character = GlobalRegistry.getCharacter(charID)
	if(character != null):
		character.adjustArtworkVariant(variant)
	
	var isGenericPortrait = true
	var imageArtist = null
	var imagePath = null
	var imageData = Images.getCharacter(charID, variant)
	
	if(character != null && character.isDynamicCharacter()):
		if(character.npcMimicArtworkID != ""):
			imageData = Images.getCharacter(character.npcMimicArtworkID, variant)
		elif(character.datapackID != null && character.datapackID != "" && imageData == null):
			var theDatapack:Datapack = GlobalRegistry.getDatapack(character.datapackID)
			if(theDatapack != null && (":" in charID) && theDatapack.characters.has(charID.split(":")[1])):
				var datapackChar:DatapackCharacter = theDatapack.characters[charID.split(":")[1]]
				var newPortrait = datapackChar.getPortrait(variant)
				if(newPortrait != null):
					imageData = [newPortrait, ""]
		
	if(imageData == null):
		if(character != null):
			var defaultImageData = character.getDefaultArtwork(variant)
			var defaultImagePath = defaultImageData
			
			if(defaultImagePath is Array):
				defaultImagePath = defaultImagePath[0]
				if(defaultImageData.size() > 1 && defaultImagePath != null):
					imageArtist = defaultImageData[1]
					
			if(defaultImagePath == null):
				imagePath = "res://Images/UI/GenericFace.png"
			else:
				if(!(defaultImagePath is String) || (defaultImagePath != "res://Images/UI/GenericFace.png")):
					isGenericPortrait = false
				imagePath = defaultImagePath
		else:
			imagePath = "res://Images/UI/GenericFace.png"
	else:
		imagePath = imageData[0]
		imageArtist = imageData[1]
		isGenericPortrait = false
	
	data["imagePath"] = imagePath
	data["imageArtist"] = imageArtist
	data["isGenericPortrait"] = isGenericPortrait
	
	characters[charID] = data
	
	if(currentCharacter == null):
		currentCharacter = charID
		updateMainCharacter()
		
	updateImages()

func removeCharacter(charID:String):
	if(!characters.has(charID)):
		return
	
	var keys = characters.keys()
	var index = keys.find(currentCharacter)
	characters.erase(charID)
	keys = characters.keys()
	
	if(characters.size() == 0):
		currentCharacter = null
		updateMainCharacter()
		updateImages()
		return
	
	if(currentCharacter == charID):
		if(index >= characters.size()):
			index = 0
		currentCharacter = keys[index]
		updateMainCharacter()
	updateImages()
		
func updateImages():
	if(characters.size() == 0):
		textureRect.textures = null
		textureRect2.textures = null
		textureRect3.textures = null
		nextCharacterButton.visible = false
		return
	
	if(currentCharacter == null):
		return
	
	var keys = characters.keys()
	
	var index = keys.find(currentCharacter)
	
	textureRect.textures = characters[currentCharacter]["imagePath"]
	if(characters.size() > 1):
		var nextIndex = index + 1
		if(nextIndex >= characters.size()):
			nextIndex = 0
		
		textureRect2.textures = characters[keys[nextIndex]]["imagePath"]
		nextCharacterButton.visible = true
	else:
		textureRect2.textures = null
		nextCharacterButton.visible = false
	
	if(characters.size() > 2):
		var prevIndex = index - 1
		if(prevIndex < 0):
			prevIndex = characters.size() - 1
		
		textureRect3.textures = characters[keys[prevIndex]]["imagePath"]
	else:
		textureRect3.textures = null

func updateMainCharacter():
	if(currentCharacter == null):
		nameLabel.text = ""
		nameLabel.self_modulate = Color.white
		return
	
	var character:Character = GlobalRegistry.getCharacter(currentCharacter)
	if(character == null):
		nameLabel.text = "???"
		nameLabel.self_modulate = Color.white
		return
	nameLabel.text = character.getName()
	nameLabel.self_modulate = character.getChatColor()
	character.updateEffectPanel(characterStatusGrid)

func _on_NextButton_pressed():
	var keys = characters.keys()
	
	if(currentCharacter == null && keys > 0):
		currentCharacter = keys[0]
	
	if(currentCharacter == null):
		updateMainCharacter()
		return
	
	var index = keys.find(currentCharacter)
	index += 1
	if(index >= characters.size()):
		index = 0
	
	currentCharacter = keys[index]
	updateImages()
	updateMainCharacter()

func _on_NameLabel_mouse_entered():
	if(currentCharacter == null):
		return
	
	var character:Character = GlobalRegistry.getCharacter(currentCharacter)
	if(character == null):
		return
		
	if(characters.has(currentCharacter)):
		var charData = characters[currentCharacter]
		
		if(charData.has("imageArtist") && charData["imageArtist"]):
			GlobalTooltip.showTooltip(character.getName() + ", " + character.getSpeciesFullName(), character.getSmallDescription()+"\n\n[i]Art drawn by "+str(charData["imageArtist"])+"[/i]", true)
			return
	
	GlobalTooltip.showTooltip(character.getName() + ", " + character.getSpeciesFullName(), character.getSmallDescription(), true)


func _on_NameLabel_mouse_exited():
	GlobalTooltip.hideTooltip()

func hasNonGenericPortrait():
	for charID in characters:
		if(!characters[charID]["isGenericPortrait"]):
			return true
	
	return false
