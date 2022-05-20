extends HBoxContainer

var id
var categoryID
var description

func setOptionName(newname):
	$Label.text = newname

func getOptionName():
	return $Label.text

func setOptionValue(_newvalue):
	pass

func setDescription(newdesc):
	description = newdesc

func getDescription():
	return description
