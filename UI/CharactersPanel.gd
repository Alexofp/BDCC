extends VBoxContainer

var characterPanelScane = preload("res://UI/CharacterPanelSmall.tscn")
var addedCharacters: Dictionary = {}
onready var charactersBox = $ScrollContainer/CharactersBox
onready var optionTooltip = $CanvasLayer/TooltipDisplay

func _ready():
	clear()

func addCharacter(charID: String):
	if(addedCharacters.has(charID)):
		return
	
	var panel = characterPanelScane.instance()
	charactersBox.add_child(panel)
	panel.setCharacterID(charID)
	panel.connect("mouse_entered", self, "onCharacterMouseEntered", [panel])
	panel.connect("mouse_exited", self, "onCharacterMouseExited")
	
	addedCharacters[charID] = panel
	
func clear():
	Util.delete_children(charactersBox)
	addedCharacters = {}

func removeCharacter(charID: String):
	if(!addedCharacters.has(charID)):
		return
		
	addedCharacters[charID].queue_free()
	var _v = addedCharacters.erase(charID)

func onCharacterMouseEntered(panel):
	optionTooltip.set_is_active(true)
	
	var charID = panel.getCharacterID()
	var character = GlobalRegistry.getCharacter(charID)
	
	optionTooltip.set_text(character.getName() + ", " + character.getSpeciesFullName(), character.getSmallDescription())

func onCharacterMouseExited():
	optionTooltip.set_is_active(false)

func updateStatuses():
	for charID in addedCharacters:
		var panel = addedCharacters[charID]
		panel.updateStatuses()
