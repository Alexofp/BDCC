extends Control

onready var optionsContainer = $VBoxContainer/ScrollContainer/ScrollVBox/OptionsContainer
var optionsCategoryScene = preload("res://UI/Options/OptionsCategory.tscn")
var optionCategoryUnknown = preload("res://UI/Options/OptionUnknownType.tscn")
var optionCategoryCheckbox = preload("res://UI/Options/OptionCheckboxType.tscn")
var optionCategoryList = preload("res://UI/Options/OptionListType.tscn")
var optionCategoryFloat = preload("res://UI/Options/OptionFloatType.tscn")
var optionCategoryInt = preload("res://UI/Options/OptionIntType.tscn")
var optionCategoryPriorityList = preload("res://UI/Options/OptionPriorityListType.tscn")
var optionCategoryString = preload("res://UI/Options/OptionStringType.tscn")
onready var category_name_label = $"%CategoryNameLabel"


signal onClosePressed



var currentTab = -1

onready var gameplay_cat_button = $"%GameplayCatButton"
onready var game_cat_button = $"%GameCatButton"
onready var display_cat_button = $"%DisplayCatButton"
onready var interface_cat_button = $"%InterfaceCatButton"

func _ready():
	setTab(OPTIONS.TAB_GAMEPLAY)
	
	#updateOptions()


func updateOptions():
	Util.delete_children(optionsContainer)

	var options = OPTIONS.getChangeableOptions()
	
	for category in options:
		var optionsCategory = optionsCategoryScene.instance()
		optionsContainer.add_child(optionsCategory)

		optionsCategory.setCategoryName(category["name"])
		
		var addedAny:bool = false
		for option in category["options"]:
			var optionTab:int = option["tab"] if option.has("tab") else OPTIONS.TAB_GAME
			if(optionTab != currentTab):
				continue
			
			var optionType = option["type"]
			var optionID = option["id"]
			var optionName = option["name"]
			var optionValue = option["value"]
			var optionDescription = null
			if(option.has("description")):
				optionDescription = option["description"]
			
			var optionUIObject: Node = null
			if(optionType == "checkbox"):
				optionUIObject = optionCategoryCheckbox.instance()
			elif(optionType == "list"):
				optionUIObject = optionCategoryList.instance()
			elif(optionType == "float"):
				optionUIObject = optionCategoryFloat.instance()
			elif(optionType == "int"):
				optionUIObject = optionCategoryInt.instance()
			elif(optionType == "prioritylist"):
				optionUIObject = optionCategoryPriorityList.instance()
			elif(optionType == "string"):
				optionUIObject = optionCategoryString.instance()
			else:
				optionUIObject = optionCategoryUnknown.instance()
			
			if(optionUIObject == null):
				continue
			
			addedAny = true
			optionsContainer.add_child(optionUIObject)
			optionUIObject.id = optionID
			optionUIObject.categoryID = category["id"]
			optionUIObject.setOptionName(optionName)
			optionUIObject.setOptionValue(optionValue)
			if(optionUIObject.has_signal("value_changed")):
				var _ok = optionUIObject.connect("value_changed", self, "onOptionChanged")
			
			if(optionType == "string"):
				if("placeholder" in option):
					optionUIObject.setPlaceholderValue(option["placeholder"])
			if(optionType == "list"):
				optionUIObject.setValues(option["values"])
			if(optionType == "prioritylist"):
				if("imagePacks" in option):
					optionUIObject.makeImagepackList()
				
				optionUIObject.setValues(option["values"])
			
			if(optionDescription != null && optionUIObject.has_signal("mouse_entered")):
				var _ok = optionUIObject.connect("mouse_entered", self, "onOptionMouseEntered", [optionUIObject])
				var _ok2 = optionUIObject.connect("mouse_exited", self, "onOptionMouseExited", [optionUIObject])
				if(optionUIObject.has_method("setDescription")):
					optionUIObject.setDescription(optionDescription)
		if(!addedAny):
			optionsCategory.queue_free()
				
func onOptionMouseEntered(optionUIObject):
	if(optionUIObject.has_method("getDescription")):
		var optionName = "Option"
		if(optionUIObject.has_method("getOptionName")):
			optionName = optionUIObject.getOptionName()
		GlobalTooltip.showTooltip(optionUIObject, optionName, optionUIObject.getDescription(), false, true)
			
func onOptionMouseExited(_optionUIObject):
	GlobalTooltip.hideTooltip(_optionUIObject)
				
func onOptionChanged(categoryID, optionID, optionNewValue):
	OPTIONS.applyOption(categoryID, optionID, optionNewValue)


func _on_RevertButton_pressed():
	OPTIONS.resetToDefaults()
	updateOptions()


func _on_CloseButton_pressed():
	OPTIONS.saveToFile()
	emit_signal("onClosePressed")


func _on_ResetRenderButton_pressed():
	OPTIONS.resetRenderSettings()

const TAB_TO_LABELTEXT = {
	OPTIONS.TAB_GAMEPLAY: "Gameplay options",
	OPTIONS.TAB_GAME: "Game options",
	OPTIONS.TAB_DISPLAY: "Display options",
	OPTIONS.TAB_INTERFACE: "Interface options",
}

func setTab(_tab:int):
	currentTab = _tab
	gameplay_cat_button.disabled = (_tab == OPTIONS.TAB_GAMEPLAY)
	game_cat_button.disabled = (_tab == OPTIONS.TAB_GAME)
	display_cat_button.disabled = (_tab == OPTIONS.TAB_DISPLAY)
	interface_cat_button.disabled = (_tab == OPTIONS.TAB_INTERFACE)
	
	category_name_label.text = TAB_TO_LABELTEXT[currentTab] if TAB_TO_LABELTEXT.has(currentTab) else "Unknown options"
	
	updateOptions()

func _on_GameplayCatButton_pressed():
	setTab(OPTIONS.TAB_GAMEPLAY)

func _on_GameCatButton_pressed():
	setTab(OPTIONS.TAB_GAME)

func _on_DisplayCatButton_pressed():
	setTab(OPTIONS.TAB_DISPLAY)

func _on_InterfaceCatButton_pressed():
	setTab(OPTIONS.TAB_INTERFACE)
