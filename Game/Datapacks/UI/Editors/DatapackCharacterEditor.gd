extends Control
onready var pack_variables = $VBoxContainer/HBoxContainer/ScrollContainer/PackVariables

var datapack:Datapack
var character:DatapackCharacter
var dynamicCharacter:DynamicCharacter
onready var doll = $VBoxContainer/HBoxContainer/DollWrapper/Viewport/Doll3D

func _ready():
	dynamicCharacter = DynamicCharacter.new()
	add_child(dynamicCharacter)
	dynamicCharacter.addArousal(1.0)
	
func setCharacter(theCharacter):
	character = theCharacter
	updateCharacter()

func updateCharacter():
	pack_variables.setVariables(character.getEditVars())
	#doll.setTemporaryState("cock", "")
	dynamicCharacter.loadFromDatapackCharacter(null, character)
	doll.prepareCharacter(dynamicCharacter)
	
func getMenu():
	var toCheck = self
	while(toCheck != null):
		toCheck = toCheck.get_parent()
		if(toCheck.has_method("isDatapackMenu")):
			return toCheck
	return null

func _on_SaveButton_pressed():
	pack_variables.checkWidgetsFinished()
	getMenu().popMenu()

func _on_PackVariables_onVariableChange(id, value):
	if(character.applyEditVar(id, value)):
		#doll.setTemporaryState("cock", "")
		dynamicCharacter.loadFromDatapackCharacter(null, character)

func onMenuPopped():
	updateCharacter()
