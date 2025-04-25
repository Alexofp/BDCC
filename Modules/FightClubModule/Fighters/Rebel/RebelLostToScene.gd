extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RebelLostToScene"

func _run():
	if(state == ""):
		addCharacter("rebel")
		playAnimation(StageScene.Duo, "kneel", {npc="rebel"})

	if(state == ""):
		saynn("You let out a gasp and fall down to your knees. Rebel turns to the audience and spreads her arms open, looking very smug.")

		saynn("[say=rebel]This bitch thought she could win against ME! Against Rebel! The strongest woman ever alive![/say]")

		saynn("The crowd cheers loudly, some begin to yell ‘Fist! Fist! Fist!’.")

		saynn("[say=rebel]Oh yeah? Am I hearing it right? The crowd wants me to shove my fist into that poor wannabe hero? I could do that![/say]")

		saynn("The audience blows up with even louder yells and cheering. Seems like she won’t ask for your opinion on the matter. It’s not like you can do anything about that, you’re busy panting and catching your breath.")

		addButton("Get fisted", "See what happens next..", "get_fisted")
		GM.ES.triggerRun("ArenaFighterPCLost", ["rebel"])

	if(state == "get_fisted"):
		playAnimation(StageScene.SexFisting, "tease", {
			pc="rebel", npc="pc",
			npcBodyState={exposedCrotch=true,hard=true}
		})
		
		saynn("The giant buff mare directs her attention to you and puts on an evil smile. You try to brace and cover yourself with your hands but she easily picks your whole body up like it’s nothing and carries you to the middle of the arena.")

		saynn("[say=rebel]No point in running away, sweetheart. It will be very enjoyable. For me at least.[/say]")

		# (if not naked)
		if(!GM.pc.isFullyNaked()):
			saynn("She easily strips you of any clothing that blocks your crotch and then puts you down onto the floor on all fours before forcing you to raise your {pc.thick} ass higher. Rebel directs her attention to the crowd again.")

		# (if naked)
		else:
			saynn("She puts you down onto the floor on all fours before forcing you to raise your {pc.thick} ass higher. Rebel directs her attention to the crowd again.")

		saynn("[say=rebel]Does this slut deserve her ass to be lubed?[/say]")

		saynn("You hear many mixed answers, some mean inmates yell ‘Go bare! Fist {pc.him} raw! Make {pc.him} suffer!’. Some instead ask for lube. Rebel looks at your cute rear and finally makes up her mind.")

		saynn("[say=rebel]Let's not break {pc.his} ass completely. Will be more fun for the other inmates to use {pc.him} later, am I right??[/say]")

		saynn("Rebel produces a tube of lube and crouches behind you. You try to voice your complaints but instead have your collar and head shoved into the floor while the other hand starts rubbing the slick cold substance into your {pc.analStretch} tailhole. Even just two of her fingers is enough to fill your butt, she lubes you thoroughly and then starts stroking your back.")

		saynn("[say=rebel]Resisting is only gonna make this worse, sweetie. Just relax and enjoy the ride.[/say]")

		saynn("Easy for her to say, she is not the one standing on all fours with her ass being on full display for anyone! She starts easy, thrusting two of her bulky digits down your star. The lube allows them to slide inside mostly without any hassle. She then spreads them, stretching your hole more and causing you to produce a loud moan. Then she adds another finger.. And another.. Four of them are inside you, stretching you out quite a bit. You start squirming and making more noises while the mare slides her palm in and out, any attempts to clench result in her using more strength and quickly overpowering you. The crowd already begs Rebel to shove the whole hand in.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Despite your pussy not receiving any attention, your sensitive folds become more aroused, already dripping some juices onto the floor, your body really seems to enjoy it..")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Your {pc.cock} is mostly lacking any erection but each time Rebel thrusts her fingers inside you feel your pleasure point being rubbed so well.. You feel like you can get used to that..")

		saynn("[say=rebel]Look at {pc.him} moaning. Time for the main event! Hope you’re ready, slut.[/say]")

		saynn("She pulls her fingers out, letting your anal ring slowly close up.")

		addButton("Continue", "See what happens next..", "continue")

	if(state == "continue"):
		playAnimation(StageScene.SexFisting, "sex", {
			pc="rebel", npc="pc",
			npcCum=true,
			npcBodyState={exposedCrotch=true,hard=true}
		})
		
		saynn("She applies more lube to her hand this time and turns it into a fist. Her actions are quick, she moves her fist to your prepared butt and starts applying pressure onto your star. The discomfort levels quickly rise, you quiver and try to struggle but she holds you pinned to the floor while trying to shove her whole hand inside you.")

		saynn("[say=pc]It won’t fit! Please![/say]")

		saynn("But she is relentless, no matter how much you clench, your tailhole slowly opens up and then gets stretched until the fist suddenly slips in! You arch your back and let out a loud passionate moan as your star closes around Rebel’s wrist. Arms and legs are shaking, she didn’t even start moving her arm but you are already moaning like a slut that’s being fucked.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("With that fist up your butt, your pussy looks cute and small in comparison. The overstimulation causes your slit to start squirting all over the floor.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your {pc.cock} instantly goes as hard as the chastity cage allows and shoots a strong line of your precum.")
		elif(GM.pc.hasPenis()):
			saynn("Your {pc.cock} instantly goes full hard and shoots a strong line of your precum.")

		saynn("[say=rebel]What did ya say, sweetie? All I hear is your ass making wet noises.[/say]")

		saynn("She starts pulling her hand out but stopping just to ram her fist further and forcing you to squirm harder. Your poor {pc.analStretch} anal ring is stretched beyond limits and now Rebel starts stretching your soft inner walls too, exploring you from the inside. With slow but powerful thrusts, she manages to shove more of her arm in before switching to fist-fucking you. The crowd goes wild seeing you moan with a giant fist up your ass, you can’t endure this for long and cum hard, your tailhole desperately clenches around the arm, sucking it in deeper.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Your pussy squirts again and again, the way her fist rubs your g-spot through the inner wall is so pleasurable, almost makes you wish she used her other hand too.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Thick strings of {pc.cum} burst out of your {pc.cock} and mess up the floor, your prostate was rubbed so much that you now experience a wet orgasm.")

		saynn("[say=rebel]Cumming already, sweetie? That’s how a real horse cock will feel.[/say]")

		saynn("She pulls her hand out, leaving your ass gaping and you a moaning mess. So much emptiness inside you suddenly. And a desire for something to fill it. She dries her hand against your {pc.masc} butt and then turns towards the public to flex her muscles again.")

		saynn("[say=rebel]That's what happens to anyone who tries to mess with Rebel! Fuck yeah![/say]")

		saynn("She bathes in her glory for a bit longer before waving to you and getting over the fence. You’re left alone in the arena with your butt ruined. Time to leave..")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	
	if(_action == "get_fisted"):
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 40)
	
	if(_action == "continue"):
		GM.pc.orgasmFrom("rebel")
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 40)
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rebel_getfisted")
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

