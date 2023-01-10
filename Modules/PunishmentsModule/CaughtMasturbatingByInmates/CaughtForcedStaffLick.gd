extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "CaughtForcedStaffLick"

func _run():
	if(state == ""):
		addCharacter("femaleguard_feline")
		playAnimation(StageScene.Duo, "stand", {npc="femaleguard_feline"})

	if(state == ""):
		saynn("You were busy sneakily teasing yourself in front of everyone when you heard a strict female voice behind you.")

		saynn("[say=femaleguard_feline]Hey![/say]")

		saynn("Turning around to face her, you see a guard cat with an exceptionally mean face expression. She is keeping her distance, her paw is resting on her belt that holds all the tools and her weapon.")

		saynn("[say=femaleguard_feline]On your knees, hands behind your head. I won’t ask twice, inmate.[/say]")

		# (if cuffed arms)
		if(GM.pc.hasBoundArms()):
			saynn("You rattle your chains for her.")

			saynn("[say=pc]Can’t exactly do that.[/say]")

			saynn("[say=femaleguard_feline]Quit being a smartass and hit the floor.[/say]")

			# (end)

		saynn("[say=pc]And what if I don’t wanna do that?[/say]")

		saynn("Kitty guard shows off her fangs and caresses a button on her shock remote, threatening. She made her point quite clear.")

		addButton("Obey", "Get on your knees and let her play with you", "obey")
		addButton("Attack her", "This might go pretty bad. But maybe that’s what you want", "attack_her")

	if(state == "attack_her"):
		playAnimation(StageScene.Duo, "defeat", {npc="femaleguard_feline"})
		
		saynn("You track her with your eyes and begin lowering yourself, pretending to behave. But all this time you were just preparing to dash towards her. Kitty seems to calm somewhat after seeing you obey, perfect moment to strike. You suddenly take off and sprint towards the cat, pushing away from the floor and pouncing.")

		saynn("The guard gasps and swiftly reacts, her clawed digit taps the button on the prepared remote, making your collar send out a powerful shock. Ow. Your muscles tense up, forcing your body to curl up before hitting the cold floor, short of the guard. She taps you softly with her boot to make sure you are breathing.")

		saynn("[say=femaleguard_feline]Really?[/say]")

		saynn("Kitty guard would shove her boot into your belly and then uncurl you before pinning to the floor. She looks down at you, her face shows disappointment.")

		saynn("[say=femaleguard_feline]Pathetic display. I’d spit on you but that would make you horny.[/say]")

		saynn("She hovers her boot over your belly and then steps over you, forcing all the air out of you as she does it.")

		saynn("[say=femaleguard_feline]That will be your punishment.[/say]")

		saynn("The guard produces some restraints.")

		# (puts restraints on player)

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")


	if(state == "obey"):
		playAnimation(StageScene.Duo, "kneel", {npc="femaleguard_feline"})
		
		saynn("[say=pc]Alright, relax. I’m obeying.[/say]")

		saynn("You raise your hands and put them behind your head while getting onto your knees. You tilt your head down and watch the floor while the guard kitty is approaching with something in her paw, some black piece of fabric.")

		saynn("[say=femaleguard_feline]If you resist I will make sure to make your neck regret it.[/say]")

		saynn("[say=pc]Huh?[/say]")

		saynn("She pulls your head closer using your collar and starts wrapping that fabric around your head, blindfolding you. Even one layer of it leaves you blind and helpless, barely any light is coming through. But the kitty makes sure to wrap a few more layers before tying it up with a tight knot behind your head.")

		saynn("[say=pc]What are you doing?[/say]")

		saynn("[say=femaleguard_feline]Shut up.[/say]")

		saynn("She finishes her job and takes a step back. You can only sit still and wait now while holding your hands behind your head. You hear the guard doing something with her armor, her belt gets undone.")

		saynn("[say=femaleguard_feline]You’re lucky I didn’t decide to just throw your ass into stocks for public indecency.[/say]")

		saynn("Huh, you don’t hear her anymore after that.")

		addButton("Continue", "See what happens next", "cummedon")

	if(state == "cummedon"):
		saynn("Suddenly you feel soft pussy lips pressed against your face. The girl is quite aroused down there, her folds are wet and give off a scent of a horny female cat. The guard isn’t being playful with you, she holds a paw on the back of your head, forcing you harder into her crotch.")

		saynn("[say=femaleguard_feline]Now lick~.[/say]")

		saynn("You’re quite surprised by a sudden slit brushing against your lips, you move back and let out a noise of confusion before the guard delivers a refreshing slap on your cheek and shoves her needy pussy into your face again.")

		saynn("[say=femaleguard_feline]Stop fucking around and lick me out.[/say]")

		saynn("She acts rough and sounds angry so you swiftly expose your tongue and begin dragging it over the pussy mound. Your tongue finds the girl’s clit and focuses on it, tracing little circles around with its tip. You can’t see the cat or her pussy which makes it more arousing, you only hear her little moans that she tries to hide and feel her sex producing more juices.")

		saynn("[say=femaleguard_feline]Yeah, at least your mouth is good for something.[/say]")

		saynn("Kitty then holds your head while dragging her slit all over it, forcing her horny female scent into you, you stick your tongue out and she practically grinds it, sliding herself up and down on it while moaning more.")

		saynn("You feel that she is getting closer, she stops grinding your face and instead hovers above your tongue, its tip finds her needy pussy hole and manages to slip inside as she lowers herself onto it. You tense it up as much as you can and feel her bouncing up and down on it, riding and pleasuring herself with it until suddenly cumming. You feel her inner walls clenching around your tongue, massaging it while a sudden fountain of transparent fluids hits your face as she squirts, making your blindfold wet.")

		saynn("[say=femaleguard_feline]F-fuck~[/say]")

		saynn("She pulls your face into her sensitive flesh, stealing your ability to breathe for a second while she rides the rest of her orgasmic waves. Then she just shoves you away and takes a step back while trying to catch her own breath.")

		saynn("[say=pc]Ow.. I.. I did everything you asked.[/say]")

		saynn("[say=femaleguard_feline]So? That was expected from you.[/say]")

		saynn("And just like that, you hear her grabbing her things and leaving. You stay with your arms raised for a bit longer, just make sure she is not around. Red blush shines on your wet face.")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")


func _react(_action: String, _args):

	if(_action == "obey"):
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))
		
	if(_action == "attack_her"):
		GM.pc.addPain(100)
		
		for item in GM.pc.getInventory().forceRestraintsWithTag(ItemTag.CanBeForcedByGuards, RNG.randi_range(1, 2)):
			addMessage(item.getForcedOnMessage())

	if(_action in ["cummedon"]):
		processTime(60*6)
		GM.pc.cummedOnBy("femaleguard_feline")
		GM.pc.addLust(40)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

