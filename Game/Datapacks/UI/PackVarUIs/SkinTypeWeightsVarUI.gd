extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var numberVarScene = preload("res://Game/Datapacks/UI/PackVarUIs/NumberVarUI.tscn")

var data = {
	SkinType.Fur: 1.0,
}

func updateSkinTypes():
	Util.delete_children($VBoxContainer)

	for skinType in SkinType.getAll():
		var newNumber = numberVarScene.instance()
		$VBoxContainer.add_child(newNumber)
		newNumber.id = skinType
		newNumber.setData({
			name = SkinType.getName(skinType),
			value = (data[skinType] if data.has(skinType) else 0.0),
		})
		newNumber.connect("onValueChange", self, "onSkinTypeWeightChanged")
	
func onSkinTypeWeightChanged(id, value):
	if(value <= 0.0):
		if(data.has(id)):
			data.erase(id)
	else:
		data[id] = value
	triggerChange(data.duplicate())

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		$Label.text = _dataLine["name"]
	if(_dataLine.has("value")):
		data = _dataLine["value"]
	updateSkinTypes()
