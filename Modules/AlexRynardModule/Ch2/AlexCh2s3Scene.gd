extends SceneBase

var howManyTimes = 0
var usedCondom = false
var condomBroke = false
var breakChance = 0.0
var didCBT = false

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
	if(howManyTimes == 4):
		setState("time5")
		increaseFlag("AlexRynardModule.ch2s3SceneNum")
		return
	if(howManyTimes == 5):
		setState("time6")
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

		saynn("[say=alexrynard]You mean {pc.him}, don't you?[/say]")

		saynn("[say=captain]I really didn't want to forbid you from interacting with inmates. But you gotta understand that they are convicted criminals, you can't trust them. Especially when any kind of new technology is involved.[/say]")

		saynn("Alex hums.")

		saynn("[say=alexrynard]So that's what it's about? You sound jealous, cap.[/say]")

		saynn("Alex gently tugs on the leash, pulling you away from the captain.")

		addButton("Continue", "See what happens next", "time5_captain_morecaptain")
	if(state == "time5_captain_morecaptain"):
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="captain"})
		saynn("[say=captain]Jealous is a very strong word, Rynard. I'm protecting the station. But I'm also protecting you. This is for your own good.[/say]")

		saynn("[say=alexrynard]Uh huh.[/say]")

		saynn("Captain frowns.")

		saynn("[say=captain]Are you forgetting what I did for you? I saved you. Where would you be without me?[/say]")

		saynn("[say=alexrynard]And now you think that you own me? Hah.[/say]")

		saynn("[say=captain]You know what.. I want you to think about it. Thoroughly. Alone. Without any other mind influencing you. We will talk later.[/say]")

		saynn("[say=alexrynard]We're not gonna talk later. I quit.[/say]")

		saynn("That bombshell catches the captain off-guard.")

		saynn("[say=captain]Huh? Wha.. You can't, we have a contract.[/say]")

		saynn("[say=alexrynard]It will run out soon. And I will be out.[/say]")

		saynn("Captain stays quiet for some time. And he is not happy even if his expression says otherwise, he can not pull his gaze away from Alex.")

		saynn("[say=captain]You're gonna break our trust like that? After everything that..[/say]")

		saynn("Alex cuts him off, making one step forward.")

		saynn("[say=alexrynard]Shut up about the trust already, it was never about trust. Do you think I'm not grateful that you pulled me out of my hell? I am. But everything has a limit. I draw mine here.[/say]")

		saynn("Captain stays quiet for some more time.")

		saynn("[say=captain]Your spine..[/say]")

		saynn("[say=alexrynard]Rip it out, I don't care. I will pay for the wheelchair. And then I will be rolling the fuck out of here.[/say]")

		saynn("Wow, Alex is ready to put his everything for this..")

		saynn("Captain rubs his chin, his strict focussed eyes staring at Alex for at least half a minute.")

		saynn("[say=captain]Right. How about.. we will allocate some funding to your prototypes, we will find a good number. And obviously then there wouldn't be a need for keeping you busy with simple repairs. I want to make it right by you, I'm not a monster.[/say]")

		saynn("It feels like the captain is forcing himself to say these words.")

		saynn("[say=alexrynard]I want full ownership of my prototypes. They're mine, not AlphaCorp's.[/say]")

		saynn("[say=captain]Huh.. That might be possible to arrange. But then I want some control of what you are creating. I can't let you create an atomic bomb here, I hope you can understand that.[/say]")

		saynn("[say=alexrynard]That's fair.[/say]")

		saynn("The captain reaches his hand out for a handshake.")

		saynn("[say=captain]We have a deal?[/say]")

		saynn("Alex quickly glances over his shoulder at you.")

		saynn("[say=alexrynard]I also want this inmate to be assigned as my apprentice. I taught {pc.him} a lot already.[/say]")

		saynn("[say=captain]{pc.He} {pc.isAre} an inmate.[/say]")

		saynn("[say=alexrynard]I once had a collar around my neck. Did you forget already?[/say]")

		saynn("Captain's hand tenses up a little.")

		saynn("[say=captain]Alright, {pc.he} can be your assistant. Within reason.[/say]")

		saynn("Alex nods and shakes the captain's hand.")

		saynn("[say=alexrynard]I'm glad we could talk it out, cap. Better than us keeping hidden anger for each other.[/say]")

		saynn("[say=captain]Of course.[/say]")

		saynn("One of them surely got a much better deal out of this. They exchange smiles before Alex leaves the office, bringing you along on a leash. The captain gives you a cold goodbye stare.")

		addButton("Continue", "See what happens next", "time5_returningback")
	if(state == "time5_returningback"):
		removeCharacter("captain")
		aimCameraAndSetLocName("cd_last_intersection")
		playAnimation(StageScene.Duo, "walk", {npc="alexrynard", npcAction="walk", flipNPC=true, bodyState={leashedBy="alexrynard"}})
		saynn("You and Alex walk through the rich corridor back to the lift.")

		saynn("[say=alexrynard]Went better than expected, huh?[/say]")

		saynn("Could be your chance to ask something.")

		addButton("No questions", "Just follow him", "time5_returnback")
		addButton("Why me", "Ask why did he brought you", "time5_whyme")
		addButton("How", "How did Alex manage to persuade him", "time5_how")
		addButton("Apprentice?", "What does that mean", "time5_apprentice")
	if(state == "time5_whyme"):
		saynn("[say=pc]Was I needed? I didn't really do anything.[/say]")

		saynn("Alex chuckles.")

		saynn("[say=alexrynard]You did more than you realize.[/say]")

		saynn("Alex turns towards you.")

		saynn("[say=alexrynard]Everyone is using each other. I thought that this is the norm, how the world works. You proved me wrong. I can't do everything, I was very close to giving up. But with you, I feel like I can do anything. Because you got my back.[/say]")

		saynn("He smiles and pats you on the head. Huh. If you could have kicked him for that pun, you probably would have.")

		addButton("Enough questions", "Just follow him", "time5_returnback")
		addButton("How", "How did Alex manage to persuade him", "time5_how")
		addButton("Apprentice?", "What does that mean", "time5_apprentice")
	if(state == "time5_how"):
		saynn("[say=pc]How did you manage to change his mind? What if he just let you quit.[/say]")

		saynn("Alex shrugs.")

		saynn("[say=alexrynard]He needs me a lot more than I need him. Either way, I'm not planning on staying here forever. I did more than enough for him already.[/say]")

		saynn("[say=pc]What are you gonna do?[/say]")

		saynn("[say=alexrynard]After BDCC? Not sure yet. And I have you here. I don't have anyone on the outside. So I wasn't planning on quitting now either way.[/say]")

		saynn("Looks like his gamble paid off.")

		addButton("Enough questions", "Just follow him", "time5_returnback")
		addButton("Why me", "Ask why did he brought you", "time5_whyme")
		addButton("Apprentice?", "What does that mean", "time5_apprentice")
	if(state == "time5_apprentice"):
		saynn("[say=pc]I'm your apprentice now? What does that mean?[/say]")

		saynn("He smiles.")

		saynn("[say=alexrynard]Nothing really changes. It's just that you're now allowed to help me legally rather than.. under the table, you know?[/say]")

		saynn("[say=pc]That means you could have been punished back then when we were helping Eliza?[/say]")

		saynn("Alex hums.")

		saynn("[say=alexrynard]If I always did the 'right' thing, I'd be the captain's slave forever, doing what he wants me to do because he saved me back then. Fuck that, I'd rather do what I want and suffer the consequences.[/say]")

		saynn("Fair enough.")

		addButton("Enough questions", "Just follow him", "time5_returnback")
		addButton("Why me", "Ask why did he brought you", "time5_whyme")
		addButton("How", "How did Alex manage to persuade him", "time5_how")
	if(state == "time5_returnback"):
		aimCameraAndSetLocName("mining_nearentrance")
		GM.pc.setLocation("mining_nearentrance")
		playAnimation(StageScene.Duo, "walk", {npc="alexrynard", npcAction="walk", flipNPC=true, bodyState={leashedBy="alexrynard"}})
		saynn("Alex brings you back to the lowest level of the station. And yet, you still feel like you won.")

		saynn("[say=alexrynard]There we go. Let's get you uncuffed.[/say]")

		saynn("[say=pc]What if he breaks his promise and gives you more things to fix?[/say]")

		saynn("[say=alexrynard]I will start stealing the parts then. He won't. And obviously there is still the whole station to fix, I'm still an engineer.[/say]")

		addButton("Cuffs", "Get them removed", "time5_nocuffs")
	if(state == "time5_nocuffs"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("He removes the cuffs, the attached leash and the muzzle.")

		saynn("[say=alexrynard]The collar stays, heh.[/say]")

		saynn("[say=pc]Is there really no way to take it off? Just curious.[/say]")

		saynn("Alex smirks.")

		saynn("[say=alexrynard]I know what you feel. There is no way to create a truly impenetrable system, these collars do have some flaws. But none of them can be exploited by inmates which makes them secure.[/say]")

		saynn("You nod.")

		saynn("[say=alexrynard]Take care. Thank you.[/say]")

		saynn("Alex leaves you alone.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time6"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("You approach Alex as his new apprentice!")

		saynn("[say=pc]Hey there.[/say]")

		saynn("He seems to be just working on something. Something that's not a broken datapad, nice!")

		saynn("[say=alexrynard]Yeah, hi. The captain didn't lie, no more devices to fix.[/say]")

		saynn("[say=pc]But.. What are we gonna do then?[/say]")

		saynn("[say=alexrynard]Well, you know, I'm still a station engineer. We could just do general maintenance.[/say]")

		saynn("It's monotonous work too.. but anything is better than repairing the same things over and over.")

		saynn("Something beeps in Alex's pocket. He pulls his datapad out and goes through some menus.")

		saynn("[say=alexrynard]Oh, speaking of. The generator in the mines has stopped working, let's go check it out.[/say]")

		saynn("Yay, your first task.")

		addButton("Mineshaft", "Head there with Alex", "time6_mine")
	if(state == "time6_mine"):
		aimCameraAndSetLocName("mining_shafts_entering")
		saynn("It's dark.. obviously.. none of the lights work so Alex has to use his datapad as a torch.")

		saynn("You and him carefully tread through the mineshaft, following the wires that are attached to the rocks.")

		saynn("[say=pc]Kinda creepy.[/say]")

		saynn("[say=alexrynard]It's fine, we just have to find the damn thing.[/say]")

		saynn("Either your mind is playing with you.. or not.. for some reason you keep noticing movement in your peripheral vision. Hard to tell, everything is so dark.")

		saynn("[say=alexrynard]There it is.[/say]")

		saynn("The generator.. It looks like a big metal box. And it clearly suffered some damage, its top panel is bent under the weight of a huge boulder.")

		saynn("[say=alexrynard]Huh, we will have to investigate the supports later, don't want the mineshaft to collapse completely.[/say]")

		saynn("Sounds dangerous.. Alex hands you the datapad and starts trying to push the boulder off.")

		saynn("[say=pc]Need some help?[/say]")

		saynn("He is panting heavily, the motors in his spine working hard.")

		saynn("[say=alexrynard]I got.. it.. Just hold the light for me.[/say]")

		saynn("He finally manages to roll it off. He unscrews one of the panels, exposing the wiring and internal parts.")

		saynn("[say=alexrynard]Yeah, some capacitors got crushed. Shouldn't take too long to fix.[/say]")

		saynn("And so you keep the light on him while he proceeds to carefully remove the busted components and replace them.")

		saynn("[say=alexrynard]Strange that the rock fell exactly on it.[/say]")

		saynn("[say=pc]What if it wasn't a coincidence?[/say]")

		saynn("[say=alexrynard]You'd need a lot of strength to lift one big enough to break this generator. They're armored as you can see.[/say]")

		saynn("Click.. and the generator kicks into action. The lights around you flicker a lot.. until the current normalizes.")

		saynn("[say=alexrynard]Voila.[/say]")

		saynn("That was easy. But nothing in the world is ever that easy..")

		saynn("[say=avy]Look who's we got here.[/say]")

		saynn("A familiar voice behind you..")

		addButton("Look around", "See what's up", "time6_avy_and_gang")
	if(state == "time6_avy_and_gang"):
		addCharacter("avy")
		addCharacter("stud")
		addCharacter("volk")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="avy"})
		saynn("You look around and see a group of three inmates surrounding you.. A black fox with a cheeky smile, a brown horse with a strong hand holding a pickaxe and a gray wolf with a crazy stare. None of them seem to be particularly friendly..")

		saynn("[say=alexrynard]Generator is fixed, get back to your jobs.[/say]")

		saynn("They're blocking the way back to the station. Alex is reaching for his shock remote already..")

		saynn("[say=alexrynard]I'm warning you.[/say]")

		saynn("[say=avy]Relax, pretty boy. If I get what I want, no one will get hurt.[/say]")

		saynn("Yeah, they are probably responsible for breaking that generator..")

		saynn("[say=alexrynard]Yeah, no.[/say]")

		saynn("Alex whips the shock remote and aims it at the gang of inmates.. He presses the red button, dropping one of the inmates.")

		saynn("[say=volk]SUKA! MY NECK![/say]")

		saynn("But before the remote can recharge, the buff horse suddenly throws his pickaxe at him.")

		saynn("[say=alexrynard]What the..[/say]")

		saynn("The dull part of the tool hits Alex's chest, causing him to drop what he was holding. And before Alex can pick it up, the black fox swiftly closes the distance and crushes the dropped remote with her foot, stealing any hope of an easy victory..")

		saynn("[say=avy]Wow, you don't even want to hear me out first? We didn't even start dating and you have already broken my trust.[/say]")

		saynn("[say=alexrynard]If you touch us, you're gonna regret it.[/say]")

		saynn("The black foxy chuckles.")

		saynn("[say=avy]Empty threats, so predictable. Either way.. I only want you to help take off our collars. And we all gonna go on our merry ways, completely unharmed and with all bones intact.[/say]")

		saynn("[say=alexrynard]What? That's the point of the collars, no one can remove them.[/say]")

		saynn("The black foxy steps forward and barks..")

		saynn("[say=avy]Don't bullshit me, boy. I know that you designed them. Which means you know how to take them off.[/say]")

		saynn("Alex tilts his head, deeply confused.")

		saynn("[say=alexrynard]How the fuck do you know that?[/say]")

		saynn("Avy directs her stare at you.. Her silent nod is deafening.")

		saynn("[say=alexrynard]What? There is no way..[/say]")

		addButton("She is lying!", "You didn't tell her that!", "time6_sheislying")
	if(state == "time6_sheislying"):
		playAnimation(StageScene.Duo, "hurt", {npc="stud", npcAction="shove"})
		saynn("You're pretty sure you never told anyone that Alex was involved with creating the collars..")

		saynn("[say=pc]She is lying! I never told her anything.[/say]")

		saynn("The dark foxy chuckles.")

		saynn("[say=avy]Really? You want to keep both the credits and your new boyfriend? Something has to give~.[/say]")

		saynn("Alex, looking even more confused and unsure now..")

		saynn("[say=alexrynard]I..[/say]")

		saynn("[say=pc]What the fuck are you talking about.[/say]")

		saynn("[say=alexrynard]We will deal with that later.. Right now..[/say]")

		saynn("[say=avy]Right now it's time to take our collars off, boy~.[/say]")

		saynn("Avy and the other two inmates start approaching Alex, one at the time. You try to stay close to him but the buff horse shoves you away.")

		saynn("[say=stud]Go the fuck away if you want to live.[/say]")

		saynn("Alex and the dark foxy are exchanging the first punches behind this mountain of muscles.. You can't leave him like this..")

		addButton("Fight!", "Start the fight", "time6_into_first_fight")
		addButton("Shock remote", "Look at it", "time6_lookatshockremote")
	if(state == "time6_lookatshockremote"):
		saynn("You quickly rush to the shock remote.. Sadly, its frame is crushed to bits. Can't use it.")

		saynn("Alex won't be able to endure the fight against three inmates for much longer..")

		addButton("Fight!", "Start the fight", "time6_into_first_fight")
		addButton("Shock remote", "Maybe you can salvage it", "time6_lookatshockactually")
	if(state == "time6_lookatshockactually"):
		playAnimation(StageScene.Solo, "kneel")
		saynn("You try to use the shock remote again.. but it doesn't work.")

		saynn("Alex yelps as he collapses, unable to fight any longer.. Fuck..")

		saynn("[say=avy]Ready to talk, failed hero? I really don't want to kill you. Just tell me how to unlock the collars and I will be out of your way~.[/say]")

		saynn("Wait.. Who cares if the frame is smashed, you just need to trigger the remote. You use your knowledge to disassemble it. Now you just need to short-circuit one of the pins with something metal..")

		saynn("Alex growls back and tries to free himself, his spine whirring loudly. Avy just stares him into the eyes.")

		saynn("[say=avy]Aww, you think you're strong?[/say]")

		saynn("Avy suddenly throws Alex down to the cold floor.. before [b]stomping[/b] on his back hard, [b]crushing his prosthetic spine[/b].. Sparks bursting out of it as Alex lets out a gut-wrenching cry.")

		saynn("[say=alexrynard]A-ARGH!..[/say]")

		saynn("[say=pc]NO! YOU BITCH![/say]")

		saynn("[say=avy]But you're just a spineless beta. Don't go anywhere, I need to deal with your little wife~.[/say]")

		saynn("Alex is in too much pain to respond, his broken prosthetic is making his whole body twitch in an uncontrollable agony..")

		saynn("Avy looks at you next.")

		saynn("[say=avy]What was that, little slut?[/say]")

		saynn("She starts walking towards you. Your hands are shaking.. you manage to find a little metal piece and jam it into the board..")

		saynn("Moments later, all four nearby collars activate..")

		saynn("[say=avy]ARGH![/say]")

		saynn("[say=stud]NGH.[/say]")

		saynn("[say=volk]SUKAAA![/say]")

		saynn("A similar cry leaves your mouth too.. the pain is almost comparable to what Alex probably feels right now..")

		saynn("After a few seconds of unbearable agony, the bluespace crystal attached to the board overheats.. and cracks.. finally ending the broadcast.")

		saynn("Avy is furious, even after being downed, she starts crawling towards you, her eyes full of rage. Her friends quickly pull her away from you luckily.")

		saynn("You hear Alex coughing..")

		addButton("Alex!", "Forget about them", "time6_won_savealex")
	if(state == "time6_into_first_fight"):
		playAnimation(StageScene.Duo, "dodge", {npc="volk", npcAction="shiv"})
		saynn("[say=pc]You're gonna pay for this, you fuckers.[/say]")

		saynn("You were ready to fight the buff horse but the gray wolf steps in and pulls a shiv out, before trying to stab you with it!")

		saynn("[say=volk]Wanna see the world red, suka. Gonna make you leak.[/say]")

		saynn("Luckily you manage to avoid his first swing..")

		saynn("It's time to fight.")

		addButton("Fight", "Start the first fight", "time6_first_fight")
	if(state == "time6_lost_fight"):
		playAnimation(StageScene.Solo, "defeat")
		saynn("You lost the fight.. Ow.. The bruises hurt badly.")

		saynn("Alex is being beat up in the background.. You have to stop them or they're gonna kill him..")

		saynn("Think..")

		addButton("Shock remote", "Try to use it", "time6_lost_fight_useremote")
	if(state == "time6_lost_fight_useremote"):
		playAnimation(StageScene.Solo, "kneel")
		saynn("The remote! Or.. whatever is left of it. You sneakily crawl to it and start inspecting while Alex is being beaten up in the background by all three of the inmates..")

		saynn("[say=avy]Ready to talk, failed hero? I really don't want to kill you. Just tell me how to unlock the collars and I will be out of your way~.[/say]")

		saynn("Alex yelps as he collapses, unable to fight any longer..")

		saynn("You reach the shock remote.. fuck.. It's smashed to bits. Wait.. Who cares if it's smashed, you just need to trigger it. You use your knowledge to disassemble it. Now you just need to short-circuit one of the pins with something metal..")

		saynn("Alex growls back and tries to free himself, his spine whirring loudly. Avy just stares him into the eyes.")

		saynn("[say=avy]Aww, you think you're strong?[/say]")

		saynn("Avy suddenly throws Alex down to the cold floor.. before [b]stomping[/b] on his back hard, [b]crushing his prosthetic spine[/b].. Sparks bursting out of it as Alex lets out a gut-wrenching cry.")

		saynn("[say=alexrynard]A-ARGH!..[/say]")

		saynn("[say=pc]NO! YOU BITCH![/say]")

		saynn("[say=avy]But you're just a spineless beta. Don't go anywhere, I need to deal with your little wife~.[/say]")

		saynn("Alex is in too much pain to respond, his broken prosthetic is making his whole body twitch in an uncontrollable agony..")

		saynn("Avy looks at you next.")

		saynn("[say=avy]What was that, little slut?[/say]")

		saynn("She starts walking towards you. Your hands are shaking.. you manage to find a little metal piece and jam it into the board..")

		saynn("Moments later, all four nearby collars activate..")

		saynn("[say=avy]ARGH![/say]")

		saynn("[say=stud]NGH.[/say]")

		saynn("[say=volk]SUKAAA![/say]")

		saynn("A similar cry leaves your mouth too.. the pain is almost comparable to what Alex probably feels right now..")

		saynn("After a few seconds of unbearable agony, the bluespace crystal attached to the board overheats.. and cracks.. finally ending the broadcast.")

		saynn("Avy is furious, even after being downed, she starts crawling towards you, her eyes full of rage. Her friends quickly pull her away from you luckily.")

		saynn("You hear Alex coughing..")

		addButton("Alex!", "Forget about them", "time6_won_savealex")
	if(state == "time6_second_fight"):
		playAnimation(StageScene.Duo, "stand", {npc="stud"})
		saynn("You managed to beat the gray wolf. He hisses loudly as he hits the floor, his hand dropping the shiv.")

		saynn("[say=volk]I WILL CUT YOU-U..[/say]")

		saynn("The horse is still blocking your path though.")

		saynn("[say=avy]Fuck.[/say]")

		saynn("You look behind the stud and notice that Alex has managed to bring the dark foxy down.. But not for long, she injects something into herself and rushes back into the fight.")

		saynn("[say=stud]I will crush you, stupid whore.[/say]")

		saynn("Can't avoid this one.. Time to fight..")

		addButton("Fight", "Start the first fight", "time6_do_second_fight")
	if(state == "time6_third_fight"):
		playAnimation(StageScene.Duo, "defeat", {pc="alexrynard", npc="avy"})
		saynn("[say=alexrynard]Fuck!..[/say]")

		saynn("Alex drops to his knees, defeated. Avy grabs him by the throat, her claws putting pressure on his skin.")

		saynn("[say=avy]Ready to talk, failed hero? I really don't want to kill you. Just tell me how to unlock the collars and I will be out of your way~.[/say]")

		saynn("[say=pc]Hey! Let him go and fight me, you bitch.[/say]")

		saynn("Alex just growls back and tries to free himself, his spine whirring loudly. Avy just stares him into the eyes.")

		saynn("[say=avy]Aww, you think you're strong?[/say]")

		saynn("Avy suddenly throws Alex down to the cold floor.. before [b]stomping[/b] on his back hard, [b]crushing his prosthetic spine[/b].. Sparks bursting out of it as Alex lets out a gut-wrenching cry.")

		saynn("[say=alexrynard]A-ARGH!..[/say]")

		saynn("[say=avy]But you're just a spineless beta. Don't go anywhere, I need to deal with your little wife~.[/say]")

		saynn("Alex is in too much pain to respond, his broken prosthetic is making his whole body twitch in an uncontrollable agony..")

		saynn("Avy looks at you next.")

		saynn("[say=avy]Come here, bitch.[/say]")

		saynn("She is still clearly under the influence of something.. Who knows when it will run out. Time to fight..")

		addButton("Fight", "Start the first fight", "time6_do_third_fight")
	if(state == "time6_lost_avy"):
		playAnimation(StageScene.Solo, "defeat")
		saynn("You drop to your knees, defeated..")

		saynn("[say=avy]That's what you get.[/say]")

		saynn("Avy turns towards Alex who is coughing and grunts as something in his back sparks..")

		saynn("[say=avy]I'm not done with you.[/say]")

		saynn("Fuck, she is gonna kill him. You have to stop her..")

		saynn("Think..")

		addButton("Shock remote", "Try to use it", "time6_lost_avy_remote")
	if(state == "time6_lost_avy_remote"):
		saynn("The remote! Or.. whatever is left of it. You sneakily crawl to it and start inspecting while Alex is being surrounded by all three inmates..")

		saynn("[say=avy]Wanna talk? Silence costs a lot these days, you know.[/say]")

		saynn("You reach the shock remote.. fuck.. It's smashed to bits. Wait.. Who cares if it's smashed, you just need to trigger it. You use your knowledge to disassemble it. Then you take a metallic piece and short-circuit one of the pins..")

		saynn("Moments later, all four nearby collars activate..")

		saynn("[say=avy]ARGH![/say]")

		saynn("[say=stud]NGH.[/say]")

		saynn("[say=volk]SUKAAA![/say]")

		saynn("A similar cry leaves your mouth too.. the pain is almost comparable to what Alex probably feels right now..")

		saynn("After a few seconds of unbearable agony, the bluespace crystal attached to the board overheats.. and cracks.. finally ending the broadcast.")

		saynn("Avy is furious, even after being downed, she starts crawling towards you, her eyes full of rage. Her friends quickly pull her away from you luckily.")

		saynn("You hear Alex coughing..")

		addButton("Alex!", "Forget about them", "time6_won_savealex")
	if(state == "time6_won_avy"):
		playAnimation(StageScene.Duo, "stand", {npc="avy", npcAction="defeat"})
		saynn("Avy drops to her knees, defeated.")

		saynn("[say=avy]Stupid bitch..[/say]")

		saynn("You slowly approach her. It'd probably be fitting to break something of hers in return.. At least a few bones.")

		saynn("[say=alexrynard]Agh-h.. h..[/say]")

		saynn("Alex's painful cries make your dark thoughts poof. You turn your head and see him coughing blood.. This isn't good..")

		saynn("Avy smirks.")

		saynn("[say=avy]Go on, save your broken toy.[/say]")

		addButton("Alex!", "Forget about Avy", "time6_won_savealex")
		addButton("Kick crotch", "(CBT) Kick Avy's crotch first", "time6_won_kickavy")
	if(state == "time6_won_kickavy"):
		playAnimation(StageScene.SexFeetPlay, "crotch", {pc="pc", npc="avy"})
		saynn("Nope, she is not getting away that easy. Time is critical but you just can't stop yourself from quickly raising your leg and stomping on Avy's crotch [b]hard[/b].")

		saynn("[say=avy]Wai-.. AGH! F-FUCK! FUCK-FUCK-Fuck![/say]")

		saynn("This girl is clearly packing.. was. Your mean stomp makes her whole body tense up, the poor foxy grabs onto her crotch and starts rolling around on the floor, painful cries escaping her maw.")

		saynn("[say=pc]You're the one with the broken toy now, stupid bitch.[/say]")

		saynn("[say=avy]F-Fuck y-you!..[/say]")

		saynn("Avy's friends quickly pull her away from you. Right, Alex is still coughing..")

		addButton("Alex!", "Forget about them", "time6_won_savealex")
	if(state == "time6_won_savealex"):
		removeCharacter("avy")
		removeCharacter("stud")
		removeCharacter("volk")
		playAnimation(StageScene.GivingBirth, "birth", {pc="alexrynard"})
		saynn("You rush to Alex and crouch near him.")

		saynn("Avy and her friends use this moment to escape. They clearly won't get what they want from Alex while he is in this state anyway..")

		saynn("[say=pc]Alex![/say]")

		saynn("[say=alexrynard]Gh-h-h..[/say]")

		saynn("He is grinding his teeth, hissing loudly, his whole body is still twitching. Each few seconds something in his back sparks, causing him to drop one painful cry after another.")

		saynn("[say=alexrynard]F-fuck.. AGH!..[/say]")

		saynn("[say=pc]I have to help you now.[/say]")

		saynn("You reach your hands to his clothing.. but he suddenly slaps them away.")

		saynn("[say=alexrynard]N-No! C-call.. help.. Kgh..[/say]")

		saynn("He is coughing blood while his own spine is sending shocks through his heart constantly, the guy clearly won't survive another minute unless you do something now..")

		saynn("You get a glimpse of his eyes.. they're full of fear.. raw animal fear..")

		addButton("His spine", "You have to try to reach it", "time6_won_reachspine")
	if(state == "time6_won_reachspine"):
		playAnimation(StageScene.GivingBirth, "birth", {pc="alexrynard", bodyState={naked=true}})
		saynn("His uniform is in the way so you can't even examine his prosthetic spine, you have to take off his clothes.")

		saynn("But each time you try to pull off his shirt, Alex grunts painfully and shoves you back.")

		saynn("[say=alexrynard]ARGH! N-NO![/say]")

		saynn("He is not thinking straight, you have to do something fast..")

		saynn("It doesn't get easier, his spine spews some oil out.. and then sparks again.. causing an instant fire! So much for the fucking first task as an apprentice!")

		saynn("While Alex is busy.. burning.. you manage to take off his toolbelt. You find some wire cutters that you quickly use to cut through the cloth of his shirt, tossing the burning pieces away.")

		saynn("Now you have to find a way to.. turn off.. his spine. But Alex is still resisting you.")

		saynn("[say=alexrynard]D-DON'T! YOU GONNA.. K-KILL ME.[/say]")

		saynn("Well maybe he should have let you practice fixing his spine when he had the chance..")

		addButton("Talk to him", "Try to persuade him into not resisting", "time6_alex_trytalkfirst")
		addButton("Knock him out", "There is no time for talking. Time for quick solutions", "time6_alex_knockout")
	if(state == "time6_alex_knockout"):
		playAnimation(StageScene.Solo, "stand")
		saynn("The way he resists.. leaves you no choice.")

		saynn("[say=pc]I'm sorry Alex..[/say]")

		saynn("Carefully but strictly, you wrap your arms around him, the inner side of your elbows pressed firmly against his throat. You have no idea how to do this correctly.. so you just start to push on his neck, trying to knock him out.")

		saynn("[say=alexrynard]Y-you're.. k-killing.. I'm g-gonna.. d-die..[/say]")

		saynn("[say=pc]I have to.. I'm sorry..[/say]")

		saynn("You keep him in this choke-hold as still as you can. All the while Alex is desperately trying to pry your arms off.. even now.. when he is getting weaker and weaker..")

		saynn("Sparks hit your skin.. leaving little dark dots of burned flesh on it. You have to..")

		saynn("Eventually Alex stops resisting.. Instantly, you stop choking him and check on his pulse.. extremely faint one.")

		saynn("His own spine is still shocking him every few seconds, threatening to stop his heart any second.. You have to.. turn the power off somehow. Hopefully you can just cut through some wires..")

		saynn("You carefully turn Alex onto his belly and get a better look at his back.. Fuck.. So much blood here too. Blood and burned fur. Is that his.. original spine poking through.. gross, it's all broken.. No wonder he is coughing blood.")

		saynn("You slip your wire cutters into that mess of metal, bones and flesh.. and start cutting through the wiring.. One wrong motion causes the sparks to hit all over your face, blinding you for a second and making Alex's body jerk.")

		saynn("You keep cutting through.. anything you can get to really. Eventually, the sparks stop coming out.. Good.")

		saynn("You carefully put Alex onto the floor. He is still breathing heavily and coughing occasionally.. But at least his own spine isn't killing him anymore..")

		saynn("Now it should be relatively safe to find someone.")

		addButton("Get help", "Find somebody to help you", "time6_alex_blur")
	if(state == "time6_alex_trytalkfirst"):
		saynn("You put your hands on the foxy and try to make him understand.")

		saynn("[say=pc]Alex, listen to me! You have to tell me how to disable your spine. And you have to actually let me. Please![/say]")

		saynn("Alex looks at you with his scared shaky eyes.. and keeps shaking his head.. while coughing up blood.. The shocks make him grab onto his heart more and more..")

		saynn("He is getting weaker.. Why doesn't he trust you..")

		addButton("Talk more", "Keep trying to persuade him while you can..", "time6_alex_moretalk")
		addButton("Knock him out", "There is no time for talking. Time for quick solutions", "time6_alex_knockout")
	if(state == "time6_alex_moretalk"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="alexrynard", bodyState={naked=true}})
		saynn("[say=pc]Alex, please. You might not want to trust me. But right now you have to. You hear me? Just this time.[/say]")

		saynn("Alex is grunting heavily.. he nods a few times.. and does his best to keep himself still.")

		saynn("[say=alexrynard]W-wires.. F-fuck.. Kgh.. C-cut.[/say]")

		saynn("Right, cut through all of the wires.. Should be easy enough. You just have to avoid panicking..")

		saynn("You carefully turn Alex onto his belly and get a better look at his back.. Fuck.. So much blood here too. Blood and burned fur. Is that his.. original spine poking through.. gross, it's all broken.. No wonder he is coughing blood.")

		saynn("You slip your wire cutters into that mess of metal, bones and flesh.. and start cutting through the wiring.. One wrong motion causes the sparks to hit all over your face, blinding you for a second and making Alex jerk.")

		saynn("[say=alexrynard]I'm g-gonna die.. Argh.. It hurts.. e-everything..[/say]")

		saynn("[say=pc]No, Alex, stay with me.[/say]")

		addButton("Continue", "See what happens next", "time6_alex_talk_final")
	if(state == "time6_alex_talk_final"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You keep cutting through.. anything you can get to really. Alex is grunting heavily.. until his legs finally 'turn off'. The pain goes away.. just like every other feeling.")

		saynn("You carefully put Alex onto the floor. He is still breathing heavily and coughing occasionally.. But at least his own spine isn't killing him anymore..")

		saynn("[say=pc]I.. I will go get help now. Everything will be okay, trust me.[/say]")

		saynn("He doesn't say anything back.")

		addButton("Get help", "Find somebody to help you", "time6_alex_blur")
	if(state == "time6_alex_blur"):
		removeCharacter("alexrynard")
		playAnimation(StageScene.Solo, "sit")
		aimCameraAndSetLocName("med_lobbyse")
		GM.pc.setLocation("med_lobbymain")
		saynn("Next few moments become a blur.. You rush out of the mineshaft and find the first staff member that you can.. You quickly tell them everything that happened.. After that.. You just don't remember it anymore.")

		saynn("You snap out of it only about an hour later. You find yourself sitting on one of the benches in the medical lobby.. You faintly remember the moment when three nurses rushed past you, pushing an emergency medical stretcher past you with unconscious Alex on it..")

		saynn("You did everything you could.. Now you can only wait.")

		saynn("Your first task didn't go exactly as planned, huh..")

		addButton("Continue", "See what happens next", "time6_eliza_approaches")
	if(state == "time6_eliza_approaches"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("[say=eliza]Wanna wash your hands?[/say]")

		saynn("[say=pc]Huh?[/say]")

		saynn("You look at your hands.. They're covered in blood.. How did you not notice that..")

		saynn("[say=pc]Yeah.[/say]")

		saynn("[say=eliza]Follow me.[/say]")

		addButton("Follow", "See where Eliza brings you", "time6_eliza_follow")
	if(state == "time6_eliza_follow"):
		aimCameraAndSetLocName("med_researchlab")
		setFlag("AlexRynardModule.ch2GotRektHappened", true)
		setFlag("AlexRynardModule.ch2GotRektDay", GM.main.getDays())
		saynn("She brings you into one of the labs and points at the sink. You start washing your hands and your face.")

		saynn("[say=eliza]Looks like you and Alex had a very rough day..[/say]")

		saynn("[say=pc]How is he?[/say]")

		saynn("Eliza stays quiet for some time.")

		saynn("[say=eliza]Alive. Barely. Surgeons are fighting for his life. His injuries are.. better not talk about it.[/say]")

		saynn("You sigh.")

		saynn("[say=eliza]Yeah.. I feel you.. I wish I had something better to say. Come back tomorrow, you look like you need rest.[/say]")

		saynn("You nod. Eliza guides you back to the medical lobby and pats you on the back.")

		saynn("[say=eliza]He is strong, he will pull through.[/say]")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "endthescene")

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

	if(_action == "time5_returningback"):
		processTime(10*60)

	if(_action == "time5_nocuffs"):
		GM.pc.freeMouthDeleteAll()
		GM.pc.freeArmsDeleteAll()
		GM.pc.freeLegsDeleteAll()

	if(_action == "time6_mine"):
		processTime(10*60)

	if(_action == "time6_avy_and_gang"):
		processTime(5*60)

	if(_action == "time6_lookatshockremote"):
		addExperienceToPlayer(100)

	if(_action == "time6_first_fight"):
		runScene("FightScene", ["volk"], "time6_fight_1")
		return

	if(_action == "time6_do_second_fight"):
		runScene("FightScene", ["stud"], "time6_fight_2")
		return

	if(_action == "time6_do_third_fight"):
		runScene("FightScene", ["avy"], "time6_fight_3")
		getCharacter("avy").addEffect(StatusEffect.DrugStrong, [6])
		return

	if(_action == "time6_won_kickavy"):
		setFlag("AlexRynardModule.ch2CBTAvy", true)
		didCBT = true

	if(_action == "time6_alex_knockout"):
		setFlag("AlexRynardModule.ch2KnockedAlexOut", true)

	if(_action == "time6_alex_talk_final"):
		processTime(10*60)

	if(_action == "time6_alex_blur"):
		processTime(60*60)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "time6_fight_1"):
		processTime(5 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("time6_second_fight")
			addExperienceToPlayer(10)
		else:
			setState("time6_lost_fight")
			addExperienceToPlayer(5)

	if(_tag == "time6_fight_2"):
		processTime(5 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("time6_third_fight")
			addExperienceToPlayer(100)
		else:
			setState("time6_lost_fight")
			addExperienceToPlayer(5)

	if(_tag == "time6_fight_3"):
		processTime(5 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("time6_won_avy")
			addExperienceToPlayer(50)
		else:
			setState("time6_lost_avy")
			addExperienceToPlayer(10)

func saveData():
	var data = .saveData()

	data["howManyTimes"] = howManyTimes
	data["usedCondom"] = usedCondom
	data["condomBroke"] = condomBroke
	data["breakChance"] = breakChance
	data["didCBT"] = didCBT

	return data

func loadData(data):
	.loadData(data)

	howManyTimes = SAVE.loadVar(data, "howManyTimes", 0)
	usedCondom = SAVE.loadVar(data, "usedCondom", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
	breakChance = SAVE.loadVar(data, "breakChance", 0.0)
	didCBT = SAVE.loadVar(data, "didCBT", false)
