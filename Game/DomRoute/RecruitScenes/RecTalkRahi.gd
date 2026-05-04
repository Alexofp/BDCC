extends RecruitTalkSceneBase

func _init():
	sceneID = "RecTalkRahi"

func _reactInit():
	allTopics = [
	[0, 1],
	[2],
	]

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("You enter the cell where Rahi currently rests.")

		saynn("[say=pc]Gonna ask you some random things.[/say]")

		saynn("[say=rahi]Meow..[/say]")

		addButton("Continue", "See what happens next", "ask_next")
	if(state == "0"):
		saynn("[say=pc]Meow?[/say]")

		saynn("[say=rahi]Meow meow![/say]")

		addRecButtons()
	if(state == "1"):
		saynn("[say=pc]Test?[/say]")

		saynn("[say=rahi]Meow meow![/say]")

		addRecButtons()
	if(state == "2"):
		saynn("[say=pc]This one is last?[/say]")

		saynn("[say=rahi]Meow meow![/say]")

		addRecButtons()

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ask_next"):
		do_ask_next()
		return

	setState(_action)
