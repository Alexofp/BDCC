extends PanelContainer

var characterID: String
onready var characterNameLabel = $VBoxContainer/CharacterName
onready var characterStatusGrid = $VBoxContainer/CharacterStatusGrid

func setCharacterID(charID: String):
	var character = GlobalRegistry.getCharacter(charID)
	
	characterNameLabel.text = character.getName()
	characterNameLabel.self_modulate = character.getChatColor()
	characterID = charID
	
	character.updateEffectPanel(characterStatusGrid)

func getCharacterID():
	return characterID

func updateStatuses():
	if(characterID == null):
		return
	
	var character = GlobalRegistry.getCharacter(characterID)
	character.updateEffectPanel(characterStatusGrid)
