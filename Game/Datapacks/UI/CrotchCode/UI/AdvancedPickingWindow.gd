extends WindowDialog

var values = []
var selectedValue
var id

var visibleValues = []

onready var filter_edit = $MarginContainer/VBoxContainer/FilterEdit
onready var item_list = $MarginContainer/VBoxContainer/ItemList

signal onConfirm(window, value)
signal onCancel(window)

func setData(_data):
	if(_data.has("values")):
		values = _data["values"]
	if(_data.has("value")):
		selectedValue = _data["value"]
	
	updateItemList()

func updateItemList():
	item_list.clear()
	visibleValues.clear()
	
	var filterText = filter_edit.text.to_lower()
	
	for value in values:
		var valueText = str(value)
		if(value is Array):
			valueText = str(value[1])
		
		if(filterText != "" && !(filterText in valueText.to_lower())):
			continue
		visibleValues.append(value)
	
	var _i = 0
	for value in visibleValues:
		var valueText = str(value)
		var valueValue = value
		if(value is Array):
			valueValue = value[0]
			valueText = value[1]
		
		item_list.add_item(valueText)
		if(valueValue == selectedValue):
			item_list.select(_i)
		
		_i += 1

func _on_FilterEdit_text_changed(_new_text):
	updateItemList()

func _on_ConfirmButton_pressed():
	if(item_list.get_selected_items().size() <= 0):
		emit_signal("onCancel", self)
		return
	var selectedIndex = item_list.get_selected_items()[0]
	if(selectedIndex < 0 || selectedIndex >= visibleValues.size()):
		emit_signal("onCancel", self)
		return
	
	if(visibleValues[selectedIndex] is Array):
		emit_signal("onConfirm", self, visibleValues[selectedIndex][0])
	else:
		emit_signal("onConfirm", self, visibleValues[selectedIndex])

func _on_CancelButton_pressed():
	emit_signal("onCancel", self)

func _on_AdvancedPickingWindow_popup_hide():
	emit_signal("onCancel", self)
