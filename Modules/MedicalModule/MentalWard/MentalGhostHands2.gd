extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MentalGhostHands2"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		saynn("Eliza enters the padded cell and hums to herself. You sit still on the soft floor and await her orders.")

		# (if bad behavior)
		if(getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) <= 0.4):
			saynn("[say=eliza]Get up, patient. How’s your vision today?[/say]")

			saynn("[say=pc]Why do you ask?[/say]")

			saynn("Eliza leans down to your level and grabs by the chin. She then holds eye contact with you until you give up and turn your head away. Doctor smirks.")

			saynn("[say=eliza]Don’t answer with a question, silly test subject.[/say]")

		# (if good)
		else:
			saynn("[say=eliza]Hey there. Behaving I see, good. How’s the vision?[/say]")

			saynn("[say=pc]Seems to be alright..[/say]")

			saynn("Eliza leans down to your level and offers you a pat on the head before scritching behind the ear. She tries to make eye contact with you and hold it but her gaze drills you too much, making you turn your head away after a second. Doctor smirks.")

			saynn("[say=eliza]Well, you surely seem to be aware of me, sweetie.[/say]")

			# (end)

		saynn("Doctor straightens her posture and produces a familiar leash.")

		saynn("[say=eliza]The partial blindness drug needs more research, that’s why I need you.[/say]")

		saynn("Remembering how the last time went, you shiver and tilt your head down. Doctor clips a leash to your collar and helps you to get up before walking you out. You’re kinda glad she grabs you sometimes, you spend so much time inside your cell..")

		addButton("Follow", "See where she brings you", "follow")

	if(state == "follow"):
		# (also runs the walking scene)
		aimCameraAndSetLocName("med_researchlab")
		playAnimation(StageScene.Solo, "sit")

		saynn("Doctor Quinn brings you into the research lab and makes you sit on the testing table before leashing your collar to one of its handy hooks.")

		saynn("[say=eliza]We will test the partial blindness drug, like I said. Today’s experiment will be more tactile. Tell me, what did you see under the influence?[/say]")

		saynn("You try to raise your hand to scratch behind your head but realize the straitjacket is still there.")

		saynn("[say=pc]I saw the room.. I saw myself. And I think I saw you? But..[/say]")

		saynn("Eliza smirks as she prepares the drug in the background. The machinery takes a while to spin the vials.")

		saynn("[say=eliza]I was a ghost, right? That sounds spooky~[/say]")

		saynn("[say=pc]Well, I only saw parts of you that were.. touching me? And that was somewhat unsettling, yes[/say]")

		saynn("Doctor fidgets around a bit, rubbing her chin and thinking.")

		saynn("[say=eliza]My guess is that your brain was just tricking you. The drug seems to make you blind completely, your pupils were empty. But the brain doesn’t realize it and tries to reconstruct the surroundings from memory.[/say]")

		saynn("Eliza fills the syringe with a gray-like substance, seemingly the same one that she used on you before. She then approaches you and disinfects your neck before preparing to inject.")

		saynn("[say=pc]But why did I see the hands.[/say]")

		saynn("[say=eliza]It’s not magic. Magic doesn’t exist, everything can be explained. Now sh-h-h. Sit still.[/say]")

		addButton("Get drugged", "Feel what happens next", "get_drugged")

	if(state == "get_drugged"):
		removeCharacter("eliza")
		addCharacter("ghostHands")
		
		saynn("You decide not to bug the doctor with more questions and just tilt your head away, giving her more access to your neck. The sharp needle easily gets under the skin and finds an artery. Eliza then injects the drug into your bloodstream and disposes of the used syringe.")

		saynn("This time you decide not to close your eyes and see what happens. So far all you feel is just.. warmness. You watch Eliza, she seems to be standing still and looking at you with a serious expression on her face. Suddenly you hear a voice near one of your ears.")

		saynn("[say=eliza]Booh. Your pupils are blank.[/say]")

		saynn("You gasp and turn towards the source of that voice but see nothing. The drug must be working, even when turning your head back you only see the lab, exactly the way it looked when you entered it.")

		saynn("[say=eliza]Our minds are so easily tricked, I love it~. You look like a little blind puppy~[/say]")

		saynn("Then a paw materializes itself out of thin air and covers your eyes. But.. It’s half-transparent so you can see the lab through it anyway.")

		saynn("[say=pc]I.. I can still see..[/say]")

		saynn("[say=eliza]Cool, isn’t it? You don’t need your eyes anymore~[/say]")

		saynn("The paw disappears, just for something else to take its place. A blindfold. You feel the cloth texture but have no idea what color it is, it all looks slightly blue and transparent for you. A ghostly paw ties it behind your head and then tugs you off the table by the collar.")

		saynn("[say=eliza]Walk around the table.[/say]")

		addButton("Do it", "Try to follow your intuition", "do_it")

	if(state == "do_it"):
		saynn("You look around, that seems to be helpful even with a blindfold. Then you take a fist step and realize that your ‘eyes’ don’t deceive you, the testing table and the walls are exactly where you think they are. You begin walking around the room like you see everything just fine. Although, when you try to read something from up close, the text is just too blurry.")

		saynn("You wonder where Eliza is.")

		saynn("[say=pc]Uh.. Doctor?[/say]")

		saynn("[say=eliza]Yeah, I’m preparing.. something. Ah..[/say]")

		saynn("Her last noise sounded a lot like a moan.")

		saynn("[say=pc]Preparing?[/say]")

		saynn("You hear her voice getting closer. You’re still wearing your straitjacket so you can’t stop her even if you wanted to, all you can do is hug yourself.")

		saynn("[say=eliza]Yes, you can feel my hands. But we must test if you can feel the objects that you have never seen before~.[/say]")

		saynn("A paw appears and grabs you by the collar again before pulling you to the nearest wall. It pins your back to it while something else starts to rub against your chastity belt. Something.. quite phallic and hard.")

		saynn("[say=pc]Is that a.. cock[/say]")

		saynn("[say=eliza]Surprised? Just a feeldoe strapon, relax~[/say]")

		saynn("The more that object rubs against your body and the belt, the more visible its outline is. It looks like a floating canine-type dick, pointy tip and even a knot near the base.")

		saynn("[say=eliza]This one can cum even~. I will give you a choice. Where do you want it~?[/say]")

		# (choices are Mouth, Pussy, Ass)

		addButton("Mouth", "Take the strapon down your throat", "mouth")
		addButtonWithChecks("Pussy", "Take the strapon down your sex", "pussy", [], [ButtonChecks.HasReachableVagina])
		addButton("Ass", "Take the strapon down your butt", "ass")
