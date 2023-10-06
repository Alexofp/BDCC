extends SceneBase

var isFirstTime = false
var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var hadSex = false
var fuckedTavi = false
var fuckedRahi = false
var creamed = false
var tookVirginity = false
var straponLoaded = false
var straponContents = ""

func _init():
	sceneID = "Ch6TaviRahiButtstackScene"

func _initScene(_args = []):
	if(_args.size() > 0 && _args[0]):
		isFirstTime = true

func _run():
	if(state == ""):
		addCharacter("tavi", ["naked"])
		addCharacter("rahi", ["naked"])
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		playAnimation(StageScene.ButtStack, "idle", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}})
		if (isFirstTime):
			saynn("The night was alright, you rub your eyes, still seeing some fog. You were about to step out of your cell when suddenly..")

			saynn("[say=rahi]Meow..[/say]")

			saynn("Rahi's voice? You suddenly realize that you missed an obvious detail. Both, Rahi and Tavi, are in your cell!")

			saynn("[say=tavi]Hey, owner~.[/say]")

			saynn("[say=rahi]Hello, {rahiMaster}..[/say]")

			saynn("Wait, why are they on top of each other like that? Rahi seems to be standing on all fours while Tavi is standing above, on all fours as well.")

			saynn("[say=pc]You two know each other?[/say]")

			saynn("[say=tavi]We got to know each other while you were sleeping~. Right, kitty?[/say]")

			saynn("[say=rahi]Meow.. Miss Tavi knows how to make friends, yes..[/say]")

			saynn("You can't help but to chuckle. Oh wow, they're both naked actually. As you walk around them, your eyes are presented with a beautiful sight: 2 naked feline butts, stacked on top of each other. A butt stack?")

			saynn("[say=pc]Why are you stacked like that?[/say]")

			saynn("[say=tavi]We both want walkies~. Woof~.[/say]")

			saynn("That doesn't really answer the question.. but.. you did train them both to be good obedient pups. Tavi playfully bounces while rubbing her {tavi.breasts} against Rahi's back, making her squirm underneath.")

			saynn("[say=rahi]Wruff..[/say]")

			saynn("Both their pussies are out on display too. Their slightly aroused scents are mixing together, making you feel kinda horny too.")

			saynn("You give both your kitties some headpats as a reward for getting along so quickly.")

			saynn("But now it's time to choose what you wanna do. You can give them walkies.. Or..")

			saynn("The more you look at this stack of butts.. the more you realize that it would be quite fun to fuck.. Maybe you can give them walkies after you do that.")

		else:
			saynn("You tell Tavi that you kinda wanna see her and Rahi in that strange position again.")

			saynn("[say=tavi]Oh~. Give me a second.[/say]")

			saynn("Tavi rushes out of the cell, probably to hunt Rahi out. And then, minutes later, she returns with the cute brown feline walking behind her.")

			saynn("[say=rahi]Meow?.. Me-..Ow![/say]")

			saynn("Before Rahi can finish her cat noise, Tavi suddenly tackles her, taking the top spot while pinning the girl to the floor, her paws quickly undressing her.")

			saynn("[say=rahi]Your kitty is here, {rahiMaster}..[/say]")

			saynn("[say=tavi]Mhm~. What are you gonna do to us?[/say]")

			saynn("You step around your pets. And there it is, a glorious butt stack. Both of the girls' asses are out on full display. Rahi is squirming slightly while Tavi is rubbing against her, their tails intertwining.")

		if (!GM.pc.hasReachablePenis()):
			addButtonWithChecks("Put on strapon", "Have some fun with the girls first", "pick_strapon", [], [ButtonChecks.HasStraponAndCanWear])
		else:
			addButton("Whip cock out", "Have some fun with the girls first", "whip_cock_out")
		addButton("Walkies", "Skip the sex and go straight to walkies", "start_walkies")
	if(state == "whip_cock_out"):
		playAnimation(StageScene.ButtStackSex, "tease", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}, npc2="pc", npc2BodyState={exposedCrotch=true, hard=true}})
		saynn("[say=pc]Let's have some fun first.[/say]")

		saynn("You let the girls see your {pc.penis} as you expose it and present it to their faces.")

		saynn("[say=pc]Little help?[/say]")

		saynn("Rahi is first to reach out and nuzzle your crotch until your cock starts inflating with blood. Tavi joins her soon after, they both rub their cheeks against your shaft. After that, the high kitty rolls her green tongue and starts licking the tip while the lower one pushes her snout into your balls and starts licking them instead. Feels pretty good..")

		saynn("[say=rahi]Ruff..[/say]")

		saynn("After you get fully hard, you position yourself behind their beautiful fluffy butts. Tavi wiggles her behind at you, causing Rahi to follow her motions. Their tails are intertwined, rubbing against each other before pulling to the side, giving you full access to their pussy slits.."+str(" Tavi is still a virgin though, maybe you shouldn't fuck her.. Or maybe now is the time?" if isVirgin else " Both of them are slightly wet already, awaiting to be used.")+"")

		saynn("Who is gonna be first?")

		addButton("Rahi", "Fuck Rahi's pussy", "do_fuck_rahi")
		addButton("Tavi", "Fuck Tavi's pussy", "do_fuck_tavi")
	if(state == "do_fuck_tavi"):
		playAnimation(StageScene.ButtStackSex, "sexup", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}, npc2="pc", npc2BodyState={exposedCrotch=true, hard=true}})
		if (!fuckedRahi):
			saynn("And so you decide to start with Tavi since she is such a playful needy pet. And Rahi is a very obedient one so she can wait for a bit.")

		else:
			saynn("After finishing fucking Rahi, you pull out and switch to your other pet, Tavi. Would have been strange not to take advantage of such a kinky situation to the fullest.")

		saynn("You raise yourself so your cock is at her pussy level. One of your hands lands on her butt and gently gropes it while the second guides your member to brush against her sensitive"+str(" virgin-tight" if isVirgin else "")+" folds.")

		saynn("[say=tavi]Oh.. woof..[/say]")

		if (tookVirginity):
			saynn("Tavi freezes as she suddenly realizes what you're about to do. She is scared.. but she doesn't seem to be against it.")

			saynn("You align yourself a little better and start putting pressure on her pussy. The petals quickly spread but then you encounter Tavi's hymen, an organic seal, the last sign of Tavi's innocence. The more you push on it, the more Tavi starts whining and shivering. Even the bottom cat is concerned.")

			saynn("[say=rahi]Is Miss Tavi okay?..[/say]")

			saynn("[say=pc]Miss Tavi is about to become a real woman.[/say]")

			saynn("[say=rahi]Oh..[/say]")

			saynn("[say=tavi]AH!..[/say]")

			saynn("And so, with one rough motion, you suddenly feel yourself getting through her barricade, your cock finally [b]stealing Tavi's virginity[/b]. She yelps painfully as her inner walls clench around their first ever dick. Her pussy has begun bleeding, drops of glowing green blood dripping down on Rahi's butt.")

			saynn("You let Tavi get used to these new sensations. She is still shivering, her fur standing on end, her tail spazzing out.")

			saynn("[say=pc]How do you feel?[/say]")

			saynn("She closes her eyes for a short second, her tail slowly calming down when Rahi's is rubbing against it.")

			saynn("[say=tavi]You can.. continue..[/say]")

		else:
			saynn("You align yourself a little better and start putting pressure on her pussy. The petals quickly spread for your cock. And since she isn't a virgin anymore, you freely slide inside, deeper into her pussy. She is tight though.. incredibly tight..")

			if (fuckedRahi):
				saynn("[say=rahi]Miss Tavi is getting fucked by the {rahiMaster} too now![/say]")

				saynn("Tavi purrs softly, her inner walls clenching around your member so well.")

				saynn("[say=tavi]Woof..[/say]")

				saynn("[say=pc]That's right, Rahi. There is plenty to share.[/say]")

			else:
				saynn("[say=rahi]Miss Tavi got to be first..[/say]")

				saynn("[say=pc]Don't be jealous, kitty. There is plenty to share.[/say]")

				saynn("Tavi purrs softly, her inner walls clenching around your member so well.")

				saynn("[say=tavi]Woof..[/say]")

		saynn("You start off slow, moving your hips at a slow pace to let the tall feline adjust to your length. And quite quickly, little moans begin to escape from the top feline while the bottom one has to try to provide a stable platform.")

		saynn("[say=tavi]Ah..[/say]")

		saynn(""+str("So little time has passed since Tavi lost her virginity. And she is already starting to enjoy it. Her pussy is still bleeding slightly.. but it's also coating your dick with her juices." if tookVirginity else "Her pussy is coating your dick with her juices.")+" Tavi gets pushed forward on each of your thrusts, allowing you to meet her on the way back and ram your {pc.penis} deeper and deeper. You can use a better grip though..")

		addButton("Faster", "Fuck Tavi faster", "do_fuck_tavi_faster")
	if(state == "do_fuck_tavi_faster"):
		playAnimation(StageScene.ButtStackSex, "fastup", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}, npc2="pc", npc2BodyState={exposedCrotch=true, hard=true}})
		saynn("And a better grip you find. You reach one of your hands and get a firm grasp on Tavi's hair, allowing you to fuck her pussy faster and harder. Feeling the discomfort, Tavi is hissing softly.. but her pussy is getting even tighter while you do that, her inner walls kneading your cock, making you eager.")

		saynn("[say=rahi]Roughness can be fun, Miss Tavi, yes-yes..[/say]")

		saynn("[say=tavi]I.. k-know.. ah-h!..[/say]")

		saynn("Suddenly, her body arches more and starts shivering, her"+str(" not-so-virgin" if tookVirginity else "")+" pussy pulsing before producing a fountain of girlcum! A fountain that makes your dick and Rahi's fur all wet.")

		saynn("[say=rahi]Miss Tavi is cumming.. Kitty can feel it..[/say]")

		saynn("Tavi's tongue is out, she is moaning loudly while drooling and clenching around you. The pleasurable friction quickly pushes to your own peak.. Pulling out now would be such a waste..")

		addButton("Cum inside", "Give Tavi some of your cream", "do_fuck_tavi_cum")
	if(state == "do_fuck_tavi_cum"):
		playAnimation(StageScene.ButtStackSex, "insideup", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}, npc2="pc", npc2BodyState={exposedCrotch=true, hard=true}})
		saynn("And so you ram your cock as deep as that pussy allows.. breaking into Tavi's womb. She moans passionately while you grunt, your throbbing dick stuffing a huge load of your thick {pc.cum} inside her, one pulsating motion at a time.."+str(" From virgin to a cum dumpster.. So quick.." if tookVirginity else "")+"")

		saynn("[say=tavi]Hh-h..[/say]")

		saynn("[say=pc]Ngh-h..[/say]")

		saynn("[say=rahi]Yes, breed your pets, {rahiMaster}..[/say]")

		saynn("Rahi seems to be the most happy about this. "+str("She probably just got inpatient, waiting for her turn." if !fuckedRahi else "What a cute kitty.")+"")

		saynn("Tavi is panting heavily, her pussy overflowing with seed. Some of it is leaking out already, messing up her fur but also the fur of the pet below.")

		saynn("[say=rahi]So messy..[/say]")

		saynn("[say=pc]You two can lick each other now though.[/say]")

		saynn("[say=rahi]That's.. that's not wrong..[/say]")

		saynn("So.. what's now?")

		if (!fuckedRahi):
			addButton("Rahi", "Time to breed Rahi too now", "do_fuck_rahi")
		addButton("Walkies", "Take your pets out on walkies", "start_walkies")
	if(state == "do_fuck_rahi"):
		playAnimation(StageScene.ButtStackSex, "sexdown", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}, npc2="pc", npc2BodyState={exposedCrotch=true, hard=true}})
		if (!fuckedTavi):
			saynn("And so you decide to start with Rahi since she is a good kitty that didn't try to throw Tavi off, instead obeying and presenting herself to you.")

			saynn("Without hesitation, you position yourself so your {pc.penis} is at Rahi's butt level. One of your hands is gently caressing the hips of the kitty who got pinned by a much taller purple feline while the second one already aligns your member with Rahi's sex. And then, with one careful thrust, you enter her, your dick spreading Rahi's slick folds and sliding between them without much problems.")

			saynn("[say=rahi]Woo-of..[/say]")

			saynn("Tavi looks down at Rahi's face with a slightly jealous look.")

			if (isVirgin):
				saynn("[say=tavi]Wonder how that feels..[/say]")

			else:
				saynn("[say=tavi]Good puppy, you love getting fucked, don't you?[/say]")

		elif (tookVirginity):
			saynn("After taking Tavi's virginity.. you might as well fuck your other pet. Rahi is probably waiting for her turn for quite a while now.")

			saynn("So you quickly pull your cock out.. and then just as quickly align it with Rahi's needy slit before thrusting inside, without even cleaning the previous cum, pussy juices or the green smears. It all mixes together with Rahi's juices, allowing for easier fucking.")

			saynn("[say=rahi]Woo-of..[/say]")

			saynn("Tavi slowly recovers after her first vaginal sex ever..")

			saynn("[say=tavi]Good p-puppy.. I know how you feel n-now..[/say]")

		else:
			saynn("Rahi is being surprisingly inpatient about this.. but how can not fuck both of your pets when they're stacked like that? So it's time to satisfy the brown kitty's desires as well.")

			saynn("You quickly pull your cock out.. and then just as quickly align it with Rahi's needy slit before thrusting inside, without even cleaning the previous cum or the pussy juices. It all mixes together with Rahi's juices, allowing for easier fucking.")

			saynn("[say=rahi]Woo-of..[/say]")

			saynn("Tavi slowly recovers after being first.")

			saynn("[say=tavi]Good puppy..[/say]")

		saynn("And so you begin to fuck Rahi, her lithe form barely withstanding an onslaught from both you and the feline on top. Moans begin to escape from her while you ram your cock inside her welcoming warmth, her inner walls clenching your cock so well.")

		saynn("[say=rahi]Ah.. ah.. Your kitty.. puppy.. loves this..[/say]")

		if (fuckedTavi):
			saynn("As you fuck Rahi, you obviously can't avoid looking at Tavi and her stuffed pussy. She is still leaking your cream onto the brown fur.. so you decide to spank that purple ass, causing her to clench.")

			saynn("[say=tavi]Ah!.. Why me?[/say]")

			saynn("After that rough smack, you decide to rub her clit instead, bringing the used kitty some pleasure instead.")

		else:
			saynn("As you fuck Rahi, you obviously can't avoid looking at Tavi and her wet"+str(" virgin" if isVirgin else "")+" pussy. You free one of your hands and rub it, your digits playing with the tall kitty's clit.")

			saynn("[say=tavi]Ah..[/say]")

			saynn("Pleasuring both pets at the same time is fun.")

		addButton("Faster", "Fuck Rahi faster", "do_fuck_rahi_fast")
	if(state == "do_fuck_rahi_fast"):
		playAnimation(StageScene.ButtStackSex, "fastdown", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}, npc2="pc", npc2BodyState={exposedCrotch=true, hard=true}})
		saynn("Both Rahi and Tavi moan while you fuck one and rub the other, their combined noises sounding like a symphony of raw sex. You decide to add to it with your wet and rhythmic sounds of thrusts, your hips smacking against Rahi's butt while you fuck her faster and harder.")

		saynn("[say=rahi]Ah.. She is g-gonna..[/say]")

		saynn("You decide to focus on the brown feline, leaving Tavi to pant softly.."+str(" You might get to her soon anyway." if !fuckedTavi else " She got her share of the fun anyway.")+"")

		saynn("As Rahi's climax approaches, her inner walls begin to hug your length so well.. you can't help but to fight the friction and keep up your pace.. Until that pussy suddenly cums..")

		saynn("[say=rahi]Ah-h-h!..[/say]")

		saynn("She arches her back, giving the feline on top a wild ride, moaning and squirming while her pussy clenches around you tight, a fountain of girlcum gushing out of its little hole, a sign of how much you pushed her.")

		saynn("Rahi is still squirming so Tavi decides to get a tighter grip on her, holding the orgasming feline still for you.")

		if (fuckedTavi):
			saynn("[say=tavi]Cum inside her.. Like you came inside me..[/say]")

		else:
			saynn("[say=tavi]Cum inside her.. She clearly wants it.[/say]")

		saynn("It's not like pulling out was even an option..")

		addButton("Cum inside", "Breed Rahi", "do_fuck_rahi_cum")
	if(state == "do_fuck_rahi_cum"):
		playAnimation(StageScene.ButtStackSex, "insidedown", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}, npc2="pc", npc2BodyState={exposedCrotch=true, hard=true}})
		saynn("Rahi's pussy shoves you over the edge.. and you welcome it.. moaning softly while your {pc.penis} is pulsating inside her.. seconds before releasing a load of thick sticky {pc.cum}, flooding her womb to the brim.")

		saynn("[say=rahi]Nya-a-a..[/say]")

		saynn("Tavi is smiling while holding Rahi in place for you to be able to breed her properly."+str(" Her own cunt leaking seed too while she does that." if fuckedTavi else "")+"")

		saynn("[say=tavi]Where did you find such a cutie anyway.[/say]")

		saynn("The brown feline has her tongue, panting and drooling. Tavi slips a digit into that opened mouth and Rahi obediently sucks on it.")

		saynn("So.. what's now?")

		if (!fuckedTavi):
			addButton("Tavi", "Time to breed Tavi too now", "do_fuck_tavi")
		addButton("Walkies", "Take your pets out on walkies", "start_walkies")
	if(state == "start_walkies"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="allfours", flipNPC=true, pc="tavi", bodyState={naked=true}, npcBodyState={naked=true}})
		if (!hadSex):
			saynn("You decide not to fuck your pets today and just tell them to get off each other."+str(" Fucking Rahi would probably make Tavi gealous. But fucking her as well would mean stealing her virginity.." if isVirgin else "")+"")

			saynn("[say=tavi]Aw, okay. Have something better in mind?..[/say]")

			saynn("Tavi stands up and takes a step to the side, presenting a naked self. And Rahi still stays on all fours.")

			saynn("[say=rahi]Wruff..[/say]")

		else:
			if (fuckedRahi && fuckedTavi):
				saynn("After "+str("breeding" if creamed else "straponing")+" both of your pets, you finally tell them to get off each other.")

				saynn("[say=tavi]Oh~? We're gonna do something else?[/say]")

				saynn("Tavi stands up and takes a step to the side, presenting a naked self, her legs shaking a little. And Rahi still stays on all fours.")

				saynn("[say=rahi]Wruff..[/say]")

			elif (fuckedRahi):
				saynn("You "+str("bred" if creamed else "straponed")+" Rahi.. and that's probably enough."+str(" Fucking Tavi would mean stealing her virginity which you didn't wanna do." if isVirgin else "")+" You finally tell them to get off each other.")

				saynn("[say=rahi]But Miss Tavi didn't get..[/say]")

				if (isVirgin):
					saynn("[say=tavi]It's okay, kitty. Owner knows best.[/say]")

				elif (creamed):
					saynn("[say=tavi]Maybe {pc.he} wasted all {pc.his} seed on your pussy~.[/say]")

				else:
					saynn("[say=tavi]Maybe {pc.he} put all {pc.his} efforts into fucking your pussy~.[/say]")

				saynn("Tavi stands up and takes a step to the side, presenting a naked self. And Rahi still stays on all fours.")

			else:
				saynn("You "+str("bred" if creamed else "straponed")+" Tavi.. and that's probably enough."+str(" Stealing her virginity in front of Rahi was quite hot." if isVirgin else "")+" You finally tell them to get off each other.")

				saynn("[say=tavi]You didn't fuck your second kitty though..[/say]")

				saynn("[say=rahi]It's okay..[/say]")

				saynn("Aw, Rahi sounds a bit disappointed. But oh well.")

				saynn("Tavi stands up and takes a step to the side, presenting a naked self, her legs shaking a little. And Rahi still stays on all fours.")

		saynn("You produce two chain leashes.")

		saynn("[say=pc]We're going on walkies. Like this.[/say]")

		saynn("Your pets look at each other silently, their cheeks blushing with different colors.")

		saynn("[say=pc]Any problems? Tavi?[/say]")

		saynn("[say=tavi]No. Walkies sound good. Very good~.[/say]")

		saynn("Rahi starts bouncing happily seeing that Tavi wants walkies too.")

		saynn("[say=rahi]Woof! Wruff![/say]")

		addButton("Leash them", "Put both pets on a leash", "leash_pets")
	if(state == "leash_pets"):
		playAnimation(StageScene.Duo, "allfours", {npc="rahi", npcAction="allfours", flipNPC=true, pc="tavi", bodyState={naked=true,chains=[["normal", "neck", "scene", "farleft"]]}, npcBodyState={naked=true,chains=[["normal", "neck", "scene", "farleft"]]}})
		saynn("You wait for Tavi to get on all fours before clipping a leash to her collar and then another leash to Rahi's collar too. They both wiggle their"+str(" creamed dripping" if creamed && fuckedTavi && fuckedRahi else "")+" butts, their obedient eyes directed up at you.")

		saynn("[say=pc]Well, that should be it. Let's go.[/say]")

		addButton("Walkies", "Wander around the prison", "walkies1")
	if(state == "walkies1"):
		playAnimation(StageScene.Duo, "crawl", {npc="rahi", npcAction="crawl", flipNPC=true, pc="tavi", bodyState={naked=true,chains=[["normal", "neck", "scene", "farleft"]]}, npcBodyState={naked=true,chains=[["normal", "neck", "scene", "farleft"]]}})
		aimCameraAndSetLocName("cellblock_corridor_middle")
		saynn("Leashes in hand, you guide your pets out of the cell, leading them on a little nice walk through the dimly lit corridors of the prison. Inmates here are used to seeing pets on a leash by now.. but two at once is different. You get some jealous looks from the inmate crowd.")

		saynn("[say=rahi]Wruff..[/say]")

		saynn("Rahi and Tavi crawl around on the cold floor pretty confidently, even when most of the gazes are glued to them. Your pups aren't afraid to show their curves and naked bits to everyone. Pets are not supposed to wear clothing after all..")

		addButton("Walkies", "Wander more", "walkies2")
	if(state == "walkies2"):
		aimCameraAndSetLocName("main_stairs_n")
		playAnimation(StageScene.Duo, "crawl", {npc="rahi", npcAction="crawl", flipNPC=true, pc="tavi", bodyState={naked=true,chains=[["normal", "neck", "scene", "farleft"]]}, npcBodyState={naked=true,chains=[["normal", "neck", "scene", "farleft"]]}})
		saynn("Your pets handle the stairs gracefully, climbing up them without ever standing up.")

		saynn("And so you step into the main hall. This is where it gets really crowded, the area is filled with both inmates and staff.")

		saynn("That's when your pups are really put under a test, the looks they are getting are quite hungry.. so you decide to go somewhere more quiet and peaceful.")

		saynn("At least they seem to enjoy themselves.")

		addButton("Walkies", "See where you wander next", "walkies3")
	if(state == "walkies3"):
		aimCameraAndSetLocName("yard_eastCorridor")
		playAnimation(StageScene.Duo, "crawl", {npc="rahi", npcAction="crawl", flipNPC=true, pc="tavi", bodyState={naked=true,chains=[["normal", "neck", "scene", "farleft"]]}, npcBodyState={naked=true,chains=[["normal", "neck", "scene", "farleft"]]}})
		saynn("The yard. Perfect place for walkies. You loosen the chains a little, letting your pups explore the green corridors. Tavi and Rahi immediately take off, investigating random bushes and rocks while you trail behind.")

		saynn("[say=pc]So adorable. What did I do to deserve such good pets?[/say]")

		saynn("Rahi looks behind her and sticks her tongue out at you.")

		saynn("[say=tavi]Well, you trained me, owner~. What about you, kitty?[/say]")

		saynn("Rahi sticks her tongue out at Tavi and then suddenly gets tackled by the tall one. The little brown kitty is not a match for a purple cat so she gives up, allowing Tavi to lick the loser.")

		saynn("[say=rahi]Wruuuf!..[/say]")

		saynn("You decide to get their attention back and find a little wooden stick before tossing it a few meters away. And, both Tavi and Rahi, rush after it! Another little fight happens between them as they try to figure out who got to it first.")

		saynn("Tavi is still stronger so she easily yanks the stick out of Rahi's mouth.. But while crawling back to you, Rahi uses her skills and bumps into Tavi, stealing the stick without the other feline even realizing it!")

		saynn("[say=tavi]WOOF![/say]")

		saynn("Seconds before Rahi crawls up to you, Tavi tackles her again and grabs one side of the stick while Rahi still holds the other. And so they finally reach you.. while both.. technically.. having the stick in their mouths.")

		saynn("[say=pc]Seems like.. it's a tie. You both won.[/say]")

		saynn("You grab the stick and watch them bounce happily and rub against each other, double purring can be heard from them as you give them lots of pats.")

		saynn("[say=rahi]Wruff~.[/say]")

		saynn("[say=tavi]Woof~. You trained the kitty too it seems~.[/say]")

		saynn("Time to find a good place to rest after that session.")

		addButton("Walkies", "Find a place to rest", "walkies4")
	if(state == "walkies4"):
		aimCameraAndSetLocName("yard_waterfall")
		playAnimation(StageScene.Cuddling, "idle", {npc="rahi", pc="tavi", bodyState={naked=true,chains=[["normal", "neck", "scene", "farleft"]]}, npcBodyState={naked=true,chains=[["normal", "neck", "scene", "farleft"]]}})
		saynn("You find a good secluded spot near the waterfall and sit on one of the benches. All the while your pets find a good spot near some bush and cuddle into each other, their leashes still in your hand.")

		saynn("The view is nice. Running water is one of those things that can be looked at forever.")

		saynn("[say=pc]Ah. Isn't life nice sometimes?[/say]")

		saynn("[say=rahi]..ruff..[/say]")

		saynn("That bark wasn't the most confident. So Tavi cuddles her harder, wrapping her paws around the brown feline and nuzzling her cheek.")

		saynn("[say=tavi]Woof. Sometimes, yeah. But only.. only if you actually act.[/say]")

		saynn("Huh. You turn your head towards Tavi.")

		saynn("[say=pc]Whatcha mean by that?[/say]")

		saynn("[say=tavi]You know.. woof.. Life only gets worse if you don't do anything. Ever noticed that?[/say]")

		saynn("Hm. You rub your chin.")

		saynn("[say=tavi]Like, you will find rats in your room one day. But you will never find a million credits there.[/say]")

		saynn("You hum, thinking more. All the while Rahi rests in Tavi's paws, her dark thoughts at bay.")

		saynn("[say=tavi]There is a huge catch though.. Sometimes you will get hurt even if you do act.[/say]")

		saynn("[say=pc]Huh. So what's the secret?[/say]")

		saynn("Tavi shrugs.")

		saynn("[say=tavi]I haven't solved life yet. Woof-woof. I'm just a silly puppy anyway~, my world view is much simpler.[/say]")

		saynn("At least she is not calling herself a monster. These puppy training sessions have been helpful with that.")

		saynn("You lean back and relax, letting the sounds of running water occupy your mind. All the while Tavi and Rahi whisper some things to each other.")

		saynn("[say=pc]You're getting along, pups?[/say]")

		saynn("[say=rahi]Woof![/say]")

		saynn("[say=tavi]Yeah~. Your kitty is telling me a lot about you. How you gave my apple to her~.[/say]")

		saynn("You chuckle.")

		saynn("Eventually it becomes time to go back to your cell.")

		saynn("[say=pc]Alright. Let's go back, pets. This was fun, wasn't it?[/say]")

		saynn("They nod and boop their snouts against each other.")

		saynn("[say=rahi]Wruff![/say]")

		saynn("After that, you bring each pet back to their cell.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pick_strapon"):
		saynn("Pick what strapon you wanna use for this.")

		addStraponButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "put_on_strapon")
	if(state == "put_on_strapon"):
		playAnimation(StageScene.ButtStackSex, "tease", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}, npc2="pc", npc2BodyState={exposedCrotch=true, hard=true}})
		saynn("[say=pc]Let's have some fun first.[/say]")

		saynn("You whip out one of your strapons and take your time, securing it around your waist. All the while the girls are watching you do that. Hm, might as well let them help lube it up. You present your new rubber cock to them, standing near their mouths.")

		saynn("[say=pc]Little help?[/say]")

		saynn("Rahi is first to reach out and use her feline tongue to start licking your rubber length. Tavi joins her soon after, helping the brown feline to coat your toy with saliva. It's not the best lube since it evaporates so quickly from friction.. but it should be enough for a start.")

		saynn("[say=rahi]Ruff..[/say]")

		saynn("After they prepare your strapon, you position yourself behind their beautiful fluffy butts. Tavi wiggles her behind at you, causing Rahi to follow her motions. Their tails are intertwined, rubbing against each other before pulling to the side, giving you full access to their pussy slits.."+str(" Tavi is still a virgin though, maybe you shouldn't fuck her.. Or maybe now is the time?" if isVirgin else " Both of them are slightly wet already, awaiting to be used.")+"")

		saynn("Who is gonna be first?")

		addButton("Rahi", "Fuck Rahi's pussy", "do_strapon_rahi")
		addButton("Tavi", "Fuck Tavi's pussy", "do_strapon_tavi")
	if(state == "do_strapon_tavi"):
		playAnimation(StageScene.ButtStackSex, "sexup", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}, npc2="pc", npc2BodyState={exposedCrotch=true, hard=true}})
		if (!fuckedRahi):
			saynn("And so you decide to start with Tavi since she is such a playful needy pet. And Rahi is a very obedient one so she can wait for a bit.")

		else:
			saynn("After finishing fucking Rahi, you pull your toy our and switch to your other pet, Tavi. Would have been strange not to take advantage of such a kinky situation to the fullest.")

		saynn("You raise yourself so your strapon is at her pussy level. One of your hands lands on her butt and gently gropes it while the second guides the rubber member to brush against her sensitive"+str(" virgin-tight" if isVirgin else "")+" folds.")

		saynn("[say=tavi]Oh.. woof..[/say]")

		if (tookVirginity):
			saynn("Tavi freezes as she suddenly realizes what you're about to do. She is scared.. but she doesn't seem to be against it.")

			saynn("You align yourself a little better and start putting pressure on her pussy. The petals quickly spread but then the rubber tip encounters Tavi's hymen, an organic seal, the last sign of Tavi's innocence. The more you push on it, the more Tavi starts whining and shivering. Even the bottom cat is concerned.")

			saynn("[say=rahi]Is Miss Tavi okay?..[/say]")

			saynn("[say=pc]Miss Tavi is about to become a real woman.[/say]")

			saynn("[say=rahi]Oh..[/say]")

			saynn("[say=tavi]AH!..[/say]")

			saynn("And so, with one rough motion, you suddenly feel yourself getting through her barricade, your strapon finally [b]stealing Tavi's virginity[/b]. She yelps painfully as her inner walls clench around their first ever dick.. sure, it's not a real dick but it has the same shape and feel. Her pussy has begun bleeding, drops of glowing green blood dripping down on Rahi's butt.")

			saynn("You let Tavi get used to these new sensations. She is still shivering, her fur standing on end, her tail spazzing out.")

			saynn("[say=pc]How do you feel?[/say]")

			saynn("She closes her eyes for a short second, her tail slowly calming down when Rahi's is rubbing against it.")

			saynn("[say=tavi]You can.. continue..[/say]")

		else:
			saynn("You align yourself a little better and start putting pressure on her pussy. The petals quickly spread for your rubber cock. And since she isn't a virgin anymore, you freely slide inside, deeper into her pussy. She is tight though.. incredibly tight..")

			if (fuckedRahi):
				saynn("[say=rahi]Miss Tavi is getting fucked by the {rahiMaster} too now![/say]")

				saynn("Tavi purrs softly, her inner walls clenching around your fake member so well.")

				saynn("[say=tavi]Woof..[/say]")

				saynn("[say=pc]That's right, Rahi. There is plenty to share.[/say]")

			else:
				saynn("[say=rahi]Miss Tavi got to be first..[/say]")

				saynn("[say=pc]Don't be jealous, kitty. There is plenty to share.[/say]")

				saynn("Tavi purrs softly, her inner walls clenching around your fake member so well.")

				saynn("[say=tavi]Woof..[/say]")

		saynn("You start off slow, moving your hips at a slow pace to let the tall feline adjust to your length. And quite quickly, little moans begin to escape from the top feline while the bottom one has to try to provide a stable platform.")

		saynn("[say=tavi]Ah..[/say]")

		saynn(""+str("So little time has passed since Tavi lost her virginity. And she is already starting to enjoy it. Her pussy is still bleeding slightly.. but it's also coating your toy with her juices." if tookVirginity else "Her pussy is coating your toy with her juices.")+" Tavi gets pushed forward on each of your thrusts, allowing you to meet her on the way back and ram your strapon deeper and deeper. You can use a better grip though..")

		addButton("Faster", "Fuck Tavi faster", "do_strapon_tavi_faster")
	if(state == "do_strapon_tavi_faster"):
		playAnimation(StageScene.ButtStackSex, "fastup", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}, npc2="pc", npc2BodyState={exposedCrotch=true, hard=true}})
		saynn("And a better grip you find. You reach one of your hands and get a firm grasp on Tavi's hair, allowing you to fuck her pussy faster and harder. Feeling the discomfort, Tavi is hissing softly.. but her pussy is getting even tighter while you do that, her inner walls kneading your rubber cock, making you eager.")

		saynn("[say=rahi]Roughness can be fun, Miss Tavi, yes-yes..[/say]")

		saynn("[say=tavi]I.. k-know.. ah-h!..[/say]")

		saynn("Suddenly, her body arches more and starts shivering, her"+str(" not-so-virgin" if tookVirginity else "")+" pussy pulsing before producing a fountain of girlcum! A fountain that makes your toy and Rahi's fur all wet.")

		saynn("[say=rahi]Miss Tavi is cumming.. Kitty can feel it..[/say]")

		saynn("Tavi's tongue is out, she is moaning loudly while drooling and clenching around you. You don't feel much since it's just a toy.. But pulling out now would be such a waste.. You get a strong urge to just ram it in while she is still cumming..")

		addButton("Shove deep", "Shove your strapon deep inside", "do_strapon_tavi_cum")
	if(state == "do_strapon_tavi_cum"):
		playAnimation(StageScene.ButtStackSex, "insideup", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}, npc2="pc", npc2BodyState={exposedCrotch=true, hard=true}})
		saynn("And so you ram your strapon as deep as that pussy allows.. breaking into Tavi's womb. She moans passionately while your roughness enhances her orgasm, prolonging it and causing her pussy to squirt again!"+str(" At the same time, your strapon starts throbbing as it starts stuffing Tavi's womb full of "+straponContents+"." if straponLoaded else "")+""+str(" From virgin to a strapon enjoyer.. So quick.." if tookVirginity else "")+"")

		saynn("[say=tavi]Hh-h..[/say]")

		saynn("[say=rahi]Yes, breed your pets, {rahiMaster}..[/say]")

		saynn("Rahi seems to be the most happy about this. "+str("She probably just got inpatient, waiting for her turn." if !fuckedRahi else "What a cute kitty.")+"")

		saynn("Tavi is panting heavily, her pussy muscles still pulsing. Her pussy juices"+str(" and your strapon's contents" if straponLoaded else "")+" mess up her fur but also the fur of the pet below.")

		saynn("[say=rahi]So messy..[/say]")

		saynn("[say=pc]You two can lick each other now though.[/say]")

		saynn("[say=rahi]That's.. that's not wrong..[/say]")

		saynn("So.. what's now?")

		if (!fuckedRahi):
			addButton("Rahi", "Time to strapon Rahi too now", "do_strapon_rahi")
		addButton("Walkies", "Take your pets out on walkies", "start_walkies")
	if(state == "do_strapon_rahi"):
		playAnimation(StageScene.ButtStackSex, "sexdown", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}, npc2="pc", npc2BodyState={exposedCrotch=true, hard=true}})
		if (!fuckedTavi):
			saynn("And so you decide to start with Rahi since she is a good kitty that didn't try to throw Tavi off, instead obeying and presenting herself to you.")

			saynn("Without hesitation, you position yourself so your strapon is at Rahi's butt level. One of your hands is gently caressing the hips of the kitty who got pinned by a much taller purple feline while the second one already aligns your fake member with Rahi's sex. And then, with one careful thrust, you enter her, the rubber tip spreading Rahi's slick folds and sliding between them without much problems.")

			saynn("[say=rahi]Woo-of..[/say]")

			saynn("Tavi looks down at Rahi's face with a slightly jealous look.")

			if (isVirgin):
				saynn("[say=tavi]Wonder how that feels..[/say]")

			else:
				saynn("[say=tavi]Good puppy, you love getting fucked, don't you?[/say]")

		elif (tookVirginity):
			saynn("After taking Tavi's virginity.. you might as well fuck your other pet. Rahi is probably waiting for her turn for quite a while now.")

			saynn("So you quickly pull your strapon out of Tavi.. and then just as quickly align it with Rahi's needy slit before thrusting inside, without even cleaning the girlcum  or the green smears. It all mixes together with Rahi's juices, allowing for easier fucking.")

			saynn("[say=rahi]Woo-of..[/say]")

			saynn("Tavi slowly recovers after her first vaginal sex ever..")

			saynn("[say=tavi]Good p-puppy.. I know how you feel n-now..[/say]")

		else:
			saynn("Rahi is being surprisingly inpatient about this.. but how can not fuck both of your pets when they're stacked like that? So it's time to satisfy the brown kitty's desires as well.")

			saynn("You quickly pull the strapon out of Tavi.. and then just as quickly align it with Rahi's needy slit before thrusting inside, without even cleaning it. Tavi's girlcum mixes with Rahi's juices, allowing for easier fucking.")

			saynn("[say=rahi]Woo-of..[/say]")

			saynn("Tavi slowly recovers after being first.")

			saynn("[say=tavi]Good puppy..[/say]")

		saynn("And so you begin to fuck Rahi, her lithe form barely withstanding an onslaught from both you and the feline on top. Moans begin to escape from her while you ram the toy inside her welcoming warmth, her inner walls clenching around the rubber shaft so well.")

		saynn("[say=rahi]Ah.. ah.. Your kitty.. puppy.. loves this..[/say]")

		if (fuckedTavi):
			saynn("As you fuck Rahi, you obviously can't avoid looking at Tavi and her"+str(" stuffed" if straponLoaded else "")+" pussy. "+str("She is still leaking {pc.straponContents} onto the brown fur.. so you decide to spank that purple ass, causing her to clench." if straponLoaded else "She is still dripping juices onto the brown fur.. so you decide to spank that purple ass, causing her to clench.")+"")

			saynn("[say=tavi]Ah!.. Why me?[/say]")

			saynn("After that rough smack, you decide to rub her clit instead, bringing the used kitty some pleasure instead.")

		else:
			saynn("As you fuck Rahi, you obviously can't avoid looking at Tavi and her wet"+str(" virgin" if isVirgin else "")+" pussy. You free one of your hands and rub it, your digits playing with the tall kitty's clit.")

			saynn("[say=tavi]Ah..[/say]")

			saynn("Pleasuring both pets at the same time is fun.")

		addButton("Faster", "Fuck Rahi faster", "do_strapon_rahi_fast")
	if(state == "do_strapon_rahi_fast"):
		playAnimation(StageScene.ButtStackSex, "fastdown", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}, npc2="pc", npc2BodyState={exposedCrotch=true, hard=true}})
		saynn("Both Rahi and Tavi moan while you fuck one and rub the other, their combined noises sounding like a symphony of raw sex. You decide to add to it with your wet and rhythmic sounds of thrusts, your hips smacking against Rahi's butt while you fuck her faster and harder.")

		saynn("[say=rahi]Ah.. She is g-gonna..[/say]")

		saynn("You decide to focus on the brown feline, leaving Tavi to pant softly.."+str(" You might get to her soon anyway." if !fuckedTavi else " She got her share of the fun anyway.")+"")

		saynn("As Rahi's climax approaches, her inner walls begin to hug the rubber length so well.. you can't help but to fight the friction and keep up your pace.. Until that pussy suddenly cums..")

		saynn("[say=rahi]Ah-h-h!..[/say]")

		saynn("She arches her back, giving the feline on top a wild ride, moaning and squirming while her pussy clenches around you tight, a fountain of girlcum gushing out of its little hole, a sign of how much you pushed her.")

		saynn("Rahi is still squirming so Tavi decides to get a tighter grip on her, holding the orgasming feline still for you.")

		if (fuckedTavi):
			saynn("[say=tavi]Be rough.. Like you were with me..[/say]")

		else:
			saynn("[say=tavi]Ram it in. She clearly wants it..[/say]")

		saynn("It's not like pulling out was even an option..")

		addButton("Ram it in", "Be rough with Rahi", "do_strapon_rahi_cum")
	if(state == "do_strapon_rahi_cum"):
		playAnimation(StageScene.ButtStackSex, "insidedown", {pc="rahi", npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}, npc2="pc", npc2BodyState={exposedCrotch=true, hard=true}})
		saynn("Rahi's pussy wants to suck your strapon in.. and you welcome it.. shoving your toy as deep as that love tunnel allows.."+str(" seconds before releasing a load of "+straponContents+", flooding her womb to the brim." if straponLoaded else "")+" Poor kitty can barely endure another orgasm washing over her, her pussy clenching around your rubber cock, trying squeeze something out of it.")

		saynn("[say=rahi]Nya-a-a..[/say]")

		saynn("Tavi is smiling while holding Rahi in place for you to be able to strapon-breed her properly."+str(" Her own cunt leaking seed too while she does that." if fuckedTavi else "")+"")

		saynn("[say=tavi]Where did you find such a cutie anyway.[/say]")

		saynn("The brown feline has her tongue, panting and drooling. Tavi slips a digit into that opened mouth and Rahi obediently sucks on it.")

		saynn("So.. what's now?")

		if (!fuckedTavi):
			addButton("Tavi", "Time to breed Tavi too now", "do_strapon_tavi")
		addButton("Walkies", "Take your pets out on walkies", "start_walkies")
func taviSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak

func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "put_on_strapon", [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "pick_strapon"):
		hadSex = true

	if(_action == "whip_cock_out"):
		processTime(3*60)
		hadSex = true
		creamed = true

	if(_action == "start_walkies"):
		GM.pc.unequipStrapon()

	if(_action == "do_fuck_rahi"):
		processTime(5*60)
		fuckedRahi = true

	if(_action == "do_fuck_tavi"):
		processTime(5*60)
		fuckedTavi = true
		
		if(isVirgin):
			tookVirginity = true
			#isVirgin = false
			setFlag("TaviModule.TaviIsNotVirgin", true)

	if(_action == "do_fuck_tavi_faster"):
		processTime(5*60)

	if(_action == "do_fuck_tavi_cum"):
		processTime(6*60)
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "do_fuck_rahi_fast"):
		processTime(10*60)

	if(_action == "do_fuck_rahi_cum"):
		processTime(5*60)
		getCharacter("rahi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "leash_pets"):
		processTime(3*60)

	if(_action == "walkies1"):
		processTime(5*60)

	if(_action == "walkies2"):
		processTime(5*60)

	if(_action == "walkies3"):
		processTime(5*60)

	if(_action == "walkies4"):
		processTime(20*60)

	if(_action == "put_on_strapon"):
		processTime(3*60)
		var strapon = _args[0]
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)

	if(_action == "do_strapon_rahi"):
		processTime(5*60)
		fuckedRahi = true

	if(_action == "do_strapon_tavi"):
		processTime(5*60)
		fuckedTavi = true
		
		if(isVirgin):
			tookVirginity = true
			#isVirgin = false
			setFlag("TaviModule.TaviIsNotVirgin", true)

	if(_action == "do_strapon_tavi_faster"):
		processTime(5*60)

	if(_action == "do_strapon_tavi_cum"):
		processTime(6*60)
		straponLoaded = GM.pc.isWearingLoadedStrapon()
		straponContents = GM.pc.getStraponContentsReadableString()
		getCharacter("tavi").cummedInVaginaBy("pc", FluidSource.Strapon, 1.0 if fuckedRahi else 0.5)
		GM.pc.orgasmFrom("tavi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "do_strapon_rahi_fast"):
		processTime(10*60)

	if(_action == "do_strapon_rahi_cum"):
		processTime(5*60)
		straponLoaded = GM.pc.isWearingLoadedStrapon()
		straponContents = GM.pc.getStraponContentsReadableString()
		getCharacter("rahi").cummedInVaginaBy("pc", FluidSource.Strapon, 1.0 if fuckedTavi else 0.5)
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isFirstTime"] = isFirstTime
	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["hadSex"] = hadSex
	data["fuckedTavi"] = fuckedTavi
	data["fuckedRahi"] = fuckedRahi
	data["creamed"] = creamed
	data["tookVirginity"] = tookVirginity
	data["straponLoaded"] = straponLoaded
	data["straponContents"] = straponContents

	return data

func loadData(data):
	.loadData(data)

	isFirstTime = SAVE.loadVar(data, "isFirstTime", false)
	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	hadSex = SAVE.loadVar(data, "hadSex", false)
	fuckedTavi = SAVE.loadVar(data, "fuckedTavi", false)
	fuckedRahi = SAVE.loadVar(data, "fuckedRahi", false)
	creamed = SAVE.loadVar(data, "creamed", false)
	tookVirginity = SAVE.loadVar(data, "tookVirginity", false)
	straponLoaded = SAVE.loadVar(data, "straponLoaded", false)
	straponContents = SAVE.loadVar(data, "straponContents", "")
