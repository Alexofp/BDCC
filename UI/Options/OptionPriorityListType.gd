extends HBoxContainer

signal value_changed(categoryID, id, newvalue)

var myvalues
var defaultValue

var id
var categoryID
var description
var isImagesPacks = false

func setOptionName(newname):
	$Label.text = newname

func getOptionName():
	return $Label.text

func repopulateList():
	$List.clear()
	for valueData in myvalues:
		if(isImagesPacks):
			var imagePack = GlobalRegistry.getImagePack(valueData)
			if(imagePack != null):
				$List.add_item(imagePack.getArtist())
			else:
				$List.add_item(valueData)
		else:
			$List.add_item(valueData)

func setValues(values):
	myvalues = values
	repopulateList()

func setOptionValue(_newvalue):
	defaultValue = _newvalue

func makeImagepackList():
	isImagesPacks = true

func _on_List_item_selected(index):
	emit_signal("value_changed", categoryID, id, myvalues[index][0])

func setDescription(newdesc):
	description = newdesc

func getDescription():
	return description


func _on_MoveUpButton_pressed():
	if(!$List.is_anything_selected()):
		return
	var selectedItemIndex = $List.get_selected_items()[0]
	
	var element = myvalues[selectedItemIndex]
	var newIndex = selectedItemIndex - 1
	if(newIndex < 0):
		newIndex = 0
	
	myvalues.remove(selectedItemIndex)
	myvalues.insert(newIndex, element)
	repopulateList()
	$List.select(newIndex)

func _on_MoveDownButton_pressed():
	if(!$List.is_anything_selected()):
		return
	var selectedItemIndex = $List.get_selected_items()[0]
	
	var element = myvalues[selectedItemIndex]
	var newIndex = selectedItemIndex + 1
	if(newIndex >= myvalues.size()):
		newIndex = myvalues.size() - 1
	
	myvalues.remove(selectedItemIndex)
	myvalues.insert(newIndex, element)
	repopulateList()
	$List.select(newIndex)
