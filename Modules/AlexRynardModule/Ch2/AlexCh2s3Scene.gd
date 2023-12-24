extends SceneBase

var howManyTimes = 0
var usedCondom = false
var condomBroke = false
var breakChance = 0.0

func _init():
	sceneID = "AlexCh2s3Scene"

func _initScene(_args = []):
	addCharacter("alexrynard")
	howManyTimes = getFlag("AlexRynardModule.ch2s3SceneNum", 0)
	
	if(howManyTimes == 0):
		setState("time1")
		increaseFlag("AlexRynardModule.ch2s3SceneNum")
		return
	if(howManyTimes == 1):
		setState("time2")
		increaseFlag("AlexRynardModule.ch2s3SceneNum")
		return
	if(howManyTimes == 2):
		setState("time3")
		increaseFlag("AlexRynardModule.ch2s3SceneNum")
		return
	if(howManyTimes == 3):
		setState("time4")
		increaseFlag("AlexRynardModule.ch2s3SceneNum")
		return

func _run():
	if(state == ""):
		addCharacter("alexrynard")
	if(state == "time1"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Helping him is the least you can do after everything. You sit nearby and proceed to work, fixing broken datapads and shock remotes.")

		saynn("Alex sits quietly for some time. But then he leans close to you and puts his hand on your shoulder.")

		saynn("[say=alexrynard]Thank you.[/say]")

		saynn("[say=pc]Don't mention it.[/say]")

		saynn("[say=alexrynard]Try and stop me.[/say]")

		saynn("He chuckles and returns to work.")

		saynn("Time flies. For some reason both of you seem to be working faster than before. What used to take you hours now just takes about thirty minutes to do. Could be that you just got more skilled at this.")

		addButton("Continue", "See what happens next", "after_work_check")
	if(state == "toolate"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("Eventually the station's lights begin to dim down, signaling the end of the work day.")

		saynn("Alex hands you the credits for the work.")

		saynn("[say=alexrynard]Good job. We could do something together if you want. Or we can just go our merry ways, that's fine too.[/say]")

		addButton("Just go", "Just go", "endthescene")
		addButton("Trust exercises", "Might as well get a little bit kinky", "start_trust")
	if(state == "aftersomefixing"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("After a few hours of work, it's time to take a break.")

		saynn("Alex hands you the credits for what you have already done.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time2"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You return to the usual grind. Alex does the same. It's so much easier to work together, having someone nearby helps you to focus. It helps him too it seems.")

		saynn("[say=pc]How.. is your back doing?[/say]")

		saynn("[say=alexrynard]Same as before.[/say]")

		saynn("[say=pc]Does it break often?[/say]")

		saynn("[say=alexrynard]It's.. fine. Does what its supposed to do. I don't want to be mean to the creators. It allows me to walk after all.[/say]")

		saynn("You nod. The room stays quiet for some time.")

		saynn("[say=alexrynard]But it's pretty shit. And it was shit even back then.[/say]")

		saynn("[say=pc]Think you would have been able to do a better job?[/say]")

		saynn("Alex sighs.")

		saynn("[say=alexrynard]Back then.. I'd say yes, I would have created something a hundred times better. But not now. I'm not putting my inventions anywhere near my body anymore. Got enough scars.[/say]")

		saynn("[say=pc]Looks like you don't trust yourself.[/say]")

		saynn("He smiles.")

		saynn("[say=alexrynard]You're right, I trust you more.[/say]")

		saynn("You don't even realize.. but you worked through most of what's left of the piles of broken devices without even realizing it.")

		saynn("[say=pc]We're almost done![/say]")

		saynn("[say=alexrynard]Huh. Let's not rush ourselves. Or bad things will happen.[/say]")

		saynn("That's fair.")

		addButton("Continue", "See what happens next", "after_work_check")
	if(state == "time3"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Inspired, you continue fixing the rest of the datapads and broken remotes. You feel like you know each component by heart by now.")

		saynn("You count how many devices are left.. about 9? Wow. Each one takes about an hour to fix.. so it looks like you will just need one more session after this!")

		saynn("[say=alexrynard]They will bring more.. for sure.[/say]")

		saynn("[say=pc]What if you're wrong?[/say]")

		saynn("[say=alexrynard]You can't imagine how much I want to be wrong.[/say]")

		saynn("You decide to shut up and work-work-work!")

		addButton("Continue", "See what happens next", "after_work_check")
	if(state == "time4"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("No extra devices were brought.. so you only have two more to fix each!")

		saynn("[say=alexrynard]No rush, please.[/say]")

		saynn("[say=pc]What, you don't even know what you're gonna do with all the free time?[/say]")

		saynn("[say=alexrynard]Pff. Of course I know.[/say]")

		saynn("You try to pace yourself.. but it's hard to hide the excitement.. even if you do realize that this might not be the end.")

		addButton("Continue", "See what happens next", "time4_done")
	if(state == "time4_done"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("And so.. you tighten up the last screw.. and pop the rear panel back on.. Done. Truly done. No one has brought any new stuff. And all of the backlog is done. Empty. Completed.")

		saynn("Alex seems to be done too.. your stares meet.")

		saynn("[say=pc]So.. What now?[/say]")

		saynn("The workbench is unnaturally empty. So weird.")

		saynn("[say=alexrynard]Um..[/say]")

		saynn("[say=pc]Didn't you want to go talk with the captain?[/say]")

		saynn("[say=alexrynard]Yeah. But I'm tired. I will do it tomorrow. For now.. how about some rest?[/say]")

		saynn("Sounds good.")

		saynn("[say=alexrynard]Nothing kinky, I promise. Just rest.[/say]")

		addButton("Follow", "See what happens next", "time3_gofollow")
	if(state == "time3_gofollow"):
		aimCameraAndSetLocName("eng_workshop")
		GM.pc.setLocation("eng_workshop")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("Alex brings you to the staff break room. A very familiar room by now.")

		saynn("Both of you pop open a soda can each. Refreshing.. especially when it's free.")

		saynn("[say=alexrynard]I will search for something to watch. Just drop yourself onto the sofa.[/say]")

		addButton("Sure", "Just do it", "time3_rest_sure")
		addButton("Yes Sir", "Say this", "time3_rest_yessir")
	if(state == "time3_rest_yessir"):
		saynn("[say=pc]Yes, Sir.[/say]")

		saynn("Alex raises a brow.. but then just smiles when you smile.")

		saynn("[say=alexrynard]You don't really have to say it outside of..[/say]")

		saynn("[say=pc]I know.[/say]")

		saynn("Your smile only becomes wider.")

		saynn("[say=pc]What, you're gonna stop me~?[/say]")

		saynn("The foxy tilts his head, his hand reaching for your collar, tugging you closer to the sofa.")

		saynn("[say=alexrynard]Sit, like a good {pc.boy}.[/say]")

		saynn("[say=pc]Yes, Sir.[/say]")

		addButton("Sit", "Do it", "time3_rest_sure")
	if(state == "time3_rest_sure"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("You take a seat on a sofa that has no right to be this soft. Maybe you're just too used to the inmate furniture being extremely stiff by now..")

		saynn("The TV shows digital static while Alex is going through random cardboard boxes, searching.")

		saynn("[say=alexrynard]There is gotta be something..[/say]")

		saynn("[say=pc]What are you looking for?[/say]")

		saynn("[say=alexrynard]Hold up.. Hell yeah, I found them.[/say]")

		saynn("He grabs two dusty vhs tapes and presents them to you.")

		saynn("[say=alexrynard]So do you want to watch.. Celestial Odyssey or.. Quantum Hearts.[/say]")

		saynn("[say=pc]What are they about?[/say]")

		saynn("[say=alexrynard]I honestly have no idea.[/say]")

		saynn("Second one has the word 'heart' in it so it's probably something romantic..")

		addButton("Celestial Odyssey", "Watch this one", "time3_cel_od")
		addButton("Quantum Hearts", "Watch this one", "time3_qua_her")
	if(state == "time3_cel_od"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("All that romantic stuff is for softies.")

		saynn("[say=pc]First one sounds good.[/say]")

		saynn("Alex quickly slides the tape into the tv's tape player and sits near you. Both you and him are sipping soda while watching the movie.")

		saynn("Obviously it starts with some shots of space. The void is littered with millions of little colorful dots, forming beautiful patterns. But then, at some point, the camera turns to reveal a husk of a planet.")

		saynn("A ship flies into view, the words 'Astral Voyager' clearly visible on its side.")

		saynn("[sayFemale]We were too late..[/sayFemale]")

		saynn("[say=alexrynard]Wow, that ship looks sick. Unpractical but sick.[/say]")

		saynn("Looks like Alex doesn't care much about the plot anymore.")

		saynn("[sayFemale]We have to warn the others![/sayFemale]")

		saynn("Some kind of space anomaly suddenly attacks the spaceship, destroying one of the engines.")

		saynn("[say=alexrynard]Really? Where were your eyes?[/say]")

		saynn("[sayFemale]..we can't win. But we're not allowed to lose hope either, all power to the warpdrive![/sayFemale]")

		saynn("All the stars become smeared lines while watching the ship warp from inside its cockpit.")

		saynn("[say=alexrynard]Ehh, ships don't really warp like that, it's clearly CGI. I will give them props for trying though.[/say]")

		saynn("And so the rest of the movie is spent with the ship racing against the clock, trying to warn planets before the anomaly gets to them. For some reason others don't believe them.. to the point of the main characters having to fight their way through them all. It's a fun, mindless movie with lots of dogfights in space. Alex seems to be quite entertained by it.")

		saynn("With the anomaly defeated.. The credits finally roll..")

		saynn("[say=alexrynard]Wow.. When they had to sacrifice their ship.. That was so sad.[/say]")

		saynn("[say=pc]That was the only way to kill the anomaly.[/say]")

		saynn("[say=alexrynard]Yeah.. Well, no. They could have just let it haunt the bad guys, who cares about these assholes.[/say]")

		saynn("[say=pc]You could always build a new ship.[/say]")

		saynn("Alex sighs.")

		saynn("[say=alexrynard]True.[/say]")

		saynn("You watch the rest of the credits together in silence.")

		saynn("[say=alexrynard]Well, it was fun. Thanks for being around.[/say]")

		saynn("[say=pc]You better prepare for the captain giving you more work tomorrow.[/say]")

		saynn("[say=alexrynard]Eh, I'd be surprised. There is probably not a single broken datapad left on the station.[/say]")

		saynn("Alex notices how late it is.")

		saynn("[say=alexrynard]Shift time well spent. I hope you can find a way out of here. It's sleepy time.[/say]")

		saynn("You nod. Alex nods back and leaves you to it.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time3_qua_her"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("[say=pc]Second one sounds nice.[/say]")

		saynn("Alex nods and inserts the second tape into the TV's tape player before taking a seat on your sofa.")

		saynn("The film is about some kind of new device that is able to harness someone's feelings as a power source, eliminating the need for conventional resources. First ten minutes are spent explaining how it works exactly.")

		saynn("[say=alexrynard]Huh, so you can just make a bunch of fuckmachines and farm the pleasure feeling that way.[/say]")

		saynn("The movie cuts to a modern-day 'power factory' full of tied up people who are constantly being whipped and spanked by some automated system, their bodies bruised and bleeding.")

		saynn("[say=alexrynard]..or that.. Pain is a pretty easy feeling to farm too I guess.[/say]")

		saynn("One of the main characters, a young engineer, sets off to stop that madness when one of the rebels shows him the full truth about how people are abused for energy..")

		saynn("You look at Alex and see that he is a bit lonely. The movie isn't exciting him that much either.")

		addButton("Cuddle up", "(No sex) Cuddle with Alex while watching the movie", "time3_cuddleup")
		addButton("Sit on lap", "(Sex) Who cares about that movie..", "time3_sitlap")
	if(state == "time3_cuddleup"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc"})
		saynn("You shift closer to Alex, your chin lands on his shoulder.")

		saynn("[say=pc]You look lonely..[/say]")

		saynn("He turns his head and looks at you. The whole room is illuminated by the pink light coming from the TV.")

		saynn("[say=pc]I could fix that..[/say]")

		saynn("And so you tackle him and snug up into his embrace.")

		saynn("[say=alexrynard]Yeah.. this is much better.[/say]")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("You watch the rest of the movie. At some point the two protagonists get cornered by the bad guys at the pain factory. They can't fight back because their weapons are drained. All hope seems to be lost..")

		saynn("And yet, they suddenly realize that they could use love, the most powerful feeling in the world. They kiss each other.. causing the factory's batteries to suddenly get overcharged beyond their limit, making the whole place explode. Of course, somehow, the two main characters survive.")

		saynn("[say=alexrynard]That was so predictable. Love saves everything, give me a break..[/say]")

		saynn("[say=pc]You didn't like it?[/say]")

		saynn("[say=alexrynard]It was alright.. with you especially.[/say]")

		saynn("He smiles kindly and hugs you tighter.")

		saynn("You watch the credits together.")

		saynn("[say=alexrynard]Well, it was fun. Thanks for being around.[/say]")

		saynn("[say=pc]You better prepare for the captain giving you more work tomorrow.[/say]")

		saynn("[say=alexrynard]Eh, I'd be surprised. There is probably not a single broken datapad left on the station.[/say]")

		saynn("Alex notices how late it is.")

		saynn("[say=alexrynard]Shift time well spent. I hope you can find a way out of here. It's time for bed.[/say]")

		saynn("You nod. Alex nods back and leaves you to it.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time3_sitlap"):
		playAnimation(StageScene.BreastFeeding, "teasealt", {pc="pc", npc="alexrynard", bodyState={naked=true}})
		saynn("Why not do something more fun. You shift closer to Alex.. before sitting on his lap.")

		saynn("[say=pc]You look lonely..[/say]")

		saynn("Alex raises a brow. The whole room is illuminated by the pink light coming from the TV, creating a cozy atmosphere.")

		saynn("[say=pc]I could fix that..[/say]")

		saynn("And so you take off your clothes, presenting your {pc.masc} body to him, your {pc.breasts} out on display.")

		saynn("Alex smiles.")

		saynn("[say=alexrynard]How are you planning to do that?[/say]")

		addButton("Tie him up", "Use his own restraints against him", "time3_tiehimup")
	if(state == "time3_tiehimup"):
		playAnimation(StageScene.BreastFeeding, "teasealt", {pc="pc", npc="alexrynard", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		saynn("Alex gets a little concerned when you start undressing him, taking off his shirt, shorts and even tugging on his underwear. You lean close to his ear.")

		saynn("[say=pc]You will have to trust me on that one~.[/say]")

		saynn("You find a few restraints in his pockets.. a blindfold and some cuffs. You hold them while looking at him, smiling.")

		saynn("[say=pc]You know what to say if you want me to stop~.[/say]")

		saynn("The corners of his mouth raise. He didn't say the safeword.. which means he doesn't mind it.")

		saynn("You begin to carefully tie a blindfold around his eyes and then just as carefully bring his arms behind his back before cuffing them.")

		saynn("Your hands slide over his manly curves, causing the muscles that you touch to twitch a little. His red rocket is leaving its sheath and is now poking your crotch.. huh..")

		saynn("Should you put a condom on him?")

		addButtonWithChecks("Best condom", "Put your best condom on his cock", "time3_lap_bestcondom", [], [ButtonChecks.HasCondoms])
		addButtonWithChecks("Worst condom", "Put your worst condom on his cock", "time3_lap_worstcondom", [], [ButtonChecks.HasCondoms])
		addButton("No condom", "Raw will feel the best", "time3_lap_nocondom")
	if(state == "time3_lap_usedcondom"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="pc", pc="alexrynard", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true}})
		saynn("There is no reason for this to get messy.. so you grab one of your condoms, quickly rip off the packaging, and begin to carefully apply it onto Alex's member. You can feel his girth pulsing slightly in your hands as you do it.")

		saynn("[say=alexrynard]Good {pc.boy}..[/say]")

		saynn("Pff, you are supposed to be in charge here.")

		saynn("[say=pc]Don't make me change my mind, sly fox.[/say]")

		saynn("He smirks.")

		saynn("[say=alexrynard]My bad, I should have seen this coming.[/say]")

		saynn("What a brat.. The blindfold hides his eyes but you can just feel the smug aura coming off from him.")

		saynn("[say=pc]If you keep this up, you might not be coming at all today.[/say]")

		saynn("[say=alexrynard]I feel like you need it a lot more than I do~.[/say]")

		saynn("Wow. He's not wrong though.. You push him into the sofa and position yourself above his member.. The movie keeps playing but exactly zero people care about it currently.")

		addButtonWithChecks("Cowgirl (Vag)", "Ride him with your pussy", "time3_lap_ridepussy", [], [ButtonChecks.HasReachableVagina])
		addButton("Cowgirl (Anal)", "Ride him with your ass", "time3_lap_rideanal")
	if(state == "time3_lap_nocondom"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="pc", pc="alexrynard", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true}})
		saynn("It's much more fun without any condoms. So you decide to do it raw.. There aren't that many chances to get all of the foxy to yourself anyway.")

		saynn("Your hands slide over his member more, getting it fully hard and spreading his own precum all over the veiny surface, preparing for what's next..")

		saynn("[say=alexrynard]No rubber? I hope you know I can't really pull out like this~.[/say]")

		saynn("Who said anything about pulling out..")

		saynn("[say=pc]I'm in charge here, sly fox. You're just along for the ride~.[/say]")

		saynn("He smirks.")

		saynn("[say=alexrynard]My bad, I should have seen this coming.[/say]")

		saynn("What a brat.. The blindfold hides his eyes but you can just feel the smug aura coming off from him.")

		saynn("[say=pc]If you keep this up, you might not be coming at all today.[/say]")

		saynn("[say=alexrynard]I feel like you need it a lot more than I do~.[/say]")

		saynn("Wow. He's not wrong though.. You push him into the sofa and position yourself above his member.. The movie keeps playing but exactly zero people care about it currently.")

		addButtonWithChecks("Cowgirl (Vag)", "Ride him with your pussy", "time3_lap_ridepussy", [], [ButtonChecks.HasReachableVagina])
		addButton("Cowgirl (Anal)", "Ride him with your ass", "time3_lap_rideanal")
	if(state == "time3_lap_ridepussy"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="pc", pc="alexrynard", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		saynn("Time for games is over, now comes the real action. You carefully align his blood-colored length with your {pc.pussyStretch} pussy slit and proceed to lower yourself, your petals being spread by the pointy tip of a canine cock.")

		saynn("Alex is completely helpless with all the restraints.. but looks like he doesn't mind much. You can see his chest moving slower as you start to accept his member inside you, the tip spreading the slick inner walls and quickly passing your pleasure spot.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your member reacts instantly by getting hard.. well, trying to. There is pressure slowly building in your chastity cage now..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your own {pc.penis} reacts instantly by getting hard, a lonely tip of your precum shining on its tip.")

		saynn("[say=pc]Yeah.. I can do whatever I want with you, sly fox..[/say]")

		saynn("[say=alexrynard]You're just lucky I allowed you to cuff me.[/say]")

		saynn("Huh. You catch him off-guard by letting your pussy take the rest of his cock in one motion, your buttcheeks slapping against his hips.")

		saynn("[say=alexrynard]Nh..[/say]")

		saynn("[say=pc]Is that so? You had every chance to stop me, sly foxy.[/say]")

		saynn("You don't just sit on him, you proceed to slowly grind his lap before switching to riding, raising your body before bringing it back down, his length fully inside you"+str(", the condom providing enough lube to allow for that" if usedCondom else ", his precum mixing with your juices, lowering friction")+".")

		saynn("[say=alexrynard]Perhaps I wanted to see what would happen.[/say]")

		saynn("[say=pc]Such a shame that I blindfolded you then, huh~?[/say]")

		saynn("You keep riding him while having this little chat, your hands resting on his pecs, your digits digging into his short orange fur.")

		saynn("[say=alexrynard]I feel enough, don't worry.[/say]")

		addButton("Faster", "Ride him faster", "time3_lap_ridepussy_faster")
	if(state == "time3_lap_ridepussy_faster"):
		playAnimation(StageScene.SexCowgirl, "fast", {npc="pc", pc="alexrynard", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		saynn("Gradually, you increase the pace, bringing yourself onto his member faster and harder. You can feel his knot getting bigger inside you.. at some point it becomes too big to fit inside, just slapping against your wet drippy pussy instead. Occasional moans escape from you..")

		saynn("[say=pc]How much do you trust me, foxy~? Mh-h..[/say]")

		saynn("[say=alexrynard]What do you think?[/say]")

		saynn("Suddenly, you stop moving your hips, letting his cock just rest inside you. One of your hands slides up to his neck.. your digits putting some slight amount of pressure on it, just to feel him less in control.")

		saynn("[say=pc]I'm the one asking questions here, foxy.[/say]")

		saynn("[say=alexrynard]Well, I didn't safeword yet.[/say]")

		saynn("[say=pc]Is that a challenge? Ah..[/say]")

		saynn("You return to riding him, his knot continuing to inflate with blood until it reaches its maximum size. He should be close, you can feel his length twitching ever so slightly inside you.. makes you want to get his knot inside so much..")

		saynn("[say=alexrynard]You already have one~.[/say]")

		saynn("You're quite close too.")

		addButton("Get knotted", "Try to force his knot inside you", "time3_lap_ridepussy_knotcum")
		addButton("Pull out", "Stop riding him at the last possible second", "time3_lap_ridepussy_pullout")
	if(state == "time3_lap_ridepussy_knotcum"):
		playAnimation(StageScene.SexCowgirl, "inside", {npc="pc", pc="alexrynard", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		saynn("Yep, his knot is a challenge alright.. but you keep trying to force it inside, bringing yourself down onto his cock hard. The tip keeps pushing on your cervix while the knot stretches your pussy wider and wider.. until finally slipping inside!")

		saynn("[say=alexrynard]Oh fuck..[/say]")

		if (usedCondom && condomBroke):
			saynn("Alex grunts, a shiver makes his spine whirl, his member is throbbing inside you, filling the condom up with his seed.. And yet.. Something feels off. You feel warmness in your womb.. Oh no.. [b]The condom has broken, spilling its contents inside you[/b]. You don't even realize it yet, your own orgasm hides this..")

		elif (usedCondom):
			saynn("Alex grunts, a shiver makes his spine whirl, his member is throbbing inside you while filling the condom up with his seed. And.. looks like.. the condom managed to contain it all just fine. Your own orgasm makes it hard to focus on that though..")

		else:
			saynn("Alex grunts, a shiver makes his spine whirl, his member is throbbing inside you, filling your womb up with his seed.. all of it. His balls are tensing up during each twitch, stuffing more warmness into you.. Your own orgasm makes it hard to focus on that though..")

		saynn("You throw your head back and produce a long noise of passion, your clenching pussy housing Alex's full length, knot included. The sensations are so strong, you can't stop yourself from gushing transparent fluids all over his chest..")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your caged up cock is throbbing too, shooting weak lines of {pc.cum} through the little hole of the cage..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your own cock is throbbing too, shooting strong thick lines of {pc.cum}, your balls quickly getting milked for all their seed..")

		saynn("[say=pc]Ahh-h..[/say]")

		saynn("You two are stuck together, the knot preventing any leakage.. You can't get up even if you wanted to though, your legs are so shaky..")

		saynn("[say=alexrynard]That feels.. so good.. so tight..[/say]")

		saynn("[say=pc]Hah-h.. Why don't you do it more often then, silly fox.. fuck..[/say]")

		saynn("[say=alexrynard]I hate how good it feels..[/say]")

		saynn("That.. doesn't make much sense.. but oh well.")

		saynn("Both of you are panting heavily.. and stuck together.")

		saynn("[say=pc]Looks like we're watching the movie now..[/say]")

		saynn("It's ending already anyway. Explosions are happening on screen while two lovers are kissing in front of them. You haven't watched the whole movie but somehow you can just guess that the love just magically fixed everything.")

		saynn("Eventually the credits begin to roll. Maybe it's time to try to free yourself.")

		addButton("Free yourself", "Try to yank his knot out of your pussy", "time3_lap_ridepussy_afterknot")
	if(state == "time3_lap_ridepussy_afterknot"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (usedCondom && condomBroke):
			saynn("Finally, after the knot has deflated enough, you manage to pull your pussy away from his cock.. just to realize that the condom has broken.. oops.. Your stuffed slit is leaking his seed..")

			saynn("[say=alexrynard]Is everything okay?[/say]")

			saynn("Alex tries to figure out why you are so quiet.")

			saynn("[say=pc]Um.. yeah.[/say]")

			saynn("You quickly remove any obvious signs of what happened and just snug up to Alex, rubbing against his manly body.")

			saynn("[say=pc]Let's just rest..[/say]")

			saynn("[say=alexrynard]Sure.. Rest sounds good now.[/say]")

		elif (usedCondom):
			saynn("Finally, after the knot has deflated enough, you manage to pull your pussy away from his cock. You carefully tie the used condom up and dispose of it safely. All mess is avoided, nice.")

			saynn("After that, you just snug up to Alex, rubbing against his manly body.")

			saynn("[say=pc]Let's just rest..[/say]")

			saynn("[say=alexrynard]Sure.. Rest sounds good now.[/say]")

		else:
			saynn("Finally, after the knot has deflated enough, you manage to pull your pussy away from his cock. Your stuffed pussy is leaking his seed a lot so you cover it with your hand.. preventing some of the mess.")

			saynn("After that, you just snug up to Alex, rubbing against his manly body.")

			saynn("[say=pc]Let's just rest..[/say]")

			saynn("[say=alexrynard]Sure.. Rest sounds good now.[/say]")

		saynn("Cuddling together feels nice. After some time you decide to uncuff Alex and remove his blindfold. It's probably best for you both to head to bed now.")

		saynn("[say=alexrynard]Take care.[/say]")

		saynn("[say=pc]You too.[/say]")

		addButton("Continue", "See what happens next", "endthescene_removecuffs")
	if(state == "time3_lap_ridepussy_pullout"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="pc", pc="alexrynard", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		if (usedCondom):
			saynn("Nope, you will go against that challenge on purpose! You wait for when the point of no return happens for Alex.. before raising your body, letting his cock to slip out.")

			saynn("The foxy grunts while his throbbing cock is filling the condom up.. while not inside you.")

			saynn("At the same time, you were also pushed past your peak, your pussy's muscles are contracting around nothing.. but it still feels good.")

			saynn("[say=alexrynard]Ah.. hah.. brat.[/say]")

			saynn("[say=pc]No you. Looks like you needed it.[/say]")

			saynn("[say=alexrynard]More than you can imagine..[/say]")

			saynn("You carefully tie the used condom up and safely dispose of it. Might as well cuddle now..")

		else:
			saynn("Nope, you will go against that challenge on purpose! You wait for when the point of no return happens for Alex.. before raising your body, letting his cock to slip out.")

			saynn("The foxy grunts while his throbbing cock releases its load.. directly onto his stomach, creating quite a mess.")

			saynn("At the same time, you were also pushed past your peak, your pussy's muscles are contracting around nothing.. but it still feels good.")

			saynn("[say=alexrynard]Ah.. hah.. brat.[/say]")

			saynn("[say=pc]No you. Looks like you needed it.[/say]")

			saynn("[say=alexrynard]More than you can imagine..[/say]")

			saynn("Might as well cuddle now.. Just gotta be careful and avoid getting his mess onto yourself too..")

		addButton("Cuddle", "Rest together", "time3_lap_ridepussy_pullout_cuddle")
	if(state == "time3_lap_ridepussy_pullout_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You turn around and snug up to Alex, your back pressed against his manly body.")

		saynn("[say=pc]Let's just rest..[/say]")

		saynn("[say=alexrynard]Sure.. Rest sounds good now.[/say]")

		saynn("Cuddling together feels nice. After some time you decide to uncuff Alex and remove his blindfold. It's probably best for you both to head to bed now.")

		saynn("[say=alexrynard]Take care.[/say]")

		saynn("[say=pc]You too.[/say]")

		addButton("Continue", "See what happens next", "endthescene_removecuffs")
	if(state == "time3_lap_rideanal"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="pc", pc="alexrynard", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		saynn("Time for games is over, now comes the real action. You carefully align his blood-colored length with your {pc.analStretch} tailhole and proceed to lower yourself, your cute star being spread by the pointy tip of a canine cock.")

		saynn("Alex is completely helpless with all the restraints.. but looks like he doesn't mind much. You can see his chest moving slower as you start to accept his member inside you, the tip spreading the slick inner walls and quickly passing your pleasure spot.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your member reacts instantly by getting hard.. well, trying to. There is pressure slowly building in your chastity cage now as your prostate is being massaged..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your own {pc.penis} reacts instantly by getting hard as your prostate is being massaged, a lonely tip of your precum shining on the tip of your member.")

		saynn("[say=pc]Yeah.. I can do whatever I want with you, sly fox..[/say]")

		saynn("[say=alexrynard]You're just lucky I allowed you to cuff me.[/say]")

		saynn("Huh. You catch him off-guard by letting your ass take the rest of his cock in one motion, your buttcheeks slapping against his hips.")

		saynn("[say=alexrynard]Nh..[/say]")

		saynn("[say=pc]Is that so? You had every chance to stop me, sly foxy.[/say]")

		saynn("You don't just sit on him, you proceed to slowly grind his lap before switching to riding, raising your body before bringing it back down, his length fully inside you"+str(", the condom providing enough lube to allow for that" if usedCondom else ", his precum lowering friction")+".")

		saynn("[say=alexrynard]Perhaps I wanted to see what would happen.[/say]")

		saynn("[say=pc]Such a shame that I blindfolded you then, huh~?[/say]")

		saynn("You keep riding him while having this little chat, your hands resting on his pecs, your digits digging into his short orange fur.")

		saynn("[say=alexrynard]I feel enough, don't worry.[/say]")

		addButton("Faster", "Ride him faster", "time3_lap_rideanal_faster")
	if(state == "time3_lap_rideanal_faster"):
		playAnimation(StageScene.SexCowgirl, "fast", {npc="pc", pc="alexrynard", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		saynn("Gradually, you increase the pace, bringing yourself onto his member faster and harder. You can feel his knot getting bigger inside you.. at some point it becomes too big to fit inside, just slapping against your needy fuckhole instead. Occasional moans escape from you..")

		saynn("[say=pc]How much do you trust me, foxy~? Mh-h..[/say]")

		saynn("[say=alexrynard]What do you think?[/say]")

		saynn("Suddenly, you stop moving your hips, letting his cock just rest inside you. One of your hands slides up to his neck.. your digits putting some slight amount of pressure on it, just to feel him less in control.")

		saynn("[say=pc]I'm the one asking questions here, foxy.[/say]")

		saynn("[say=alexrynard]Well, I didn't safeword yet.[/say]")

		saynn("[say=pc]Is that a challenge? Ah..[/say]")

		saynn("You return to riding him, his knot continuing to inflate with blood until it reaches its maximum size. He should be close, you can feel his length twitching ever so slightly inside you.. makes you want to get his knot inside so much..")

		saynn("[say=alexrynard]You already have one~.[/say]")

		saynn("You're quite close too.")

		addButton("Get knotted", "Try to force his knot inside you", "time3_lap_rideanal_knotcum")
		addButton("Pull out", "Stop riding him at the last possible second", "time3_lap_rideanal_pullout")
	if(state == "time3_lap_rideanal_knotcum"):
		playAnimation(StageScene.SexCowgirl, "inside", {npc="pc", pc="alexrynard", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		saynn("Yep, his knot is a challenge alright.. but you keep trying to force it inside, bringing yourself down onto his cock hard. The tip keeps pushing on your pleasure spot while the knot stretches your tailhole wider and wider.. until finally slipping inside!")

		saynn("[say=alexrynard]Oh fuck..[/say]")

		if (usedCondom && condomBroke):
			saynn("Alex grunts, a shiver makes his spine whirl, his member is throbbing inside you, filling the condom up with his seed.. And yet.. Something feels off. You feel warmness spreading.. Oh no.. [b]The condom has broken, spilling its contents inside you[/b]. You don't even realize it yet, your own orgasm hides this..")

		elif (usedCondom):
			saynn("Alex grunts, a shiver makes his spine whirl, his member is throbbing inside you while filling the condom up with his seed. And.. looks like.. the condom managed to contain it all just fine. Your own orgasm makes it hard to focus on that though..")

		else:
			saynn("Alex grunts, a shiver makes his spine whirl, his member is throbbing inside you, filling your butt up with his seed.. all of it. His balls are tensing up during each twitch, stuffing more warmness into you.. Your own orgasm makes it hard to focus on that though..")

		saynn("You throw your head back and produce a long noise of passion, your clenching ass housing Alex's full length, knot included. The sensations are so strong, you can't stop yourself from squirming around his cock..")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your caged up cock is throbbing too, shooting weak lines of {pc.cum} through the little hole of the cage, your prostate beyond stimulated..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your own cock is throbbing too, shooting strong thick lines of {pc.cum}, your balls quickly getting milked for all their seed, your prostate beyond stimulated..")

		saynn("[say=pc]Ahh-h..[/say]")

		saynn("You two are stuck together, the knot preventing any leakage.. You can't get up even if you wanted to though, your legs are so shaky..")

		saynn("[say=alexrynard]That feels.. so good.. so tight..[/say]")

		saynn("[say=pc]Hah-h.. Why don't you do it more often then, silly fox.. fuck..[/say]")

		saynn("[say=alexrynard]I hate how good it feels..[/say]")

		saynn("That.. doesn't make much sense.. but oh well.")

		saynn("Both of you are panting heavily.. and stuck together.")

		saynn("[say=pc]Looks like we're watching the movie now..[/say]")

		saynn("It's ending already anyway. Explosions are happening on screen while two lovers are kissing in front of them. You haven't watched the whole movie but somehow you can just guess that the love just magically fixed everything.")

		saynn("Eventually the credits begin to roll. Maybe it's time to try to free yourself.")

		addButton("Free yourself", "Try to yank his knot out of your ass", "time3_lap_rideanal_afterknot")
	if(state == "time3_lap_rideanal_afterknot"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (usedCondom && condomBroke):
			saynn("Finally, after the knot has deflated enough, you manage to pull your ass away from his cock.. just to realize that the condom has broken.. oops.. Your stuffed fuckhole is leaking his seed..")

			saynn("[say=alexrynard]Is everything okay?[/say]")

			saynn("Alex tries to figure out why you are so quiet.")

			saynn("[say=pc]Um.. yeah.[/say]")

			saynn("You quickly remove any obvious signs of what happened and just snug up to Alex, rubbing against his manly body.")

			saynn("[say=pc]Let's just rest..[/say]")

			saynn("[say=alexrynard]Sure.. Rest sounds good now.[/say]")

		elif (usedCondom):
			saynn("Finally, after the knot has deflated enough, you manage to pull your ass away from his cock. You carefully tie the used condom up and dispose of it safely. All mess is avoided, nice.")

			saynn("After that, you just snug up to Alex, rubbing against his manly body.")

			saynn("[say=pc]Let's just rest..[/say]")

			saynn("[say=alexrynard]Sure.. Rest sounds good now.[/say]")

		else:
			saynn("Finally, after the knot has deflated enough, you manage to pull your ass away from his cock. Your stuffed fuckhole is leaking his seed a lot so you cover it with your hand.. preventing some of the mess.")

			saynn("After that, you just snug up to Alex, rubbing against his manly body.")

			saynn("[say=pc]Let's just rest..[/say]")

			saynn("[say=alexrynard]Sure.. Rest sounds good now.[/say]")

		saynn("Cuddling together feels nice. After some time you decide to uncuff Alex and remove his blindfold. It's probably best for you both to head to bed now.")

		saynn("[say=alexrynard]Take care.[/say]")

		saynn("[say=pc]You too.[/say]")

		addButton("Continue", "See what happens next", "endthescene_removecuffs")
	if(state == "time3_lap_rideanal_pullout"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="pc", pc="alexrynard", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		if (usedCondom):
			saynn("Nope, you will go against that challenge on purpose! You wait for when the point of no return happens for Alex.. before raising your body, letting his cock to slip out.")

			saynn("The foxy grunts while his throbbing cock is filling the condom up.. while not inside you.")

			saynn("At the same time, you were also pushed past your peak, your asshole's muscles are contracting around nothing.. but it still feels good.")

			saynn("[say=alexrynard]Ah.. hah.. brat.[/say]")

			saynn("[say=pc]No you. Looks like you needed it.[/say]")

			saynn("[say=alexrynard]More than you can imagine..[/say]")

			saynn("You carefully tie the used condom up and safely dispose of it. Might as well cuddle now..")

		else:
			saynn("Nope, you will go against that challenge on purpose! You wait for when the point of no return happens for Alex.. before raising your body, letting his cock to slip out.")

			saynn("The foxy grunts while his throbbing cock releases its load.. directly onto his stomach, creating quite a mess.")

			saynn("At the same time, you were also pushed past your peak, your asshole's muscles are contracting around nothing.. but it still feels good.")

			saynn("[say=alexrynard]Ah.. hah.. brat.[/say]")

			saynn("[say=pc]No you. Looks like you needed it.[/say]")

			saynn("[say=alexrynard]More than you can imagine..[/say]")

			saynn("Might as well cuddle now.. Just gotta be careful and avoid getting his mess onto yourself too..")

		addButton("Cuddle", "Rest together", "time3_lap_rideanal_pullout_cuddle")
	if(state == "time3_lap_rideanal_pullout_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You turn around and snug up to Alex, your back pressed against his manly body.")

		saynn("[say=pc]Let's just rest..[/say]")

		saynn("[say=alexrynard]Sure.. Rest sounds good now.[/say]")

		saynn("Cuddling together feels nice. After some time you decide to uncuff Alex and remove his blindfold. It's probably best for you both to head to bed now.")

		saynn("[say=alexrynard]Take care.[/say]")

		saynn("[say=pc]You too.[/say]")

		addButton("Continue", "See what happens next", "endthescene_removecuffs")
	if(state == "time5"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("You two are standing near Alex's normal workplace, near his bench. All the tools are neatly stashed away, no broken device in sight.")

		saynn("[say=alexrynard]Feels weird, huh?[/say]")

		saynn("You nod.")

		saynn("[say=pc]What are you gonna do?[/say]")

		saynn("[say=alexrynard]Well, I still don't have parts that I need.. I guess I will just brainstorm new ideas. And obviously do my duties as a station's engineer.[/say]")

		saynn("That doesn't leave much space for you, huh?")

		saynn("[say=pc]Can I help somehow?[/say]")

		saynn("Alex rubs the back of his head, looking a bit guilty.")

		saynn("[say=alexrynard]I.. don't know.[/say]")

		saynn("Sudden male voice.")

		saynn("[sayMale]Rynard? Here is something for you.[/sayMale]")

		saynn("One of the engineers brings a huge cardboard box and places it on the table.")

		saynn("[say=alexrynard]What do you mean, for me?[/say]")

		saynn("[sayMale]I dunno, logistics says it's for you, I gotta go.[/sayMale]")

		saynn("After that, the guy just walks away, leaving you alone with the anxiety.")

		saynn("Looks like that vacation is posponed.. Alex's eyes are so sad.")

		saynn("[say=alexrynard]I don't want to open it..[/say]")

		saynn("[say=pc]What if it's.. something good?[/say]")

		saynn("He sighs.")

		saynn("[say=alexrynard]You will never find a million credits in your room randomly.. but you may find rats.[/say]")

		saynn("So pessimistic.")

		addButton("Open it", "See what's inside", "time5_rekt")
	if(state == "time5_rekt"):
		saynn("Since Alex is hesitating, you just open the box yourself.")

		saynn("Inside.. about what you would expect..")

		saynn("Alex stares at the contents.. intently.")

		saynn("[say=alexrynard]About two weeks of new work.[/say]")

		saynn("[say=pc]You.. definitely need my help now.[/say]")

		saynn("Alex shrugs.")

		saynn("[say=alexrynard]You might be right. But not for the right reason.[/say]")

		saynn("Huh? You give Alex a look of confusion.")

		saynn("[say=alexrynard]I'm so sick of this. I'm not touching another broken datapad ever.[/say]")

		saynn("[say=pc]But.. What are you gonna do then?[/say]")

		saynn("[say=alexrynard]Let's pay the captain a visit.[/say]")

		saynn("That sounds better than doing this.. but it also sounds scarier.")

		saynn("[say=alexrynard]You don't have to say anything, I will do most of the talking.[/say]")

		saynn("Seems like a no-brainer..")

		addButton("Follow", "See where Alex brings you", "time5_nearlift")
	if(state == "time5_nearlift"):
		aimCameraAndSetLocName("cd_near_elevator")
		GM.pc.setLocation("hall_mainentrance")
		saynn("You and Alex enter the lift. He uses his badge to get access to more floors before selecting the command deck.")

		saynn("[say=pc]Do you really need me though?[/say]")

		saynn("[say=alexrynard]Yeah.[/say]")

		saynn("The lift screeches as it starts ascending to a higher floor.")

		saynn("[say=alexrynard]So old. And yet, it will probably serve another century at least. People knew what they were doing back then.[/say]")

		saynn("[say=pc]Don't you know what you're doing?[/say]")

		saynn("[say=alexrynard]I just pretend to.[/say]")

		saynn("He smiles.")

		saynn("The doors open.. revealing a few guards. Guards that don't seem to be happy about seeing an unrestrained inmate here.")

		saynn("[say=alexrynard]Right.. It is a high-security floor, huh.[/say]")

		saynn("He turns towards you, his hands producing some cuffs.")

		saynn("[say=alexrynard]You have to be restrained first, inmate.[/say]")

		saynn("Fair enough.. He talks so differently when guards are nearby.")

		addButton("Continue", "See what happens next", "time5_cuffup")
	if(state == "time5_cuffup"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", bodyState={leashedBy="alexrynard"}})
		saynn("Alex carefully brings your arms behind your back and cuffs them.. before also cuffing your ankles together.")

		saynn("[say=alexrynard]No scratch, no kick..[/say]")

		saynn("Next, he produces a muzzle.. and proceeds to secure it around your head.")

		saynn("[say=alexrynard]..and no bite.[/say]")

		saynn("He turns towards the guards.. but they still don't seem happy about how you look.")

		saynn("[say=alexrynard]Right, I don't do this very often, okay?[/say]")

		saynn("Alex produces a leash and clips it to your collar.")

		saynn("[say=alexrynard]Happy?[/say]")

		saynn("The guards finally seem to give way.")

		addButton("Follow", "See where Alex brings you", "time5_nearcaptain")
	if(state == "time5_nearcaptain"):
		aimCameraAndSetLocName("cd_near_captain_office")
		playAnimation(StageScene.Duo, "walk", {npc="alexrynard", npcAction="walk", flipNPC=true, bodyState={leashedBy="alexrynard"}})
		saynn("You and Alex walk through the rich-looking corridors. Your feet feel the soft carpet as you awkwardly hop around, your eyes feast upon the many paintings that are hanging on the walls.")

		saynn("[say=alexrynard]Even makes me feel small. And I'm not the one cuffed here.[/say]")

		saynn("You approach the captain's office. It seems to be guarded by one of the special guards, one that has his lower jaw replaced with a scary-looking prosthetic one.")

		saynn("[say=alexrynard]I need to see the captain.[/say]")

		saynn("[say=skar]Why?[/say]")

		saynn("[say=alexrynard]Because.[/say]")

		saynn("[say=skar]Why the inmate?[/say]")

		saynn("[say=alexrynard]I need to talk, okay? {pc.He} {pc.isAre} important to the matter.[/say]")

		saynn("The big guard talks into his headset for some time.. before letting you through.")

		addButton("Captain's office", "See what happens next", "time5_captain")
	if(state == "time5_captain"):
		addCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="captain", npcAction="sit"})
		aimCameraAndSetLocName("cd_captain_office")
		saynn("Alex steps into the captain's office, you follow after.")

		saynn("The captain seems to be sitting behind his table, working on something on his laptop. He closes it down and looks at you two.")

		saynn("[say=captain]Welcome.[/say]")

		saynn("He looks at Alex specifically.")

		saynn("[say=captain]Coffee? Whiskey? I have just water too.[/say]")

		saynn("[say=alexrynard]I'm good, I'm not gonna take much of your time.[/say]")

		saynn("The captain nods. Alex stands in the middle of the room.. you take a spot behind him.")

		saynn("[say=captain]Alright. What's eating you?[/say]")

		saynn("Alex sighs and lowers his gaze for a second.")

		saynn("[say=alexrynard]Why?[/say]")

		saynn("The captain tilts his head slightly.")

		saynn("[say=captain]Why what?[/say]")

		saynn("[say=alexrynard]You know what.[/say]")

		saynn("[say=captain]Enlighten me, I really don't.[/say]")

		saynn("[say=alexrynard]Why do you make me do useless crap?[/say]")

		saynn("Wow, Alex sounds quite annoyed. While the captain stays unphased, his voice is neutral.")

		saynn("[say=captain]You mean.. repairs? Could you please remind me of who you are?[/say]")

		saynn("[say=alexrynard]Me? I'm a station's engineer, why the stupid question.[/say]")

		saynn("The captain tilts his head more, his strict gaze direct towards Alex's eyes.")

		saynn("[say=captain]I'm asking because I feel like you forgot who you are, Rynard.[/say]")

		saynn("[say=alexrynard]I didn't forget anything. But this can't continue like this. I demand an answer. Why? Why do I feel like I'm being punished.[/say]")

		saynn("The captain rubs his chin.")

		saynn("[say=captain]Right..[/say]")

		addButton("Continue", "See what happens next", "time5_captainapproaches")
	if(state == "time5_captainapproaches"):
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="captain"})
		saynn("The captain stands up and approaches Alex, their gazes are at the same level now.")

		saynn("[say=captain]I guess there was a misunderstanding between us. I'm not punishing you, Alex. I'm just.. trying to hold you back a little.[/say]")

		saynn("Alex raises a brow.")

		saynn("[say=alexrynard]Hold me back? But why?[/say]")

		saynn("The captain looks at you for a second. His deep stare sends shivers down your spine.")

		saynn("[say=captain]Like I said before.. Big things await us in the future, Alex. But for now.. I need you to do what I'm saying. I just don't want you to.. burn out.. with tech.[/say]")

		saynn("Confusing..")

		saynn("[say=alexrynard]Burn out?[/say]")

		saynn("[say=captain]Yeah. You have great potential, Alex. I'm afraid that you might accidentally.. break yourself.. more than you already did.[/say]")

		saynn("The captain directs his attention to Alex's chest.. the whirling of his back becoming obvious.")

		saynn("[say=captain]I hope you can understand this, you're a smart guy. But no one is perfect. And that's fine. But that means that our creations aren't perfect either. They can hurt us.. bad.[/say]")

		saynn("[say=alexrynard]I.. I..[/say]")

		saynn("Alex starts lowering his gaze, he seems to be struggling with something. The captain taps on his shoulder a few times.")

		saynn("[say=captain]I want you to be happy, I really do. All these repairs.. they're just to keep your mind sharp, you know? I can't offer you much more with what resources the station currently has, I'm sorry.[/say]")

		addButton("Continue", "See what happens next", "time5_captain_looksatplayer")
	if(state == "time5_captain_looksatplayer"):
		playAnimation(StageScene.Duo, "stand", {npc="captain"})
		saynn("[say=captain]I put my full trust into you. I just hope you can do the same for me. There are a lot of bad people in the world, you know that better than me.[/say]")

		saynn("The captain approaches you next.. while still talking with Alex.")

		saynn("[say=captain]I just really don't want you to.. make a mistake.[/say]")

		saynn("The captain tugs on your muzzle a bit, checking how well secured it is.")

		saynn("Alex, even more confused, looks at the captain. Something clicks in him..")

		saynn("[say=alexrynard]Mistake? What do you mean by mistake?[/say]")

		saynn("[say=captain]Exactly what it sounds like.[/say]")

		saynn("[say=alexrynard]You mean.. {pc.him}?[/say]")

		saynn("[say=captain]I really didn't want to forbid you from interacting with inmates. But you gotta understand that they are convicted criminals, you can't trust them. Especially when any kind of new technology is involved.[/say]")

		saynn("Alex hums.")

		saynn("[say=alexrynard]So that's what it's about? You're jealous?[/say]")

		saynn("Alex gently tugs on the leash, pulling you away from the captain.")

		addButton("Continue", "See what happens next", "time5_captain_morecaptain")
	if(state == "time5_captain_morecaptain"):
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="captain"})
		saynn("[say=captain]Jealous is a very strong word, Rynard. I'm protecting the station. But I'm also protecting you. This is for your own good.[/say]")

		saynn("[say=alexrynard]Uh huh.[/say]")

		saynn("Captain frowns.")

		saynn("[say=captain]Are you forgetting what I did for you? I saved you.[/say]")

		saynn("[say=alexrynard]And now you think that you own me? Hah.[/say]")

		saynn("[say=captain]You know what.. I want you to think about it. Thoroughly. Alone. Without any other mind influencing you. We will talk later.[/say]")

		saynn("[say=alexrynard]We're not gonna talk later. I quit.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "after_work_check"):
		processTime(RNG.randi_range(3,5) * 60 * 60)
		GM.pc.addCredits(2)
		addMessage("You received 2 credits")
		
		if(GM.main.isVeryLate()):
			setState("toolate")
		else:
			setState("aftersomefixing")
		return

	if(_action == "start_trust"):
		endScene()
		runScene("AlexTrustExercisesMenuScene")
		return

	if(_action == "time4_done"):
		processTime(60*60*2)
		addExperienceToPlayer(100)
		GM.pc.addCredits(10)
		addMessage("You received 10 credits!")

	if(_action == "time3_cel_od"):
		GM.main.processTimeUntil(23*60*60)
		setFlag("AlexRynardModule.ch2PickedRomanticMovie", false)

	if(_action == "time3_qua_her"):
		GM.main.processTimeUntil(23*60*60)
		setFlag("AlexRynardModule.ch2PickedRomanticMovie", true)

	if(_action == "time3_cuddleup"):
		setFlag("AlexRynardModule.ch2MovieHadSex", false)

	if(_action == "time3_sitlap"):
		setFlag("AlexRynardModule.ch2MovieHadSex", true)

	if(_action == "time3_tiehimup"):
		getCharacter("alexrynard").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))
		getCharacter("alexrynard").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))

	if(_action == "time3_lap_bestcondom"):
		breakChance = GM.pc.useBestCondom()
		usedCondom = true
		setState("time3_lap_usedcondom")
		return

	if(_action == "time3_lap_worstcondom"):
		breakChance = GM.pc.useWorstCondom()
		usedCondom = true
		setState("time3_lap_usedcondom")
		return

	if(_action == "time3_lap_ridepussy_faster"):
		GM.pc.gotVaginaFuckedBy("alexrynard")

	if(_action == "time3_lap_ridepussy_knotcum"):
		GM.pc.orgasmFrom("alexrynard")
		GM.pc.gotVaginaFuckedBy("alexrynard")
		if(usedCondom):
			condomBroke = getCharacter("alexrynard").shouldCondomBreakWhenFucking(GM.pc, breakChance)
			if(condomBroke):
				GM.pc.cummedInVaginaByAdvanced("alexrynard", {knotted=true,condomBroke=condomBroke,engulfed=true})
			else:
				addFilledCondomToLootIfPerk(getCharacter("alexrynard").createFilledCondom())
		else:
			GM.pc.cummedInVaginaByAdvanced("alexrynard", {knotted=true,engulfed=true})

	if(_action == "time3_lap_ridepussy_pullout"):
		if(usedCondom):
			addFilledCondomToLootIfPerk(getCharacter("alexrynard").createFilledCondom())
		else:
			getCharacter("alexrynard").cummedOnBy("alexrynard")
		GM.pc.orgasmFrom("alexrynard")

	if(_action == "endthescene_removecuffs"):
		getCharacter("alexrynard").removeAllRestraints()
		endScene()
		return

	if(_action == "time3_lap_rideanal_faster"):
		GM.pc.gotAnusFuckedBy("alexrynard")

	if(_action == "time3_lap_rideanal_knotcum"):
		GM.pc.orgasmFrom("alexrynard")
		GM.pc.gotAnusFuckedBy("alexrynard")
		if(usedCondom):
			condomBroke = getCharacter("alexrynard").shouldCondomBreakWhenFucking(GM.pc, breakChance)
			if(condomBroke):
				GM.pc.cummedInAnusByAdvanced("alexrynard", {knotted=true,condomBroke=condomBroke,engulfed=true})
			else:
				addFilledCondomToLootIfPerk(getCharacter("alexrynard").createFilledCondom())
		else:
			GM.pc.cummedInAnusByAdvanced("alexrynard", {knotted=true,engulfed=true})

	if(_action == "time3_lap_rideanal_pullout"):
		if(usedCondom):
			addFilledCondomToLootIfPerk(getCharacter("alexrynard").createFilledCondom())
		else:
			getCharacter("alexrynard").cummedOnBy("alexrynard")
		GM.pc.orgasmFrom("alexrynard")

	if(_action == "time5_nearlift"):
		processTime(3*60)

	if(_action == "time5_cuffup"):
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("basketmuzzle"))

	if(_action == "time5_nearcaptain"):
		processTime(5*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["howManyTimes"] = howManyTimes
	data["usedCondom"] = usedCondom
	data["condomBroke"] = condomBroke
	data["breakChance"] = breakChance

	return data

func loadData(data):
	.loadData(data)

	howManyTimes = SAVE.loadVar(data, "howManyTimes", 0)
	usedCondom = SAVE.loadVar(data, "usedCondom", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
	breakChance = SAVE.loadVar(data, "breakChance", 0.0)
