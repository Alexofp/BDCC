extends HBoxContainer

var id

func setArgs(_args):
	if("value" in _args):
		$SpinBox.value = _args["value"]
	if("name" in _args):
		$Label.text = _args["name"]
	if("onlyPositive" in _args && _args["onlyPositive"]):
		$SpinBox.allow_lesser = false
	if("float" in _args && _args["float"]):
		$SpinBox.step = 0.01
		$SpinBox.rounded = false

func getResult():
	return $SpinBox.value
