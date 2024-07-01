extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var fetishMap = {
	Fetish.AnalSexReceiving: FetishInterest.Loves,
}

var fetishSingleScene = preload("res://Game/Datapacks/UI/PackVarUIs/FetishSingleVarUI.tscn")

func updateMap():
	Util.delete_children($FetishMap)
	
	for fetishID in GlobalRegistry.getFetishes():
		var newFetishScene = fetishSingleScene.instance()
		$FetishMap.add_child(newFetishScene)
		newFetishScene.id = fetishID
		newFetishScene.setData({
			fetish= fetishID,
			value= (fetishMap[fetishID] if fetishMap.has(fetishID) else FetishInterest.Neutral),
		})
		newFetishScene.connect("onValueChange", self, "onFetishValueSelected")
		$FetishMap.add_child(HSeparator.new())

func onFetishValueSelected(_id, _value):
	fetishMap[_id] = _value
	triggerChange(fetishMap.duplicate())

func setFetishMapValue(_value):
	fetishMap = _value.duplicate()
	updateMap()

func setData(_dataLine:Dictionary):
	if(_dataLine.has("value")):
		setFetishMapValue(_dataLine["value"])
