extends OptionButton

var id
var values = []
var selectedValue = ""

signal onValueChanged(id, newVal)

func setValues(newVals):
	values = newVals
	
	updateValues()

func setValue(theValue):
	selectedValue = theValue
	
	updateSelectedValue()

func setValueAndValues(theValue, newVals):
	values = newVals
	selectedValue = theValue
	updateValues()

func updateSelectedValue():
	var _i = 0
	for value in values:
		var valueActual = value
		if(valueActual is Array):
			valueActual = valueActual[0]
		if(selectedValue == valueActual):
			select(_i)
		_i += 1

func updateValues():
	clear()
	for value in values:
		if(value is Array):
			add_item(value[1])
		else:
			add_item(str(value))
	updateSelectedValue()

func _on_VisRawSelector_item_selected(index):
	if(index < 0 || index >= values.size()):
		return
	
	selectedValue = values[index]
	if(selectedValue is Array):
		selectedValue = selectedValue[0]
	emit_signal("onValueChanged", id, selectedValue)
