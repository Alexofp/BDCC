extends SceneBase

func _init():
	sceneID = "PSTentaclesTinySleep"

func _reactInit():
	addCharacter(GM.main.PS.getTentaclesCharID())

func resolveCustomCharacterName(_charID):
	if(_charID == "ten"):
		return GM.main.PS.getTentaclesCharID()
	if(_charID == "sci1"):
		return GM.main.PS.getScientist1CharID()
	if(_charID == "sci2"):
		return GM.main.PS.getScientist2CharID()

func _run():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(state == ""):
		playAnimation(StageScene.Sleeping, "sleep")
		var theBiggestStat = _tentacles.getBiggestStat()
		saynn("It was time to take a nap..")

		if (theBiggestStat == _tentacles.STAT_ANGER):
			saynn("The tentacles still seem to be quite.. upset. They're taking their anger out on the cold floor, tapping it.")

			saynn("You're not too afraid.. since they're still very much too weak to move around.. You just block the noise by pushing your face into the comfy pillow harder.")

		elif (theBiggestStat == _tentacles.STAT_AGILITY):
			saynn("The tentacles are already sleeping tightly.. Or so it seems like. They're resting curled on top of each other.. It's kinda cute.")

			saynn("You're not afraid of them pouncing you suddenly.. since they're still very much too weak to move around.")

		elif (theBiggestStat == _tentacles.STAT_MIND):
			saynn("The tentacles are already sleeping tightly.. Or so it seems like. They're resting curled on top of each other.. It's kinda cute.")

			saynn("Somehow, their presence makes you feel safer.")

		elif (theBiggestStat == _tentacles.STAT_LUST):
			saynn("The tentacles are already sleeping tightly.. Or so it seems like. They're resting curled on top of each other.. It's kinda cute.")

			saynn("You're wondering if you can bring them into your bed.. keep them under your sheets.. Eh.. why the heck not.")

			saynn("Excited, you get up and carefully scoop up the confused tentacles. They're not too heavy.")

			saynn("[say=pc]Tshh.. all good..[/say]")

			saynn("You bring them into your bed and let them rest near your chest.")

			saynn("[say=pc]There we go..[/say]")

			saynn("And now.. you try to sleep.")

			saynn("As it turns out.. the tentacles are very.. tickly.. Their constant touches in various places are making you squirm a bit.")

			saynn("Still.. It feels nice to not be alone.")

		else:
			saynn("The tentacles are already sleeping tightly.. Or so it seems like. They all just picked their own corners of the nest to occupy.")

			saynn("It should be safe for you to sleep")

		addButton("Sleep", "See what happens next", "newday")
	if(state == "newday"):
		# (( small idle anim
		playAnimation(StageScene.Solo, "stand")
		aimCameraAndSetLocName("pstent_left")
		GM.pc.setLocation("pstent_left")
		saynn("It's a new day..")

		saynn("And the first thing that you notice after waking up.. is that the tentacles aren't in their nest!")

		saynn("Oh.. They have grown enough to move around.")

		saynn("The tentacle monster has grown quite a few more tentacles.. and the ones that were there have grown in mass and strength.. allowing it to bring itself out of the nest.")

		saynn("[say=sci2]You're up, test subject. Good.[/say]")

		saynn("[say=pc]You were here? Why didn't you wake up earlier?[/say]")

		saynn("[say=sci2]We wanted to see what it would do to you.[/say]")

		saynn("[say=sci1]It's your job to be a test dummy. Dummy.[/say]")

		saynn("Right..")

		saynn("[say=pc]So what now?[/say]")

		saynn("[say=sci2]We are gonna need a few days to go through all of the collected data. In the meantime, your current task is to look after it.[/say]")

		saynn("[say=sci1]Yeah. If you let the plant die, we won't have a reason to keep you around.[/say]")

		saynn("Somehow you get a feeling that this doesn't mean that you will get set free.")

		saynn("You shrug.")

		saynn("[say=sci1]Feed it, train it, entertain it. You know the drill by now.[/say]")

		saynn("Should be simple enough.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "newday"):
		GM.main.startNewDay()
		_tentacles.setStage(_tentacles.STAGE_SMALL)
		_tentacles.setMonsterLoc("pstent_left")

	setState(_action)
