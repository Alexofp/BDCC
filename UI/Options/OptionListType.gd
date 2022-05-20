extends HBoxContainer

signal value_changed(categoryID, id, newvalue)

var myvalues
var defaultValue

var id
var categoryID
var description

func setOptionName(newname):
	$Label.text = newname

func getOptionName():
	return $Label.text

func setValues(values):
	myvalues = values
	var i = 0
	for valueData in values:
		$List.add_item(valueData[1])
		if(valueData[0] == defaultValue):
			$List.select(i)
		i += 1

func setOptionValue(_newvalue):
	defaultValue = _newvalue


func _on_List_item_selected(index):
	emit_signal("value_changed", categoryID, id, myvalues[index][0])

func setDescription(newdesc):
	description = newdesc

func getDescription():
	return description
