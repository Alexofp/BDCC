extends SceneBase

var biggestStat = -1

func _init():
	sceneID = "PSTentaclesFirstSex"

func _reactInit():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	addCharacter(GM.main.PS.getTentaclesCharID())
	_tentacles.didFirstSexEvent = true

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
		playAnimation(StageScene.TentaclesStroke, "tease", {plant=true})
		#playAnimation(StageScene.TentaclesGrope, "tease", {plant=true})
		biggestStat = _tentacles.getBiggestStat()
		if (biggestStat == _tentacles.STAT_ANGER):
			playAnimation(StageScene.TentaclesChoke, "sextease", {plant=true})
			saynn("The tentacles are slithering past you.. No.. They are slithering towards you.")

			saynn("You barely have time to react before a thick tendril grabs you and slams you against one of the walls, knocking the air from your lungs! It sure has little care for you.")

			saynn("[say=pc]Agh..[/say]")

			saynn("Another tendril wraps firmly around your throat.. misplacing your collar a bit while putting pressure, stealing your breathing.")

			saynn("[say=pc]Khh..[/say]")

			saynn("Your leg gets grabbed and forced high, exposing more of you.")

			saynn("Being so close to the tentacles.. you notice that some of them have changed slightly. They now have fatter tips.. tips that have little cross-shaped creases.. ovipositors..")

			saynn("The tentacles are clearly horny and wanna fuck you..")

		elif (biggestStat == _tentacles.STAT_AGILITY):
			playAnimation(StageScene.TentaclesCuddle, "breaststease", {plant=true})
			saynn("The tentacles suddenly dash towards you!")

			saynn("They sweep you off of your feet and catch you, holding you suspended effortlessly above the floor. One of the tentacles curls between your legs and rubs against the crotch of your leotard while another traces hot lines across your belly and then teases your nips through the cloth.")

			saynn("[say=pc]What are you trying to do..[/say]")

			saynn("Being so close to the tentacles.. you notice that some of them have changed slightly. They now have fatter tips.. tips that have little cross-shaped creases.. ovipositors..")

			saynn("The tentacles are clearly horny and wanna fuck you..")

		elif (biggestStat == _tentacles.STAT_MIND):
			playAnimation(StageScene.TentaclesStroke, "tease", {plant=true})
			saynn("The tentacles get your attention and then slowly approach you. One of them brings itself close to your face.")

			saynn("[say=pc]Huh?[/say]")

			saynn("You meet their gaze.. and suddenly.. the world at the edge of your vision starts going soft.. fading subtly. A warm, throbbing thought fills your mind..")

			_tentacles.talk("Obey.")
			saynn("To obey..")

			saynn("That thought isn't yours.. but it sure feels right at home. Your body really wants to relax against your will.. really wants to submit.")

			saynn("Being so close to the tentacles.. you notice that some of them have changed slightly. They now have fatter tips.. tips that have little cross-shaped creases.. ovipositors..")

			saynn("The tentacles are clearly horny and wanna fuck you..")

		else:
			playAnimation(StageScene.TentaclesGrope, "tease", {plant=true})
			saynn("The tentacles slither towards you.. and suddenly.. they're all around you. They slide over your hips, your {pc.breasts}, your inner thighs. One teases at your lips while another circles your waist and gropes your butt..")

			saynn("[say=pc]So.. bold..[/say]")

			saynn("They grope and caress you, never staying still, searching for all of your sensitive spots and rubbing them, pulling soft moans out of you. One tendril curls firmly between your legs and grinds against the crotch part of your leotard.")

			saynn("Being so close to the tentacles.. you notice that some of them have changed slightly. They now have fatter tips.. tips that have little cross-shaped creases.. ovipositors..")

			saynn("The tentacles are clearly horny and wanna fuck you..")

		addButton("Allow!", "(Sex) Let the tentacles fuck you..", "start_sex")
		addButton("Wiggle free", "Try to just wiggle free", "do_wiggle_free")
		addButton("Slap them off!", "Get the tentacles off by attacking them", "do_slap_them")
	if(state == "8_after"):
		saynn("You had fun with the tentacles..")

		saynn("They've certainly only gotten more lusty after this.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "8_afterEgged"):
		playAnimation(StageScene.TFLook, "start")
		saynn("You had fun with the tentacles..")

		saynn("And now, when you look down, you can't help but to notice your belly being quite round.")

		saynn("It looks like you got stuffed with eggs! You can feel them shifting inside you slightly as you move..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_wiggle_free"):
		_tentacles.doAnim("idle")
		if (biggestStat == _tentacles.STAT_ANGER):
			saynn("You're not gonna submit to them like that! You use your whole body, squirming and flailing, trying to wiggle free.")

			saynn("Eventually, you manage to pry the tentacle away from your neck and then free yourself.")

			saynn("It was quite a workout.. For you and them both.")

		elif (biggestStat == _tentacles.STAT_AGILITY):
			saynn("You're not gonna submit to them! You use your whole body, squirming and flailing, trying to wiggle free.")

			saynn("Eventually, you manage to escape their strong grasp.")

			saynn("It was quite a workout.. For you and them both.")

		elif (biggestStat == _tentacles.STAT_MIND):
			saynn("You channel your whole mind.. the parts that you still control.. to fight the order. No. You don't wanna submit to them.")

			saynn("And eventually, you manage to escape their control and regain yours.")

			saynn("Drops of cold sweat appear on your body. It was quite a workout.. For you and them both.")

		else:
			saynn("You don't feel like submitting to them.. Gently, you wiggle free and step away from the horny tentacles. They keep trying to pull you in so you use more and more strength.")

			saynn("Eventually, you manage to escape their needy grasp.")

			saynn("It was quite a workout.. For you and them both.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_slap_them"):
		_tentacles.doAnim("glare", {npcAction="shove"})
		if (biggestStat == _tentacles.STAT_ANGER):
			saynn("How fucking dare it do this to you. You slap the tentacle that holds you.. and then dig your claws into it until the thing finally lets go of your throat, letting you touch the floor.")

			saynn("You wrestle each of the rebellious tentacles into submission and give more slaps to the ones that were responsible for all of this.")

			saynn("When do that.. and then raise your fist.. the tentacles back off.")

			saynn("They just glare at you.. clearly very unhappy. Serves them right.")

		elif (biggestStat == _tentacles.STAT_AGILITY):
			saynn("You really don't wanna submit to them.. So you slap all of the eager tentacles away until they let you down to the floor.")

			saynn("They're strong.. very strong.. but it looks like they still feel pain. So you use that against them and strike them until they fuck off.")

			saynn("The tentacles glare at you.. clearly very unhappy. Serves them right.")

		elif (biggestStat == _tentacles.STAT_MIND):
			saynn("You channel your whole mind.. the parts that you still control.. to fight the order. No. You don't wanna submit to them.")

			saynn("It proves to be too hard to resist.. But you manage to make your body slap away the main tentacle, breaking the connection for enough time to step away.")

			_tentacles.talk("We did not enjoy that.")
			saynn("The tentacles glare at you.. clearly very unhappy. Serves them right.")

		else:
			saynn("You really don't feel like submitting to them. You try to break free.. but the tentacles keep groping and fondling you, pulling you back in.")

			saynn("It's only when you give a slap to each of the horny tentacles, is when they finally pull away from you and your body.")

			saynn("The tentacles glare at you.. clearly very unhappy. Serves them right.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_sex"):
		_tentacles.prepareForSex()
		runScene("GenericSexScene", [_tentacles.getTentaclesCharID(), "pc", SexType.TentaclesSex, {}], "tentaclesSex")
		return

	if(_action == "do_wiggle_free"):
		_tentacles.train(_tentacles.STAT_AGILITY)

	if(_action == "do_slap_them"):
		_tentacles.trainUntilFive(_tentacles.STAT_ANGER)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "tentaclesSex"):
		var _tentacles:PlayerSlaveryTentacles = GM.main.PS
		_tentacles.trainUntilFive(_tentacles.STAT_LUST)
		_tentacles.didFirstSexEvent = true
		if(!_tentacles.noticedEgged && GM.pc.isEggStuffedBy(_tentacles.getTentaclesCharID())):
			setState("8_afterEgged")
			_tentacles.noticedEgged = true
		else:
			setState("8_after")

func saveData():
	var data = .saveData()

	data["biggestStat"] = biggestStat

	return data

func loadData(data):
	.loadData(data)

	biggestStat = SAVE.loadVar(data, "biggestStat", -1)
