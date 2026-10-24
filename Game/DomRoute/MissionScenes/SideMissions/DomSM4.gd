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
		GM.pc.setLocation("hideout_chill")
		saynn("[say=avy]Don't make me snap your horns off, bitch.[/say]")

		saynn("[say=ferri]I'm not gonna do what you want![/say]")

		saynn("Avy has Ferri backed against one of the crates. The foxy is taller, her blue eyes shining bright, she is looming over the dracat. Ferri is standing her ground, her dragon tail wagging behind her annoyed.")

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

		saynn("Ferri lunges, her jaws open wide and clamp down on Avy's shoulder. Hard. Enough to draw some blood from the foxy. Avy lets out a painful cry, eyes wide in shock.")

		saynn("[say=avy]AGHH! YOU F-F..[/say]")

		saynn("Avy manages to shove the ferocious dracat away without causing too much more damage to her shoulder.")

		saynn("Ferri is hissing while Avy is grunting painfully. She really got caught off-guard by the sudden attack.")

		saynn("[say=avy]Fucking.. brat.. ugh.. Gonna fucking ravage you.[/say]")

		saynn("You shove yourself in-between them before things get any worse.")

		saynn("[say=pc]Stop. Both of you.[/say]")

		saynn("[say=avy]She is gonna regret this. Step aside.[/say]")

		saynn("[say=pc]You're not getting your tramadol, you heard her. It's not safe to make meds here. At least not at the moment.[/say]")

		saynn("Avy rolls her eyes. She pulls out a pill bottle and pops one.")

		saynn("[say=avy]Why the fuck did we break her then?[/say]")

		saynn("[say=pc]Other stuff. Her chemistry is what saved us from Eliza. You have to chill now, Avy.[/say]")

		saynn("[say=avy]Ugh.. Alright. But I want her punished. She bit me! Your bratty slave has forgotten her place.[/say]")

		saynn("You look at the Ferri next. She is still quite.. upset.. her tail is lashing behind her.")

		saynn("[say=ferri]Mow..[/say]")

		addButton("Punish Ferri", "(Avy's Love +) Show Ferri her place", "punish_ferri")
		addButton("Punish Avy", "(Avy's Obedience +) Avy went way too far", "punish_avy")
	if(state == "punish_avy"):
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("[say=pc]I think you deserved it, Avy. I think you actually deserve much more for your threats.[/say]")

		saynn("[say=avy]What? You gonna treat that doormat like she is above me?[/say]")

		saynn("[say=pc]She is not above you. Not below you either. I think you should apologize to your fellow teammate.[/say]")

		saynn("Avy is growling. You understand that she would never do that. You're counting on it.")

		saynn("[say=avy]Fuck you, I won't do that. I'd rather make that slut eat the dirt.[/say]")

		saynn("[say=pc]Ferri, bite her again.[/say]")

		saynn("Ferri didn't need much convincing. She pounced the foxy the instant you gave the order.")

		addButton("Continue", "See what happens next", "avy_tied_up")
	if(state == "avy_tied_up"):
		playAnimation(StageScene.RopesSolo, "struggle", {pc="avy"})
		saynn("You join Ferri and overpower Avy together. Then you use some ropes to tie the foxy up before suspending her above the floor using one of the pipes in the ceiling.")

		saynn("[say=avy]Hey! What the fuck![/say]")

		saynn("When you're done, she is left dangling in the air, squirming, trying to escape.. but that only makes the ropes dig into her fur and cloth harder.")

		saynn("[say=pc]Ferri is waiting.[/say]")

		saynn("[say=avy]Really? You are pathetic. Fucking hell, I will kill you both.[/say]")

		saynn("You sigh and direct your attention towards Ferri.")

		saynn("[say=pc]I guess we should leave Avy for a bit to think about her behaviour. For an hour or three.[/say]")

		saynn("[say=ferri]Sounds good, mew~.[/say]")

		saynn("And so you start walking away.")

		saynn("Avy is growling behind you.. growling and squirm.")

		saynn("As soon as you step out of the room, you hear her voice.")

		saynn("[say=avy]Wait, you fuckers![/say]")

		saynn("You go back and surround the annoyed foxy.")

		saynn("[say=avy]Forget what I said. I was just fucking with you. Okay?[/say]")

		saynn("[say=pc]Are you happy with that, Ferri?[/say]")

		saynn("[say=ferri]I think so. Mew..[/say]")

		saynn("You cup Avy's chin, making her growl softly.")

		saynn("[say=pc]Are you gonna bully Ferri into making shit for you again?[/say]")

		saynn("[say=avy]I wouldn't have to if she would be doing her job.[/say]")

		saynn("[say=pc]I see. Let's go, Ferri. I'm gonna go ask Kait to spend time with her.[/say]")

		saynn("[say=avy]Fine! I won't![/say]")

		saynn("Avy has given up struggling, panting heavily instead. The ropes are digging into her fur, including around her crotch. Avy's shorts look quite bulgy.")

		saynn("[say=pc]Ferri is just as valuable as you to this team. And you are just as valuable as her. Understand?[/say]")

		saynn("[say=avy]Sure..[/say]")

		saynn("[say=pc]We look after each other. We don't threaten each other.[/say]")

		saynn("[say=avy]Yeah, yeah, I get it. Get me the fuck down before Kait sees me like this.[/say]")

		saynn("That's probably as much as you can get out of her. And so you begin untying her.")

		addButton("Continue", "See what happens next", "untie_avy")
	if(state == "untie_avy"):
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("Avy gets up off of the floor and crosses her arms, her mean eyes glaring at the both of you.")

		saynn("[say=pc]You looked cute tied up.[/say]")

		saynn("[say=ferri]I agree~.[/say]")

		saynn("[say=avy]Shut up, both of you.[/say]")

		saynn("And so she walks away.")

		saynn("[say=ferri]I will be going too I think..[/say]")

		saynn("[say=pc]Sure. Don't let Avy bully you around.[/say]")

		saynn("[say=ferri]I will bite her again if she tries, mew.[/say]")

		saynn("You chuckle. It might end badly for Ferri. But maybe she wants it.")

		saynn("Mission completed!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "punish_ferri"):
		playAnimation(StageScene.Duo, "stand", {npc="ferri"})
		saynn("[say=pc]Ferri. You really should learn your place already.[/say]")

		saynn("[say=ferri]Mew?.. But she was threatening me![/say]")

		saynn("You pull out some ropes. Avy seems to understand what you want to do.")

		saynn("[say=pc]Hold her, Avy.[/say]")

		saynn("[say=avy]With pleasure~.[/say]")

		saynn("Not even a second passes before Avy pins Ferri to the floor, already undressing her.")

		saynn("[say=ferri]Hey! Ah![/say]")

		saynn("You start tying the brat up.")

		addButton("Continue", "See what happens next", "ferri_tied_up")
	if(state == "ferri_tied_up"):
		playAnimation(StageScene.RopesSolo, "struggle", {pc="ferri", bodyState={naked=true}})
		addCharacter("ferri", ["naked"])
		saynn("Avy is holding growling Ferri still while you undress and tie her up before suspending her above the floor by throwing the ropes over the ceiling pipe.")

		saynn("Ferri is thrashing against the ropes, her naked body tries to twist and pull. But that only makes the ropes dig into her fur more, getting all tight around her chest and her thighs.. as well as right between her legs. She lets out a sharp gasp as the rope presses against her pussy.")

		saynn("[say=ferri]Nngh! You fu.. ah..[/say]")

		saynn("[say=pc]Watch your mouth, brat.[/say]")

		saynn("You give her ass a firm spank, so loud that the echo bounces off the walls multiple times. Ferri cries out, her tail lashing wildly behind her.")

		saynn("[say=ferri]Grrrr-r.. I will bite you all! Let me down![/say]")

		saynn("Another spank sends her curvy ass to jiggle. Her tail whips harder.. so you grab it and tie it to the rope above until she can't move it at all. She growls more.")

		saynn("[say=ferri]Meanies![/say]")

		saynn("[say=avy]What a slut, are you dripping already?[/say]")

		saynn("Avy is right, the fur looks a bit wet around her crotch.")

		saynn("[say=ferri]Shut up! That's just.. it's not me.. uh..[/say]")

		saynn("[say=pc]Sure.[/say]")

		saynn("You produce a ballgag. Ferri's eyes go wide.")

		saynn("[say=ferri]No no no-.. mphh..[/say]")

		addButton("Continue", "See what happens next", "ferri_gets_gagged")
	if(state == "ferri_gets_gagged"):
		playAnimation(StageScene.RopesOralSex, "tease", {pc="ferri", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You push the ball past her sharp teeth and tighten the head harness around her face. She tries to push it out but can't. Then you tie a blindfold around her eyes, plunging her into complete darkness.")

		saynn("[say=ferri]MHhhh-h..[/say]")

		saynn("[say=avy]Much better, in my opinion.[/say]")

		saynn("Ferri is still squirming and growling.. through the gag now. Her body rocks in the ropes, making the rope between her legs rub back and forth. She shivers, some of her growls turning into muffled whines.")

		saynn("[say=pc]You're staying like this for now.[/say]")

		saynn("She huffs.. but she doesn't really have a choice.")

		saynn("[say=pc]Let's go chill for now, Avy.[/say]")

		saynn("[say=avy]Sure~.[/say]")

		saynn("And so you leave Ferri be like this for about twenty minutes.")

		saynn("When you return, you see that she isn't fighting anymore. Her body is just idly swaying slightly, drool runs down her chin around the ballgag. Her thighs are all soaked with her juices. She is breathing slowly and shaky, letting the ropes hold her.")

		saynn("[say=pc]Should be enough.[/say]")

		addButton("Continue", "See what happens next", "undo_ferri_gag")
	if(state == "undo_ferri_gag"):
		saynn("You undo the ballgag and pull off the blindfold. Ferri blinks at the light, squinting from the sudden brightness.")

		saynn("[say=pc]How are you doing now, Ferri?[/say]")

		saynn("[say=ferri]..mew..[/say]")

		saynn("She looks at you, her eyes subby.")

		saynn("[say=pc]Learned your place yet?[/say]")

		saynn("[say=ferri]..yes..[/say]")

		saynn("You give her a pat.")

		saynn("[say=pc]Good. You don't have to make stuff for Avy. But don't bite her.[/say]")

		saynn("[say=ferri]I will be good.. mew..[/say]")

		saynn("Looks like the brat broke a bit. Her eyes are flat with her head.")

		saynn("[say=pc]Let's get you down then.[/say]")

		addButton("Continue", "See what happens next", "ferri_after_down")
	if(state == "ferri_after_down"):
		playAnimation(StageScene.Duo, "stand", {npc="ferri"})
		saynn("And so you lower her down to the floor before untying her limbs. She is indeed.. quite wet.")

		saynn("[say=pc]What do you think, Avy? Did the brat suffer enough?[/say]")

		saynn("[say=avy]No. But it will do.[/say]")

		saynn("[say=ferri]Mow..[/say]")

		saynn("Mission completed!")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "avy_threats"):
		processTime(10*60)

	if(_action == "punish_ferri"):
		processTime(5*60)
		GM.main.MS.setDecision("punish", "ferri")

	if(_action == "punish_avy"):
		processTime(5*60)
		GM.main.MS.setDecision("punish", "avy")

	if(_action == "avy_tied_up"):
		putOn("avy", "ropeharness")

	if(_action == "untie_avy"):
		putOff("avy", "ropeharness")
		GM.main.MS.completeMission()

	if(_action == "ferri_tied_up"):
		putOn("ferri", "ropeharness")

	if(_action == "ferri_gets_gagged"):
		putOn("ferri", "ballgag")
		putOn("ferri", "blindfold")
		processTime(20*60)

	if(_action == "undo_ferri_gag"):
		putOff("ferri", "ballgag")
		putOff("ferri", "blindfold")

	if(_action == "ferri_after_down"):
		putOff("ferri", "ropeharness")
		GM.main.MS.completeMission()

	setState(_action)
