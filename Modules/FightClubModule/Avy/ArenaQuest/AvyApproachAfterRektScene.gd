extends SceneBase

func _init():
	sceneID = "AvyApproachAfterRektScene"

func _run():
	if(state == ""):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("Avy eyes you out curiously when you approach her.")

		saynn("[say=avy]Came back for more?[/say]")

		saynn("Foxy looks at her claws.")

		saynn("[say=avy]You know, I wasn't actually trying to kill you.[/say]")

		saynn("Her gaze gets directed back towards you.")

		saynn("[say=avy]You're just too soft, I guess. Anyway. What do you want?[/say]")

		addButton("Continue", "That was rude", "do_talk")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_talk"):
		runScene("AvyTalkScene")
		endScene()
		return

	setState(_action)
