extends SceneBase

var selectedRahiState = "rahi_is_sleeping"

func _init():
	sceneID = "rahiSlaveryMorningScene"

func _reactInit():
	if(getModule("RahiModule").canAdvanceStage()):
		setState("ask_if_advance")
		return
	var possible = []
	
	var slaveryStage = getModule("RahiModule").getSlaveryStage()
	
	if(slaveryStage <= 1):
		possible.append("rahi_is_sleeping")
		possible.append("rahi_is_sad")
	else:	
		possible.append("rahi_default")
	
	selectedRahiState = RNG.pick(possible)
	setState(selectedRahiState)
	playAnimation(StageScene.Duo, "stand", {npc="rahi"})
	addCharacter("rahi")

func _run():
	if(state == ""):
		saynn("You shouldn't see this")

	if(state == "rahi_is_sleeping"):
		saynn("You step into Rahi's cell. She seems to be sleeping so you make your presence known by coughing a few times.")

		saynn("Rahi's ears perk as she opens her eyes. The feline quickly gets up and assumes a submissive pose. Straight posture, head tilted down, arms by her sides.")

		saynn("[say=rahi]Hello, {rahiMaster}..[/say]")

		saynn("[say=pc]Did you drink any alcohol while I wasn't here?[/say]")

		saynn("Rahi shakes her head subtly.")

		saynn("[say=pc]I trust you not to lie, kitty.[/say]")

		addButton("Continue", "See what happens next", "pick_task_scene")
	if(state == "rahi_is_sad"):
		saynn("As you enter Rahi's cell, you find her curled up on her bed, her ears drooping low and her tail wrapped around her body.")

		saynn("You slowly approach her.")

		saynn("[say=pc]Hey, kitty.[/say]")

		saynn("Rahi looks up at you with her sad eyes and gives a small nod.")

		saynn("[say=rahi]She is doing.. okay.[/say]")

		saynn("You sit down next to her on the bed and put a hand on her shoulder, trying to cheer her up. Rahi's ears twitch slightly as she slowly gets up, getting ready to do her task.")

		addButton("Continue", "See what happens next", "pick_task_scene")
	if(state == "rahi_default"):
		saynn("You enter Rahi's cell. She is being the usual lazy kitty, sleeping in her bed. As you carefully wake her up, she swiftly gets off her bed and straightens her posture for you.")

		saynn("[say=rahi]Hello, {rahiMaster}..[/say]")

		saynn("She rubs her nose and patiently awaits her task.")

		saynn("[say=pc]Let's see..[/say]")

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
		setFlag("RahiModule.rahiSlaveryShowNewSkill", true)
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
