extends SceneBase

var biggestStat = -1

func _init():
	sceneID = "PSTentaclesSmallEndOfDay"

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
		GM.pc.setLocation(_tentacles.getMonsterLoc())
		aimCameraAndSetLocName(_tentacles.getMonsterLoc())
		
		biggestStat = _tentacles.getBiggestStat()
		if (biggestStat == _tentacles.STAT_ANGER):
			saynn("It's getting late.. The tentacle monster is looking quite tired too.. even if it doesn't show it.")

		elif (biggestStat == _tentacles.STAT_AGILITY):
			saynn("It's getting late.. The tentacle monster got quite a workout today so it's looking pretty tired as well.")

		elif (biggestStat == _tentacles.STAT_MIND):
			saynn("It's getting late.. And the tentacle monster is as tired as you are.. you're pretty sure.")

		else:
			saynn("It's getting late.. The tentacle monster is looking quite tired too, it's not even swaying as much.")

		addButton("Rest", "Time to rest!", "before_rest")
	if(state == "before_rest"):
		playAnimation(StageScene.TentaclesDuo, "idle", {plant=true,tentaclesSizeSmall=true})
		
		saynn("Before resting, you gotta get the tentacles back into their spot.")

		saynn("[say=pc]Why don't you go back to your nest.. uh..[/say]")

		saynn("You realize that you have never given it a name. Calling it a monster feels a bit strange, especially now.")

		saynn("[say=pc]How should I call you.. hm..[/say]")

		_tentacles.addMonsterNameButtons(self)
		if (false):
			addButton("PICKNAME", "YOU SHOULDNT SEE THIS", "pickName")
	if(state == "pickName"):
		removeCharacter(_tentacles.getTentaclesCharID())
		addCharacter(_tentacles.getTentaclesCharID())
		playAnimation(StageScene.TentaclesDuo, "sleep", {plant=true,tentaclesSizeSmall=true})
		aimCameraAndSetLocName(_tentacles.LOC_MIDDLE)
		GM.pc.setLocation(_tentacles.LOC_MIDDLE)
		saynn("[say=pc]How about.. {psTentacles}?[/say]")

		if (biggestStat == _tentacles.STAT_ANGER):
			saynn("The tentacles twitch and direct their pointy tips towards you in an instant. It looks like a forest of daggers is watching you.")

			saynn("It certainly got their attention.. sounds like a good name then.")

		elif (biggestStat == _tentacles.STAT_AGILITY):
			saynn("The tentacles sway and bounce eagerly when you say that. It looks like the name that you picked has gotten them quite excited.")

			saynn("Must be a good name then.")

		elif (biggestStat == _tentacles.STAT_MIND):
			saynn("The tentacles don't show any emotion.. but somehow you just know that they like the name. It's like you have some kind of connection.")

			_tentacles.talk("We approve that name.")
			saynn("Well.. must be a good name then.")

		else:
			saynn("The tentacles reach out and rub against you when they hear that name. It looks like they like it.")

			saynn("Must be a good name then.")

		saynn("You invite {psTentacles} to go back to the nest.. and so it does.")

		saynn("But before you go to bed.. you hear knocking on the glass. Right.")

		addButton("Window", "Go approach it", "window")
	if(state == "window"):
		removeCharacter(_tentacles.getTentaclesCharID())
		addCharacter(_tentacles.getScientist1CharID())
		addCharacter(_tentacles.getScientist2CharID())
		playAnimation(StageScene.Duo, "stand", {pc=_tentacles.getScientist1CharID(), npc=_tentacles.getScientist2CharID()})
		aimCameraAndSetLocName(_tentacles.LOC_IMPORTANT)
		GM.pc.setLocation(_tentacles.LOC_IMPORTANT)
		saynn("You approach the reinforced window. On the other side you see two familiar scientists standing under the sterile corridor lights.")

		saynn("[say=sci1]You're still alive. Color me surprised.[/say]")

		saynn("[say=sci2]Indeed.. the test subject still possesses most of {pc.his} limbs.[/say]")

		saynn("You cross your arms, the tone that they're using is quite.. dismissive.")

		saynn("[say=pc]All of them. I have all of them.[/say]")

		saynn("[say=sci2]Well, actually, no one asked you.[/say]")

		saynn("[say=pc]Well, actually, when are you letting me go already?[/say]")

		saynn("The second scientist furrows {sci2.his} brows.")

		saynn("[say=sci1]Go? You're just gonna leave that poor alien thing alone to die? So cruel.[/say]")

		saynn("The first scientist clicks {sci1.his} tongue in mock disapproval. The second one peers closer, fogging the glass with {sci2.his} breath.. before wiping it with {sci2.his} sleeve.")

		saynn("[say=sci1]I thought that we had only put one monster into that cell.[/say]")

		saynn("[say=sci2]Actually.. We did only put a single..[/say]")

		saynn("[say=sci1]Shush, you.[/say]")

		saynn("The second scientist pouts.")

		saynn("[say=pc]So?[/say]")

		saynn("A smirk gets directed towards you.")

		saynn("[say=sci1]We have some results. Nothing that we would like to share with someone like you.[/say]")

		saynn("[say=sci2]A weak-minded person wouldn't understand anyway.[/say]")

		saynn("[say=sci1]A day or two and this research will probably be over.[/say]")

		saynn("{sci1.He} says it so casually.. and then turns to exchange a look with {sci1.his} colleague.")

		saynn("[say=pc]Over?[/say]")

		saynn("[say=sci1]Yes, over.[/say]")

		saynn("You don't like the sound of that.")

		saynn("[say=sci2]Over means that the research..[/say]")

		saynn("[say=pc]Didn't ask.[/say]")

		saynn("[say=sci2]Well, actually, you did..[/say]")

		saynn("[say=pc]Shush.[/say]")

		saynn("[say=sci2]Hmpf..[/say]")

		saynn("{sci2.He} pouts even harder.")

		saynn("[say=pc]You're gonna kill us, aren't you?[/say]")

		saynn("[say=sci1]You wanna give us a reason to? No, we are not violent people. I personally see no reason in disposing of such an.. adaptable.. test subject.[/say]")

		saynn("Being stuck here.. a test subject for such people.. The prison starts to look a lot more appealing.")

		saynn("[say=pc]What about the tentacles.[/say]")

		saynn("[say=sci1]They don't seem to possess any danger. If we develop a strong-enough glass pod, this alien might just become our new office plant.[/say]")

		saynn("[say=sci2]Unless our research yields a better use for this specimen.[/say]")

		saynn("[say=sci1]That's the plan, yes.[/say]")

		saynn("Office plant.. not the worst fate.. but not the best either.")

		saynn("With a final, dismissive look at both you and the monster behind you, they turn and walk away, their murmured conversation fading.")

		if (biggestStat == _tentacles.STAT_MIND):
			saynn("The tentacles curl back into a ball as you turn around.")

		saynn("With that, it's time to go to bed.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "pickName"):
		_tentacles.setMonsterName(_args[0])
		_tentacles.setStage(_tentacles.STAGE_SMALL_ENDDAY)
		_tentacles.setMonsterLoc(_tentacles.LOC_MIDDLE)

	setState(_action)

func saveData():
	var data = .saveData()

	data["biggestStat"] = biggestStat

	return data

func loadData(data):
	.loadData(data)

	biggestStat = SAVE.loadVar(data, "biggestStat", -1)
