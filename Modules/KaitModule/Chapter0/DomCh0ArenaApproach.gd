extends SceneBase

func _init():
	sceneID = "DomCh0ArenaApproach"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("You approach a familiar snow leopard that's wearing lilac colors. Looks like she is wearing a fresh uniform actually.. makes sense. She looks a bit beat up still.")

		saynn("[say=pc]Hey there. I managed to find you. That fight was rough.[/say]")

		saynn("Her round ears perk towards your voice.")

		if (getFlag("KaitModule.bredByAviArena")):
			saynn("[say=kait]Yeah.. Avy.. that stupid bitch. At least I cleaned her cum out as fast as I could.[/say]")

			saynn("[say=pc]Does that happen often?[/say]")

			saynn("[say=kait]That was my first loss. I knew what I signed up for I guess.[/say]")

			saynn("First loss.. but already a big one.")

		else:
			saynn("[say=kait]Yeah.. Avy.. that stupid bitch. At least I didn't get fucked, that would have been humiliating. Some kind soul decided to save me.[/say]")

			saynn("You decide not to tell her who that soul was.. not yet at least.")

			saynn("[say=pc]Does that happen often?[/say]")

			saynn("[say=kait]Getting saved? Not really. Usually the crowd only makes it worse. I knew what I signed up for I guess.[/say]")

			saynn("The crowd wants a good show.")

		saynn("[say=pc]But yeah.. here I am.[/say]")

		saynn("[say=kait]You did it. Nice.[/say]")

		saynn("[say=pc]I did your test.[/say]")

		saynn("Kait offers you a cute smile. Her bruises make her hiss soon after.")

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

		saynn("[say=kait]Follow my steps. If you win a few fights, that will be enough for me.[/say]")

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
