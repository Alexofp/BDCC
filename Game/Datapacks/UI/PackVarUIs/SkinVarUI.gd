extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var data = {
	skin = "",
	r = Color.white,
	g = Color.lightgray,
	b = Color.darkgray,
}

var noBase = false
var possibleSkins = []

var thePrefix = ""

func setSkinData(_value):
	data = _value
	updateEverything()

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		#thePrefix = _dataLine["name"]
		$Label.text = _dataLine["name"]
	if(_dataLine.has("skins")):
		possibleSkins = _dataLine["skins"]
	if(_dataLine.has("noBase")):
		noBase = _dataLine["noBase"]
	if(_dataLine.has("value")):
		setSkinData(_dataLine["value"].duplicate())
	else:
		updateEverything()



func updateEverything():
	if(possibleSkins.size() <= 0 || noBase):
		$CheckBoxSkin.visible = false
	else:
		$CheckBoxSkin.visible = true
	
	if(data["skin"] == null):
		$CheckBoxSkin.set_pressed_no_signal(true)
	else:
		$CheckBoxSkin.set_pressed_no_signal(false)
	
	$OptionButton.clear()
	if(possibleSkins.size() <= 0 || data["skin"] == null):
		$OptionButton.visible = false
	else:
		$OptionButton.visible = true
		var _i = 0
		for skinid in possibleSkins:
			if(skinid == ""):
				$OptionButton.add_item("-default-")
			else:
				$OptionButton.add_item(skinid)
			
			if(skinid == data["skin"]):
				$OptionButton.select(_i)
			_i += 1
	
	if(noBase):
		$CheckBoxR.visible = false
		$CheckBoxG.visible = false
		$CheckBoxB.visible = false
	else:
		$CheckBoxR.visible = true
		$CheckBoxG.visible = true
		$CheckBoxB.visible = true
	
	if(data["r"] == null && !noBase):
		$ColorPickerButtonR.visible = false
		$CheckBoxR.set_pressed_no_signal(true)
	else:
		$CheckBoxR.set_pressed_no_signal(false)
		$ColorPickerButtonR.visible = true
		$ColorPickerButtonR.color = data["r"]

	if(data["g"] == null && !noBase):
		$ColorPickerButtonG.visible = false
		$CheckBoxG.set_pressed_no_signal(true)
	else:
		$CheckBoxG.set_pressed_no_signal(false)
		$ColorPickerButtonG.visible = true
		$ColorPickerButtonG.color = data["g"]

	if(data["b"] == null && !noBase):
		$CheckBoxB.set_pressed_no_signal(true)
		$ColorPickerButtonB.visible = false
	else:
		$CheckBoxB.set_pressed_no_signal(false)
		$ColorPickerButtonB.visible = true
		$ColorPickerButtonB.color = data["b"]


func _on_CheckBoxSkin_toggled(button_pressed):
	if(!button_pressed):
		if(possibleSkins.size() > 0):
			data["skin"] = possibleSkins[0]
	else:
		data["skin"] = null
	updateEverything()
	triggerChange(data.duplicate())

func _on_OptionButton_item_selected(index):
	if(index < 0 || index >= possibleSkins.size()):
		return
	
	data["skin"] = possibleSkins[index]
	triggerChange(data.duplicate())

func _on_CheckBoxR_toggled(button_pressed):
	if(button_pressed):
		data["r"] = null
	else:
		data["r"] = Color.white
	updateEverything()
	triggerChange(data.duplicate())

func _on_CheckBoxG_toggled(button_pressed):
	if(button_pressed):
		data["g"] = null
	else:
		data["g"] = Color.white
	updateEverything()
	triggerChange(data.duplicate())

func _on_CheckBoxB_toggled(button_pressed):
	if(button_pressed):
		data["b"] = null
	else:
		data["b"] = Color.white
	updateEverything()
	triggerChange(data.duplicate())

var isDebouncing = false
func _on_ColorPickerButtonR_color_changed(color):
	data["r"] = color
	if(isDebouncing):
		return
	isDebouncing = true
	yield(get_tree().create_timer(0.1), "timeout")
	triggerChange(data.duplicate())
	isDebouncing = false

func _on_ColorPickerButtonG_color_changed(color):
	data["g"] = color
	if(isDebouncing):
		return
	isDebouncing = true
	yield(get_tree().create_timer(0.1), "timeout")
	triggerChange(data.duplicate())
	isDebouncing = false

func _on_ColorPickerButtonB_color_changed(color):
	data["b"] = color
	if(isDebouncing):
		return
	isDebouncing = true
	yield(get_tree().create_timer(0.1), "timeout")
	triggerChange(data.duplicate())
	isDebouncing = false
