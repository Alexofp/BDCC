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
		var rahiModule = getModule("RahiModule")
		if(rahiModule.getSlaveryStage() >= 1):
			addButton("Stealing", "Make her steal something", "dotask", ["rahiSlaveryStealingTaskScene"])
		if(rahiModule.isSkillLearned("rahiSkillExhibit")):
			addButton("Yoga", "(Exhibionism) Make her do yoga", "dotask", ["rahiSlaveryYogaTaskScene"])
		if(rahiModule.isSkillLearned("rahiSkillProstitution")):
			addButton("Kissing booth", "(Prostitution) Make Rahi earn credits by offering kisses to others and more", "dotask", ["rahiSlaveryKissingBoothTaskScene"])
		if(rahiModule.getSlaveryStage() >= 8):
			addButton("No task", "Give Rahi a free day!", "dotask", ["rahiSlaveryFreeTaskScene"])
				
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
			
		if(_result == ["free"]):
			setFlag("RahiModule.rahiCommentedOnTask", true)
			endScene()
			runScene("rahiSlaveryTalkScene")
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
