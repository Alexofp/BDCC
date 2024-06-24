extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var singleStatScene = preload("res://Game/Datapacks/UI/PackVarUIs/PersonalityStatVarUI.tscn")

var data = {
	PersonalityStat.Brat: 1.0,
}

func updatePersData():
	Util.delete_children($VBoxContainer)
	for statID in PersonalityStat.getAll():
		var newStat = singleStatScene.instance()
		$VBoxContainer.add_child(newStat)
		newStat.id = statID
		newStat.setData({
			"personalityStat": statID,
			"value": (data[statID] if data.has(statID) else 0.0),
		})
		newStat.connect("onValueChange", self, "onPersonalitySingleChange")

func onPersonalitySingleChange(_id, _value):
	data[_id] = _value
	triggerChange(data.duplicate())

func setPersonalityData(_value):
	data = _value
	updatePersData()

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		$Label.text = _dataLine["name"]
	if(_dataLine.has("value")):
		setPersonalityData(_dataLine["value"])
	else:
		updatePersData()
