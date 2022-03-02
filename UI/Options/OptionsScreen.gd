extends Control

onready var optionsContainer = $VBoxContainer/ScrollContainer/ScrollVBox/OptionsContainer
var optionsCategoryScene = preload("res://UI/Options/OptionsCategory.tscn")
var optionCategoryUnknown = preload("res://UI/Options/OptionUnknownType.tscn")
var optionCategoryCheckbox = preload("res://UI/Options/OptionCheckboxType.tscn")
var optionCategoryList = preload("res://UI/Options/OptionListType.tscn")
signal onClosePressed

func _ready():
	updateOptions()


func updateOptions():
	Util.delete_children(optionsContainer)

	var options = OPTIONS.getChangeableOptions()
	
	for category in options:
		var optionsCategory = optionsCategoryScene.instance()
		optionsContainer.add_child(optionsCategory)

		optionsCategory.setCategoryName(category["name"])
		
		for option in category["options"]:
			var optionType = option["type"]
			var optionID = option["id"]
			var optionName = option["name"]
			var optionValue = option["value"]
			
			var optionUIObject: Node = null
			if(optionType == "checkbox"):
				optionUIObject = optionCategoryCheckbox.instance()
			elif(optionType == "list"):
				optionUIObject = optionCategoryList.instance()
			else:
				optionUIObject = optionCategoryUnknown.instance()
			
			if(optionUIObject == null):
				continue
			
			optionsContainer.add_child(optionUIObject)
			optionUIObject.id = optionID
			optionUIObject.categoryID = category["id"]
			optionUIObject.setOptionName(optionName)
			optionUIObject.setOptionValue(optionValue)
			if(optionUIObject.has_signal("value_changed")):
				var _ok = optionUIObject.connect("value_changed", self, "onOptionChanged")
			if(optionType == "list"):
				optionUIObject.setValues(option["values"])
				
func onOptionChanged(categoryID, optionID, optionNewValue):
	OPTIONS.applyOption(categoryID, optionID, optionNewValue)


func _on_RevertButton_pressed():
	OPTIONS.resetToDefaults()
	updateOptions()


func _on_CloseButton_pressed():
	OPTIONS.saveToFile()
	emit_signal("onClosePressed")
