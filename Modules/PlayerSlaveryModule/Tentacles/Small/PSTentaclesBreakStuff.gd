extends SceneBase

var eventKind = ""
var anger = 0
var didEncourage = false

func _init():
	sceneID = "PSTentaclesBreakStuff"

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
		if (GM.pc.getLocation() == "pstent_fridge"):
			eventKind = "fridge"
		elif (GM.pc.getLocation() == "pstent_play"):
			eventKind = "table"
		elif (GM.pc.getLocation() == "pstent_left"):
			eventKind = "door"
		elif (GM.pc.getLocation() == "pstent_important"):
			eventKind = "window"
		_tentacles.doAnim("whip")
		anger = _tentacles.anger
		if (eventKind == "fridge"):
			if (anger <= 2):
				saynn("The tentacles approach the fridge. They stare at it for a bit.. before suddenly smacking it! The hit doesn't really leave any damage, the involved tentacle just bounces off.")

				saynn("After some time, they try to slap the fridge again.")

			elif (anger <= 4):
				saynn("The tentacles approach the fridge. They tug on the handle a bit.. and get angry after failing to open the door. And so the tendrils start smacking the thing!")

			elif (anger <= 6):
				saynn("The tentacles approach the fridge and don't hesitate, already striking it! The heavy object doesn't budge much.. but it does receive new dents. Somehow, it is still humming.")

				saynn("Clearly, the tendrils wanna let their anger out on it.")

			elif (anger <= 8):
				saynn("The tentacles approach the fridge and start letting their anger out on it. They furiously smash the heavy thing, making the metal groan from the many dents.")

			else:
				saynn("The tentacles dart toward the fridge like furious snakes and begin to strike it. Within seconds, they're already battering it from every angle, the sounds echoing off the walls. The fridge rocks on its base..")

		addButton("Watch", "Just watch them do it", "doWatch")
		addButton("Stop", "Stop them from doing this", "doStop")
		addButton("Encourage", "Tell them that they're doing a good job!", "doEncourage")
	if(state == "doWatch"):
		if (didEncourage):
			saynn("You decide to encourage the tentacles. Getting them as mad as they can be is what you want.")

			saynn("[say=pc]Yeah, fuck it up. Let it all out.[/say]")

		else:
			saynn("You decide to just watch and not interfere.")

		if (eventKind == "fridge"):
			if (anger <= 2):
				saynn("The tentacles give the fridge a few more hits. But they don't do much damage.. Still, it got them angrier.")

			elif (anger <= 4):
				saynn("The tentacles surround the fridge, their tips vibrating from anger. One of them strikes.. thump.. Then another.. thump.. They're not exactly coordinated about it.. but they're trying. Each hit leaves a small dent.")

				saynn("They keep at it for some time before getting tired and giving up. Still, they got a great outlet for their anger.")

			elif (anger <= 6):
				saynn("A tentacle winds up and then delivers a solid crack against the fridge door. A visible dent appears. The tentacle seems surprised.. and then pleased. The others join in, their hits growing stronger.")

				saynn("By the end of it.. the fridge got quite a few extra dents on it. But it still seems to be working.")

			elif (anger <= 8):
				saynn("The tentacles slam the fridge.. again and again.. With force that's enough to make it move. One of the hits slam the fridge's door open.. another one soon hits the freezer from the inside.")

				saynn("After they're done, you come in and fix the damage.. closing the door and putting all the food back into it. Luckily, they didn't destroy everything..")

			else:
				saynn("The tentacles suddenly slam the fridge so hard that it gets toppled to the side, producing a loud boom in the process. The furious tendrils continue to let their rage on it, hitting the metal object again and again, leaving new dents and breaking off anything that can be broken off.. like the handles.")

				saynn("After they're done letting their anger out, they just whip it one last time and quickly slither off, smashing your bed too while they're at it.")

				saynn("You approach the fridge and get it standing again. It might not be able to cool very well anymore.. so hopefully you won't have to stay here for long.")

				if (anger >= 10):
					saynn("The tentacles have gotten extremely mean and angry by now. Hitting fridges is clearly not enough for them anymore. Maybe you will be able to direct their rage to the bio-lab itself..")

		elif (eventKind == "door"):
			pass
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "doStop"):
		if (anger <= 1):
			saynn("Before they can land another hit, you step between them and the object.")

			saynn("[say=pc]Hey. Chill. No reason to do this.[/say]")

			saynn("The tips droop immediately, looking almost ashamed. They make a sad little gesture.")

			saynn("[say=pc]This isn't the way. Let's find another outlet.[/say]")

			if (_tentacles.mind <= 4):
				saynn("They might not exactly understand you.. but they can feel your tone. The tentacles give up and slither away.")

			else:
				saynn("The tentacles seem to understand you perfectly. They accept your words and just slither away.")

				_tentacles.talk("We understand..")
		elif (anger <= 2):
			saynn("Before they can land another hit, you get in the way and prevent them.")

			saynn("[say=pc]Save your strength. Really.[/say]")

			saynn("They look at you.. and then at the object behind you..")

			saynn("[say=pc]I don't want you to be mean. So you better stop.[/say]")

			if (_tentacles.mind <= 4):
				saynn("They might not exactly understand you.. but they can feel your tone. The tentacles give up and slither away.")

			else:
				saynn("The tentacles seem to understand you perfectly. They accept your words and just slither away.")

				_tentacles.talk("We understand..")
		elif (anger <= 4):
			saynn("You grab the most aggressive tendril mid-swing.")

			saynn("[say=pc]Enough.[/say]")

			saynn("It freezes. The others pause too, just glaring at you now.")

			saynn("[say=pc]You're wasting energy. Save it for something that matters.[/say]")

			saynn("They reluctantly withdraw.. but you can just feel frustration spreading through their tendrils. It looks like they want an outlet.. any kind of outlet.")

		elif (anger <= 7):
			saynn("You have to physically insert yourself between the object and the angry tentacles.. which means.. taking a glancing blow in the process. It hurts.")

			saynn("[say=pc]STOP.[/say]")

			saynn("The tentacles freeze instantly.")

			saynn("[say=pc]This isn't who we are. Calm the fuck down.[/say]")

			saynn("The monster pulls its tentacles away.. reluctantly. They're still vibrating with barely contained rage.")

			saynn("[say=pc]Breathe. Focus. Enough of this. We will escape. But this won't help.[/say]")

			saynn("It takes visible effort from them.. but their anger slowly begins to fade. Eventually, they give up and just slither away.")

		else:
			saynn("You don't even try to physically stop them.. you'd get crushed as well. Instead, you shout at full volume..")

			saynn("[say=pc]STOP IT. NOW.[/say]")

			saynn("The tentacles freeze mid-swing, one of them an inch from their target. They turn to you, vibrating with barely contained rage.")

			saynn("You meet their furious glare. Slowly, carefully, you hold up your empty hands.")

			saynn("[say=pc]I'm not your enemy.[/say]")

			saynn("The rage makes them suddenly whip at your leg. It hurts. But you don't do anything back. You just take the hit and continue holding your hands up.")

			saynn("[say=pc]We will escape. But not like this.[/say]")

			saynn("They whip your body.. ow.. You grunt and recoil back.. but keep surrendering.")

			saynn("[say=pc]If you kill me.. then you will be screwed for sure.[/say]")

			saynn("It takes visible effort from them.. but their anger slowly begins to fade. Eventually, they give up and just slither away.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doWatch"):
		_tentacles.train(_tentacles.STAT_ANGER)

	if(_action == "doStop"):
		_tentacles.trainNothing()

	if(_action == "doEncourage"):
		didEncourage = true
		_tentacles.train(_tentacles.STAT_ANGER)
		_tentacles.setPrefer(_tentacles.EVENT_BREAK)
		setState("doWatch")
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["eventKind"] = eventKind
	data["anger"] = anger
	data["didEncourage"] = didEncourage

	return data

func loadData(data):
	.loadData(data)

	eventKind = SAVE.loadVar(data, "eventKind", "")
	anger = SAVE.loadVar(data, "anger", 0)
	didEncourage = SAVE.loadVar(data, "didEncourage", false)
