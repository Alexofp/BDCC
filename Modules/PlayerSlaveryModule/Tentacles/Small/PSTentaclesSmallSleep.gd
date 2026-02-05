extends SceneBase

var biggestStat = -1

func _init():
	sceneID = "PSTentaclesSmallSleep"

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
		if (biggestStat == _tentacles.STAT_ANGER):
			saynn("You climb into your bed and prepare to sleep.")

			saynn("You give the tentacles a short glimpse and notice that they've started doing a strange thing.. Only some of the tendrils are actually resting curled-up in the nest.. the rest are still up and watching around.")

			saynn("After some time, some of them go limp.. and some wake up instead. It's like.. they are rotating.")

			saynn("Understandable, really. You wouldn't trust anyone in this bio-lab either.")

		elif (biggestStat == _tentacles.STAT_AGILITY):
			saynn("You climb into your bed.. and start preparing for sleep.")

			saynn("When you glance over at the tentacles, you can see them lie completely still, probably already sleeping. They clearly don't have any energy left.")

			saynn("[say=pc]Long day, huh, {psTentacles}?[/say]")

			saynn("A single, thick tendril lifts an inch off the nest in a weak, acknowledging twitch before flopping back down. The rest don't react at all.")

			saynn("You hum softly, settling under your blanket. The only sound from them is a faint, wet rustle as they shift slightly, seeking the most comfortable position in their pile.")

			saynn("[say=pc]Get some rest. You've earned it.[/say]")

		elif (biggestStat == _tentacles.STAT_MIND):
			saynn("You climb into your bed.. and start preparing for sleep.")

			saynn("But no matter how hard you try, you can't seem to actually fall asleep. You just have this unexplainable feeling of.. anxiety.. on your mind.")

			saynn("You look at the tentacles.. and realize that you two are sharing that feeling.")

			saynn("[say=pc]Things will be alright, {psTentacles}. We will find a way out of here.[/say]")

			saynn("They stay still, thinking about your words. The anxiety lessens.. but now a slight confusion replaces it.. There is also a creeping feeling of distrust gaining power. Where did that come from?")

			saynn("[say=pc]You don't trust me?[/say]")

			saynn("The tentacles shake side to side a bit.. and then direct their tips towards the camera.")

			saynn("[say=pc]Oh. Right.[/say]")

			saynn("That's probably where the anxiety comes from.")

			saynn("[say=pc]We will do what they want us to do for as long as possible.[/say]")

			saynn("The confusion is getting stronger again.")

			saynn("[say=pc]They're gonna make a mistake. And we're gonna exploit that.[/say]")

			saynn("Your confidence begins to overpower the confusion and anxiety. Finally, you feel calm again.")

			_tentacles.talk("Thank you, we feel better.")
		else:
			saynn("You climb into your bed.. and start preparing for sleep. The tentacles are watching you do so.. they're really starring. They're trying to be sneaky about it.. but you can feel their attention.")

			saynn("When they notice your stare, the tendrils pretend that they're not doing anything, just swaying aimlessly. Kinda cute.")

			saynn("[say=pc]You're too big to sleep in my bed, {psTentacles}.[/say]")

			saynn("When they hear that, they all collectively droop. Aw.. Some tentacles still have hope, watching you subtly.")

			saynn("[say=pc]You're just gonna crush me.[/say]")

			saynn("And now even they have lost any and all hope. They might not understand you exactly.. but they can feel it in your tone.")

			saynn("You hum while tentacles prepare for their own sleep, curling around each other, making a rustling noise.")

			saynn("Time passes but they're still doing it. They're sure taking a while to settle.. You let out a sigh.")

			saynn("[say=pc]Fine-e, come here. Just don't kill me.[/say]")

			saynn("The tentacles instantly spring up all at once. They gently pull their nest closer until it bumps against the side of your bed. Their bases remain nestled where they were.. but the tendrils themselves flop onto the bed!")

			saynn("Thicker ones carefully slide under the mattress, lifting it a bit. The slender, warm ones wrap around your legs, curl around your waist and get under your pillow.")

			saynn("They finish by pulling the blanket up over both you and themselves..")

			saynn("Despite there now being way less empty space.. it's still quite comfy.")

			saynn("[say=pc]Good night.[/say]")

			saynn("You smooch one of the tentacles.")

		saynn("Time to sleep.")

		addButton("Sleep", "Time to sleep", "doSleep")
	if(state == "doSleep"):
		if (biggestStat == _tentacles.STAT_ANGER):
			playAnimation(StageScene.Solo, "stand")
			saynn("A new day arrives..")

			saynn("As you get up and look at the tentacles.. You realize that they have gotten bigger! They barely fit in their nest now.. there is no way they'd grow further.")

			saynn("They seem to be just as mean as before.")

		elif (biggestStat == _tentacles.STAT_AGILITY):
			playAnimation(StageScene.Solo, "stand")
			saynn("A new day arrives..")

			saynn("As you get up and look at the tentacles.. You realize that they have gotten bigger! They barely fit in their nest now.. there is no way they'd grow further.")

			saynn("But they can probably get stronger and more agile yet.. all that mass is useless without muscles to lift it.")

		elif (biggestStat == _tentacles.STAT_MIND):
			playAnimation(StageScene.Solo, "stand")
			saynn("A new day arrives..")

			saynn("As you get up and look at the tentacles.. You realize that they have gotten bigger! They barely fit in their nest now.. there is no way they'd grow further.")

			saynn("You feel a stronger connection with them too..")

		else:
			saynn("A new day arrives..")

			saynn("Your whole body feels sore for some reason.")

			saynn("You open your eyes.. and realize that the tentacles have gotten bigger! They've been resting on you the whole night.")

			saynn("[say=pc]Ouch.. ow..[/say]")

			saynn("As the monster wakes up, it of course takes its heavy tendrils off of you. Instead, it rubs your sore limbs.")

			saynn("[say=pc]..thanks.[/say]")

			saynn("The tentacles barely fit in their nest now.. there is no way they'd grow further.")

			saynn("They can probably grow more lusty though..")

		saynn("Well.. It's a new day.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doSleep"):
		GM.main.startNewDay()
		_tentacles.clearEvent()
		_tentacles.setStage(_tentacles.STAGE_NORMAL)

	setState(_action)

func saveData():
	var data = .saveData()

	data["biggestStat"] = biggestStat

	return data

func loadData(data):
	.loadData(data)

	biggestStat = SAVE.loadVar(data, "biggestStat", -1)
