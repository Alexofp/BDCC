extends "res://Scenes/SceneBase.gd"

var actionID = ""
var action:SlaveActionBase

var mainSlave = ""
var pickedSlaves = {}


func _init():
	sceneID = "SlaveActionWrapperScene"

func _initScene(_args = []):
	actionID = _args[0]
	action = GlobalRegistry.getSlaveAction(actionID)
	if(_args.size() > 1):
		mainSlave = _args[1]
	if(_args.size() > 2):
		pickedSlaves = _args[2]
	
func _reactInit():
	runScene(action.sceneID, [mainSlave, pickedSlaves, action], "slave_action")
	
func _run():
	if(state == ""):
		saynn("You shouldn't see this ever.")
		#addButton("Continue", "See what happens next", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "slave_action"):
		action.reactSceneResult(mainSlave, pickedSlaves, _result)
		endScene()
		return

func saveData():
	var data = .saveData()
	
	data["actionID"] = actionID
	data["mainSlave"] = mainSlave
	data["pickedSlaves"] = pickedSlaves
	
	return data
	
func loadData(data):
	.loadData(data)
	
	actionID = SAVE.loadVar(data, "actionID", "")
	action = GlobalRegistry.getSlaveAction(actionID)

	mainSlave = SAVE.loadVar(data, "mainSlave", "")
	pickedSlaves = SAVE.loadVar(data, "pickedSlaves", {})
