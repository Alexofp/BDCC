extends SceneBase

var isCaged = false
var howBroken = 0.0

func _init():
	sceneID = "AvySlutwallScene"

func _run():
	if(state == ""):
		isCaged = getFlag("FightClubModule.AvyGotCaged", false)
		addCharacter("avy", ["naked"])
		playAnimation(StageScene.Slutwall, "idle", {pc="avy", bodyState={naked=true, hard=true, caged=isCaged}})
		saynn("Avy is stuck in the slutwall, her ass, "+str("caged up cock" if isCaged else "hard canine cock")+", tail, thighs, hands and feet are all on display. She is completely helpless, the chains keep her immobilized and the thick wall means she wouldn't even know who is using her.")

		saynn("There is a piece of cardboard above her that says 'Avy The Fallen Hero' and also a note near her that says 'Anal - FREE, condoms not allowed, break the bitch!'.")

		saynn("What do you wanna do?")

		if (isCaged):
			addButton("Remove cage", "Take off that cage off her dick", "take_cage_off")
		else:
			addButton("Chastity cage", "Put a cage on her dick!", "put_cage_on")
		addButton("Free Avy", "She had enough", "ask_free")
		addButton("Leave", "Enough fun", "endthescene")
	if(state == "put_cage_on"):
		playAnimation(StageScene.SlutwallSex, "tease", {pc="avy", bodyState={naked=true, hard=true, caged=isCaged}})
		saynn("Looking at that free canine cock that just doesn't wanna go soft, you get a great idea. You go ahead and pay the Announcer a quick visit before asking him for a chastity cage. He gives you one for free when he hears that it's for Avy.")

		saynn("With a sly smile on your face, you return back to the slutwall. In your hands you're holding a cute pink chastity cage that is surely a few sizes too small for Avy's cock. But that's part of the fun.")

		if (howBroken < 0.5):
			saynn("Time to do this. Avy cock is hard but at least the knot is not fully inflated so the ring part of the cage slips past it after you put some effort into it. The foxy feels that something is happening with her cock and starts thrashing against the chains.. desperately.")

			saynn("[say=avy]Hey, don't do that! Help me! I will pay you! Credits, all of them![/say]")

			saynn("She can't see you but hearing your giggling makes Avy sigh loudly.")

			saynn("[say=avy]Fuck, it's you..[/say]")

			saynn("You press the second part of the cage against the head of Avy's canine cock and begin putting more and more pressure, trying to connect it to the ring while battling her erection. Eventually you manage to do that so you just insert the little key and turn it, locking Avy's cock away and forcing it to stay in her sheath.")

			saynn("[say=avy]Ngh-h.. Fuck..[/say]")

		else:
			saynn("Time to do this. Avy cock has seen better days but it's still hard and the knot is not fully inflated so the ring part of the cage slips past it after you put some effort into it. The foxy feels that something is happening with her cock and moans loudly from the stimulation.")

			saynn("[say=avy]Ah.. You're gonna lock her cock, aren't you?..[/say]")

			saynn("She can't see you but hearing your giggling makes Avy sigh loudly.")

			saynn("[say=avy]Sluts don't need their cocks to pleasure people..[/say]")

			saynn("You press the second part of the cage against the head of Avy's canine cock and begin putting more and more pressure, trying to connect it to the ring while battling her erection. Eventually you manage to do that so you just insert the little key and turn it, locking Avy's cock away. But as soon as you do that, Avy suddenly cums, arching her back while a few weak strings of her cum squeeze through the little hole in the chastity cage.")

			saynn("[say=avy]Fu-uck.. Ah.. Shit..[/say]")

			saynn("She might be slowly getting used to the fact that she is just a slut.")

		addButton("Continue", "That was fun", "main")
	if(state == "take_cage_off"):
		playAnimation(StageScene.SlutwallSex, "tease", {pc="avy", bodyState={naked=true, hard=true, caged=isCaged}})
		if (howBroken < 0.5):
			saynn("Time to remove Avy's cage. You put one hand on her locked dick and hold it steady while the second one retrieves the key and inserts it into the keyhole and begins to turn it. Avy knows that there is only one person who has the key.")

			saynn("[say=avy]You're a bitch, you know that?..[/say]")

			saynn("[say=pc]It's like you're asking to stay caged up. Already learned to enjoy cumming from anal, slut?[/say]")

			saynn("You hear grumbling from the other side of the slutwall.")

			saynn("[say=avy]Fuck you..[/say]")

			saynn("The cage clicks as it gets unlocked, allowing Avy's canine shaft to start peeking out of the sheath more while getting hard. It's pretty even if a caged variant of it is more neat and cute.")

		else:
			saynn("Time to remove Avy's cage. You put one hand on her locked dick and hold it steady while the second one retrieves the key and inserts it into the keyhole and begins to turn it. Avy knows that there is only one person who has the key.")

			saynn("[say=avy]But.. sluts don't need their cocks..[/say]")

			saynn("[say=pc]But I need it.[/say]")

			saynn("You hear moaning from the other side of the slutwall.")

			saynn("[say=avy]Okay.. ah..[/say]")

			saynn("The cage clicks as it gets unlocked, allowing Avy's canine shaft to start peeking out of the sheath more while getting hard. It takes quite a while for her cock to become fully erected. It's like it's learning to stay soft.")

		addButton("Continue", "That went good", "main")
	if(state == "ask_free"):
		saynn("Are you sure you wanna free Avy from the slutwall? You will be able to lock her again if you challenge her for a rematch.")

		addButton("No", "She can say for a little longer", "main")
		addButton("Free Avy", "Enough slutting", "free_avy")
	if(state == "free_avy"):
		playAnimation(StageScene.Duo, "stand", {npc="avy", npcBodyState={naked=true}})
		saynn("Well, Avy had enough fun in that slutwall. Maybe it's time to free her.")

		saynn("[say=pc]I'm gonna free you, don't resist.[/say]")

		saynn("No response. Hopefully she is okay.")

		saynn("You begin by unchaining her legs and hands, freeing them and helping her put them through the holes in the wall.")

		saynn("Then you carefully pull her frame out of the big hole. Oh wow, so that's how her tits and face look. She is kinda emotionless though.")

		saynn("You help Avy get up. She doesn't even seem to be covering herself up. Well, everyone saw her asshole and cock in miniscule detail already but still. She just looks at you, intently.")

		saynn("But then she just starts walking away, probably to get her uniform.")

		saynn("[say=pc]No even a thank you?[/say]")

		saynn("[say=avy]Fuck you.[/say]")

		saynn("Oh yeah, that's the Avy you know. Mean and scary.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "take_cage_off"):
		setFlag("FightClubModule.AvyGotCaged", false)
		isCaged = false
		processTime(5*60)

	if(_action == "put_cage_on"):
		setFlag("FightClubModule.AvyGotCaged", true)
		isCaged = true
		processTime(5*60)

	if(_action == "main"):
		setState("")
		return

	if(_action == "free_avy"):
		setFlag("FightClubModule.AvyGotCaged", false)
		setFlag("FightClubModule.AvyIsInSlutwall", false)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCaged"] = isCaged
	data["howBroken"] = howBroken

	return data

func loadData(data):
	.loadData(data)

	isCaged = SAVE.loadVar(data, "isCaged", false)
	howBroken = SAVE.loadVar(data, "howBroken", 0.0)
