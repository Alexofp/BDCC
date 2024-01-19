extends SceneBase

func _init():
	sceneID = "AlexTrustExercisesMenuScene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("Which trust exercise do you wanna do?")

		addButton("Trust exercise 1", "Do the first one", "do_first")
		var howManyCh2 = getFlag("AlexRynardModule.ch2SceneNum", 0)
		if (howManyCh2 >= 3):
			addButton("Trust exercise 2", "Do the second one", "do_second")
		if (howManyCh2 >= 7):
			addButton("Trust exercise 3", "Do the third one", "do_third")
		if (getFlag("AlexRynardModule.ch2FinalSceneHappened")):
			addButton("Trust exercise 4", "Do the last one", "do_fourth")
		addButton("Never mind", "You changed your mind", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_first"):
		endScene()
		runScene("AlexTrustExercise1Scene")
		return

	if(_action == "do_second"):
		endScene()
		runScene("AlexTrustExercise2Scene")
		return

	if(_action == "do_third"):
		endScene()
		runScene("AlexTrustExercise3Scene")
		return

	if(_action == "do_fourth"):
		endScene()
		runScene("AlexTrustExercise4Scene")
		return

	setState(_action)