#ACEPREGEXPAC - Eliza ghost hands 2nd scene gets additional lines

	if(state == "mouth"):
		saynn("[say=pc]Uh.. In my mouth?[/say]")

		saynn("Eliza chuckles, the floating paws land on your shoulders and pull you down to your knees. You obey and kneel with your back pressed against the wall behind.")

		saynn("[say=eliza]I might be a bit rough, the only way for me to feel anything~. Open up, sweetie.[/say]")

		saynn("You see the floating ghost cock pressing against your lips, the outline looks like it might be a real one but the textures give it out as a silicon toy. You open your mouth wide for it and feel it sliding inside. When it hits the back of your mouth, your body tenses up, including your throat.")

		saynn("[say=eliza]Relax. Just pretend you’re being face fucked by a ghost~[/say]")

		saynn("All you see of Eliza are the paws that hold you in place and her cock that starts applying more pressure onto your {pc.throatStretch} throat, stretching it. And after a bit of force, the cock manages to bend and enter your throat, creating a lovely visible bulge on your neck and stealing your breathing.")

		saynn("[say=eliza]Oops, my bad.[/say]")

		saynn("The doctor notices how much you are struggling and starts to pull out. But your throat is now resisting that too, sucking the transparent cock back in. Eliza lets out a muffled noise as the friction causes the other side of her strapon to shift inside her pussy, she gives in to the sensations and rams the cock deep inside your mouth again before dropping a moan.")

		saynn("[say=eliza]Feels so good though. Try to endure it for a bit. For me~.[/say]")

		saynn("The cock starts fucking your mouth, sliding in and out, giving you only half a second to breathe before each thrust. Its synthetic knot slaps against your lips and tries to slip inside but it's too big. More and more moans escape from the doctor as she is using your throat for her pleasure. So rough. But you love it, even if it's just a toy, seeing how you’re being fucked by nothing but a floating cock is so hot, you eagerly lick the shaft and let your throat clench around it, quickly sending Eliza over the peak.")

		saynn("She lets out a passionate moan and rams her cock deep down your throat, it starts to fill your belly with something that feels like cum but is mostly like some kind of replacement. She pulls her strapon out a second later and lets it spray the warm cum lube all over your face and your exposed {pc.breasts}, making you look quite messy. You pant heavily and cough a few times. Then you realize that you also see the cum on you, it's half transparent like everything else so it looks like a ghost came all over you.")

		saynn("[say=eliza]Such a good test subject~. I feel like this experiment was a huge success.[/say]")

		# (continue button here)
		addButton("Continue", "See what happens next", "continue")

	if(state == "pussy"):
		saynn("[say=pc]Uhh.. can try my pussy..[/say]")

		saynn("Eliza chuckles, the floating paws turn you around and press against the wall, making you stick your butt for them. One paw then unlocks the chastity belt while another guides the ghost cock to rub against your sensitive petals, slowly making you wet.")

		saynn("[say=eliza]Oh yeah? You wanna be fucked by a ghost so much~?[/say]")

		if(GM.pc.isHeavilyPregnant()):
			saynn("You look down only to be greeted with the top of your own gravid midsection, the knot of a transparent canine cock felt between your thighs right against your vagina. You see one of the ghost paws pat the side of your strained tummy rubbing it's way across and around it and getting a grip to push you back onto the tip of the canine cock while the other goes for your hair.") 
			
			saynn("Your {pc.pussyStretch} petals gets penetrated by a sudden thrust as you let out a loud moan and spread your legs more for that cock instinctively.")

		elif(GM.pc.isVisiblyPregnant()):
			saynn("You look down between your legs and see the tip of the transparent canine cock stick out from just above the round curve of your belly as it presses.")
			saynn("But you don’t get to do that for very long, a ghost paw grabs your hair and pulls back on it while the second one directs the cock directly towards your {pc.pussyStretch} pussy hole followed by a sudden thrust. Your petals get forced spread, your pussy gets penetrated by the cock as you let out a loud moan and spread your legs more for that cock instinctively.")

		else:
			saynn("You look down between your legs and see the tip of the transparent canine cock grinding against your slit. But you don’t get to do that for very long, a ghost paw grabs your hair and pulls back on it while the second one directs the cock directly towards your {pc.pussyStretch} pussy hole followed by a sudden thrust. Your petals get forced spread, your pussy gets penetrated by the cock as you let out a loud moan and spread your legs more for that cock instinctively.")

		saynn("[say=eliza]Yeah, your body tells me everything~[/say]")

		saynn("The paws let go of the hair and instead land on your {pc.breasts}, giving them a slight massage "+str("giving little streams of milk from your nipples" if GM.pc.canBeMilked() else "")+" while the cock starts exploring and stretching your insides. You rest your face against the cold wall while the cock hammers at your pleasure point and tries to break into the womb. Your slit leaks juices all over it, coating the shaft like lube. But very quickly, your inner walls begin to clench around it, showing that you are close and also making Eliza moan from pleasure too as the other end of her strapon shifts inside her.")

		addButton("Cum!", "You gonna cum", "cum!")

	if(state == "cum!"):
		saynn("The last thrusts get very close, you let your tongue out and drool while the disembodied dick fucks you rough. Its knot starts to slip past your folds, stretching them very wide in the process. And sure enough, one last thrust was enough for the whole cock to slip inside and break into your babymaker. You hear the doctor’s moans and a second later you cum too, your body starts shaking and shivering while squirting all over the floor. All the while the strapon stuffs your womb with a huge load of warm cum lube, making you feel full without the danger of getting pregnant, hopefully.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("It was too much pleasure, your {pc.cock} puts a lot of pressure on it’s cage and then wastes its load on the wall in front of you.")
		elif(GM.pc.hasPenis()):
			saynn("It was too much pleasure, your {pc.cock} wastes its load on the wall in front of you.")

		saynn("[say=eliza]Ah~.. Yeah, I should use this toy more often~[/say]")

		saynn("The knotted strapon gets pulled out of your used slit and cums all over your butt, spending the last of its reserves. Then the ghost paws lock your belt again and pull away from the wall.")

		saynn("[say=pc]Y-yyeah..[/say]")

		saynn("Half-transparent goo starts leaking out of your slit, you see it slide over your inner thighs, so messy.")

		saynn("[say=eliza]Such a good test subject~. I feel like this experiment was a huge success.[/say]")

		# (Continue button here)
		addButton("Continue", "See what happens next", "continue")

	if(state == "ass"):
		saynn("[say=pc]Uhh.. can try my butt..[/say]")

		saynn("Eliza chuckles, the floating paws turn you around and press against the wall, making you stick your butt for them. One paw then unlocks the chastity belt while another guides the ghost cock to prod at your {pc.analStretch} star and rub between the legs.")

		saynn("[say=eliza]Oh yeah? You wanna be fucked by a ghost so much~?[/say]")

		if(GM.pc.isHeavilyPregnant()):
			saynn("You look down only to be greeted with the top of your own gravid midsection, the knot of a transparent canine cock felt between your thighs.")
			saynn("You see one of the ghost paws pat the side of your strained tummy, rubbing it's way across and around it and getting a grip to push you back onto the canine cock, while the other goes for your hair.")
			saynn("Your {pc.analStretch} anus gets penetrated by a sudden thrust as you let out a loud moan and spread your legs more for that cock instinctively.")

		elif(GM.pc.isVisiblyPregnant()):
			saynn("You look down between your legs and see the tip of the transparent canine cock stick out from just above the round curve of your belly as it slides between your thighs.")
			saynn("But you don’t get to do that for very long, a ghost paw grabs your hair and pulls back on it while the second one directs the cock directly towards your tailhole followed by a sudden thrust. Your {pc.analStretch} anus gets penetrated by the cock as you let out a loud moan and spread your legs more for that cock instinctively.")

		else:
			saynn("You look down between your legs and see the tip of the transparent canine cock sliding between your thighs. But you don’t get to do that for very long, a ghost paw grabs your hair and pulls back on it while the second one directs the cock directly towards your tailhole followed by a sudden thrust. Your {pc.analStretch} anus gets penetrated by the cock as you let out a loud moan and spread your legs more for that cock instinctively.")

		saynn("[say=eliza]Yeah, your body tells me everything~[/say]")

		saynn("The paws let go of the hair and instead land on your {pc.breasts}, giving them a slight massage "+str("giving little streams of milk from your nipples" if GM.pc.canBeMilked() else "")+"while the cock starts exploring and stretching your insides. You rest your face against the cold wall while the cock hammers at your pleasure point and tries to slide deeper each time. The shaft is prelubed which allows it to fuck you nice and fast. But very quickly, your inner walls begin to clench around it, showing that you are close and also making Eliza moan from pleasure too as the other end of her strapon shifts inside her.")

		addButton("Cum!", "You gonna cum", "cum!1")

	if(state == "cum!1"):
		saynn("The last thrusts get very close, you let your tongue out and drool while the disembodied dick fucks you rough. Its knot starts to slip past your star, stretching it very wide in the process. And sure enough, one last thrust was enough for the whole cock to slip inside your butt. You hear the doctor’s moans and a second later you cum too, your body starts shaking and shivering, legs barely support you. All the while the strapon stuffs your fuckhole with a huge load of warm cum lube, making you feel full.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("It was too much pleasure, your {pc.cock} puts a lot of pressure on it’s cage and then wastes its load on the wall in front of you.")
		elif(GM.pc.hasPenis()):
			saynn("It was too much pleasure, your {pc.cock} wastes its load on the wall in front of you.")

		saynn("[say=eliza]Ah~.. Yeah, I should use this toy more often~[/say]")

		saynn("The knotted strapon gets pulled out of your used anus and cums all over your butt, spending the last of its reserves. Then the ghost paws lock your belt again and pull away from the wall.")

		saynn("[say=pc]Y-yyeah..[/say]")

		saynn("Half-transparent goo starts leaking out of your ass, you see it slide over your inner thighs, so messy.")

		saynn("[say=eliza]Such a good test subject~. I feel like this experiment was a huge success.[/say]")

		# (Continue button here)

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		saynn("You slowly catch your breath. A ghostly paw then removes your blindfold and grabs the leash.")

		saynn("[say=pc]What about the mess.[/say]")

		saynn("[say=eliza]What about it?[/say]")

		saynn("She sounds like she doesn’t really care about the answer. Floating kitty paw just tugs you back into your cell and leaves you there to calm down and let the drug effect end.")

		# (scene ends)
		addButton("Continue", "What was that", "endthescene")

func _react(_action: String, _args):
	if(_action == "follow"):
		runScene("ParadedOnALeashScene", ["eliza", GM.pc.getLocation(), "med_researchlab", [
			"Almost there, patient",
			"Today's experiment should be interesting",
			"Smile to the nurses",
		]])
	
	if(_action == "get_drugged"):
		GM.pc.addIntoxication(0.8)

	if(_action == "mouth"):
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Head, 30)
		GM.pc.cummedInMouthBy("eliza", FluidSource.Strapon)
		GM.pc.cummedOnBy("eliza", FluidSource.Strapon)
		#GM.pc.orgasmFrom("eliza")
		GM.pc.addSkillExperience(Skill.SexSlave, 25)

	if(_action == "cum!"):
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Vagina, 30)
		GM.pc.cummedInVaginaBy("eliza", FluidSource.Strapon)
		GM.pc.cummedOnBy("eliza", FluidSource.Strapon)
		GM.pc.orgasmFrom("eliza")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)
		
	if(_action == "cum!1"):
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 30)
		GM.pc.cummedInAnusBy("eliza", FluidSource.Strapon)
		GM.pc.cummedOnBy("eliza", FluidSource.Strapon)
		GM.pc.orgasmFrom("eliza")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)
		
	if(_action == "continue"):
		GM.pc.addCredits(1)
		addMessage("You received 1 work credit!")
		
		setModuleFlag("MedicalModule", "Mental_ExpGhostHands", Util.maxi(2, getModuleFlag("MedicalModule", "Mental_ExpGhostHands", 0)))

	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)


