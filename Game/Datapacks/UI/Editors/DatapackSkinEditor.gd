extends Control
onready var pack_variables = $VBoxContainer/HBoxContainer/ScrollContainer/PackVariables

var datapack:Datapack
var skin:DatapackSkin
var dynamicCharacter:DynamicCharacter
onready var doll = $VBoxContainer/HBoxContainer/DollWrapper/Viewport/Doll3D

func _ready():
	for speciesID in GlobalRegistry.getAllSpecies():
		$VBoxContainer/HBoxContainer/DollWrapper/HBoxContainer/OptionButton.add_item(speciesID)
	
func setSkin(theSkin):
	skin = theSkin
	updateCharacter()

func updateCharacter():
	pack_variables.setVariables(skin.getEditVars())
	#dynamicCharacter.loadFromDatapackCharacter(null, character)
	#doll.setTemporaryState("cock", "")
	if(dynamicCharacter != null):
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
	if(skin.applyEditVar(id, value)):
		#dynamicCharacter.loadFromDatapackCharacter(null, character)
		#doll.loadCharacter(dynamicCharacter)
		if(dynamicCharacter != null && is_instance_valid(dynamicCharacter)):
			dynamicCharacter.updateAppearance()
			#doll.setTemporaryState("cock", "")

func onMenuPopped():
	updateCharacter()

func _on_RandomCharButton_pressed():
	if(dynamicCharacter != null):
		dynamicCharacter.queue_free()
		dynamicCharacter = null
	
	var selectedSpecies = Species.Canine
	var selectedSpeciesIndex = $VBoxContainer/HBoxContainer/DollWrapper/HBoxContainer/OptionButton.selected
	if(selectedSpeciesIndex >= 0):
		selectedSpecies = GlobalRegistry.getAllSpecies().keys()[selectedSpeciesIndex]
	
	var theGenerator:CharacterGeneratorBase = CharacterGeneratorBase.new()
	dynamicCharacter = theGenerator.generate({"editor_noequip": true, "addtonode": self, NpcGen.Gender: RNG.pick(NpcGender.getAll()), NpcGen.Species: selectedSpecies})
	#add_child(dynamicCharacter)
	
	dynamicCharacter.pickedSkin = datapack.id+":"+skin.id
	dynamicCharacter.addArousal(1.0)
	
	doll.loadCharacter(dynamicCharacter)
	#doll.setTemporaryState("cock", "")
