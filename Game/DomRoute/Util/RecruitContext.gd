extends Reference
class_name RecruitContext

var choices:Array = [] # indicies
var choiceByID:Dictionary = {} # id = id
var perfect:bool = false
var success:bool = false
var extras:Dictionary = {}

func t3(_choiceIndx:int, _text1:String, _text2:String, _text3:String) -> String:
	var theC:int = choices[_choiceIndx]
	if(theC == 0):
		return _text1
	if(theC == 1):
		return _text2
	if(theC == 2):
		return _text3
	return _text1

func saveData() -> Dictionary:
	return {}

func loadData(_data:Dictionary):
	pass
