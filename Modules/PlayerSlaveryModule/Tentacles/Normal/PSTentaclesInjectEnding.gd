extends SceneBase

var biggestStat = -1

func _init():
	sceneID = "PSTentaclesInjectEnding"

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
		biggestStat = _tentacles.getBiggestStat()
		saynn("Might as well be done with it now. Becoming a mindless plant is what that thing deserves anyway.")

		saynn("You grip the injector tightly.. and start to slowly approach the tentacles.")

		if (biggestStat == _tentacles.STAT_ANGER):
			_tentacles.doAnim("glare")
			saynn("A low hum begins to vibrate through the cell. As the monster notices you, all of its tendrils go rigid in an instant. It can probably tell that something strange is happening.")

			saynn("[say=pc]Easy. Just let me do this.[/say]")

			saynn("You keep the injector behind your back.. until it becomes the time to reveal it!")

			saynn("As soon as you do, a thick tentacle lashes out! It was aiming for your hand.. but you jerk back at the last second, just about avoiding it.")

			saynn("[say=pc]No you don't![/say]")

			saynn("You dive to the side as another tendril slams down where you were standing, sending a wave of broken floor tiles in all directions. Looks like they're not gonna make it easy for you.")

			saynn("You quickly get up to your feet and kick the table into a make-shift barrier. A tentacle whips around it, catching one of the legs and hurling it against one of the reinforced windows. Shards of glass start raining down everywhere.")

			saynn("You use the distraction to lunge, aiming the injector towards the main mass of the tentacles.")

			saynn("But you don't make it. One of the tendrils wraps around your ankles and yanks you down. You hit the ground hard, the air getting pushed out of your lungs fast, the injector flying out of your hand and rolling who knows where.")

			saynn("[say=pc]Fuck. Ugh..[/say]")

			saynn("More and more tentacles start to wrap around your ankles and wrists, trying to find the missing item. Failing to do so, they just squeeze. Your bones creak. You do your best to kick and punch the tentacles away while looking for the injector.")

			addButton("Continue", "See what happens next", "choke")
		#elif (biggestStat == _tentacles.STAT_AGILITY):
		#elif (biggestStat == _tentacles.STAT_MIND):
		#else:
	if(state == "choke"):
		playAnimation(StageScene.TentaclesChoke, "chokefast", {plant=true})
		saynn("Eventually, the tentacles get a good grip on you and pull you into the air. They slam you against one of the walls, making some of your ribs crack. A wave of pain rushing through your whole body.")

		saynn("[say=pc]Agh![/say]")

		saynn("After pinning you, one of the tendrils precisely loops around your throat.. and begins to choke you. You try to dig your claws into it, leaving some wet tears.")

		saynn("The world starts to get all gray at the edges.")

		saynn("It feels like.. this is it. This is how it ends.")

		saynn("Miraculously, in the corner of your fading vision, you notice a faint yellow glow.. the injector! It's on the floor.. and you're not.. Your legs are dangling, trying to reach and push it closer to the edge.")

		saynn("The strength is leaving you fast. Your cone of vision is nothing but a small circle. As your body starts to go limp, the tentacles let you sink lower.")

		saynn("The next moments feel like a blur..")

		saynn("Your {pc.foot} finds something.. pushes it into the wall.. and flings it up.")

		saynn("Your hand catches the item.. and jabs it.")

		addButton("Continue", "See what happens next", "choke_after")
	if(state == "choke_after"):
		_tentacles.doAnim("sleep", {npcAction="defeat"})
		saynn("You drop to the floor.. gasping and holding onto your bruised throat.")

		saynn("The tentacles writhe, doing a series of chaotic, pained spasms. And then.. they just slump to the floor.")

		saynn("They twitch once.. twice.. and then lie perfectly still.")

		saynn("The cell is silent now.")

		saynn("It's pretty much destroyed too. Broken furniture.. huge cracks in the walls and the floor.. shards of glass everywhere.")

		saynn("[say=sci1]Really? For fuck's sake.[/say]")

		addButton("Continue", "See what happens next", "choke_talk")
	if(state == "choke_talk"):
		saynn("You look through the window.. and see the scientists.")

		saynn("[say=sci1]Do you know how much this is gonna cost to repair? The materials, they don't grow on trees. Couldn't you apply some finesse, you fuck?[/say]")


func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["biggestStat"] = biggestStat

	return data

func loadData(data):
	.loadData(data)

	biggestStat = SAVE.loadVar(data, "biggestStat", -1)
