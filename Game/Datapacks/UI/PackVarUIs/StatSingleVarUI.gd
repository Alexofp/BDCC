extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var statValue = 0

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		$Label.text = _dataLine["name"]
	if(_dataLine.has("value")):
		statValue = _dataLine["value"]
		$Label2.text = str(statValue)

func addAndTrigger(howMuch):
	statValue += howMuch
	$Label2.text = str(statValue)
	triggerChange(statValue)

func _on_Minus5Button_pressed():
	addAndTrigger(-5)
	
func _on_MinusButton_pressed():
	addAndTrigger(-1)

func _on_PlusButton_pressed():
	addAndTrigger(1)

func _on_Plus5Button_pressed():
	addAndTrigger(5)
