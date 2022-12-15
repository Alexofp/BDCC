extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MentalCheckup2"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
	if(state == ""):
		saynn("It’s an early morning, you hear someone approaching your cell, the sound of an intercom resonates in your ears. You hear Eliza yawning and then catching herself.")

		# (if bad behavior)
		if(getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) < 0.3):
			saynn("[say=eliza]How is the unwilling test subject doing? Plan on behaving today?[/say]")

		# (if medium behavior)
		elif(getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) < 0.8):
			saynn("[say=eliza]Good morning, inmate. Doing fine? Good.[/say]")

		# (if best heavior)
		else:
			saynn("[say=eliza]How is my favorite test subject doing? Can’t wait to do more with you.[/say]")

		saynn("Eliza opens the door and enters your cell, she seems to be holding something. Some kind of candy.")
		
		saynn("[say=eliza]Gonna give you a treat if you behave, how ‘bout that.[/say]")
		
		addButton("Continue", "Interesting", "continue")
	
	if(state == "continue"):
		saynn("She crouches before you and observes you, your bound body, your exposed {pc.breasts}. Then she grabs your head and looks into your eyes.")

		# (if low sanity)
		if(getModuleFlag("MedicalModule", "Mental_PCSanity", 0.0) < 0.7):
			saynn("[say=eliza]Still recovering but I do see some progress. Although, for now, you are still marked as ‘insane’ in our database. Just to be on the safe side~[/say]")

		# (if high sanity)
		else:
			saynn("[say=eliza]Eye pupils look fine, body temperature is good, mental health seems fine. It’s probably safe to let you go but you know~. Research, who is other than us gonna do it.[/say]")

		saynn("She stands up and takes some time punching the data into her tablet, still holding the candy with her other hand. Then she directs her attention back at you.")

		saynn("[say=eliza]If you want that treat.. well.. I wanna see you act as a good puppy. Or a kitty, I don’t mind cute kitties.[/say]")

		addButton("Bark", "Act like a good puppy", "bark")
		addButton("Meow", "Act like a good kitty", "meow")
		addButton("Moo?", "Act like a good cow", "moo")
		addButton("Growl at", "You’re not some kind of animal. Behavior-", "growl_at")

	if(state == "bark"):
		saynn("You feel slightly humiliated but you really want that treat. You look away and bark a few times.")

		saynn("[say=pc]Bark, bark, bark..[/say]")

		saynn("A cheeky grin flashes on Eliza’s face. She scritches you behind the ear and you can’t stop your leg from kicking the floor. You blush hard.")

		saynn("[say=eliza]Who’s a good puppy~?[/say]")

		saynn("You’re making confused noises! Who is she talking about? You tilt your head to the side.")

		saynn("[say=pc]Mee-e?..[/say]")

		saynn("Eliza puts hands on your cheeks and gives you more scritches.")

		saynn("[say=eliza]Of course it’s you~.[/say]")

		saynn("Then she opens the candy bar and feeds it to you. You open your mouth and eagerly nom it while she showers you with headpats.")

		saynn("[say=eliza]That’s a good puppy. Gonna go check other patients.[/say]")

		saynn("She leaves your cell and closes the door, leaving you alone again. At least you got that treat.")

		# (scene ends)
		addButton("Continue", "That wasn't so bad", "endthescene")

	if(state == "meow"):
		saynn("You feel slightly humiliated but you really want that treat. You tilt your head down.")

		saynn("[say=pc]Meow?.. mew..[/say]")

		saynn("A cheeky grin flashes on Eliza’s face. She boops your nose and watches you go cross-eyed. Then she strokes your head, your chest, your {pc.breasts}. You imitate a feline purr for her, just cause it feels good..")

		saynn("[say=eliza]That’s a good kitty cat. Would snuggle you for hours but I gotta go check on others.[/say]")

		saynn("She opens the candy and places it into your mouth. You nom it eagerly and purr louder. Eliza offers you scritches and then continues on her way, closing your cell and leaving you alone.")

		# (scene ends)
		addButton("Continue", "That wasn't so bad", "endthescene")

		

	if(state == "moo"):
		saynn("You feel slightly humiliated but you really want that treat. You push your chest out and produce a cute animal noise.")

		saynn("[say=pc]Moo.. moo-o..[/say]")

		saynn("Eliza raises her brow and chuckles.")

		saynn("[say=eliza]You’re a cow, huh~. Let’s check.[/say]")

		saynn("She puts her hands on your {pc.breasts} and gives them a firm squeeze, her fingers wrap around your nipples and tug on them, trying to milk you. It feels good, you can’t stop moans from escaping your lips.")

		# (if can milk)
		if(GM.pc.canBeMilked()):
			saynn("And soon enough, drips of {pc.milk} began streaming down your breasts, you’re lactating. Eliza catches some of your {pc.milk} and licks her digits. You moo again..")

			saynn("[say=eliza]Tasty. I should add this into my morning coffee~.[/say]")

		# (if can’t milk)
		else:
			saynn("She did manage to squeeze a very small amount of your milk but nowhere near enough. Still, you moo again for her.")

			saynn("[say=eliza]Hmm.. Should work on these more sometime.[/say]")

		saynn("She opens the candy and places it into your mouth. You nom it eagerly and moo for her.")

		saynn("[say=eliza]Gonna go check on others, sit tight, moo~[/say]")

		saynn("She leaves your cell and closes the door, leaving you alone again. At least you got that treat.")

		# (scene ends)
		addButton("Continue", "That wasn't so bad", "endthescene")

		

	if(state == "growl_at"):
		saynn("You show Eliza your fangs and growl at her. She tilts her head to the side and shakes it.")

		saynn("[say=eliza]That’s not a cute puppy I was asking for. You’re showing me a spoiled bitch.[/say]")

		saynn("She seems very upset with you. She bares her claws and gives your skin a swift scratch. Ow.")

		saynn("[say=eliza]No candy for you then, brat.[/say]")

		saynn("Eliza stands up and leaves your cell. The door slowly closes behind her.")

		# (scene end)
		addButton("Continue", "Ow", "endthescene")

func _react(_action: String, _args):

	if(_action in ["bark", "meow", "moo"]):
		MedicalModule.addPCBehavior(0.05)
		GM.pc.addStamina(50)
		addMessage("That treat gave you some energy!")
	
	if(_action == "moo"):
		var milkAmount = GM.pc.milk(0.1)
		if(milkAmount > 0.01):
			addMessage(str(Util.roundF(milkAmount, 1))+" ml leaked from your breasts")
	
	if(_action == "growl_at"):
		MedicalModule.addPCBehavior(-0.1)
		GM.pc.addPain(20)

	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)


