extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"
onready var option_button = $HBoxContainer/OptionButton

var bodypartSlot = BodypartSlot.Head
var data = {
	id = null,
	data = {},
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
	
	option_button.clear()
	optionIDs.clear()
	
	option_button.add_item("-nothing-")
	optionIDs.append("")
	
	var possiblePartIDs = GlobalRegistry.getBodypartsIdsBySlot(bodypartSlot)
	
	for partID in possiblePartIDs:
		option_button.add_item(partID)
		optionIDs.append(partID)
		
		if(partID == data["id"]):
			option_button.select(optionIDs.size() - 1)

func _on_OptionButton_item_selected(index):
	if(index < 0 && index >= optionIDs.size()):
		return
	
	data["id"] = optionIDs[index]
	# Update settings menu here (penis size etc)
	
	triggerChange(data.duplicate())
