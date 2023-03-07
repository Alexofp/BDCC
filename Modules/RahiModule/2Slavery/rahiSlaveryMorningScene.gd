extends SceneBase

var selectedRahiState = "rahi_is_sleeping"

func _init():
	sceneID = "rahiSlaveryMorningScene"

func _reactInit():
	if(getModule("RahiModule").canAdvanceStage()):
		setState("ask_if_advance")
		return
	selectedRahiState = "rahi_is_sleeping"
	setState(selectedRahiState)

func _run():
	if(state == ""):
		saynn("You shouldn't see this")

	if(state == "rahi_is_sleeping"):
		saynn("You step into Rahi's cell. She seems to be sleeping so you make your presence known by coughing a few times.")

		saynn("Rahi's ears perk as she opens her eyes. The feline quickly gets up and assumes a submissive pose. Straight posture, head tilted down, arms by her sides.")

		saynn("[say=rahi]Hello, "+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+"..[/say]")

		saynn("[say=pc]Did you drink any alcohol while I wasn't here?[/say]")

		saynn("Rahi shakes her head subtly.")

		saynn("[say=pc]I trust you not to lie, kitty.[/say]")

		addButton("Continue", "See what happens next", "pick_task_scene")
	if(state == "ask_if_advance"):
		saynn("You're ready to advance your relationship with Rahi.")

		saynn("Do you wanna do that now?")

		addButton("Yes", "Advance it", "advance_stage")
		addButton("Not today", "You have things to do", "no_advance")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "pick_task_scene"):
		endScene()
		runScene("rahiSlaveryPickTaskScene")
		return

	if(_action == "advance_stage"):
		var sceneToRun = getModule("RahiModule").getAdvanceStageScene()
		
		if(sceneToRun == null):
			setState("")
			return
		
		endScene()
		setFlag("RahiModule.rahiCommentedOnTask", true)
		setFlag("RahiModule.rahiTaskSuceeded", true)
		setFlag("RahiModule.rahiNeedsPunishment", false)
		setFlag("RahiModule.rahiTaskSuceeded", false)
		setFlag("RahiModule.rahiTired", 2)
		
		increaseFlag("RahiModule.rahiSlaveryStage", 1)
		runScene(sceneToRun)
		return

	if(_action == "no_advance"):
		setState(selectedRahiState)
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["selectedRahiState"] = selectedRahiState

	return data

func loadData(data):
	.loadData(data)

	selectedRahiState = SAVE.loadVar(data, "selectedRahiState", "rahi_is_sleeping")
