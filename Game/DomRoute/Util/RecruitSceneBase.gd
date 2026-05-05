extends SceneBase
class_name RecruitSceneBase

var RC:RecruitContext
var c1:int = 0
var c2:int = 0
var c3:int = 0
var success:bool = false
var perfect:bool = false

func _initScene(_args = []):
	RC = _args[0]
	c1 = RC.choices[0]
	c2 = RC.choices[1]
	c3 = RC.choices[2]
	success = RC.success
	perfect = RC.perfect

func saveData():
	var data = .saveData()
	
	data["RC"] = RC.saveData()
	
	return data

func loadData(data):
	.loadData(data)

	RC = RecruitContext.new()
	RC.loadData(SAVE.loadVar(data, "RC", {}))
	c1 = RC.choices[0]
	c2 = RC.choices[1]
	c3 = RC.choices[2]
	success = RC.success
	perfect = RC.perfect


func t3(_choiceIndx:int, _text1:String, _text2:String, _text3:String) -> String:
	return RC.t3(_choiceIndx, _text1, _text2, _text3)

func ch1(_text1:String, _text2:String, _text3:String) -> String:
	return RC.ch1(_text1, _text2, _text3)

func ch2(_text1:String, _text2:String, _text3:String) -> String:
	return RC.ch2(_text1, _text2, _text3)

func ch3(_text1:String, _text2:String, _text3:String) -> String:
	return RC.ch3(_text1, _text2, _text3)
