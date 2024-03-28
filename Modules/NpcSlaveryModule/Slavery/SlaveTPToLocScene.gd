extends "res://Scenes/SceneBase.gd"

var locToTp = ""

func _init():
	sceneID = "SlaveTPToLocScene"

func _initScene(_args = []):
	locToTp = _args[2][0]
	
func _reactInit():
	processTime(5*60)
	GM.pc.setLocation(locToTp)
	endScene()
	
func _run():
	if(state == ""):
		saynn("You shouldn't see this ever.")
		#addButton("Continue", "See what happens next", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
func saveData():
	var data = .saveData()
	
	data["locToTp"] = locToTp
	
	return data
	
func loadData(data):
	.loadData(data)
	
	locToTp = SAVE.loadVar(data, "locToTp", "")
