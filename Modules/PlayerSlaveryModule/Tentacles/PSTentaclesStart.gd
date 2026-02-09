extends SceneBase

func _init():
	sceneID = "PSTentaclesStart"

func _reactInit():
	#addCharacter(GM.main.PS.getTentaclesCharID())
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
		saynn("Next moments are a blur of harsh lights and loud voices. You get brought onto some kind of spaceship.. A few armed people meet you there.")

		saynn("Next moment you know it, your hands are cuffed and a gas mask is forced onto your face. You gasp against it, your breathing immediately loud and panicked in your own ears.. you also notice subtle fumes of some green gas are slipping past your nostrils.")

		saynn("You get drowsy fast. You see with the corner of your eyes that one of the filters on the mask is replaced with some kind of canister.")

		saynn("As much as you'd like to avoid breathing in sketchy stuff.. you can't avoid breathing at all. You hold your breath until your lungs burn.. but then you suck in a desperate gasp.")

		saynn("The harsh lights around you start turning into soft, glowing orbs. The sounds of boots on metal are fading into a distant, echoing hum. The last thing you feel is someone's grip on your shoulders as you start losing the fight against gravity..")

		addButton("Continue", "See where your fate takes you next", "wakeup")
		_tentacles.addSkipActions(self) #TODO: REMOVE BEFORE SHIP
		if (false):
			addButton("Meow", "You shouldn't see this", "skipStage")
	if(state == "wakeup"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="pc"})
		aimCameraAndSetLocName("pstent_bed")
		GM.pc.setLocation("pstent_bed")
		saynn("Your head hurts a little. A slow, throbbing ache is sitting behind your eyes.")

		saynn("At least you're not dead.. but you really don't wanna open your eyes.. It sure looks like you have to.")

		saynn("Ow.. it was a bad choice. The bright flash of a white, sterile ceiling makes you wince.")

		saynn("You seem to be lying on a firm, narrow bed with a thin mattress.. but at least it has a mattress. Slowly, you sit up.. the whole world tilting for a moment before settling.")

		saynn("You seem to be wearing some kind of leotard. A fancy one at that. Maybe things aren't as bad as they seem.")

		saynn("There is no immediate danger around you. In fact.. you seem to be alone here.")

		addButton("Get up", "Get up and look around", "lookaround")
	if(state == "lookaround"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You swing your legs over the side of the bed, your bare {pc.feet} meeting cool floor tiles. You stand.. still feeling a little unsteady.. and look around.")

		saynn("This room.. you can spot a prisoner cell from a mile away. But this one seems much cleaner and bigger than your usual cell. The walls are all white.. just like the ceiling.. just like the floor.")

		saynn("Near you, there seems to be a fridge. That's a piece of machinery that you haven't seen in a while. Are they actually planning to feed you? Whoever they are..")

		saynn("There is a small table with a chair on the opposite side of the room too. Even though it's small.. It still helps with the overall mood.")

		saynn("You look around a bit and notice that this room has a shower too. It's a basic one.. but it's better than nothing.")

		saynn("There are some reinforced windows.. most of them lead into some kind of corridor. But there is also a window that gives you a great view of.. a great void. Yeah, you're still in space clearly.")

		saynn("As you take a step.. you notice something moving at the edge of your vision with a faint, almost imperceptible whirr. A security camera is tracking you. Great. At least you have some kind of company.")

		saynn("Still.. What the heck is happening here?")

		addButton("Continue", "See what happens next", "start_main")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "wakeup"):
		processTime(60*57)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("Leotard"))

	if(_action == "skipStage"):
		_tentacles.doSkipAction(_args[0])
		endScene()
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("Leotard"))
		runScene("PSTentaclesWalker")
		return

	if(_action == "start_main"):
		endScene()
		runScene("PSTentaclesWalker")
		return

	setState(_action)
