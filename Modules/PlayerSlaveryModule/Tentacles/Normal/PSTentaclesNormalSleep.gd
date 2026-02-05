extends SceneBase

var biggestStat = -1

func _init():
	sceneID = "PSTentaclesNormalSleep"

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
		saynn("It's late now.. the lights of the bio-lab begin to dim, forcing you to start winding down, no matter if you want it or not.")

		saynn("You go check on {psTentacles}.")

		if (biggestStat == _tentacles.STAT_ANGER):
			_tentacles.doAnim("glare")
			saynn("They look.. angry.. to say the least. Their green pointy tips are always glaring in some direction, threatening to strike at any second.")

			saynn("This could be a bad thing if their anger gets directed towards you.. But this also could be a good thing. Certainly.")

		elif (biggestStat == _tentacles.STAT_AGILITY):
			_tentacles.doAnim("idle")
			saynn("They look.. thick and strong. The tendrils are swaying lazily, clearly tired after all the workouts..")

			saynn("The tentacles got strong incredibly fast. And the scientists will certainly not expect that. This could be a great opportunity.")

		elif (biggestStat == _tentacles.STAT_MIND):
			_tentacles.doAnim("idle")
			saynn("Over your time with them, you have certainly gotten to know them better. It's like you have some kind of.. psychic bond of sorts. Being alone in this cell would make you much more miserable for sure.")

			_tentacles.talk("We're doing well, thank you for wondering.")
			saynn("Huh. Somehow you get a feeling that they're doing well. Knowing that makes you feel better too. Maybe you will find a way out, one day.")

		else:
			_tentacles.doAnim("idle")
			saynn("The tentacles are swaying seductively at you. They way their green tips drip with juices.. ghhh.. makes it hard to resist.")

			saynn("Getting your tentacles to be so horny might've not been the best idea.. but who knows.. maybe it was. Lust can be a powerful motivator.")

		saynn("But for now.. it's time to get into your bed.")

		addButton("Bed", "Get into the bed", "goBed")
	if(state == "goBed"):
		if (biggestStat == _tentacles.STAT_ANGER):
			playAnimation(StageScene.Sleeping, "sleep", {pc="pc"})
			saynn("You get into your bed and prepare to sleep.")

			saynn("A constant feeling of being watched by tentacles doesn't help with that. But at least they only seem to be watching and nothing else.")

		elif (biggestStat == _tentacles.STAT_AGILITY):
			playAnimation(StageScene.TentaclesCuddle, "cuddle", {plant=true})
			saynn("Before you can get into your bed, you suddenly get swept up by the tentacles! It looks like they're offering themselves as an alternative for a bed.")

			saynn("They're not the most comfy.. the texture of the tendrils has gotten quite more hard.. but it's not the worst.")

		elif (biggestStat == _tentacles.STAT_MIND):
			playAnimation(StageScene.Sleeping, "sleep", {pc="pc"})
			saynn("You get into your bed and prepare to sleep. One of the most thin tentacles join you, laying on top.")

			saynn("Slowly, you start drifting into the land of dreams. You feel.. at peace.")

		else:
			playAnimation(StageScene.TentaclesSleepOn, "sleep", {plant=true, bodyState={naked=true}})
			saynn("Before you can get into your bed, you suddenly get swept up by the tentacles! It looks like they're offering themselves as an alternative for a bed.")

			saynn("They feel.. incredibly comfy actually.. The tentacles mold into perfect supports.. and proceed to gently tease your body in various spots.")

		saynn("Time to sleep..")

		addButton("Sleep", "Time to sleep", "doSleep")
	if(state == "doSleep"):
		_tentacles.doAnim("sleep", {instantSleep=true})
		saynn("New day arrives. And you're still in the bio-lab.")

		saynn("The tentacles still seem to be sleeping..")

		saynn("You hear knocking on the glass. It's these clowns again, you almost forgot about them by now.")

		addButton("Window", "Go approach the window", "talk_sci")
	if(state == "talk_sci"):
		addCharacter(GM.main.PS.getScientist1CharID())
		addCharacter(GM.main.PS.getScientist2CharID())
		playAnimation(StageScene.Duo, "stand", {pc=GM.main.PS.getScientist1CharID(), npc=GM.main.PS.getScientist2CharID()})
		saynn("You approach the window and see the two scientists. They're classy as always.")

		saynn("The intercom kicks in.")

		saynn("[say=sci2]How are you doing, test subject?[/say]")

		saynn("[say=pc]How does it look like I'm doing?[/say]")

		saynn("[say=sci1]So.. pretty well. Getting along with that thing?[/say]")

		saynn("[say=pc]You bet. What do you want?[/say]")

		saynn("[say=sci1]We've come to inform you that this is your happy day.[/say]")

		saynn("[say=sci2]We've completed the research. This specimen.. unfortunately.. hasn't proved to be valuable enough.[/say]")

		saynn("[say=pc]What do you mean?[/say]")

		saynn("[say=sci1]It's just an alien plant. Completely useless. The database already has plenty of them, wasting space on our digital drives.[/say]")

		saynn("[say=sci2]The data that was extracted.. has shown nothing promising. We will have to terminate this project.[/say]")

		saynn("[say=pc]Really?[/say]")

		saynn("[say=sci1]What? Don't tell me you got attached to a plant? Are you that dumb? Maybe you do share something in common, haha.[/say]")

		saynn("[say=sci2]Our bio-lab needs space for the next project.[/say]")

		saynn("[say=pc]What do you mean by erasing?[/say]")

		saynn("[say=sci1]Throwing it out into space would be my preferred choice. But I don't like littering. We gotta put more care into our environment.[/say]")

		saynn("[say=sci2]I've developed a substance that will shut down most of its neural activity. It will still grow.. but it will be completely harmless.[/say]")

		saynn("[say=sci1]It will serve us as a cute office plant.[/say]")

		saynn("[say=pc]What about me? Gonna keep me forever or inject me with that shit too?[/say]")

		saynn("[say=sci2]Actually, we have no reason to do so. Your collar has piqued my interest. I've run a traceback of a signal and found a bounty attached to your name. We can just hand you back to the authorities.[/say]")

		saynn("[say=sci1]You have outlived your usefulness. If not for {sci2.his} kindness, you'd be sharing a similar fate. But, luckily, we can extract more value out of you still.[/say]")

		saynn("[say=sci2]In a few minutes, the guards will deliver a syringe into the cell. Your job.. you know what your job is.[/say]")

		addButton("Continue", "See what happens next", "syr")
	if(state == "syr"):
		saynn("Just as they said, after some time, the door to your cell opens and a few armed guards enter it, one of them carrying a protected case.")

		saynn("They place the case on the floor and open with a satisfying hiss that also releases some kind of cold fumes at the same time.")

		saynn("Inside.. some kind of injector.")

		saynn("[say=pc]Why are you telling me to do this?[/say]")

		saynn("[say=sci1]Because I want YOU to do this.[/say]")

		saynn("The guards leave, the door closes behind them.")

		saynn("[say=pc]What if I won't do it?[/say]")

		saynn("[say=sci2]If you refuse to do so, we will just have to terminate the speci-..[/say]")

		saynn("[say=sci1]You will do it. If not, I will order to fill the cell full of the same gas as what's inside that syringe.[/say]")

		saynn("[say=sci2]That is.. quite unnecessary.[/say]")

		saynn("[say=sci1]Shut your mouth. It is necessary. And you.[/say]")

		saynn("[say=sci1]You have time.. until we finish our coffee break. Apparently I also have to have a short talk with my assistant.[/say]")

		addButton("Continue", "See what happens next", "grabsSyr")
	if(state == "grabsSyr"):
		saynn("You approach the opened case and grab the syringe.")

		addButton("Do it now", "Inject it into the tentacles and be done with it", "doItNow")
		addButton("Postpone it", "Maybe there is something else you can do..", "postpone")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doSleep"):
		GM.main.startNewDay()
		_tentacles.doNewDay()

	setState(_action)

func saveData():
	var data = .saveData()

	data["biggestStat"] = biggestStat

	return data

func loadData(data):
	.loadData(data)

	biggestStat = SAVE.loadVar(data, "biggestStat", -1)
