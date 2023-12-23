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
