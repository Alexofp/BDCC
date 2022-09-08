extends Control

# Dude, please, set strings, arrays and other non-objects to their empty analog, not null!
# They are uncheckable by "is_instance_valid" func.
# Why this func?
# Becouse checking objects by sentense "object == null" is unstable in release builds.

var currentCharacter 	= ""
var characters 			= {}

onready var nameLabel 			= $VBoxContainer2/Control/MarginContainer/VBoxContainer/NameLabel
onready var textureRect 		= $VBoxContainer2/Control/TextureRect
onready var textureRect2 		= $VBoxContainer2/Control/TextureRect2
onready var textureRect3 		= $VBoxContainer2/Control/TextureRect3
onready var characterStatusGrid = $VBoxContainer2/CharacterStatusGrid
onready var nextCharacterButton = $VBoxContainer2/Control/MarginContainer/VBoxContainer/HBoxContainer/NextButton

func _ready():
	clear()
	
	addCharacter("rahi", [])
	addCharacter("tavi", [])
	addCharacter("risha", [])
	
func clear():
	characters.clear()
	
	textureRect.texture 	= null
	textureRect2.texture 	= null
	textureRect3.texture 	= null
	currentCharacter 		= ""
	
	updateMainCharacter()
	
func addCharacter(charID:String, variant:Array):
	var data = {}
	
	var imageData 	= Images.getCharacter(charID, variant)
	
	if(imageData.size() == 0):
		data["imagePath"] 		= "res://Images/UI/GenericFace.png"
		data["imageArtist"] 	= ""
	else:
		data["imagePath"] 		= imageData[0]
		data["imageArtist"] 	= imageData[1]
	
	characters[charID] 	= data
	
	if(currentCharacter == ""):
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
		currentCharacter = ""
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
		textureRect.texture = null
		textureRect2.texture = null
		textureRect3.texture = null
		nextCharacterButton.visible = false
		return
	
	if(currentCharacter == ""):
		return
	
	var keys = characters.keys()
	
	var index = keys.find(currentCharacter)
	
	textureRect.texture = load(characters[currentCharacter]["imagePath"])
	if(characters.size() > 1):
		var nextIndex = index + 1
		if(nextIndex >= characters.size()):
			nextIndex = 0
		
		textureRect2.texture = load(characters[keys[nextIndex]]["imagePath"])
		nextCharacterButton.visible = true
	else:
		textureRect2.texture = null
		nextCharacterButton.visible = false
	
	if(characters.size() > 2):
		var prevIndex = index - 1
		if(prevIndex < 0):
			prevIndex = characters.size() - 1
		
		textureRect3.texture = load(characters[keys[prevIndex]]["imagePath"])
	else:
		textureRect3.texture = null

func updateMainCharacter():
	var character:Character = GlobalRegistry.getCharacter(currentCharacter)
	# I make in GlobalRegestry what empty string don't emmits erorr loging in this func
	# Just don't forget to add checking empty characters names in GloabalRegestry
	
	if (!is_instance_valid(character)):
		if currentCharacter == "":
			nameLabel.text = ""
			nameLabel.self_modulate = Color.white
		else:
			nameLabel.text = "???"
			nameLabel.self_modulate = Color.white
		
		return
		
	nameLabel.text = character.getName()
	nameLabel.self_modulate = character.getChatColor()
	character.updateEffectPanel(characterStatusGrid)

func _on_NextButton_pressed():
	var keys = characters.keys()
	
	if (currentCharacter == ""):
		updateMainCharacter()
		if (keys > 0): currentCharacter = keys[0]
		else: return
	
	var index = keys.find(currentCharacter) + 1
	
	if(index >= characters.size()):
		index = 0
	
	currentCharacter = keys[index]
	updateImages()
	updateMainCharacter()

func _on_NameLabel_mouse_entered():
	var character:Character = GlobalRegistry.getCharacter(currentCharacter)
	
	if(!is_instance_valid(character)):
		return
		
	if(characters.has(currentCharacter)):
		var charData = characters[currentCharacter]
		
		if(charData.has("imageArtist") && charData["imageArtist"]):
			GlobalTooltip.showTooltip(character.getName() + ", " + character.getSpeciesFullName(), character.getSmallDescription()+"\n\n[i]Art drawn by "+str(charData["imageArtist"])+"[/i]", true)
			return
	
	GlobalTooltip.showTooltip(character.getName() + ", " + character.getSpeciesFullName(), character.getSmallDescription(), true)


func _on_NameLabel_mouse_exited():
	GlobalTooltip.hideTooltip()
