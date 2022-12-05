extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MentalGhostHands3"

func _run():
	if(state == ""):
		pass
		
	if(state == ""):
		saynn("You are sitting still in your padded cell, expecting Eliza or some other doctor to grab you since it feels like the right time.")

		saynn("No one comes though, is today a free day?")

		addButton("Wait more", "What else can you do", "wait_more")

	if(state == "wait_more"):
		addCharacter("ghostHands")
		
		saynn("Doing nothing makes you feel pretty drowsy, your eyes were about to close when you suddenly saw something, a little blue floating orb.")

		saynn("[say=pc]Huh?[/say]")

		saynn("You try to focus on it. You realize that it looks more like an outline. Hand outline. And it hovers near your head. That can’t be real, it must be Eliza playing with you.")

		saynn("The ghostly hand moves closer to your nose and boops you. You felt the cold touch quite well, it must be the doctor.")

		# (if bad behavour)
		if(getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) <= 0.4):
			saynn("[say=pc]Eliza? Did you drug me again? That’s not funny, stop it.[/say]")

		# (if good behavour)
		else:
			saynn("[say=pc]Oh, doctor Quinn, is that you? Testing the drug on me again?[/say]")

		saynn("Wait. You realize that you never heard or saw the door opening, it’s still closed shut. And there is no way you would miss that, the thing weighs like a spaceship and opens with a similar noise.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		# (Second paw appears. They start groping.)

		# (You realize that something is very wrong when a third and a fourth one appear too.)

		saynn("A second ghostly hand appears from thin air and joins the first. They land on your straitjacket and slide over the latex before slipping under your bound arms and cupping your exposed {pc.breasts}.")

		saynn("[say=pc]Hey.. Say something at least..[/say]")

		saynn("You’re being teased by two floating hands when another two appear out of nothing! This is becoming more strange by the second.")

		saynn("[say=pc]What is happening..[/say]")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("The hands don’t react to your speech at all, the new pair of hands seems to be interested in your chastity belt. You look down and notice them straight up phasing through metal but then landing on your pussy lips and giving them a rub.")

		# (else if has cock)
		elif(GM.pc.hasPenis()):
			if(GM.pc.isWearingChastityCage()):
				saynn("The hands don’t react to your speech at all, the new pair of hands seems to be interested in your chastity belt. You look down and notice them straight up phasing through metal and through your chastity cage before landing on your crotch and stroking your cock a bit. The hands don’t seem to follow the rules of this reality but your dick still does.")
			else:
				saynn("The hands don’t react to your speech at all, the new pair of hands seems to be interested in your chastity belt. You look down and notice them straight up phasing through metal but then landing on your crotch and stroking your cock a bit.")

		# (else)
		else:
			saynn("The hands don’t react to your speech at all, the new pair of hands seems to be interested in your chastity belt. You look down and notice them straight up phasing through metal but then landing on your crotch and rubbing it a bit.")

		addButton("Resist", "Something is very wrong!", "resist")

	if(state == "resist"):
		# (You try to resist but they pin you to the floor)

		# (Ghost dicks appear, a few of them actually)

		# (Dicks rub against you, making you horny)

		saynn("You try to get up and make noise so someone can help you but the ghostly paws easily overpower you and pin against the padded floor. One of the paws land on your neck and put a fair amount of pressure while the others hold your limbs and keep your {pc.thick} legs spread.")

		saynn("Then you notice a few new ghostly outlines appear but these are different. They look like.. disembodied dicks, hovering near your body. And they don’t seem to be fake strapon ones, they twitch and each have a hanging drop of pre hanging from the tip.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Slight panic settles into you as one of the cocks goes straight through the chastity belt and grinds against your pussy lips with the other one hovering near your lips.")

		# (else)
		else:
			saynn("Slight panic settles into you as one of the cocks goes straight through the chastity belt and grinds between your asscheeks with the other one hovering near your lips.")

		saynn("[say=pc]Anyone?.. Please?..[/say]")

		saynn("You try to call for help but your attempts are quickly countered by another set of ghostly hands appearing and covering your mouth. They then slip a few digits past your lips, letting you feel how strange it's cold skin feels. Biting them seems like a dangerous idea, you just let them explore your mouth while you gently suckle on them.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You can’t escape the teasing, many floating hands are keeping you pinned while groping your {pc.breasts}. A few cocks align themselves to your wet pussy, {pc.analStretch} tailhole and open mouth before displacing any digits and sliding inside you, stretching your holes!")

		# (else)
		else:
			saynn("You can’t escape the teasing, many floating hands are keeping you pinned while groping your {pc.breasts}. A few cocks align themselves to your {pc.analStretch} tailhole and open mouth before displacing any digits and sliding inside you, stretching your hole!")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		# (Dicks fuck you in all the holes while you stroke other ones)

		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("The floating dicks begin pounding your ass and pussy at a fast rate, never leaving at least one hole empty. The pleasure is too much, your body tries to squirm and struggle but the paws hold you and keep your legs spread for the cocks to fuck you.")

		# (else)
		else:
			saynn("The floating dick begins pounding your ass at a fast rate before another one joins in, alternating with the first and making it so your fuckhole is never empty. The pleasure is too much, your body tries to squirm and struggle but the paws hold you and keep your legs spread for the cocks to fuck you.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Your own dick is trying to get hard but it can’t pass through metal like the ghost ones, you just feel the pressure rising.")

		saynn("The cock in your mouth is sliding too, brushing against the back of it before going down your throat and fucking your face!")

		saynn("Your eyes fill with desire, you look around and notice even more cocks appearing around you, some are thrusting between the latex of your bound arms, some are rubbing against your thighs or exposed chest.")

		addButton("Cum!", "You can’t endure this anymore", "cum!")

	if(state == "cum!"):
		# (You cum and dicks cum inside you too, you feel the cum on you)

		# (too much stimulation so you black out)

		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("With so many sources of pleasure, you are quickly pushed over the edge, your body creates an arch and shivers as your holes twitch and pulsate around the cocks, trying to milk them. But they don’t stop and keep fucking you through your orgasm, extending it and messing with your mind. The first cock cums down your throat, soon followed by the other two that stuff your ass and babymaker to the brim with some kind of transparent glowing seed that can even be seen shining through your belly.")

		# (else)
		else:
			saynn("With so many sources of pleasure, you are quickly pushed over the edge, your body creates an arch and shivers as your hole twitches and pulsates around the cocks, trying to milk them. But they don’t stop and keep fucking you through your orgasm, extending it and messing with your mind. The first cock cums down your throat, soon followed by the other two that stuff your ass to the brim with some kind of transparent glowing seed that can even be seen shining through your belly.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Even though your {pc.cock} is trapped behind the chastity belt and the chastity cage at the same time, it suddenly throbs and wastes its load.")
		elif(GM.pc.hasPenis()):
			saynn("Even though your {pc.cock} is trapped behind the chastity belt, it suddenly throbs and wastes its load.")

		saynn("Then the other cocks cum one by one, shooting strings of that strange glowing goo all over your body and face, leaving quite a mess indeed. Drippy seed leaks out of you, lots of it.")

		saynn("You’re left panting on the floor while the cocks retract out of your holes. Although the paws don’t seem to let you move. And then you see why, another set of cocks already starts to align against your holes, oh no.")

		saynn("But as they slide inside your used holes and start fucking them, you begin to lose it, the darkness says hello and makes you lose consciousness. Or what’s left of it anyways.")

		addButton("Sleep", "It was too much!", "sleep")

	if(state == "sleep"):
		removeCharacter("ghostHands")
		addCharacter("eliza")
		
		saynn("You are soon awakened by a familiar voice coming through the intercom.")

		saynn("[say=eliza]Are you alright, patient?[/say]")

		saynn("[say=pc]Hu-uh?..[/say]")

		saynn("You slowly open your eyes. The screech of that door opening makes you wince. The doctor walks in and crouches near you.")

		saynn("[say=eliza]You are panting, inmate. Had a bad dream?[/say]")

		saynn("You just realized it, you are indeed panting heavily, trying to catch some breath.")

		saynn("[say=pc]Uh.. yeah, I guess.[/say]")

		saynn("[say=eliza]Need a sedative injection?[/say]")

		saynn("[say=pc]No! I’m fine..[/say]")

		saynn("Eliza tilts her head to the side slightly and looks at you and your eyes carefully for a few seconds. She then silently nods and stands up.")

		saynn("[say=eliza]You seem tired. Rest, we can skip this day and continue the research tomorrow.[/say]")

		saynn("The doctor then leaves your cell and starts the door closing sequence that traps you inside.")

		saynn("…")

		saynn("What is that leaking out of you?")

		# (scene ends)
		addButton("Continue", "What was that", "endthescene")

func _react(_action: String, _args):

	if(_action == "cum!"):
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy("ghostHands")
			GM.pc.cummedInVaginaBy("ghostHands")
			GM.pc.gotAnusFuckedBy("ghostHands")
			GM.pc.cummedInAnusBy("ghostHands")
		else:
			GM.pc.gotAnusFuckedBy("ghostHands")
			GM.pc.cummedInAnusBy("ghostHands")
		GM.pc.gotThroatFuckedBy("ghostHands")
		GM.pc.cummedInMouthBy("ghostHands")
		GM.pc.orgasmFrom("ghostHands")
		GM.pc.addSkillExperience(Skill.SexSlave, 10)
		

	if(_action == "continue"):
		#GM.pc.addCredits(1)
		#addMessage("You received 1 work credit!")
		
		setModuleFlag("MedicalModule", "Mental_ExpGhostHands", Util.maxi(3, getModuleFlag("MedicalModule", "Mental_ExpGhostHands", 0)))

	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)


