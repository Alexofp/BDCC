extends Control

onready var artworkPanel = $CharactersArtworkPanel
onready var charactersPanel = $CharactersPanel
onready var fightCharacterList = $ScrollContainer/FightCharacterPanels
onready var scrollContainer = $ScrollContainer

var fightCharacterUIScene = preload("res://Game/CharacterPanel.tscn")
var isInFightMode = false

var characters = {}
var fightCharacterPanels = {}

func _ready():
	updateVisibility()

func clear():
	characters.clear()
	charactersPanel.clear()
	artworkPanel.clear()
	fightCharacterPanels.clear()
	Util.delete_children(fightCharacterList)
	updateVisibility()

func addCharacter(charID:String, variant:Array = []):
	if(charID == "pc" || GlobalRegistry.getCharacter(charID) == null):
		return
	characters[charID] = variant
	artworkPanel.addCharacter(charID, variant)
	charactersPanel.addCharacter(charID)
	
	if(!fightCharacterPanels.has(charID)):
		var fightSceneUI = fightCharacterUIScene.instance()
		fightCharacterList.add_child(fightSceneUI)
		fightSceneUI.updateFromCharacterID(charID)
		fightCharacterPanels[charID] = fightSceneUI
	
	updateVisibility()

func removeCharacter(charID:String):
	characters.erase(charID)
	artworkPanel.removeCharacter(charID)
	charactersPanel.removeCharacter(charID)
	
	if(fightCharacterPanels.has(charID)):
		fightCharacterPanels[charID].queue_free()
		fightCharacterPanels.erase(charID)
	
	updateVisibility()

func updateData():
	artworkPanel.updateMainCharacter()
	charactersPanel.updateStatuses()
	
	for charID in fightCharacterPanels:
		fightCharacterPanels[charID].updateFromCharacterID(charID)

func updateVisibility():
	if(characters.size() <= 0):
		scrollContainer.visible = false
		artworkPanel.visible = false
		charactersPanel.visible = false
		return
	
	if(isInFightMode):
		scrollContainer.visible = true
		artworkPanel.visible = false
		charactersPanel.visible = false
	else:
		scrollContainer.visible = false
		if(OPTIONS.shouldShowCharacterArt() && artworkPanel.hasNonGenericPortrait()):
			artworkPanel.visible = true
			charactersPanel.visible = false
		else:
			artworkPanel.visible = false
			charactersPanel.visible = true

func switchToFightMode():
	isInFightMode = true
	updateVisibility()

func switchToNormalMode():
	isInFightMode = false
	updateVisibility()

