extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var interestMap = {
	InterestTopic.AndroBody: Interest.Neutral,
}

var fetishSingleScene = preload("res://Game/Datapacks/UI/PackVarUIs/LikesDislikesSingleVarUI.tscn")

func updateMap():
	Util.delete_children($FetishMap)
	
	for lustTopicObject in GlobalRegistry.getLustTopicObjects():
		for interestID in lustTopicObject.handles_ids:
			var newFetishScene = fetishSingleScene.instance()
			$FetishMap.add_child(newFetishScene)
			newFetishScene.id = interestID
			newFetishScene.setData({
				interestTopic= interestID,
				value= (interestMap[interestID] if interestMap.has(interestID) else Interest.Neutral),
			})
			newFetishScene.connect("onValueChange", self, "onFetishValueSelected")
			$FetishMap.add_child(HSeparator.new())

func onFetishValueSelected(_id, _value):
	interestMap[_id] = _value
	triggerChange(interestMap.duplicate())

func setInterestMapValue(_value):
	interestMap = _value.duplicate()
	updateMap()

func setData(_dataLine:Dictionary):
	if(_dataLine.has("value")):
		setInterestMapValue(_dataLine["value"])
