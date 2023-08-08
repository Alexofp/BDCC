extends SceneBase

func _init():
	sceneID = "Ch6TaviCorruption25Scene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("Tavi is leaning against the wall, her head seems to be busy with some heavy thoughts.")

		saynn("You approach her and copy her stance.")

		saynn("[say=pc]Whatcha thinking about?[/say]")

		saynn("Tavi shrugs.")

		saynn("[say=tavi]Anything really. My mind is no longer clouded. And now, some things have became quite clear.[/say]")

		saynn("Huh. You raise a brow.")

		saynn("Tavi pushes herself away from the wall and stands in front of you.")

		saynn("[say=tavi]I.. I think I should stop creating new escape plans.. The ones I came up with.. Most of them failed.. In the most spectacular ways sometimes.[/say]")

		saynn("That's.. concerning..")

		saynn("[say=pc]Are you ready to give up, Tavi? On your dreams?[/say]")

		saynn("Tavi thinks about it a bit more.")

		saynn("[say=tavi]No. But..[/say]")

		addButton("Continue", "See what happens next", "tavi_kneels")
	if(state == "tavi_kneels"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="kneel"})
		saynn("Slowly, Tavi gets on her knees before you, a clear sign of submission. Or just weakness..")

		saynn("[say=tavi]I want you to be in charge. I want you to choose from now on. Choose what happens with us.. or just me..[/say]")

		saynn("Tavi lowers her chin, her ears droop too.")

		saynn("You can't help but to start stroking her head.")

		saynn("[say=pc]You were doing alright.[/say]")

		saynn("[say=tavi]But the captain was always ahead of me..[/say]")

		saynn("Tavi slowly looks up until your gazes collide.")

		saynn("[say=tavi]I trust you.. you know, completely..[/say]")

		saynn("Her words.. make you feel warm inside.")

		saynn("[say=tavi]If you think we should stop trying to escape.. Then let's just stop. My whole life I've been.. trying to make the world a fair place.. a small, insignificant chunk of it. But I think I was just seeking revenge.[/say]")

		saynn("[say=pc]We got so close last time..[/say]")

		saynn("She nods.")

		saynn("[say=tavi]We can try again, yeah. The captain would probably not expect it, considering what he did to me. Who knows what will happen if we fail though..[/say]")

		saynn("That's fair.")

		saynn("[say=pc]I will need to think about it. You can get up, Tavi.[/say]")

		saynn("She smiles and nuzzles your {pc.masc} thighs.")

		saynn("[say=tavi]Okay~.[/say]")

		addButton("Continue", "See what happens next", "start_talking")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "tavi_kneels"):
		processTime(3*60)

	if(_action == "start_talking"):
		runScene("Ch6TaviTalkScene")
		endScene()
		return

	setState(_action)
