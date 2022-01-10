extends PanelContainer

var characterID: String
onready var characterNameLabel = $CharacterName

func setCharacterID(charID: String):
	var character = GlobalRegistry.getCharacter(charID)
	
	characterNameLabel.text = character.getName()
	characterID = charID

func getCharacterID():
	return characterID
