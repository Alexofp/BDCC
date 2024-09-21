extends SceneBase

func _init():
	sceneID = "ElizaBackupPCSaveScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Sleeping, "sleep", {pc="pc"})
		saynn("Empty deafening thoughts rush through your silent mind, disturbing the peace..")

		saynn("[say=eliza]Where is this hecking inmate?[/say]")

		saynn("On second thought.. these might not be your thoughts exactly..")

		saynn("[say=eliza]Don't tell me they shove {pc.him} into a maintenance hatch or something..[/say]")

		saynn("Familiar voice.. getting closer and closer.. Just gotta make sure to not go towards it.. just in case.")

		saynn("[say=eliza]I ain't an engineer. I break things more often than I repair them, hah.[/say]")

		saynn("Your ear picks up air vibrations of a gasp.")

		saynn("[say=eliza]Oh! There we go. Lazy nurses, this wasn't part of my contract when I signed up![/say]")

		saynn("You feel a needle piercing your skin. Ow..")

		addButton("Get up", "You feel your mind waking up..", "do_wakeup")
	if(state == "do_wakeup"):
		playAnimation(StageScene.SexStart, "idle", {pc="eliza", npc="pc"})
		saynn("The pain doesn't go away. In fact, it feels worse now that your mind is coming to its senses..")

		saynn("[say=eliza]Nu huh! Don't turn away on me, I'm not gonna give you 5 more minutes, wake up already, patient.[/say]")

		saynn("[say=pc]My head..[/say]")

		saynn("You hear a quiet giggle. You open your eyes and see a feline sitting near you, wearing a labcoat with a simple top and a pencil skirt.")

		saynn("[say=eliza]"+str( RNG.pick(["I shared one of mine nine lives with you. So you better treasure this one more.", "I hope I didn't give you too big of a dose.. That'd be wasteful! Don't worry, if you start seeing colors, that's completely intentional.", "I've seen test subjects hold up better than you, but hey, you're still in one piece.. more or less.", "You really do make a perfect crash test dummy. Good thing I like fixing broken toys~.", "Next time you blackout, I'll charge you extra for this. Science isn't cheap!", "That drug should bring you back in one piece. And if it doesn't.. at least try to have fun while you can!", "This drug will maybe give you superhuman strength or maybe it'll just make you giggle uncontrollably. Who knows, haha.", "I'll fix you up, but remember, every dose brings you a little closer to being my favorite experiment~.", "You're like my favorite toy - so durable! Let's keep it that way.", "Do try to stay upright this time. My drug stash isn't infinite, and I'm not sharing my personal supply.", "You'll be fine. And if you're not, at least I'll get some interesting data out of it."]) )+"[/say]")

		saynn("What is she.. talking about..")

		saynn("[say=eliza]See you around, patient~.[/say]")

		saynn("She does a quick last visual check..")

		if (GM.pc.hasEffect(StatusEffect.StretchedPainfullyAnus) || GM.pc.hasEffect(StatusEffect.StretchedPainfullyPussy) || GM.pc.hasEffect(StatusEffect.Wounded)):
			saynn("[say=eliza]Looks like you had quite the night.. You should pay me a visit sometime if this doesn't heal. I love testing.. I mean.. helping.[/say]")

		elif (GM.pc.getPainLevel() >= 0.5):
			saynn("[say=eliza]So many bruises.. You should try and sleep them off. I have just the place, very soft~. No? Aw.[/say]")

		else:
			saynn("[say=eliza]You seem to be okay now. Good.[/say]")

		saynn("..and then leaves you alone.")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_wakeup"):
		processTime(3*60)

	setState(_action)
