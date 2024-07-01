extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"
onready var parts_list = $ScrollContainer/PartsList

var data = {
	BodypartSlot.Head : {
		id = null,
		data = {},
	},
}
var bodypartEditors = {}

func _ready():
	for bodypartSlot in BodypartSlot.getAll():
		var singleUI = preload("res://Game/Datapacks/UI/PackVarUIs/BodypartSingleVarUI.tscn").instance()
		singleUI.id = bodypartSlot
		parts_list.add_child(singleUI)
		singleUI.setData({
			"bodypartSlot": bodypartSlot,
			"value": {id="", data={}},
		})
		singleUI.connect("onValueChange", self, "onBodypartChanged")
		bodypartEditors[bodypartSlot] = singleUI

func setData(_dataLine:Dictionary):
	#if(_dataLine.has("bodypartSlot")):
	#	bodypartSlot = _dataLine["bodypartSlot"]
	if(_dataLine.has("value")):
		data = (_dataLine["value"]).duplicate()
		for bodypartSlot in data:
			if(bodypartEditors.has(bodypartSlot)):
				bodypartEditors[bodypartSlot].setData({"value": data[bodypartSlot]})

func onBodypartChanged(_bodypartSlot, _data):
	data[_bodypartSlot] = _data
	
	triggerChange(data.duplicate())
