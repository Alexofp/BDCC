extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MentalObedienceDrug2"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		saynn("The door to your cell opens. You see Eliza walking in.")

		saynn("[say=eliza]Another day, another breakthrough. Wake up~[/say]")

		saynn("She clicks a chain leash to your collar and tugs you out of your cell.")

		addButton("Continue", "Follow the doctor", "continue")

	if(state == "continue"):
		aimCamera("med_researchlab")
		setLocationName("Research lab")
		
		saynn("You are being walked through the many straight corridors.")

		saynn("[say=eliza]Recovered after the last time?[/say]")

		saynn("[say=pc]Maybe? Isn’t it your job to check that?[/say]")

		saynn("[say=eliza]You know, foreign elements in your blood are like unstable atoms, they have a half-life time. That means even after many days there still might be some of it left.[/say]")

		saynn("Great.")

		saynn("She brings into the lab and chains to the table in the middle of the room.")

		addButton("Sit still", "See what happens", "sit_still")

	if(state == "sit_still"):
		playAnimation(StageScene.Solo, "sit")
		
		saynn("Eliza leans down and quickly checks your pulse and the size of your pupils. You sit still, with your latex straitjacket on.")

		saynn("[say=eliza]Eh, should be fine.[/say]")

		saynn("[say=pc]What are you gonna do to me?[/say]")

		saynn("[say=eliza]Rela-ax, inmate. You already experienced this drug.[/say]")

		saynn("Eliza grabs a little vial off of her belt and fills a syringe with it. Seems like it’s one that gives you pain for disobedience.")

		saynn("[say=pc]So why are we doing this again?[/say]")

		saynn("Doctor sighs and scritches you slightly under the chin. It feels nice..")

		saynn("[say=eliza]We’re checking if there are any side effects from long term use. You expect me to just test each drug once and be done? Now be a good test subject and don’t move.[/say]")

		saynn("That seems like a fair explanation. You tilt your head to the side and wait for the prick.")

		addButton("Get drugged", "Maybe it will feel nice this time..", "get_drugged")

	if(state == "get_drugged"):
		saynn("Eliza injects you with the contents of the syringe. You feel a slight warm feeling as the drug starts to travel through your bloodstream. Eliza disposes of the syringe and starts to take notes.")

		saynn("[say=eliza]Feel any different?[/say]")

		saynn("[say=pc]Same as before..[/say]")

		saynn("[say=eliza]That’s very good. Last time I got distracted when I saw that it actually worked. This time we will go through some prepared tests.[/say]")

		saynn("You try to shrug but you can barely move your shoulders with that jacket on, you’re forced to constantly hug yourself.")

		saynn("[say=eliza]Let’s see. What’s your name?[/say]")

		addButton(GM.pc.getName(), "Tell her your real name", "sayrealname")
		addButton("Lie", "Lie to Eliza", "saybadname")

	if(state == "sayrealname"):
		saynn("[say=pc]I’m {pc.name}. Or inmate {pc.inmateNumber} if you’re talking about that one.[/say]")

		saynn("She observes you for a second. You don’t feel any different which is kinda strange, you were expecting some reward from your body.")

		saynn("[say=eliza]Mhm. Makes sense.[/say]")

		saynn("[say=pc]Didn’t I obey?[/say]")

		saynn("[say=eliza]No, you just answered a question. You can’t trick your brain that easy.[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "saybadname"):
		saynn("You put on a cheeky smile.")

		saynn("[say=pc]My name is NoneOfYourBusiness.[/say]")

		saynn("You quickly prepare yourself for the pain that will surely come soon. But it never does. Strange.")

		saynn("[say=eliza]Very funny.[/say]")

		saynn("She baps you on the nose. You felt that at least.")

		saynn("[say=pc]Didn’t I disobey?[/say]")

		saynn("[say=eliza]No, you just answered a question. Poorly. You can’t trick your brain that easy.[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		saynn("[say=eliza]Alright. This one should be more interesting. Tell me your name, inmate.[/say]")

		saynn("That one surely did the trick, the longer you stay quiet the bigger your headache, you can’t stand still and start to shift around. Eliza watches you carefully.")

		addButton("Obey", "Tell her your name", "obey")
		addButton("Disobey", "Don’t say her anything", "disobey")

	if(state == "obey"):
		saynn("You can’t hold it back anymore.")

		saynn("[say=pc]My name is {pc.name}.[/say]")

		saynn("That felt good, really good, like you were just hugged tightly. Eliza takes a note of that and chuckles.")

		saynn("[say=eliza]Good~. Tell me, does it feel good?[/say]")

		saynn("[say=pc]Yes..[/say]")

		saynn("[say=eliza]Tell me how much~[/say]")

		saynn("[say=pc]It feels very good..[/say]")

		saynn("She is clearly teasing you but who cares. Your dopamine levels spike, you feel.. good.")

		saynn("[say=eliza]Open your mouth, inmate.[/say]")

		addButton("Open mouth", "You really wanna obey..", "open_mouth")

	if(state == "disobey"):
		saynn("You wanna test yourself. Your mind really wants you to say it but you’re keeping quiet, for now. You feel very uncomfortable. You are swaying to the sides, making the leash rattle, anything to try and distract yourself.")

		saynn("[say=eliza]Mhm~? You know that it’s pointless. Your mind uses your own willpower against you. This won’t end until you give in. But sure, I don’t mind watching you squirm~.[/say]")

		saynn("At this point your brain is working against you. Think about it.. Nothing bad is gonna happen if you say it.. You want it. Reward is so much better than a punishment. Maybe if you say it letter by letter it won’t count as cheating. Huff.. This feels awful, why are you doing this. You know what, fuck it.")

		saynn("[say=pc]I’m {pc.name}![/say]")

		saynn("You let out a cute moan and start panting audibly. The uncomfortable feeling goes away, replaced by.. bliss. Eliza caresses your cheek.")

		saynn("[say=eliza]Wasn’t so hard, was it~?[/say]")

		saynn("[say=pc]This can be used for so many wrong reasons..[/say]")

		saynn("[say=eliza]That’s why we’re testing it. So we can protect ourselves from its effects. Though, you know, it’s also pretty fun. And you love it, don’t you. Say it.[/say]")

		saynn("Even thinking about lying makes that bad feeling return. No, you don’t want it.")

		saynn("[say=pc]Yes, I love this..[/say]")

		saynn("[say=eliza]Open your mouth~[/say]")

		addButton("Open mouth", "You really wanna obey..", "open_mouth")

	if(state == "open_mouth"):
		saynn("You open your mouth and stick your tongue out for Eliza. Your cheeks blush but you feel like It’s the only right thing. Eliza moves her hand to your mouth and rests two digits on your tongue.")

		saynn("[say=eliza]Start sucking~[/say]")

		saynn("So humiliating. You close your lips around her digits and proceed to gently suckle them. You slide your tongue back and forth, coating the fingers in your mouth with your saliva. Eliza watches you and bites her lip, she starts gently pumping her digits in and out, fucking your mouth.")

		saynn("[say=eliza]I wonder. Don’t you dare bite me.[/say]")

		saynn("It’s not like you were planning to but now you’re unable to do it physically. Eliza uses her free hand to grab another syringe off her belt and then fills it with the same drug. Your eyes open wide when she does that but you can’t stop sucking and licking her digits.")

		saynn("[say=eliza]What~? We gotta test it~. You will take it, like a good test subject that you are.[/say]")

		saynn("Your eyes show embarrassment. And helplessness. You moan softly through the doctor's digits and give her access to your neck again. She carefully injects you with the second dose. So warm..")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		playAnimation(StageScene.Solo, "kneel")
		
		saynn("[say=eliza]I wanna see an obedient inmate.[/say]")

		saynn("Oh no.. Your mind hears it and swiftly proceeds to trap your remaining freewill away. Your eyes look so subby, you begin to eagerly suck on Eliza’s digits, trying to get more into your mouth where your tongue works on them. It feels so good, you feel like you don’t need anything else. You just found your true purpose, to serve Eliza, do anything she orders, be anything she tells you to be..")

		saynn("[say=eliza]You can stop licking~.[/say]")

		saynn("She pulls her digits out and dries them against your cheeks. More humiliation but you don’t care, you keep your mouth opened for her, drooling and waiting eagerly for the next order.")

		saynn("Eliza starts to take off the straitjacket from you, she loosens all the straps and belts, unlocks the many little padlocks and yanks it off, rendering you naked. She then points down at the floor just before her.")

		saynn("You don’t need many words, you drop down from the table and get on your knees before her. She rests her hand on your head.")

		saynn("[say=eliza]You’re gonna address me as Mistress.[/say]")

		saynn("[say=pc]Yes, Mistress..[/say]")

		saynn("[say=eliza]Show me how you worship your Mistress.[/say]")

		# (options are lick toes, lick panties,

		addButton("Lick toes", "Worship her feet..", "lick_toes")
		addButton("Lick panties", "Worship her pussy", "lick_panties")

	if(state == "lick_toes"):
		saynn("You lower yourself to her feet and nuzzle each one. Eliza smirks, the pastel-yellow fur on her legs is covered by black half-transparent thighs, but not her feet, you gently grab one, lift it, and start giving it a light massage with your hands. You knead each her animal toe separately, then rub her pink beans, the footpads that she is walking on. Then you lower that foot and switch your attention to the second one.")

		saynn("[say=pc]I’m glad I’m serving you, Mistress..[/say]")

		saynn("[say=eliza]Well thank you. Do you like my toes?[/say]")

		saynn("[say=pc]Yes, they are incredible, Mistress..[/say]")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Your pussy is dripping juices onto the floor, you’re so turned on by what you are doing.. You’d finger yourself to an orgasm there and now but your mind is fully consumed by the idea of being a perfect sub.")

		# (if has a cock)
		elif(GM.pc.hasPenis()):
			if(GM.pc.isWearingChastityCage()):
				saynn("Your {pc.cock} is hard already, putting pressure on your chastity and dripping pre onto the floor, you’re so turned on by what you are doing.. You’d stroke yourself to an orgasm there and now but your mind is fully consumed by the idea of being a perfect sub.")
			else:
				saynn("Your {pc.cock} is rock hard already, dripping pre onto the floor, you’re so turned on by what you are doing.. You’d stroke yourself to an orgasm there and now but your mind is fully consumed by the idea of being a perfect sub.")

		saynn("You stick your tongue out and begin dragging it along Eliza’s beans, licking each one. Then you thrust it between her toes and give the claws there a lick too. She looks down at you and smirks, her eyes clearly show lust too, her hand sneaks under her labcoat and begins squeezing and groping her own breasts.")

		saynn("[say=eliza]Such a good subby pet..[/say]")

		saynn("After you’re done with worshiping her toes, she pulls her leg back and instead uses it to spread your legs. You keep them fully spread for her.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Then she shifts her leg closer to your crotch, sneaks it under you. Your wet cunt already drips juices onto it..")

			saynn("[say=eliza]If you like my feet so much you may use them to get off~[/say]")

			saynn("That’s all you needed to hear, you spread your legs as much as possible, your needy slit touched Eliza’s toes. You start moving your lower part of the body back and forth, grinding your pussy against the doctor’s feet, her fur quickly gets coated with your juices. It feels strange.. yet so good.. You can’t stop pleasuring yourself, you basically hump that leg, moaning and squirming, your clit rubbing against the animal toes.")

		# (if has cock)
		elif(GM.pc.isWearingChastityCage()):
			saynn("Then she shifts her leg to your chastity cage. Your dick is forced to be limp but it’s still dripping quite a lot of pre. Eliza sits on the table and captures your cage between her feet.")
			
			saynn("[say=eliza]Well then, if you like my feet so much you may use them to get off~[/say]")
			
			saynn("That’s all you needed to hear, you start thrusting your caged up cock between the tight opening while she rubs her toes against the tip of your cage and against your balls. You can’t stop pleasuring yourself, you basically hump her feet, moaning and squirming, desperate to get at least some stimulation, your cock wants to throb real hard through that damn cage.")
		elif(GM.pc.hasPenis()):
			saynn("Then she shifts her leg to your cock. You’re hard and still dripping pre. Eliza sits on the table and captures your cock between her feet.")

			saynn("[say=eliza]Well then, if you like my feet so much you may use them to get off~[/say]")

			saynn("That’s all you needed to hear, you start thrusting your cock between the tight opening while she rubs her toes against the tip of your {pc.cock}. It feels so good. You can’t stop pleasuring yourself, you basically hump her feet, moaning and squirming, your cock already throbbing hard.")

		# (if cock or pussy)
		if(GM.pc.hasVagina() || GM.pc.hasPenis()):
			saynn("You look up at Eliza and see her playing with herself, her hand inside her black panties, rubbing her clit. She lets out short lustful moans while you use her legs for your pleasure. Her second hand is under her top, groping her breasts.")

			saynn("[say=eliza]Bet you’d cum right now if I’d order you~?[/say]")

			saynn("[say=pc]Yes, Mistress..[/say]")

			saynn("[say=eliza]Cum, pet~[/say]")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("And just like that, you cry out a moan and slump down, pushing your pussy into Eliza’s leg harder, you shiver and squirm while your slit squirts juices all over the doctor’s fur. The climax and your submissiveness multiply together, causing your mind to blank for a second. When you get a hold of yourself, you lower yourself to her feet again and lick-clean your mess.")

		# (if has cock)
		elif(GM.pc.hasPenis()):
			if(GM.pc.isWearingChastityCage()):
				saynn("And just like that, you cry out a moan as your cock starts shooting {pc.cum} through the little hole in your chastity cage all over Eliza’s legs, her feet and toes. You shiver and squirm while she milks your balls dry. The climax and your submissiveness multiply together, causing your mind to blank for a second. When you get a hold of yourself, you lower yourself to her feet again and lick-clean your mess.")
			else:
				saynn("And just like that, you cry out a moan as your cock starts shooting {pc.cum} all over Eliza’s legs, her feet and toes. You shiver and squirm while she milks your balls dry. The climax and your submissiveness multiply together, causing your mind to blank for a second. When you get a hold of yourself, you lower yourself to her feet again and lick-clean your mess.")

		# (if has cock or pussy)
		if(GM.pc.hasVagina() || GM.pc.hasPenis()):
			saynn("You hear that Eliza starts cumming too, she drags out her moans for a long time as her legs and arms tremble from each wave of pleasure. It’s honestly pretty cute. But not as cute as you and the mess you created.")

		saynn("[say=eliza]Ah-h~. Aren’t you an adorable toy. This was a great success, huh~[/say]")

		saynn("She grabs your leash and your unlocked straitjacket.")

		saynn("[say=eliza]Time to bring you back. I think you will walk like that, naked and on all fours~[/say]")

		saynn("[say=pc]Of course, Mistress. Thank you..[/say]")

		saynn("She rewards you with many headpats and then walks you out of the lab.")

		addButton("Follow her back", "See where she brings you", "follow_her_back")

	if(state == "lick_panties"):
		saynn("You shove your head under her long skirt and raise it, exposing her girly thighs and black panties. Then you stick your tongue out and begin nuzzling and licking the fabric there. You can feel the outline of her petals as your tongue travels across her panties, you find a little bump near the top and rub it, forcing a cute moan out of your Mistress.")

		saynn("[say=pc]I’m glad I’m serving you, Mistress..[/say]")

		saynn("[say=eliza]Well thank you. Do you like my panties? My pussy?[/say]")

		saynn("[say=pc]Yes, they are incredible, Mistress..[/say]")

		saynn("She puts her hand on your head and gives you more scritches. You breathe warmly and continue working, eagerly licking her clit and pussy lips through the panties. Her female scent is incredible, you feel like you are ready to be her servant forever, just so you can worship that pussy every day. The doctor’s eyes clearly show lust too, her hand sneaks under her labcoat and begins squeezing and groping her own breasts.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("All the while your own needy pussy is neglected. You rub your legs together, desperately trying to get any stimulation. But are of course entirely focused on worshiping Eliza first.")

		# (if has cock)
		elif(GM.pc.hasPenis()):
			saynn("All the while your {pc.cock} is being neglected. You rub your legs together, desperately trying to get any stimulation. But are of course entirely focused on worshiping Eliza first.")

		saynn("[say=eliza]Trying to make me cum, huh~. Such a good pet[/say]")

		saynn("Eliza’s moans become more frequent, you prod at the spot where her pussy entering is but the cloth blocks it so you just keep lapping at it, quickly bringing the doctor to her peak. She parts her lips and produces a series of dragged-on pleasure noises, it’s honestly kinda cute. She tries to close her shaking legs around your head while you breathe warmly at her panties and get their strong scent.")

		# (if has pussy or cock)
		if(GM.pc.hasVagina() || GM.pc.hasPenis()):
			saynn("[say=eliza]Ah-h~. You probably wanna cum too, huh~?[/say]")

			saynn("You speak under her skirt.")

			saynn("[say=pc]Yes, Mistress.. But.. It’s your choice..[/say]")

			saynn("[say=eliza]Well, cum for me, my toy~[/say]")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("And suddenly, you cry out a moan as you slump down. You shiver and squirm while your slit squirts juices all over the floor. The climax and your submissiveness multiply together, causing your mind to blank for a second.")

		# (if has cock)
		elif(GM.pc.hasPenis()):
			if(GM.pc.isWearingChastityCage()):
				saynn("And suddenly, you cry out a moan as your cock starts shooting {pc.cum} through the little hole in your chastity cage all over the floor. You shiver and squirm while she milks your balls dry just by exploiting your poor mind. The climax and your submissiveness multiply together, causing your mind to blank for a second.")
			else:
				saynn("And suddenly, you cry out a moan as your cock starts shooting {pc.cum} all over the floor. You shiver and squirm while she milks your balls dry just by exploiting your poor mind. The climax and your submissiveness multiply together, causing your mind to blank for a second.")

		saynn("[say=eliza]Aren’t you an adorable toy. This was a great success, huh~[/say]")

		saynn("She grabs your leash and your unlocked straitjacket.")

		saynn("[say=eliza]Time to bring you back. I think you will walk like that, naked and on all fours~[/say]")

		saynn("[say=pc]Of course, Mistress. Thank you..[/say]")

		saynn("She rewards you with many headpats and then walks you out of the lab.")

		addButton("Follow her back", "See where she brings you", "follow_her_back")

	if(state == "follow_her_back"):
		aimCamera("medical_paddedcell_player")
		GM.pc.setLocation("medical_paddedcell_player")
		playAnimation(StageScene.Solo, "kneel")
		setLocationName("Padded cell")
		
		saynn("You crawl behind Eliza as she walks you through some more corridors, she is nice enough to walk slowly so you can catch up. Nurses aren’t that used to seeing completely naked inmates so you’re met with many curious glances. You sway your {pc.thick} {pc.masc} hips as you crawl, your head is tilted down, showing how submissive you are.")

		saynn("Eliza brings you back to your padded cell and then puts the straitjacket back on you.")

		saynn("[say=eliza]Be good~. The data that got collected is invaluable.[/say]")

		saynn("You obey and listen even when Eliza leaves you alone in your cell. Now when is that drug gonna metabolize.. who knows..")

		# (scene ends)
		
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "continue"):
		runScene("ParadedOnALeashScene", ["eliza", GM.pc.getLocation(), "med_researchlab", [
			"Almost there, patient",
			"Today's experiment should be interesting",
			"Smile to the nurses",
			"We will do a follow up on a previous experiment today",
		]])
	
	if(_action == "sayrealname"):
		MedicalModule.addPCBehavior(0.05)
	
	if(_action == "open_mouth"):
		MedicalModule.addPCBehavior(0.1)
	
	if(_action == "disobey"):
		GM.pc.addPain(30)
		MedicalModule.addPCSanity(-0.1)
		#MedicalModule.addPCBehavior(-0.1)
	
	if(_action in ["lick_toes", "lick_panties"]):
		#MedicalModule.addPCBehavior(0.1)
		GM.pc.orgasmFrom("eliza")
		GM.pc.addSkillExperience(Skill.SexSlave, 20)
		GM.pc.addCredits(1)
		addMessage("You received 1 work credit!")
		
		setModuleFlag("MedicalModule", "Mental_ExpObeyDrug", Util.maxi(2, getModuleFlag("MedicalModule", "Mental_ExpObeyDrug", 0)))

	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)


