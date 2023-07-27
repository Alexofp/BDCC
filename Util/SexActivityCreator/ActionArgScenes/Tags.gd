extends "res://Util/SexActivityCreator/ActionArgScenes/BaseActionArg.gd"

var fetishes = {}
var fetishList = []

func _init():
	id = "tags"

func _ready():
	pass

func setData(_data):
	fetishes = _data
	updateFetishList()

func getData():
	return fetishes

func setText(_newText):
	$Label.text = _newText

func setOptions(_options):
	if(_options.has("value")):
		setData(_options["value"])
	if(_options.has("tags")):
		fetishList.clear()
		$VBoxContainer/HBoxContainer/OptionButton.clear()
		for tag in _options["tags"]:
			$VBoxContainer/HBoxContainer/OptionButton.add_item(tag)
			fetishList.append(tag)
		if(fetishList.size() > 0):
			$VBoxContainer/HBoxContainer/OptionButton.selected = 0

func _on_TextEdit_text_changed():
	emitChanged()

func updateFetishList():
	$Label2.text = Util.join(fetishes.keys(), ", ")

func _on_AddFetishButton_pressed():
	var currentFetish = fetishList[$VBoxContainer/HBoxContainer/OptionButton.selected]
	
	if(fetishes.has(currentFetish)):
		fetishes.erase(currentFetish)
	else:
		fetishes[currentFetish] = true
	updateFetishList()
