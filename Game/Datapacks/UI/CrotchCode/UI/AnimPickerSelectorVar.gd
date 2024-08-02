extends HBoxContainer

var selectedValue
var values = []

var selectedVar = ""
var vars = []
var isVar = false

var id

signal onDataChanged(id, data)

onready var option_button = $OptionButton
onready var var_option_list = $VarOptionList
onready var label = $Label
onready var var_enabled_box = $VarEnabledBox

func setData(_data:Dictionary):
	if(_data.has("name")):
		label.text = _data["name"]
	if(_data.has("value")):
		selectedValue = _data["value"]
	if(_data.has("values")):
		values = _data["values"]
		
		option_button.clear()
		var _i = 0
		for value in values:
			if(value is Array):
				option_button.add_item(value[1])
				if(selectedValue == value[0]):
					option_button.select(_i)
			else:
				option_button.add_item(str(value))
				if(selectedValue == value):
					option_button.select(_i)

			_i += 1
	if(_data.has("varName")):
		selectedVar = _data["varName"]
	if(_data.has("vars")):
		vars = _data["vars"]
		
		var_option_list.clear()
		var _i = 0
		for varvar in vars:
			var_option_list.add_item(str(varvar))
			if(selectedVar == varvar):
				var_option_list.select(_i)

			_i += 1
	if(_data.has("isVar")):
		setIsVar(_data["isVar"])
	
	if(vars.size() <= 0 && !isVar):
		selectedVar = ""
		var_enabled_box.visible = false
	else:
		var_enabled_box.visible = true
	
	if(vars.size() > 0 && isVar):
		if(!vars.has(selectedVar)):
			selectedVar = vars[0]

func setIsVar(newIsVar):
	isVar = newIsVar
	var_enabled_box.set_pressed_no_signal(newIsVar)
	var_option_list.visible = newIsVar
	option_button.visible = !newIsVar
	if(!isVar):
		selectedVar = ""
	elif(vars.size() > 0):
		if(!vars.has(selectedVar)):
			selectedVar = vars[0]
			updateSelectedVarOption()

func updateSelectedVarOption():
	var _i = 0
	for varvar in vars:
		if(selectedVar == varvar):
			var_option_list.select(_i)
			return
		_i += 1

func _on_OptionButton_item_selected(index):
	if(index < 0 || index >= values.size()):
		return
	
	selectedValue = values[index]
	if(selectedValue is Array):
		selectedValue = selectedValue[0]
	emitChange()
	
func emitChange():
	emit_signal("onDataChanged", id, {
		value = selectedValue,
		isVar = isVar,
		varName = selectedVar,
	})


func _on_VarEnabledBox_toggled(button_pressed):
	setIsVar(button_pressed)
	emitChange()

func _on_VarOptionList_item_selected(index):
	if(index < 0 || index >= vars.size()):
		return
	selectedVar = vars[index]
	emitChange()
