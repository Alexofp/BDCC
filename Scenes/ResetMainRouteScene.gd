extends SceneBase

func _init():
	sceneID = "ResetMainRouteScene"

func _run():
	if(state == ""):
		saynn("Do you wanna reset the main route? You will be able to try another main route if you do so. But you [b]can't undo[/b] this action!")
		
		if(!GM.main.MRH.history.empty()):
			sayn("History of your endings:")
			for theEnding in GM.main.MRH.history:
				sayn("Day "+str(theEnding.day)+": "+MainRouteEnding.getName(theEnding.ending))
		
		addButton("RESET", "Reset the main route!", "doReset")
		addButton("Abort", "You changed your mind", "endthescene")
	if(state == "doReset"):
		playAnimation(StageScene.Sleeping, "sleep")
		saynn("You close your eyes, letting the world around you dissolve into nothingness.")

		saynn("You're surrounded by pure darkness.. It's cozy here actually.")

		saynn("The old dream became a reality. That's nice. Makes you feel accomplished.")

		saynn("But the dreaming never really ends, does it?")

		addButton("Dream away", "See what the new day will bring to you..", "do_sleep")
	if(state == "do_sleep"):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("You come back to your senses to the sound of inmate chatter.. and footsteps on the concrete floor. The bed beneath you is hard, the pillow thin.. the usual.")

		saynn("Through the barred window of your cell, you see a familiar silhouette. Risha. She knocks on the glass and then switches on the intercom.")

		saynn("[say=risha]Up, inmate. I won't ask twice.[/say]")

		saynn("You obey, getting off the bed. The lynx guard enters your cell, her red eyes scanning you and your immediate surroundings.")

		saynn("[say=risha]Lazy time is over, inmate. I want you to go down to the mineshafts level and do some actual work.[/say]")

		saynn("She pauses and tilts her head. Her ears twitch, her expression changes as she says that.")

		saynn("[say=risha]I have this.. strange feeling.. for some reason. Weird.[/say]")

		saynn("She stares at you for a long moment, her brows furrowed.")

		saynn("[say=pc]Deja vu?[/say]")

		saynn("[say=risha]The ja what? Use words, you stupid slut.[/say]")

		saynn("Risha stares at her hands.. and at her current surroundings. Then she shakes it off.")

		saynn("[say=risha]Whatever. Go hit those rocks.[/say]")

		addButton("Fine", "Tell her you will do it", "wake_fine")
		addButton("Fuck off", "Tell her you're not happy", "wake_fuck_off")
	if(state == "wake_fine"):
		saynn("[say=pc]You're the boss.[/say]")

		saynn("Risha smirks and gives you a cold pat on the head.")

		saynn("[say=risha]Stay obedient and maybe you will even enjoy it here.[/say]")

		saynn("She leans down, bringing her face level with yours.")

		saynn("[say=risha]As my fucktoy~.[/say]")

		saynn("She suddenly gives your butt a good spank, forcing a gasp out of you.")

		saynn("[say=pc]I missed you too.[/say]")

		saynn("[say=risha]What? Such a slut.[/say]")

		saynn("She exits your cell and continues on her way, leaving you alone with your thoughts.")

		addButton("Continue", "Time to head to the mineshafts", "endthescene")
	if(state == "wake_fuck_off"):
		saynn("[say=pc]Why don't you fuck off and pester someone else instead.[/say]")

		saynn("Risha reaches towards her sheathed stun baton.. her palm rests on top of it.")

		saynn("[say=risha]You want me to put a leash on you and personally drag you off to the mines myself? I can also just put you into stocks and let every inmate have a turn at using you, sex toys are very popular here, you lazy slut.[/say]")

		saynn("[say=pc]I know. I'm glad you're still the same, Risha.[/say]")

		saynn("[say=risha]What? Such a slut.[/say]")

		saynn("She exits your cell and continues on her way, leaving you alone with your thoughts.")

		addButton("Continue", "Time to head to the mineshafts", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doReset"):
		GM.main.MRH.resetMainRoute()

	if(_action == "do_sleep"):
		GM.main.startNewDay()

	if(_action == "wake_fine"):
		addMessage("New task added!")
	if(_action == "wake_fuck_off"):
		addMessage("New task added!")

	setState(_action)
