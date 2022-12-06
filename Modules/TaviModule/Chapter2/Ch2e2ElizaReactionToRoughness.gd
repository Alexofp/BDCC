extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "Ch2e2ElizaReactionToRoughness"


func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})

		saynn("You approach the counter that Eliza usually sits behind. She is there, drinking her coffee as usual. But when she sees you, her expression changes to a very dark one, she frowns.")

		saynn("[say=eliza]It’s you. I remember what you did to me.[/say]")

		saynn("You’re not really sure how to react. Eliza growls at you but then gets quiet.")

		saynn("[say=eliza]You’re lucky I didn’t tell the captain. He would space you the same second.[/say]")

		saynn("She sips some coffee and calms down.")

		saynn("[say=eliza]Anyway, what do you want?[/say]")

		# (scene ends, starts talking scene again?)

		addButton("Continue", "See what happens next", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		runScene("ElizaTalkScene")
		return

	setState(_action)

