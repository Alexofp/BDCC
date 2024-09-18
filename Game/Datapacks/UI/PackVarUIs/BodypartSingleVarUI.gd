extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"
#onready var option_button = $HBoxContainer/OptionButton
onready var settings_list = $SettingsList
onready var auto_selector_var_ui = $HBoxContainer/AutoSelectorVarUI


var bodypartSlot = BodypartSlot.Head
var data = {
	id = null,
	data = {},
	pickedSkin = null,
	pickedR = null,
	pickedG = null,
	pickedB = null,
}
var optionIDs = []

func _ready():
	pass
	
func setData(_dataLine:Dictionary):
	if(_dataLine.has("bodypartSlot")):
		bodypartSlot = _dataLine["bodypartSlot"]
	if(_dataLine.has("value")):
		data = (_dataLine["value"]).duplicate()
	updateValue()

func updateValue():
	$HBoxContainer/Label.text = BodypartSlot.getVisibleName(bodypartSlot)
	
	#option_button.clear()
	optionIDs.clear()
	
	#option_button.add_item("-nothing-")
	optionIDs.append("")
	var optionValues:Array = [
		[0, "-nothing-"],
	]
	
	var possiblePartIDs = GlobalRegistry.getBodypartsIdsBySlot(bodypartSlot)
	
	var selInd:int = 0
	var _i:int = 1
	for partID in possiblePartIDs:
		#option_button.add_item(partID)
		optionValues.append([_i, partID])
		optionIDs.append(partID)
		
		if(partID == data["id"]):
			selInd = _i
			#option_button.select(optionIDs.size() - 1)
		
		_i += 1

	auto_selector_var_ui.setData({
		values = optionValues,
		value = selInd,
		alwaysEdit = true,
		name = BodypartSlot.getVisibleName(bodypartSlot),
		expand = true,
	})
	updateSettings()

func _on_OptionButton_item_selected(index):
	if(index < 0 && index >= optionIDs.size()):
		return
	
	data["id"] = optionIDs[index]
	data["data"] = {}
	data["pickedSkin"] = null
	data["pickedR"] = null
	data["pickedG"] = null
	data["pickedB"] = null
	
	# Update settings menu here (penis size etc)
	
	updateSettings()
	triggerChange(data.duplicate())

func getSelectedPartID():
#	if(optionIDs.size() <= 0):
#		return ""
#	var index = option_button.selected
#	if(index < 0 && index >= optionIDs.size()):
#		return ""
#	return optionIDs[index]
	return data["id"]

var numberVarUIScene = preload("res://Game/Datapacks/UI/PackVarUIs/NumberVarUI.tscn")
var selectorVarUIScene = preload("res://Game/Datapacks/UI/PackVarUIs/AdvancedSelectorVarUI.tscn")
var skinUIScene = preload("res://Game/Datapacks/UI/PackVarUIs/SkinVarUI.tscn")

func updateSettings():
	Util.delete_children(settings_list)
	
	var selectedPartID = getSelectedPartID()
	if(selectedPartID == null || selectedPartID == ""):
		return
	
	var partRef:Bodypart = GlobalRegistry.getBodypartRef(selectedPartID)
	if(partRef == null):
		return
	
	if(partRef.supportsSkin()):
		var availSkins = []
		if(!partRef.hasCustomSkinPattern()):
			availSkins = GlobalRegistry.getSkinsAllKeys()
		else:
			availSkins = [""] + GlobalRegistry.getPartSkins(selectedPartID).keys()
		
		var skinScene = skinUIScene.instance()
		settings_list.add_child(skinScene)
		skinScene.id = "skin"
		skinScene.setData({
			name = "- Skin",
			value = {skin=(data["pickedSkin"] if data.has("pickedSkin") else null),r=(data["pickedR"] if data.has("pickedR") else null),g=(data["pickedG"] if data.has("pickedG") else null),b=(data["pickedB"] if data.has("pickedB") else null)},
			skins = availSkins,
		})
		skinScene.connect("onValueChange", self, "onBodypartSkinChanged")
	
	var pickableAttributes = partRef.getPickableAttributes()
	
	for attribID in pickableAttributes:
		var attribData:Dictionary = pickableAttributes[attribID]
		
		var defaultValue = (1.0 if !(attribData.has("default")) else attribData["default"])
		var theValue = defaultValue
		if(data["data"].has(attribID)):
			theValue = data["data"][attribID]
		
		if(attribData.has("floatinput") && attribData["floatinput"]):
			var newNumberVar = numberVarUIScene.instance()
			settings_list.add_child(newNumberVar)
			newNumberVar.id = attribID
			newNumberVar.setData({
				"value": theValue,
				"name": attribData["textButton"],
			})
			newNumberVar.connect("onValueChange", self, "onBodypartSettingChange")
			continue
	
		var newSelectorVar = selectorVarUIScene.instance()
		settings_list.add_child(newSelectorVar)
		newSelectorVar.id = attribID
		newSelectorVar.setData({
			"value": theValue,
			"name": attribData["textButton"],
			"values": attribData["options"],
			"noexpand": true,
			"isAltText": true,
		})
		newSelectorVar.connect("onValueChange", self, "onBodypartSettingChange")

func onBodypartSettingChange(settingID, value):
	data["data"][settingID] = value
	triggerChange(data.duplicate())

func onBodypartSkinChanged(_id, value):
	data["pickedSkin"] = value["skin"]
	data["pickedR"] = value["r"]
	data["pickedG"] = value["g"]
	data["pickedB"] = value["b"]
	triggerChange(data.duplicate())


func _on_AutoSelectorVarUI_onValueChange(_id, newValue):
	_on_OptionButton_item_selected(newValue)
