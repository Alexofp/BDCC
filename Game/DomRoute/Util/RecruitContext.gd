extends Reference
class_name RecruitContext

var recruitID:String = "" # recruit id
var charID:String = ""
var choices:Array = [] # indicies
var choiceIDs:Array = [] # ids
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
	return {
		recruitID = recruitID,
		charID = charID,
		choices = choices,
		choiceIDs = choiceIDs,
		choiceByID = choiceByID,
		perfect = perfect,
		success = success,
		extras = extras,
	}

func loadData(_data:Dictionary):
	recruitID = SAVE.loadVar(_data, "recruitID", "")
	charID = SAVE.loadVar(_data, "charID", "")
	choices = SAVE.loadVar(_data, "choices", [])
	choiceIDs = SAVE.loadVar(_data, "choiceIDs", [])
	choiceByID = SAVE.loadVar(_data, "choiceByID", {})
	perfect = SAVE.loadVar(_data, "perfect", false)
	success = SAVE.loadVar(_data, "success", false)
	extras = SAVE.loadVar(_data, "extras", {})
