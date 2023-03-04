extends SceneBase

func _init():
	sceneID = "rahiSlaveryPickTaskScene"


#func _reactInit():
#	if(getModule("RahiModule").canAdvanceStage()):
#		setState("ask_if_advance")

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
		
		setFlag("RahiModule.rahiCommentedOnTask", false)
		if(theresult):
			addExperienceToPlayer(10)
			setFlag("RahiModule.rahiNeedsReward", true)
			setFlag("RahiModule.rahiTaskSuceeded", true)
			endScene()
			runScene("rahiSlaveryTalkScene")
		else:
			addExperienceToPlayer(5)
			setFlag("RahiModule.rahiNeedsPunishment", true)
			setFlag("RahiModule.rahiTaskSuceeded", false)
			endScene()
			runScene("rahiSlaveryTalkScene")
