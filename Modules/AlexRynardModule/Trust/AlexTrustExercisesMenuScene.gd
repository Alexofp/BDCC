extends SceneBase

func _init():
	sceneID = "AlexTrustExercisesMenuScene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("Which trust exercise do you wanna do?")

		addButton("Trust exercise 1", "Do the first one", "do_first")
		addButton("Never mind", "You changed your mind", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_first"):
		endScene()
		runScene("AlexTrustExercise1Scene")
		return

	setState(_action)
