extends SceneBase

func _init():
	sceneID = "DomM1s1Intro"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		addCharacter("kait")
		saynn("[say=pc]Let's go get those records.[/say]")

		saynn("Kait bounces eagerly.")

		saynn("[say=kait]Out first heist, fuck yeah! I'm gonna go grab everyone.[/say]")

		addButton("Continue", "See what happens next", "explain_stuff")
	if(state == "explain_stuff"):
		addCharacter("announcer")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="kait", pc="announcer"})
		saynn("A few minutes later, Kait returns with Avy and Ans.")

		saynn("You begin talking about the plan.")

		saynn("[say=kait]The datapad is obviously a no-go. The thing is gonna get wiped.[/say]")

		saynn("[say=announcer]I might have an idea. What if we use an ancient piece of technology.. known as a printer.[/say]")

		saynn("[say=kait]Printer? Ancient? They're used everywhere.[/say]")
		
		saynn("Ans raises a brow.")
		
		saynn("[say=announcer]Really? Not where I'm from.[/say]")
		
		saynn("[say=kait]You wanna print multiple thousands of records? How?[/say]")

		saynn("[say=announcer]Find any console. Sort the inmate records by.. the length of the crime list. And we print the top twenty or so. Should fit on a page nicely.[/say]")

		saynn("[say=avy]Exclude me too first, because I'd be the first on that list.[/say]")

		saynn("Kait takes a moment to roll her eyes.")

		saynn("[say=kait]Very funny, Avy.[/say]")

		saynn("The snow leopard rubs her chin.")

		saynn("[say=kait]Hm.. That is so weird. But it could actually work. They can't wipe a piece of paper remotely. Do you know any consoles we can get to?[/say]")

		saynn("[say=announcer]Command Deck has a bunch of offices. All you need is a staff badge.[/say]")

		saynn("[say=pc]Command Deck?[/say]")

		saynn("[say=avy]Don't be scared. They're a bunch of pussies up there. Worst case, you will run into a guard or two.[/say]")

		saynn("[say=kait]I will go grab Rahi then. Let's all meet near the checkpoint, in front of the main elevator.[/say]")

		saynn("[say=announcer]Hope you don't need my presence. The arena requires managing.[/say]")

		saynn("[say=kait]You should stay and do that, you gave us plenty of help anyway.[/say]")

		saynn("Ans nods.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "explain_stuff"):
		processTime(5*60)
		addMessage("Task updated!")

	setState(_action)
