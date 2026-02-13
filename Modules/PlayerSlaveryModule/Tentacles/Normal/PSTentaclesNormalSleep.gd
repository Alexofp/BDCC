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
		saynn("A new day arrives. And you're still in the bio-lab.")

		saynn("The tentacles still seem to be sleeping..")

		saynn("You hear knocking on the glass. It's these clowns again, you almost forgot about them by now.")

		addButton("Window", "Go approach the window", "talk_sci")
	if(state == "talk_sci"):
		addCharacter(GM.main.PS.getScientist1CharID())
		addCharacter(GM.main.PS.getScientist2CharID())
		playAnimation(StageScene.Duo, "stand", {pc=GM.main.PS.getScientist1CharID(), npc=GM.main.PS.getScientist2CharID()})
		saynn("You approach the window and see the two scientists. Their bodies are outlined by the harsh, cold lights. The guy holds a steaming mug and the girl is clutching a table to her chest. They're classy as always.")

		saynn("The intercom kicks in with a sharp pop.")

		saynn("[say=sci2]Hello. How are you feeling, test subject?[/say]")

		saynn("You look around.. the tentacles still seem to be asleep.")

		saynn("[say=pc]How does it look like I'm feeling?[/say]")

		saynn("[say=sci1]Hm. Well-fed. Rested. Cozy, even. Getting along with that thing?[/say]")

		saynn("{sci1.He} takes a slow sip from {sci1.his} mug.")

		saynn("[say=pc]You bet. What do you want?[/say]")

		saynn("[say=sci1]We've come to inform you that this is your happy day.[/say]")

		saynn("{sci1.He} says that with a corporate smile on {sci1.his} face.")

		saynn("[say=sci2]We've completed the research. This specimen.. unfortunately.. hasn't proved to be valuable enough.[/say]")

		saynn("[say=pc]What do you mean?[/say]")

		saynn("[say=sci1]It's just an alien plant. Space weed. Completely useless. The database already has plenty of them, wasting space on our digital drives.[/say]")

		saynn("Another sip.")

		saynn("[say=sci2]The data shows no unique properties worth further investment. We will have to terminate this project.[/say]")

		saynn("[say=pc]Really?[/say]")

		saynn("Of course they didn't find any unique properties. They got their data way too early.")

		saynn("[say=sci1]Hah. Don't tell me you've formed a bond. Sentimentality is always just a path to fatality. Perhaps you two do have more in common than I thought.[/say]")

		saynn("Behind you, the tentacles go unnaturally still.")

		saynn("[say=sci2]Our bio-lab needs space for the next project.[/say]")

		saynn("[say=pc]What do you mean by terminating? You're just gonna kill it?[/say]")

		saynn("[say=sci1]Kill is such an ugly word. I prefer the term.. Decommissioning. Spacing it would be my preferred choice. But I don't like littering. We gotta put more care into our environment.[/say]")

		saynn("The girl flinches slightly.")

		saynn("[say=sci2]I've developed a substance that will shut down most of its neural activity. It will still grow.. but it will be completely harmless.[/say]")

		saynn("[say=sci1]It will serve us as a cute office plant.[/say]")

		saynn("They really wanna go with that plan.")

		saynn("[say=pc]What about me? Gonna keep me forever or inject me with that shit too?[/say]")

		saynn("[say=sci2]Actually, we have no reason to do so. Your collar has piqued my interest. I've run a traceback of a signal and found a bounty attached to your name. We can just hand you back to the authorities.[/say]")

		saynn("The guy finishes his coffee.. and then leans closer to the glass.")

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

		saynn("[say=sci1]You will do it. If you refuse.. well.. we can always make an aerosolized version. Isn't that right?[/say]")

		saynn("{sci1.He} throws a stern look towards {sci1.his} colleague.")

		saynn("[say=sci2]It would be possible.. but.. quite unnecessary.[/say]")

		saynn("[say=sci1]Shut your mouth. It is necessary. And you.[/say]")

		saynn("He looks at his colleague.")

		saynn("[say=sci1]You have time.. until we finish our coffee break. Apparently I also have to have a short talk with my assistant.[/say]")

		saynn("Knowing them.. you probably have a few more hours.")

		addButton("Continue", "See what happens next", "grabsSyr")
	if(state == "grabsSyr"):
		removeCharacter(GM.main.PS.getScientist1CharID())
		removeCharacter(GM.main.PS.getScientist2CharID())
		playAnimation(StageScene.Solo, "stand")
		saynn("You approach the opened case and grab the auto-injector syringe. The yellow fluid inside is glowing faintly.")

		addButton("Do it now", "Inject it into the tentacles and be done with it", "doItNow")
		addButton("Postpone it", "Maybe there is something else you can do..", "postpone")
	if(state == "postpone"):
		saynn("Nah. You don't wanna do this.")

		saynn("You put the injector away.")

		saynn("The tentacles have woken up by now.. They're just going through their normal routine.. seemingly unaware that this might be their last day of existence.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doSleep"):
		GM.main.startNewDay()
		_tentacles.doNewDay()

	if(_action == "doItNow"):
		endScene()
		runScene("PSTentaclesInjectEnding")
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["biggestStat"] = biggestStat

	return data

func loadData(data):
	.loadData(data)

	biggestStat = SAVE.loadVar(data, "biggestStat", -1)
