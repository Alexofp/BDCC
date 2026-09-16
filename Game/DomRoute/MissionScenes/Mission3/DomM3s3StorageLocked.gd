extends SceneBase

func _init():
	sceneID = "DomM3s3StorageLocked"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="kait", pc="avy"})
		addCharacter("kait")
		addCharacter("avy")
		saynn("You're following a path of defeated, panting nurses until you meet your team.")

		saynn("[say=kait]Locked! Why is it locked? Is it always locked?[/say]")

		saynn("You're standing in front of a wide door. There is a sign on the wall that says 'Storage'. Below it is a locked access panel.")

		saynn("[say=avy]It should be unlocked. That's weird. They don't usually lock it.[/say]")

		saynn("Kait puts her paws on her sides and glares at the foxy.")

		saynn("[say=kait]How do you know?[/say]")

		saynn("[say=avy]I just know. Fuck. I guess we need a badge or whatever.[/say]")

		saynn("Kait tries to use a badge from one of the defeated nurses.. but the access panel just beeps angrily and flashes red.")

		saynn("[say=kait]Crap, it needs higher access. The more we waste our time here, the more nurses we will have to beat up.[/say]")

		saynn("Going back to Eliza and asking for a badge might not be the best idea..")

		saynn("[say=pc]What can we do? Eliza is busy with Ferri.[/say]")

		saynn("[say=kait]I don't know. Showers! Maybe some doctor is taking a shower.[/say]")

		saynn("[say=avy]We should have just broken the nerdy bitch first.[/say]")

		saynn("[say=kait]Hindsight is twenty-twenty! We don’t have much time. I’m gonna try to.. hack it open maybe. You find a working badge.[/say]")

		saynn("Shower area.. surely there is someone there.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
