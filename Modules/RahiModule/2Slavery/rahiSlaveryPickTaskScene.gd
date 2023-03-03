extends SceneBase

func _init():
	sceneID = "rahiSlaveryPickTaskScene"


#func _reactInit():
#	setState("rahi_is_sleeping")

func _run():
	if(state == ""):
		saynn("Pick what task you want Rahi to do today.")

		addButton("Cleaning", "Make her clean her cell", "dotask", ["rahiSlaveryCleaningTaskScene"])

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "dotask"):
		runScene(_args[0], [], "theTask")
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "theTask"):
		if(_result == null || _result.size() == 0):
			setState("")
			return
		var theresult = _result[0]
		
		if(theresult):
			addExperienceToPlayer(10)
			endScene()
			runScene("rahiSlaveryTalkScene")
		else:
			addExperienceToPlayer(5)
			endScene()
			runScene("rahiSlaveryTalkScene")
