extends SceneBase

func _init():
	sceneID = "PSTentaclesTableAlone"

func _reactInit():
	#addCharacter(GM.main.PS.getTentaclesCharID())
	processTime(60*10)
	pass

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
		playAnimation(StageScene.Solo, "stand")
		saynn("You're standing near a table. There is generally not that much stuff that you can do here..")

		if (_tentacles.isNormal() || _tentacles.isSmalll()):
			saynn("But you can do some yoga perhaps.. And if you get the tentacles' attention.. they might get interested too.")

			if (_tentacles.getPrefer() != _tentacles.EVENT_PLAY):
				addButton("Yoga", "Do some yoga exercises and try to get the tentacles' attention", "do_yoga")
			else:
				addDisabledButton("Yoga", "They tentacles are already preferring to be active..")
		else:
			saynn("But you can do some yoga perhaps. Why would you do that?..")

			saynn("Now that you think about it.. yeah.. there is not much reason currently. You can give the security camera something to look at.. but that's about it.")

			addButton("Yoga", "Do some yoga exercises", "do_yoga")
		addButton("Leave", "You changed your mind", "endthescene")
	if(state == "do_yoga"):
		if (_tentacles.isNormal() || _tentacles.isSmalll()):
			addCharacter(GM.main.PS.getTentaclesCharID())
		saynn("Nobody said it.. but you might as well do some yoga.")

		var randomPose = RNG.pick(["cobra", "catcow", "dog", "bridge"])
		playAnimation(StageScene.Yoga, randomPose)
		if (randomPose == "cobra"):
			saynn("You find a good clean spot and lower yourself onto your stomach, legs straight behind you, palms near your chest. You press into the floor and begin to lift your chest.")

			saynn("Your back arches. Your shoulders roll back. Your head tilts up toward the ceiling.")

			saynn("As much as you can, you hold this pose.. good.. You stop when your muscles begin to feel like they burn a bit.")

		elif (randomPose == "catcow"):
			saynn("You find a good clean spot and kneel before planting your hands firmly on the floor, getting on all fours. Back is straight, head is neutral. You do a slow breath in..")

			saynn("Then you arch your back, lowering your belly while lifting your chin and chest.")

			saynn("Another breath. Then you do the opposite, rounding your spine upward like a stretching cat, tucking your chin toward your chest.")

			saynn("You move slowly between these two poses.. making sure to breathe a lot. You stop when your muscles begin to feel like they burn a bit.")

		elif (randomPose == "dog"):
			saynn("You find a good clean spot and stand straight. From that state, you fold forward, letting your palms meet the cold floor. Then you slowly slide your hands forward and lift your hips while pressing your {pc.feet} as flat as you can with the floor.")

			saynn("Your body forms.. a triangle of sorts. Your arms are straight, your back is long, head hanging a bit loose.")

			saynn("As much as you can, you hold this pose.. And stop when your muscles begin to feel like they burn a bit.")

		else:
			saynn("You find a good clean spot and kneel.. before planting your {pc.feet} flat on the floor, close to your body. Your arms rest at your sides, palms down. Slowly, you lift your hips toward the ceiling.")

			saynn("Your body forms a smooch arc, starting from your shoulders and going down to your knees. Your chest rises, your thigh muscles tense up. You do slow motions with your hips, stretching further..")

			saynn("As much as you can, you hold this pose.. And stop when your muscles begin to feel like they burn a bit.")

		if (_tentacles.isNormal() || _tentacles.isSmalll()):
			saynn("You hear some soft rustling behind you..")

			saynn("The tentacles have stopped not that far away from you, their tips are lifted, angled toward you. They were watching you stretch.")

			saynn("Looks like you got them a bit curious.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_yoga"):
		processTime(15*60)
		GM.pc.addStamina(-20)
		GM.pc.addEffect(StatusEffect.Yoga)
		if(_tentacles.isNormal() || _tentacles.isSmalll()):
			_tentacles.setPrefer(_tentacles.EVENT_PLAY)

	setState(_action)
