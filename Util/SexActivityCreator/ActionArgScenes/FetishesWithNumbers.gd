extends "res://Util/SexActivityCreator/ActionArgScenes/BaseActionArg.gd"

var fetishes = {}
var fetishList = []

func _init():
	id = "fetishesWithNumbers"

func _ready():
	for fetishID in GlobalRegistry.getFetishes():
		var fetishStr = "Fetish."+fetishID
		$VBoxContainer/HBoxContainer/OptionButton.add_item(fetishStr)
		fetishList.append(fetishStr)
	if(fetishList.size() > 0):
		$VBoxContainer/HBoxContainer/OptionButton.selected = 0

func fillWithGoals():
	fetishList.clear()
	$VBoxContainer/HBoxContainer/OptionButton.clear()
	for fetishID in GlobalRegistry.getSexGoals():
		var fetishStr = "SexGoal."+fetishID
		$VBoxContainer/HBoxContainer/OptionButton.add_item(fetishStr)
		fetishList.append(fetishStr)
	if(fetishList.size() > 0):
		$VBoxContainer/HBoxContainer/OptionButton.selected = 0

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
	if(_options.has("goals") && _options["goals"]):
		fillWithGoals()

func _on_TextEdit_text_changed():
	emitChanged()

func updateFetishList():
	$FetishList.clear()
	for fetishID in fetishes:
		$FetishList.add_item(fetishID+": "+fetishes[fetishID])

func _on_AddFetishButton_pressed():
	var currentFetish = fetishList[$VBoxContainer/HBoxContainer/OptionButton.selected]
	var fetishValue = $VBoxContainer/HBoxContainer2/LineEdit.text
	
	if(fetishValue == ""):
		return
	fetishes[currentFetish] = fetishValue
	updateFetishList()


func _on_RemoveFetishButton_pressed():
	if(!$FetishList.is_anything_selected()):
		return
	
	var selectedVarIndex = $FetishList.get_selected_items()[0]
	var selectedVar = fetishes.keys()[selectedVarIndex]
	fetishes.erase(selectedVar)
	updateFetishList()
