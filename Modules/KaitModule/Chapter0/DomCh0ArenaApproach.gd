extends SceneBase

func _init():
	sceneID = "DomCh0ArenaApproach"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("You approach a familiar snow leopard that's wearing lilac colors.")

		saynn("[say=pc]Hey there. I managed to find you.[/say]")

		saynn("Her round ears perk towards your voice.")

		saynn("[say=kait]Oh, you did it. Nice.[/say]")

		saynn("[say=pc]I did your test.[/say]")

		saynn("Kait offers you a cute smile.")

		saynn("[say=kait]Good job.[/say]")

		saynn("But now there is only silence.")

		saynn("[say=pc]So?[/say]")

		saynn("[say=kait]Well..[/say]")

		saynn("[say=pc]Well?[/say]")

		saynn("She rubs her snout.")

		saynn("[say=kait]You gotta be able to stand for yourself. I don't need total doormats.[/say]")

		saynn("[say=pc]You saying I'm a doormat?[/say]")

		saynn("You got past the bulldog.. but that might not be enough for her it seems.")

		saynn("[say=kait]No. Well.. There is a way to find that out. See the arena?[/say]")

		saynn("Right.")

		saynn("[say=kait]If you win a few fights, that will be enough for me.[/say]")

		saynn("[say=pc]I have to fight in the arena?[/say]")

		saynn("[say=kait]Yeah? How do you think we're gonna overthrow the captain? We're gonna fight for it. A lot. Until he is our bitch! If you don't wanna fight, that's fine too. Just don't waste my time then, pretty please.[/say]")

		saynn("If you wanna join the rebellion, you gotta become a rebel.")

		addButton("Continue", "See what happens next", "startTalkScene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "startTalkScene"):
		endScene()
		runScene("DomCh0KaitTalkScene")
		return

	setState(_action)
