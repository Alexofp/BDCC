extends SceneBase

func _init():
	sceneID = "Ch5s5TaviPreparationScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="sit"})
		saynn("Tavi is sitting on some crate as you approach her. Nothing out of the ordinary, apart from the crate shaking a little under her.")

		saynn("[say=tavi]Hey there~.[/say]")

		saynn("[say=pc]I've got what we need.[/say]")

		saynn("You show Tavi the datapad and the prototype grenade.")

		saynn("[say=tavi]Perfect![/say]")

		saynn("Tall cat grabs the first item and quickly cracks it open by sliding her claws under the frame and propping it up, breaking it slightly and exposing the wiring.")

		saynn("[say=tavi]It should be somewhere.. here![/say]")

		saynn("Tavi disconnects some internal modules until she finds the one that has a blue crystal lodged into its electrical guts.")

		saynn("[say=tavi]Perfect. See these two pins? One supplies a frequency in an analog form and the second one is just power. Probably. I'm only a hacker.[/say]")

		saynn("She looks at you and notices your emotionless face. Her free paw reaches out to pat you.")

		saynn("[say=tavi]Good job, really. Let's try to cobble it all together. I will need your help.[/say]")

		addButton("Help Tavi", "Do what she tells you to do", "do_help_tavi")
	if(state == "do_help_tavi"):
		saynn("Time passes. You help Tavi disassemble the datapad more and find the right components like buttons or the correct capacitors. It's hard to do when you don't have the right tools but Tavi just about manages, using the power from the battery to melt the copper wires together by short-circuiting them.")

		saynn("[say=tavi]Where did you get it anyway?[/say]")

		if (getFlag("TaviModule.Ch5StoleDatapadFromNova") && getFlag("TaviModule.Ch5BlackmailedNova")):
			saynn("[say=pc]Nova was kind enough to give it to me.[/say]")

			saynn("Tavi giggles while working.")

			saynn("[say=tavi]Is that so, huh~? Tell me more.[/say]")

			saynn("[say=pc]Well.. I just recorded her doing some.. tricks. That pup looks very cute on camera.[/say]")

			saynn("[say=tavi]Oh-h-h~[/say]")

			saynn("Tavi scritches you under the chin.")

			saynn("[say=tavi]Something similar got me into trouble with her. Make sure you cover your tracks up.[/say]")

			saynn("[say=pc]Puppy didn't want me to share it. She probably wants this forgotten more than anyone.[/say]")

			saynn("[say=tavi]Good old blackmail~. Oh, I should have watched the recording first. Wait![/say]")

			saynn("Tavi quickly assembles some of the datapad modules back and connects them to the screen that instantly lights up. She swipes through some menus and then opens the recording that you made.")

			saynn("[say=tavi]Aww~. Isn't she such a good puppy?[/say]")

			saynn("[say=pc]You weren't calling her a good puppy when she was nearby.[/say]")

			saynn("Tavi pouts.")

			saynn("[say=tavi]She just knows what buttons to push, is all.[/say]")

			saynn("Buttons huh. Tavi continues to assemble some kind of little tool that looks like a remote with some wires sticking out. Rough but you don't exactly go for ergonomics here.")

		elif (getFlag("TaviModule.Ch5StoleDatapadFromNova")):
			saynn("[say=pc]Nova was kind enough to give it to me.[/say]")

			saynn("Tavi giggles while working.")

			saynn("[say=tavi]Is that so, huh~? Tell me more.[/say]")

			saynn("[say=pc]Well. It's hard to say no when you're unconscious.[/say]")

			saynn("Tall cat stops working for a second and raises her brows.")

			saynn("[say=tavi]Don't tell me you killed her.[/say]")

			saynn("[say=pc]No, why would I?[/say]")

			saynn("Tavi looks concerned for a second. But then she snaps out of it and continues working.")

			saynn("[say=pc]Do you care that much about Nova?[/say]")

			saynn("[say=tavi]I don't. I don't know. She never really.. hurt me.. you know? Without a good reason I mean.[/say]")

			saynn("[say=pc]Not physically. But what about mentally? I think she broke you.[/say]")

			saynn("Tall kitty shrugs.")

			saynn("[say=tavi]I don't know, cutie. Do I look broken?.. Let's worry about this for now.[/say]")

			saynn("Huh. Tavi continues to assemble some kind of little tool that looks like a remote with some wires sticking out. Rough but you don't exactly go for ergonomics here.")

		else:
			saynn("[say=pc]Stole one from a guard.[/say]")

			saynn("Tavi nods while working.")

			saynn("[say=tavi]Decided to avoid Nova. That's okay.[/say]")

			saynn("[say=pc]Doesn't really matter where I got it from, right?[/say]")

			saynn("She giggles and nods.")

			saynn("[say=tavi]Yeah. They already blocked this one but I just need the hardware.[/say]")

			saynn("[say=pc]But you think I should have gone for Nova?[/say]")

			saynn("She shrugs.")

			saynn("[say=tavi]Might have been more fun. Don't worry about it, cutie.[/say]")

			saynn("Huh. Tavi continues to assemble some kind of little tool that looks like a remote with some wires sticking out. Rough but you don't exactly go for ergonomics here.")

		addButton("Continue", "See what happens next", "tavi_finishes_assembling")
	if(state == "tavi_finishes_assembling"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("After assembling the little janky remote and dialing in the frequency that you tell to Tavi, she moves on to the grenade, attaching a little timer to it and a button so it can actually be activated by a person.")

		saynn("[say=tavi]Alright.. This should be it.[/say]")

		saynn("[say=pc]Are you sure it will work?[/say]")

		saynn("Tavi gets up and hums.")

		saynn("[say=tavi]Only one way to find out.[/say]")

		saynn("She plays with the grenade in her paws while looking at you.")

		saynn("[say=tavi]I have high hopes for this plan.[/say]")

		saynn("[say=pc]What is it exactly?[/say]")

		saynn("[say=tavi]If I tell you, it won't happen.. But. I haven't been sitting on my butt all day. Check this out.[/say]")

		saynn("Tavi turns around and opens the crate that was sitting on. Inside you find.. two guards.. naked and tied up completely.. Their mouths gagged, their eyes blindfolded, their ears have earplugs in them. All they can do is rub against each other and make muffled noises.")

		saynn("[say=pc]Oh wow.[/say]")

		saynn("[say=tavi]I will let them go soon. But I needed this.[/say]")

		saynn("Tavi opens another crate and shows you their guard armor, completed with the fitting helmets even.")

		saynn("[say=tavi]I tried to find the ones that would fit us~.[/say]")

		saynn("[say=pc]Are we doing what I think we're doing?[/say]")

		saynn("She smiles.")

		saynn("[say=tavi]It won't fool them for too long. That's why we gotta be prepared and act fast.[/say]")

		saynn("Tavi closes the crate and walks up to you, her paw grabbing your collar while she tilts her head ever so slightly, like she is about to kiss you..")

		saynn("[say=tavi]We can escape.. And then we will be able to achieve our dreams..[/say]")

		saynn("She leaves a little sweet kiss on your lips..")

		saynn("[say=tavi]Are you ready?.. This won't be easy.[/say]")

		addButton("Yes", "You're ready to do this", "start_big_scene")
		addButton("Not yet", "You need more time", "not_yet_ready")
		addButton("Sexy time?", "How about some lewds first", "ask_lewd")
	if(state == "ask_lewd"):
		saynn("You run your hands over Tavi's back and knead it a little bit. She sees your advances and smirks.")

		saynn("[say=pc]Maybe you would like to.. remove some tension first?[/say]")

		saynn("Her paw lands on your chin as she moves it dangerously close to her lips.. Just to keep you there.")

		saynn("[say=tavi]After today we will be able to have all the sex in the world. Trust me~.[/say]")

		saynn("A little disappointing.. But she doesn't seem like the type that would lie to you.")

		saynn("[say=pc]If you say so, Miss Tavi.[/say]")

		saynn("Tavi reaches for your neck and leaves a little bite on it before whispering into your ear.")

		saynn("[say=tavi]After today, everything will be different~.[/say]")

		saynn("She is not wrong. If you finally escape, everything will indeed be quite different.")

		saynn("[say=tavi]So is my pet ready~?[/say]")

		addButton("Yes", "You're ready to do this", "start_big_scene")
		addButton("Not yet", "You need more time", "not_yet_ready")
	if(state == "not_yet_ready"):
		saynn("[say=pc]I.. need some time to prepare.[/say]")

		saynn("Tavi nods.")

		saynn("[say=tavi]Of course. Let me know when you're ready.[/say]")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_help_tavi"):
		processTime(10*60)

	if(_action == "tavi_finishes_assembling"):
		processTime(10*60)

	if(_action == "start_big_scene"):
		runScene("Ch5s6TaviCaptainScene")
		endScene()
		return

	setState(_action)

func getDevCommentary():
	return "Tavi is a hacker so it might not make the most amount of sense that she can suddenly work with electronics.. But I tried to write in a way that shows her doing her best. She obviously has some knowledge of how components work and stuff.."

func hasDevCommentary():
	return true
