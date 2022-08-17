extends HBoxContainer

var id

func setArgs(_args):
	if("value" in _args):
		$LineEdit.text = _args["value"]
	if("name" in _args):
		$Label.text = _args["name"]

func getResult():
	return $LineEdit.text
