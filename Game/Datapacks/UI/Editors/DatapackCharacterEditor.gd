extends Control
onready var pack_variables = $VBoxContainer/HBoxContainer/ScrollContainer/PackVariables

var character:DatapackCharacter
var dynamicCharacter:DynamicCharacter
onready var doll = $VBoxContainer/HBoxContainer/DollWrapper/Viewport/Doll3D

func _ready():
	dynamicCharacter = DynamicCharacter.new()
	add_child(dynamicCharacter)
	
func setCharacter(theCharacter):
	character = theCharacter
	updateCharacter()

func updateCharacter():
	pack_variables.setVariables(character.getEditVars())
	dynamicCharacter.loadFromDatapackCharacter(character)
	doll.loadCharacter(dynamicCharacter)
	doll.setTemporaryState("cock", "")
	
func getMenu():
	var toCheck = self
	while(toCheck != null):
		toCheck = toCheck.get_parent()
		if(toCheck.has_method("isDatapackMenu")):
			return toCheck
	return null

func _on_SaveButton_pressed():
	getMenu().popMenu()

func _on_PackVariables_onVariableChange(id, value):
	if(character.applyEditVar(id, value)):
		dynamicCharacter.loadFromDatapackCharacter(character)
		doll.setTemporaryState("cock", "")

func onMenuPopped():
	updateCharacter()
