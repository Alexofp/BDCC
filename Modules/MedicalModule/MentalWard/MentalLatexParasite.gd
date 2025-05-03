extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MentalLatexParasite"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		saynn("Eliza walks into your cell and crouches before you. She holds a leash in her hand, her second one holds you by the chin. She seems to be quite excited.")

		saynn("[say=eliza]Ready to be a test subject?[/say]")

		# (if normal behaviour)
		if(getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) > 0.5):
			saynn("[say=pc]Maybe.[/say]")

			saynn("[say=eliza]It’s gonna be fun, don’t worry.[/say]")

		# (if low behaviour)
		else:
			saynn("[say=pc]Like I have a choice.[/say]")

			saynn("[say=eliza]Awww. Grumpy because you’re so lonely? Let’s fix that.[/say]")

		saynn("She clips a leash to your collar and tugs you out of your cell. You hastily get up and follow.")

		addButton("Follow", "See where she brings you", "follow")

	if(state == "follow"):
		aimCamera("med_researchlab")
		setLocationName("Research lab")
		
		saynn("You follow Eliza through some long bright corridors until she brings you into some laboratory, you notice that one of the signs says ‘Bio Incubator’. You see two doors, one of them is a reinforced double-airlock.")

		saynn("Eliza catches your concerned gaze.")

		saynn("[say=eliza]Space is very huge as you probably know. We managed to capture a very unique specimen, we think it traveled to us from another galaxy, we’re speaking million light years away. This is a great opportunity for all of us.[/say]")

		saynn("Your gaze becomes even more concerned, you start looking for an exit to escape through but Eliza still holds your leash.")

		saynn("[say=pc]And what do you want me to do?[/say]")

		saynn("[say=eliza]Your job is simple, just try to establish communication with it. We’re unaware of its abilities but so far it doesn’t seem to be hostile towards anyone.[/say]")

		saynn("She walks you towards the airlocks. The task doesn’t seem too hard. She unleashes you and invites you to step into the testing chamber.")

		saynn("[say=eliza]I’m gonna be watching from behind a glass, ready to terminate the experiment if anything goes wrong.[/say]")

		saynn("[say=pc]What about the straitjacket?[/say]")

		saynn("[say=eliza]We can’t let you hurt it, you will be fine.[/say]")

		saynn("Great.")

		addButton("Step in", "See what’s up", "step_in")

	if(state == "step_in"):
		addCharacter("latexParasite")
		
		saynn("The airlock closes behind you. White room. No furniture, there is only a big reinforced window. You look around and can’t see anyone, just Eliza behind the glass, taking notes.")

		saynn("Strange.")

		saynn("Suddenly the shadow on the floor moves slightly. You realize that it’s not actually a shadow, it’s.. something alive. It looks like.. a pile of black goo. Its surface seems very shiny and smooth, almost reflective.")

		saynn("[say=pc]Umm..[/say]")

		saynn("It seems to have noticed you and started slowly oozing towards you..")

		saynn("You keep stepping away and quickly get yourself into a corner. It gets closer and closer, it’s in your reach now.")

		saynn("[say=eliza]Don’t be afraid, everything is under control.[/say]")

		saynn("Easy for her to say. The dark slimy goo touches your leg. It feels kinda firm, you can feel it starting to envelope around your feet.")

		addButton("Resist", "Try and free yourself", "resist")

	if(state == "resist"):
		playAnimation(StageScene.TentaclesSex, "tease", {bodyState={naked=true, hard=true}})
		
		saynn("You try to pull your leg away but the goo doesn’t let you, it keeps your foot still. Oh no. The more you do it, the more you get stuck in it, the black goo starts climbing your legs, coating them with a thick layer of black rubber-like material. Fascinated Eliza watches the process carefully.")

		saynn("[say=pc]Maybe it’s time to stop?.. I can’t move.[/say]")

		saynn("[say=eliza]I didn’t tell you but it seems to be attracted to our bodily fluids. You know, sweat, saliva, cum. We think it’s some kind of parasite. So far you’re not under any danger, we will continue as far as possible.[/say]")

		saynn("It reaches your knees level and keeps going, you try to free your legs again but can’t even wiggle a toe. The goo starts enveloping around your thighs, it feels warm and completely follows your curves. You can’t close your legs, the goo spreads them apart when you try, it clearly moves towards your crotch. You press yourself into the corner.")

		saynn("[say=pc]Oh no..[/say]")

		saynn("A few little black goo-tentacles form, they travel up your legs, one of them slides under your chastity belt and finds your {pc.analStretch} backdoor. It starts prodding it, seeing how easy your anal ring would give in. All the while you can’t even grab it, you’re forced to endure its onslaught on your tailhole. It slowly applies more and more pressure, stretching you out.")

		# (if has vagina)
		if(GM.pc.hasVagina()):
			saynn("Another alien tentacle reaches your pussy, its pointy tip catches your sensitive clit and starts rubbing it. You can’t help but to bite your lip and let out a little moan, it feels as if a silicon dildo suddenly gained consciousness. You feel yourself becoming more wet, your slit attracts the alien even more, its tentacles trace across your petals and then spread them open. Your {pc.pussyStretch} pussy is exposed and you can’t do anything about it..")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("A single tentacle slips under your chastity and has wrapped around your half-erect member. It begins to slide along the length of your {pc.cock}, it’s stroking you hard. You let out a soft moan as a drop of your precum already shines on the tip of your cock. Another tentacle quickly catches that and seemingly just absorbs it. Your cock quickly becomes rock hard, putting a lot of pressure onto your poor cage.")
		elif(GM.pc.hasPenis()):
			saynn("A single tentacle has wrapped around your half-erect member. It begins to slide along the length of your {pc.cock}, it’s stroking you hard. You let out a soft moan as a drop of your precum already shines on the tip of your cock. Another tentacle quickly catches that and seemingly just absorbs it. Your cock quickly becomes rock hard")

		saynn("You catch a glimpse of Eliza’s face, she is blushing. And you feel like you can’t resist at all anymore..")

		addButton("Give in", "Maybe it will let you go sooner if you don’t resist..", "give_in")

	if(state == "give_in"):
		playAnimation(StageScene.TentaclesSex, "sex", {bodyState={naked=true, hard=true}})
		
		saynn("While the tentacles explore you, the latex-y goo continues to envelop more and more of your body. You feel like you can’t stand anymore, you relax and try to fall but the parasite catches you and gently places you down on your knees.")

		saynn("You sense that the alien parasite started doing something strange, you look behind and see that the goo seems to shape some of it into a pair of black latex cuffs that it locks around ankles. Then they get connected by some more of that goo that quickly turns into a sturdy spreader bar that forces your legs open.")

		saynn("One tentacle manages to slip down your rear. You let out a moan as it stretches your anal ring enough and has now began exploring you from the inside. It feels so strange, you can’t control a thing, you’re just left at the mercy of this alien. But it also feels very good, the tentacle shifts inside you so much..")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Your pussy is being violated too, another tentacle has found your pussy entering and began prodding at it. It doesn’t take much, you’re so wet that the tentacle manages to slip in with ease and then stretches you out more by becoming fatter. It fills you so well, you look down and see a little bump on your abdomen as the tentacle moves inside you and absorbs your female juices. A second one joines and attached itself to your clit, this one seems to be focused on suction.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("The tentacle around your cock keeps milking you for your precum, its stroking slowly becomes faster. Another few tentacles reach your ballsack and give it a little squeeze, they wrap around your balls and start kneading them, it feels like nothing you ever experienced.")

		saynn("[say=pc]It’s too much..[/say]")

		saynn("Science can’t exist without brave test subjects like you, the goo has covered your whole lower part of the body with a latex-like layer at this point. Your toes, ankles, knees, thighs, it even covered your privates and went down your butt. Latex cuffs prevent you from shutting your legs while quite a few tentacles continue to fuck you, milking you and seemingly becoming stronger by doing so.")

		addButton("Continue", "See what happens next..", "continue")

	if(state == "continue"):
		saynn("The tentacles become so strong they can seemingly support your whole body, they wrap around your belly and raise you above the floor with some holding your legs. Now you feel truly helpless, letting out little moans as it milks you. The black goo spreads to your straitjacket too, it engulves it, turning it completely black. It goes up to your {pc.breasts}, little thin tentacles latch onto your nips and begin tugging on them, trying to stimulate. You can’t stop moaning..")

		# (if lactating)
		if(GM.pc.canBeMilked()):
			saynn("It only takes a few seconds before your breasts start to lactate, squirting with {pc.milk}. The tentacles form pump-like tips and attach themselves to your nipples. Then they start working on your breasts, sucking and doing strong pump motions until eventually creating a stable flow of your {pc.milk}. It all gets absorbed by the parasite, giving it more energy.")

		saynn("The goo coats you up to the neck, it does the same thing with your collar as it did with your straitjacket, covering it in black latex. You notice one of the tentacles going up to your mouth, you stick your tongue out and give it a lick, it tastes like rubber. But it doesn’t stop there, you see the tip of the tentacle being formed into something phallic, it looks like a plug. The tentacle forces that plug into your mouth, it feels rubbery, you can’t bite on it even if you wanted, all you can do now is make muffled moans while it stretches your throat. From the back of the plug form two black straps that wrap around your head and connect behind it, finishing a gag. That tentacle then moves slightly up and produces a blindfold of the same design and wraps it around your eyes, completely stealing your sight. Last thing you saw was Eliza sneakily touching herself between her legs.")

		addButton("Isolation", "And pleasure", "isolation")

	if(state == "isolation"):
		playAnimation(StageScene.TentaclesSex, "fast", {pcCum=true, bodyState={naked=true, hard=true}})
		
		saynn("Even blindfolded and gagged, you have enough to worry about, the tentacle in your butt had began thrusting in and out at a steady pace, fucking you! Your {pc.analStretch} anus doesn’t even close fast enough before it’s stuffed again. Then a second tentacle joins, they begin pounding your butt interchangeably, stretching you out so much.")

		# (if vagina)
		if(GM.pc.hasVagina()):
			saynn("The tentacle in your pussy has found your sweet spot, the spot that made your arch your back and moan from pleasure. It began hammering at it, shifting the fat part in and out your cunt, fucking you like that. You feel like you won’t endure it for long, waves of ecstatic pleasure overwhelm your body. You can’t stop cumming, your poor stuffed pussy keeps squirting juices and that only makes the onslaught stronger, the parasite manages to slip another tentacle inside you and past your cervix! It’s fucking your womb and it feels unbelievable.")

		# (if dick)
		if(GM.pc.isWearingChastityCage()):
			saynn("One of the tentacles transforms its tip into a fleshlight and tries to engulf your {pc.cock} with it! You don’t get any direct stimulation but the feeling of your cage being pulled and pushed back and forth feels amazing. It doesn’t take much time before you cum, muffled moans escape from your gagged mouth as your throbbing cock stuffs that fleshlight full of {pc.cum}. It doesn’t stop there, the tentacle in your butt finds your prostate and focuses on it, roughly pounding it. That causes a huge spike of pleasure, your cock shoots {pc.cum} again and again, stuffing that fleshlight to the brim until your balls are completely drained.")
		elif(GM.pc.hasPenis()):
			saynn("One of the tentacles transforms its tip into a fleshlight and engulfs your {pc.cock} with it! It feels amazing, the texture on the inside is bumpy and it’s so tight, the fleshlight then gets moved back and forth along your cock, letting you fuck it. It doesn’t take much time before you cum, muffled moans escape from your gagged mouth as your throbbing cock stuffs that fleshlight full of {pc.cum}. It doesn’t stop there, the tentacle in your butt finds your prostate and focuses on it, roughly pounding it. That causes a huge spike of pleasure, your cock shoots {pc.cum} again and again, stuffing that fleshlight to the brim until your balls are completely drained.")

		saynn("It feels so good, you can’t stop cumming, your mind slowly slips into obscurity, drowning in a sea of pleasure. As the tentacles milk you more they only get stronger, their onslaught on your holes increases, the plug in your mouth increases in size, it starts stretching and fucking your throat. You’re completely helpless, being held above the floor with your legs spread open. It feels like something will happen any second, something big.")

		addButton("Let it happen", "Ride it to the end..", "let_it_happen")

	if(state == "let_it_happen"):
		playAnimation(StageScene.TentaclesSex, "inside", {cum=true, pcCum=true, bodyState={naked=true, hard=true}})
		
		saynn("Suddenly your holes are being stuffed with black liquid goo! All the tentacles increase in size, they keep pounding you while cumming inside. Cumming so much that your belly quickly becomes cuminflated, the one in your throat sends goo directly to your belly, quickly filling it. The ones in your butt do the same, stuffing your butt to the brim.")

		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("Your pussy did not escape it too, the tentacle in your womb explodes with so much goo that it quickly overflows and already starts leaking, painting your inner walls black too.")

		saynn("You arch your back and squirm desperately, you can’t stop cumming even now, when the latex parasite is cumming inside you. Muffled moans of pleasure is all you can make through that gag, you can’t even see how you look, you can’t see anything.")

		saynn("The tentacles stop moving. They withdraw out of you, causing a strong flow of that goo out of your holes. You feel that they gently place you on the floor and leave you alone. Seems like the parasite is satisfied. And so are you, you feel so used, so tired..")

		addButton("Take a nap", "A simple nap always helps", "take_a_nap")

	if(state == "take_a_nap"):
		aimCamera("medical_paddedcell_player")
		GM.pc.setLocation("medical_paddedcell_player")
		playAnimation(StageScene.Solo, "kneel")
		setLocationName("Padded cell")
		
		saynn("You wake up somewhere else. You can hear Eliza as she grabs your blindfold and carefully removes it. Then she does the same for the gag. You squint from the bright light and cough out more of that black goo. Eliza giggles. You’re in your padded cell. The doctor continues to take off the restraints that the parasite has produced. Then she grabs a scalpel and carefully splits open the latex suit that’s on you and then takes it off you.")

		saynn("[say=eliza]Good job handling that one~, the material that was collected is incredibly rare. It’s durable, great to the touch and stretches to any body size without losing tightness. The only way to get it is to let the parasite milk you.[/say]")

		saynn("[say=pc]Mm-mhm..[/say]")

		saynn("You’re still so tired and unable to stop leaking black goo.")

		saynn("[say=eliza]Have a good rest, test subject~[/say]")

		saynn("Eliza leaves your cell, leaving you alone..")

		# (scene ends)
		
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "follow"):
		runScene("ParadedOnALeashScene", ["eliza", GM.pc.getLocation(), "med_researchlab", [
			"Almost there, patient",
			"Today's experiment should be interesting",
			"Smile to the nurses",
			"This will be very interesting, I'm excited~",
		]])
	
	if(_action == "continue"):
		GM.pc.orgasmFrom("latexParasite")
	
	if(_action == "let_it_happen"):
		GM.pc.gotAnusFuckedBy("latexParasite")
		GM.pc.gotThroatFuckedBy("latexParasite")
		
		GM.pc.orgasmFrom("latexParasite")
		GM.pc.cummedInAnusBy("latexParasite")
		GM.pc.cummedInMouthBy("latexParasite")
		if(GM.pc.hasVagina()):
			GM.pc.cummedInVaginaBy("latexParasite")
			GM.pc.gotVaginaFuckedBy("latexParasite")
		GM.pc.cummedOnBy("latexParasite")
		
		if(GM.pc.canBeMilked()):
			GM.pc.milk()
		if(GM.pc.canBeSeedMilked()):
			GM.pc.milkSeed()
		
		GM.pc.addSkillExperience(Skill.SexSlave, 20)
		MedicalModule.addPCBehavior(0.1)
		
		setModuleFlag("MedicalModule", "Mental_ExpTentacles", Util.maxi(1, getModuleFlag("MedicalModule", "Mental_ExpTentacles", 0)))

	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)

func getDevCommentary():
	return "It would be really cool to have a tentacle monster animated. But I don't even know how to start with that.. Do I just need a few tentacles? Or an entire.. monster?.. I dunno. I would need to rig and animate each tentacle.. just for this one scene x3. Would it be worth it?.. Lemme know down in the comments.. smash like.."

func hasDevCommentary():
	return true
