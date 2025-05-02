extends SceneBase

func _init():
	sceneID = "Eliza0AskJobScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You quickly skim through the paper. One of the options sounds intriguing.. Lab Assistant.. it's written with a pen rather than printed.")

		saynn("[say=pc]Lab assistant? What's that about?[/say]")

		saynn("Quinn looks at the paper herself.")

		saynn("[say=eliza]Oh, yeah. I forgot about that one. No one usually asks.[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("The feline shrugs and blinks cutely, the corners of her mouth raising in a slightly creepy way.")

		saynn("[say=eliza]I have no idea~.[/say]")

		saynn("Her eyes are sparking while she stares at you.")

		saynn("[say=eliza]You love science, huh~? Isn't it great, making breakthroughs, unlocking hidden knowledge, creating prototypes, testing your freshly-made drugs on unsuspecting test subjects.. mmm~..[/say]")

		saynn("She seems to be drifting off somewhere else, her gaze wandering around the lobby..")

		saynn("[say=pc]What is the job about, lady?[/say]")

		saynn("She snaps out of it and frowns.")

		saynn("[say=eliza]I'm doctor Quinn, not just a lady.[/say]")

		saynn("[say=pc]Sure. I just wanted the job details.[/say]")

		saynn("Doctor Quinn hums and rubs her chin.")

		saynn("[say=eliza]This position is exactly what it sounds like. I need a lab assistant. Someone that can help me in the lab.[/say]")

		saynn("[say=pc]What kind of help do you need?[/say]")

		saynn("Huh. Would she really allow any inmate inside the lab?")

		saynn("[say=eliza]I'm a chemist. I'm researching new types of drugs, medical or.. mostly medical of course. But I've been lacking enough time to do proper research lately. Since, I need an assistant.[/say]")

		saynn("Researching drugs.. Could be interesting.")

		saynn("[say=pc]Let's say.. I want to try to fill that position. What do I do?[/say]")

		saynn("Doctor tilts her head slightly and puts on her serious eyes.")

		saynn("[say=eliza]Do you have experience in the chemistry field?[/say]")

		saynn("[say=pc]Depends..[/say]")

		saynn("Suddenly, the feline switches to her rapid voice.")

		saynn("[say=eliza]What is the name of the highly toxic chemical compound that contains a carbon atom triple-bonded to a nitrogen atom and is often associated with certain industrial processes and the poisoning of living organisms?[/say]")

		saynn("[say=pc]Uh..[/say]")

		saynn("[say=eliza]You have one second to answer.[/say]")

		saynn("Panic settles fast.. what..")

		saynn("[say=pc]Um..[/say]")

		saynn("[say=eliza]Beep beep, wrong! The answer is cyanide![/say]")

		saynn("Really?")

		saynn("[say=eliza]What is the name of the compound with the formula NH3, commonly used as a fertilizer and in cleaning products?[/say]")

		saynn("[say=pc]Uh.. wait![/say]")

		saynn("[say=eliza]Ammonia![/say]")

		saynn("More like.. Imma need more time..")

		saynn("[say=eliza]What is the name of the element with the symbol O, essential for respiration in most living organisms and a key component of water?[/say]")

		saynn("[say=pc]Oxygen![/say]")

		saynn("[say=eliza]I'd be surprised if you didn't know that.[/say]")

		saynn("[say=pc]Pfff.[/say]")

		saynn("[say=eliza]What is the name of the coordination complex with the formula [Fe(CN)6]3-, known for its deep blue color and used in various chemical applications?[/say]")

		saynn("What the heck is that formula..")

		saynn("[say=eliza]Ferricyanide! Love that one, by the way.[/say]")

		saynn("[say=pc]C'mon, we already had cyanide![/say]")

		saynn("[say=eliza]What is the name of the organic compound with the formula C14H18O4, commonly known as a type of polyol and used in the production of plastics and resins?[/say]")

		saynn("She is just trying to bury you at this point..")

		saynn("[say=pc]Plastic is made out of oil, I don't know..[/say]")

		saynn("[say=eliza]Pentaerythritol![/say]")

		saynn("[say=pc]How can you even spell that?[/say]")

		saynn("[say=eliza]What is the name of the compound with the formula NaCl, commonly used as a seasoning and preservative?[/say]")

		saynn("Seasoning..")

		saynn("[say=pc]You mean.. salt?[/say]")

		saynn("Doctor Quinn hums.")

		saynn("[say=eliza]Actually, its proper name is Sodium chloride.[/say]")

		saynn("What a nerd.")

		saynn("[say=eliza]2 for 6. That's pretty weak.[/say]")

		saynn("[say=pc]You didn't even give me a proper chance![/say]")

		saynn("[say=eliza]Sounds like excuses. Science has no space for excuses![/say]")

		saynn("You can only sigh.")

		saynn("[say=pc]So?[/say]")

		saynn("[say=eliza]Well..[/say]")

		addButton("Continue", "See what happens next", "after_test")
	if(state == "after_test"):
		saynn("She looks around the lobby, her paw grips her personal coffee mag, her clawed thumb tapping a rhythm on it.")

		saynn("[say=eliza]You know.. You still did better than all others. I usually just get drug junkies.[/say]")

		saynn("A sign of hope?")

		saynn("[say=eliza]But you will have to prove yourself a bit. I can't just trust a random inmate with my precious chemistry lab.[/say]")

		saynn("Sounds reasonable.")

		saynn("[say=pc]Sure. How can I prove myself?[/say]")

		saynn("She scratches her chin.")

		saynn("[say=eliza]Nursery lobby.. the room that's connected to this main lobby.. has a bounty board of sorts. Complete a few tasks there and then I will think about it.[/say]")

		saynn("[say=pc]Nursery? Bounty board? What does that have anything to do with chemistry or researching?[/say]")

		saynn("Doctor frowns.")

		saynn("[say=eliza]There is a direct connection. We put up tasks there because that's what we need to push science forward![/say]")

		saynn("Better not anger the science cat it seems.")

		saynn("[say=pc]Alright. I get it.[/say]")

		saynn("She nods.")

		saynn("[say=eliza]If that is all.. I have coffee I need to drink.[/say]")

		saynn("You let her sip her life juice and step away from the counter..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "after_test"):
		processTime(3*60)
		addMessage("New task added!")
		addMessage("Bounty board is now available in the nursery!")

	setState(_action)
