extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var statData = {}

var singleStatUI = preload("res://Game/Datapacks/UI/PackVarUIs/StatSingleVarUI.tscn")

func updateStats():
	Util.delete_children($VBoxContainer)
	for statID in GlobalRegistry.getStats():
		var theStat:StatBase = GlobalRegistry.getStat(statID)
		
		var newStatUI = singleStatUI.instance()
		$VBoxContainer.add_child(newStatUI)
		newStatUI.id = statID
		newStatUI.setData({
			name = theStat.getVisibleName(),
			value = (statData[statID] if statData.has(statID) else 0),
		})
		newStatUI.connect("onValueChange", self, "onStatChanged")

func onStatChanged(id, value):
	statData[id] = value
	triggerChange(statData.duplicate())
	
func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		$Label.text = _dataLine["name"]
	if(_dataLine.has("value")):
		statData = _dataLine["value"].duplicate()
	updateStats()
