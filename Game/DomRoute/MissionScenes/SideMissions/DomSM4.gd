extends SceneBase

func _init():
	sceneID = "DomSM4"

func _run():
	if(state == ""):
		saynn("You've been standing in front of the mission board when you suddenly begin hearing angry snarls and noises coming out from the other room.")

		saynn("Better go see what's up.")

		addButton("Continue", "See what happens next", "avy_ferri_angy")
	if(state == "avy_ferri_angy"):
		addCharacter("avy")
		addCharacter("ferri")
		playAnimation(StageScene.Duo, "stand", {pc="avy", npc="ferri"})
		aimCameraAndSetLocName("hideout_chill")
		saynn("[say=avy]Don't make me snap your horns off, bitch.[/say]")

		saynn("[say=ferri]I'm not gonna do what you want![/say]")

		saynn("Avy has Ferri backed against one of the crates. The foxy is taller, her red eyes shining bright, she is looming over the dracat. Ferri is standing her ground, her dragon tail wagging behind her annoyed.")

		saynn("[say=pc]What is happening here?[/say]")

		saynn("Avy looks at you, her eyes narrowed.")

		saynn("[say=avy]The slut has gotten her stupid lab but she refuses to work still.[/say]")

		saynn("Ferri's claws are visibly out.")

		saynn("[say=ferri]I did a thing! I saved you![/say]")

		saynn("Avy crosses her arms.")

		saynn("[say=avy]I don't care, do what you're told. We didn't make you our slave for nothing.[/say]")

		saynn("[say=ferri]Grr-r..[/say]")

		saynn("Ferri looks up at the foxy and just growls, showing her long fangs.")

		saynn("[say=pc]Ferri? Chill. What did Avy tell you to do?[/say]")

		saynn("[say=avy]Bitch is slacking![/say]")

		saynn("[say=pc]Avy, shush.[/say]")

		saynn("Avy lets out a sharp huff and takes a half-step back.")

		saynn("[say=ferri]She wants meds..[/say]")

		saynn("[say=avy]I want painkillers, the good stuff! They only push paracetamol here but that shit is weak. Bitch doesn't want to make tramadol for us.[/say]")

		saynn("Ferri points at the lab setup.")

		saynn("[say=ferri]Avy, we don't exactly have the most sterile space here. Anything I make might as well be poison. And besides.. Tramadol has bad side effects.. It can also cause..[/say]")

		saynn("[say=avy]I know what it can cause, shut your mouth. I don't care. Obey, you useless whore.[/say]")

		saynn("Ferri takes a brave step towards Avy, closing in until their noses almost touch.")

		saynn("[say=ferri]You're stupid, Avy![/say]")

		saynn("Her words are followed by an instant silence. Avy tilts her head to the side a bit.")

		saynn("[say=avy]Huh? What did you just say?[/say]")

		saynn("The air gets tense fast. The foxy's glare is drilling Ferri's shaky eye contact. The dracat is visibly getting smaller under the onslaught.. but still rebellious.")

		saynn("[say=ferri]You're.. stupid.. kinda.. gr..[/say]")

		addButton("Continue", "See what happens next", "avy_threats")
	if(state == "avy_threats"):
		saynn("Avy doesn't shout.. or snarl. Her voice just drops to a low, flat tone.")

		saynn("[say=avy]I guess you forgot your place, girl.. happens sometimes.. it does.[/say]")

		saynn("The foxy's eyes start smoothly following the dracat's curves while she points out certain features.")

		saynn("[say=avy]Can be fixed easily. I guess I will start by breaking some of your fingers. One by one. Snap-snap. Until you won't be able to hold even a beaker..[/say]")

		saynn("Ferri blinks.. and takes a step back, her tail freezes.")

		saynn("[say=avy]Guess I can break your arms too by that point. Make little pieces of bone poking through the skin. You will start bleeding all over your precious lab. I will make you clean it with your own tongue.[/say]")

		saynn("Ferri's breath hitches, her ears go flat, her angry expression turning into a fearful one.")

		saynn("[say=pc]Avy.[/say]")

		saynn("[say=avy]After that.. gonna fuck you. Why not? Right here. You're just gonna drool and whine while I tear you open with my knot.[/say]")

		saynn("Avy approaches and reaches out to trace a claw down Ferri's cheek. Ferri doesn't move.")

		saynn("[say=pc]Quit it.[/say]")

		saynn("[say=avy]Gonna leave your holes gaping. You'll be bleeding for days. Maybe weeks. You're nothing, Ferri. You're our slave. Our toy, to do whatever we want to.[/say]")

		saynn("Avy's claw stops under Ferri's chin. She tilts the dracat's head up.")

		saynn("[say=avy]So make my tramadol. You useless. Worthless. Annoying. Little. Cunt.[/say]")

		saynn("Silence happens again. Ferri's eyes get visibly wet, her jaw getting tight.")

		addButton("Continue", "See what happens next", "ferri_bites")
	if(state == "ferri_bites"):
		playAnimation(StageScene.Duo, "hurt", {pc="avy", npc="ferri", npcAction="bite"})
		saynn("Then something in her snaps.")

		saynn("[say=ferri]GRRRrh![/say]")

		saynn("Ferri lunges, her jaws open wide and clamp down on Avy's shoulder. Hard. Enough to draw blood from the foxy. Avy lets out a painful cry, eyes wide in shock.")

		saynn("[say=avy]AGHH! YOU F-F..[/say]")

		saynn("Avy manages to shove the ferocious dracat away, causing more damage to her shoulder.")

		saynn("Ferri is hissing while Avy is grunting painfully. She really got caught off-guard by the sudden bravery.")

		saynn("[say=avy]Fucking.. brat.. ugh.. I'm gonna fucking kill you.[/say]")

		saynn("You shove yourself in-between before things get any worse.")

		saynn("[say=pc]Stop. Both of you.[/say]")

		saynn("[say=avy]She is gonna regret this. Step aside.[/say]")

		saynn("[say=pc]You're not getting your tramadol, you heard her. It's not safe to make meds here. At least not at the moment.[/say]")

		saynn("[say=avy]Why the fuck did we break her then?[/say]")

		saynn("[say=pc]Other stuff. Her chemistry is what saved us from Eliza. You have to relax now, Avy.[/say]")

		saynn("[say=avy]Ugh.. Whatever. But I want her punished. She bit me! Your bratty slave has forgotten her place.[/say]")

		saynn("[say=ferri]Mow..[/say]")

		addButton("Punish Ferri", "(Avy's Love +) Put Ferri back into her place", "punish_ferri")
		addButton("Punish Avy", "(Avy's Obedience +) Avy went way too far", "punish_avy")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "avy_threats"):
		processTime(10*60)

	if(_action == "punish_ferri"):
		processTime(5*60)

	if(_action == "punish_avy"):
		processTime(5*60)

	setState(_action)
