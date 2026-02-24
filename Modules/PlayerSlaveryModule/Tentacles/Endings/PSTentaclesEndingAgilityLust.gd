extends SceneBase

var choseBoth = false

func _init():
	sceneID = "PSTentaclesEndingAgilityLust"

func _reactInit():
	addCharacter(GM.main.PS.getTentaclesCharID())

func resolveCustomCharacterName(_charID):
	if(_charID == "ten"):
		return GM.main.PS.getTentaclesCharID()
	if(_charID == "sci1"):
		return GM.main.PS.getScientist1CharID()
	if(_charID == "sci2"):
		return GM.main.PS.getScientist2CharID()

func _run():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(state == ""):
		_tentacles.doAnim("idle")
		aimCameraAndSetLocName("pstent_important")
		saynn("They made a huge mistake, trapping you here with that monster. And it's time to make them regret that decision.")

		saynn("You look around.. The door into your cell is probably too strong. Breaking it would take way too long. But the window.. the one that the scientists were looking at you from.. that one seems like a good target.")

		saynn("You approach one of the tentacles and slap its thick, strong surface to get its attention. The many tips look at you, wondering if you want to do some armwrestling. No, you have a much better workout in mind.")

		saynn("[say=pc]They wanted me to turn you into a mindless plant. Can you imagine that?[/say]")

		saynn("You smack the tentacle again but your hand just bounces off. Your actions do make the tentacles get all slick and drippy though.. They sure are playful.")

		saynn("[say=pc]Instead, I made you powerful. I trained you. I had lots of hot sex with you..[/say]")

		saynn("Time to put their energy and their desires to good use.. You point at the window.")

		saynn("[say=pc]Smash it! Let's make them pay.[/say]")

		saynn("The tentacles understand you without knowing what you said. They slither up to the window that leads into some kind of corridor and prepare. The thickest one of them gets pulled back.. and then slams into the glass with full force, sending a huge wave of vibrations through the rest of the windows! Boom!")

		saynn("The glass manages to withstand the impact.. but the tentacle does leave a small spiderwebs of cracks on it.")

		saynn("[say=pc]More.[/say]")

		saynn("You say it calmly.. and soon.. another thunderous impact shakes the whole cell. The tentacles are coiling with barely contained rage, the tendrils are pulsing wildly.")

		saynn("More of the glass cracks.. the plan is working. You're getting closer and closer.")

		saynn("Suddenly, alarms begin to blare. Red lights start strobing through the corridor, the intercom starts yelling at you.")

		saynn("[say=sci1]What the.. Containment breach, we have a containment breach at cell 5! Code red, code red. All guards, the armory is unlocked, I order you to kill the specimen now. I repeat, shoot to kill![/say]")

		saynn("There is no going back now. You show the curious security cam your ass as the tentacles continue to smash into the glass.")

		saynn("Ohh.. Suddenly all the air vents of your cell open.. and some kind of gas starts pouring in. Something tells you that you shouldn't breathe that in.. and so you cover your mouth with your hand, holding your breath.")

		saynn("Something starts happening with the windows too. Some kind of thick metal panels start sliding down behind all of them, blocking more and more of the corridor, gradually sealing your cell away from the rest of the lab.")

		saynn("It feels like your little rebellious act was about to be cut short..")

		saynn("But then.. the glass explodes! The tentacles manage to break through and prop up the metal panel, before proceeding to forcefully push it back up. You can hear the hydraulic system whining and screaming in agony.. until the overheated motors give up completely.")

		addButton("Continue", "See what happens next", "in_corridor")
	if(state == "in_corridor"):
		aimCameraAndSetLocName("pstent_scientists")
		saynn("You and tentacles get through the broken window, out into the corridor. Finally, you can breathe again.")

		saynn("The surprises don't end here as you begin to hear boots pounding against the concrete flooring..")

		saynn("[say=pc]Get ready. And don't kill anyone, okay?[/say]")

		saynn("Guards appear from behind the corner, wearing some kind of advanced armor and with plasma rifles in their hands.")

		saynn("The first guard doesn't even have time to scream. A thick, slick tentacle wraps around his helmet and yanks it off.. before stuffing itself into his open mouth. His eyes go wide as his throat bulges, the tendril pushing itself deep, using him like a warm, wet sleeve.")

		saynn("[say=pc]That works.[/say]")

		saynn("The second guard raises his rifle and shoots your tentacles.. The impact makes the targeted tendril recoil away.. and then strike back, smacking the weapon out of his hands before wrapping around his waist. One particularly horny tentacle would rip some of his armor pieces off and force itself between his legs, down his clenched tailhole. He gasps as the wet tentacle suddenly begins to pump into him.")

		saynn("The third guard.. a girl.. tries to run.. but a tendril catches her ankle and drags her back. She is flipped onto her stomach, her armor torn away like paper.. Before two thick tips find her holes and stretch them wide, fucking her right there.")

		saynn("All of the tentacles are now busy with all the guards.. It certainly is a view. And the sounds.. hearing all of the wet, rhythmic pumping mixed together with muffled moans and groans.. It's cute.")

		saynn("[say=pc]Some of you seem to enjoy it. Aw. So many sluts here.[/say]")

		saynn("Seconds later, the tentacles start pumping all of the guards full of their cum-like nectar, making their bellies nice and around. As they pull their tendrils away, the guards are left panting heavily on the floor, their used holes gushing with that juice.")

		saynn("You grab one of the dropped plasma rifles, they don't need it anyway.")

		saynn("That's when you hear more boots rushing towards you.")

		saynn("[say=pc]Welp. I hope you're still horny.[/say]")

		addButton("Continue", "See what happens next", "corridor")
	if(state == "corridor"):
		aimCameraAndSetLocName("pstent_entrance")
		saynn("You've never shot anything like what you're holding.. but you don't need to be accurate with it anyway.")

		saynn("More guards appear from all the corners. You catch their attention and pin them down by shooting plasma bolts in their rough direction.")

		saynn("This gives the tentacles enough time to leap at them, smack some of their guns away and grab them! They would then proceed to do a similar.. activity.. with them, stripping them naked and stuffing all of their holes!")

		saynn("Many moans and plaps echo around the corridor, the ones who try to crawl away get pulled back into the action, now with an extra tentacle getting shoved down their throats.")

		saynn("Some manage to break free and grab their weapons. They start shooting the tentacles.. their tough texture absorbing impact after impact. Training their strength also strengthened their surface it seems.")

		saynn("[say=pc]Stop it, just let it pound you senseless.[/say]")

		saynn("Their rebellion doesn't last for too long as the tentacles crush all of their guns into dust and focus on their holes again. The pounding continues until the tentacles start pumping each of the guards full of that nectar again, their bellies getting visibly bumpier from the sheer amount of it.")

		saynn("[say=pc]Perfect.[/say]")

		saynn("The tentacles leave the panting guards on the floor.. You don't see the reason to kill them, they're clearly not threats anymore.")

		saynn("Time to move on.")

		addButton("Continue", "See what happens next", "show_stuff")
	if(state == "show_stuff"):
		aimCameraAndSetLocName("pstent_scientist_2")
		saynn("The tentacles proceed to explore the bio-lab on their own.. while you stay behind.")

		saynn("You shortly realize that your pace isn't fast enough. You decide to split when you notice small colorful signs that are placed on the walls of each intersection. The ones that you were interested in.. say 'docks'.")

		saynn("[say=pc]I will come find you.[/say]")

		saynn("You run. And you were right.. As soon as you arrive, you see quick glimpses of the two scientists who were trying to board the escape pods.")

		saynn("A few shots from your plasma rifle has made them quickly reconsider. They stop trying to pry the airlocks open.. and instead run somewhere deeper into the bio-lab. Perfect.")

		saynn("After that, you trace your steps back and find the tentacles. It's not hard to find.. You just have to follow the path of.. cum.. nectar.. and fucked-silly guards.")

		saynn("During your exploration, you find more reinforced windows.. a whole row of them, each leaving into a separate containment cell.. just like yours. There are.. things.. inside them. Some have humanoid shapes.. some are just nothing but twisted forms.")

		saynn("Security doors close in front of you.. but the tentacles just smash through them. Their sheer strength is enough to bend the metal until the doors just fall out of their frames.")

		saynn("All the corridors look the same.. but eventually you do reach some kind of checkpoint.. with more guards defending it. You hide behind the corner and take blind shots with your rifle while the tentacles do the.. messy.. work and charge forward.")

		saynn("[say=pc]Go have fun with them.[/say]")

		saynn("You hear screams.. followed by thumps.. followed by moans. Makes you smile almost.")

		saynn("Feeling a bit curious, you peek your head out and watch as the tentacles penetrate all of the holes of a poor guard.. before stuffing them full of nectar. The rest are already fucked into submission. They all seem to be liking {psTentacles} after spending some time with it. Sillies, why do they even try to resist..")

		saynn("You feel like you're getting close to something.")

		addButton("Continue", "See what happens next", "pleading")
	if(state == "pleading"):
		addCharacter(GM.main.PS.getScientist1CharID())
		addCharacter(GM.main.PS.getScientist2CharID())
		aimCameraAndSetLocName("pstent_near_lastroom")
		saynn("At last, you reach some kind of room.. a room that has gone full lockdown mode, all of its doors and windows are sealed shut.")

		saynn("This.. certainly piques your interest. The tentacles are waiting for you to show the next target. They might not be the smartest.. but it looks like they do understand that they won't be able to get out of here without your help.")

		saynn("You knock on the metal and nod towards the enraged tentacles.")

		saynn("And that's all the convincing they need.")

		saynn("The horny tentacles start smashing into the reinforced blast shutters, trying to break through.")

		saynn("Suddenly, a voice cries through an intercom.")

		saynn("[say=sci1]Wait! Wait-wait-wait! We can make a deal! There is no need for any more bloodshed![/say]")

		saynn("Looks like you have struck gold. Bloodshed.. Hah. A lot of fluids were spilled, yes.. but none of them have anything to do with blood.")

		saynn("You look around and see that one of the security cameras is nearby. It's watching you and your little friend trying to get inside their shelter.")

		saynn("The initiative is on your side.. so you just stare at the camera silently, your head tilted ever so slightly to the side, your plasma rifle resting on your shoulder.")

		saynn("[say=sci1]There is a way out! An escape pod! We will let you take it! Just.. Just call them off![/say]")

		saynn("You continue to say nothing. The banging that's happening behind you is enough of a statement.")

		saynn("The metal barrier starts to bend from the crazy onslaught. The tentacles manage to break it enough to slip one of the tentacles under it and start trying to pull it up instead.")

		saynn("[say=sci2]Please.. I didn't.. I never wanted to.. I was just doing my.. please..[/say]")

		saynn("The girl's pleading.. It makes you smile a bit. She thinks you're coming to kill them. So silly.")

		saynn("The doors finally get torn open.")

		addButton("Continue", "See what happens next", "theTalk")
	if(state == "theTalk"):
		aimCameraAndSetLocName("pstent_lastroom")
		playAnimation(StageScene.Duo, "stand", {pc=GM.main.PS.getScientist1CharID(), npc=GM.main.PS.getScientist2CharID()})
		saynn("You and the tentacles step inside some kind of lab. There is lots of expensive-looking science equipment around.. a fridge.. a separate compartment with beds.. a bathroom.. and also a few computers. The sight reminded you of your own cell that you had here for some reason.")

		saynn("[say=pc]So that's how you live. Pretty cute.[/say]")

		saynn("Both scientists are hiding under one of the tables. Pathetic really. Your tentacles see them too.. but you gesture to them to stay still and guard the only way out of this room.")

		saynn("Slowly, you approach the table, making each step echo in their ears. You can hear them shuffling around in there. You are still holding your rifle.. just in case they try to do something stupid.")

		saynn("You knock on the table.")

		saynn("[say=pc]Up.[/say]")

		saynn("[say=sci1]Listen..[/say]")

		saynn("[say=pc]Up, I said.[/say]")

		saynn("The scientists scramble to get from under the table. The guy is holding something in your view.. a piece of paper.")

		saynn("[say=sci1]These are codes.. To launch the escape pod.. Let's talk about it, please.[/say]")

		saynn("The wolf looks.. scared. Even the girl is not shivering as much.")

		saynn("[say=pc]Leave them on the table.[/say]")

		saynn("He starts lowering the codes onto a flat surface of the table.. but then stops.")

		saynn("[say=sci1]Please.. Spare me at least.[/say]")

		saynn("[say=sci2]Hey.. uh-h.. um-m.. wait-t..[/say]")

		saynn("The way he throws her under the bus.. makes you angry. But she isn't innocent either, that's for sure.")

		saynn("[say=sci1]If I destroy these, you will be stuck here forever.[/say]")

		saynn("Should you obey these people one more time? Nah. That's not why you came here.")

		saynn("[say=pc]I think I'm good.[/say]")

		saynn("He really gets caught off-guard.")

		saynn("[say=pc]Oh? You think I care about getting out of here? My {psTentacles} here fucked a lot of holes today.. But it is still horny. I think it wants one of your butts~. Ain't that right?[/say]")

		saynn("The tentacles sway eagerly, some of their green tips are swollen and dripping juices profusely..")

		saynn("Now.. who is it gonna be..")

		addButton("Guy", "Make the tentacles fuck the guy!", "fuck_guy")
		addButton("Girl", "Make the tentacles fuck the girl!", "fuck_girl")
		addButton("Both", "Make the tentacles fuck the guy first.. and then fuck the girl too..", "fuck_both")
	if(state == "fuck_girl"):
		playAnimation(StageScene.TentaclesBondage, "start", {pc=GM.main.PS.getScientist2CharID(), plant=true, bodyState={naked=true,hard=true}})
		if (!choseBoth):
			saynn("Seeing that the things aren't looking good for him, the wolf just sets off, dashing towards the exit. His foot almost leaves the lab.. almost.")

			saynn("A tendril wraps around his other ankle, yanking him back and pinning him into the wall. He struggles.. but fails to do anything. The tentacles are just too strong.")

			saynn("[say=sci1]Let me go! Let me..[/say]")

			saynn("The tentacles don't bother with him. They simply wrap around his mouth.. firm enough to silence but loose enough to breathe. He is just a spectator now.")

			saynn("The real target of the tentacles was the girl.. Carefully, the tentacles approach her. She is shivering.. but doesn't pull away.")

		else:
			saynn("Now that the wolf is.. stuffed. The tentacles direct their attention towards the girl.")

		saynn("[say=sci2]Hey.. uh.. I w-will do anything if you tell it to.. ah!..[/say]")

		saynn("The first touch.. is actually quite light. One of the tentacles reaches out to trace her collarbone, putting no pressure. The girl shivers.. but not from cold. Another tendril glides along her hip.. before grabbing onto her labcoat and gently pulling it off. She doesn't resist that.")

		saynn("Her skirt follows.. then her top.. each piece folded and set aside by the tips. The girl's cute black lace underwear is now revealed.. but the tentacles aren't satisfied with that. They start tugging on her panties and the bra while she tries to hold onto them.")

		saynn("[say=sci2]My underwear.. ah..[/say]")

		saynn("[say=pc]The tentacles think you don't need it. Who am I to say no to them?[/say]")

		saynn("[say=sci2]Huff..[/say]")

		saynn("Eventually the underwear gets removed as well.")

		saynn("The girl is trying to cover herself.. but the tentacles catch her wrists and gently guide them away, revealing her cute perky tits and the pink slit between her legs. She is already wet.. her folds are visibly slick with her arousal. So much for fear.")

		saynn("[say=sci2]Ah.. You don't.. have to do this..[/say]")

		saynn("[say=pc]You seem to be liking it though. They're not so scary when you don't try to fight, see?[/say]")

		addButton("Continue", "See what happens next", "fuck_girl_fuck")
	if(state == "fuck_girl_fuck"):
		playAnimation(StageScene.TentaclesSex, "sex", {pc=GM.main.PS.getScientist2CharID(), plant=true, bodyState={naked=true,hard=true}})
		saynn("After they've done with her clothes, the tentacles lift her.. not roughly.. but smoothly. She still gasps as she is suspended above the floor, her limbs carefully held by the tendrils. A thick, shiny one presses between her thighs.. gently rubbing against her slit.. letting her feel its warmth and a slight pulsing.")

		saynn("[say=sci2]Ah..[/say]")

		saynn("She doesn't try to close her legs. Her hips shift, subtly, moving in rhythm with the tentacle.")

		saynn("Another one drifts to her mouth. The girl watches it for some time.. and then decides to part her lips willingly, taking the tip in with a soft moan. She begins to suck it gently.. while a shiver of pleasure travels through the whole mass.")

		saynn("[say=sci2]Mmm.. mmmh..[/say]")

		saynn("The other tendril keeps doing slow circles around her clit and light brushes along her folds. She is soaking now, her juices coating the tentacle with each pass. A second one joins, catching some of those juices and now just pressing at her other entrance.. not pushing.. just teasing.")

		saynn("She whimpers softly around the tendril in her mouth.. her noise full of a desperate desire.")

		saynn("[say=sci2]Mhh.. mmm-..[/say]")

		saynn("Then, together, they all slide inside.")

		saynn("The girl arches her back, a muffled cry of pleasure escaping her throat. The tentacles stretch and fill her holes.. before proceeding to move together, speeding up when she bucks her hips and slowing down when she shivers too much.")

		saynn("[say=sci2]Mmh.. mm.. hh~..[/say]")

		saynn("One particularly clever tendril snakes up to her clit that was left unattended so soon. It begins flicking and circling it.. which makes her girl arch her back, her eyes rolling back.")

		saynn("A wet, desperate cry escapes around the tendril in her throat as her first orgasm rips through her. She shakes hard.. cumming.. milking the tentacles inside her. They don't stop, they keep their pace, extending her euphoric state further..")

		addButton("Continue", "See what happens next", "girl_fuck_cum")
	if(state == "girl_fuck_cum"):
		playAnimation(StageScene.TentaclesSex, "fast", {pc=GM.main.PS.getScientist2CharID(), cum=true, plant=true, bodyState={naked=true,hard=true}})
		saynn("Some of the tendrils begin to look different. Something is moving inside them, creating visible bumps. That bump hits the girl's pussy.. and starts stretching her folds even wider.")

		saynn("[say=sci2]Mmm?.. mmh-..[/say]")

		saynn("Her eyes go wide, her pussy clenching.. but she doesn't pull away.")

		saynn("Gradually, the tentacles manage to stretch her entrance enough for that bump to get buried inside her. It was an egg.. and now that egg gets pushed directly into her womb.. and then another soon after.")

		saynn("Despite how strange it probably feels, her eyes are full of raw desire. Each egg stretches her.. fills her.. sends new sparks of pleasure through her overstimulated nerves. Her belly swells gradually, growing round.. as egg after egg is deposited deep inside her.")

		saynn("The tentacle in her ass does the same, filling her other hole with these eggs..")

		saynn("By the time they're done, she looks pregnant.. and pretty happy about it too.")

		saynn("And then.. the nectar comes.")

		saynn("[say=sci2]Mmmph.. mhh!..[/say]")

		saynn("Every tentacle begins to pulse.. before releasing streams of warm, sweet fluid over her body.. her tits, her face, her swollen belly. The ones inside her pump her full to the brim, filling all of the empty space between the eggs until she is dripping with it.")

		saynn("[say=pc]Wow.[/say]")

		saynn("After that.. the tentacles withdraw slowly, carefully, making sure not to spill too much. They lower her gently to the floor, laying her on her back.")

		saynn("She is covered in fluids.. Her belly is beautifully round. Her holes are open, gaping, still dripping. A silly smile shines on her face.")

		saynn("[say=sci2]Hhh.. ah..-h.. mmh~..[/say]")

		saynn("[say=pc]You look good like that. Real good.[/say]")

		addButton("Continue", "See what happens next", "after_all_sex")
	if(state == "fuck_guy"):
		playAnimation(StageScene.TentaclesChoke, "sextease", {pc=_tentacles.getScientist1CharID(), plant=true, bodyState={naked=true, hard=true}})
		if (choseBoth):
			saynn("Why choose one of them.. when you can have your revenge on both? Yes.")

		saynn("Seeing that the things aren't looking good for him, the wolf just sets off, dashing towards the exit. His foot almost leaves the lab.. almost.")

		saynn("A tendril wraps around his other ankle, yanking him back. Another one coils around his waist, lifting him clean off the floor. He tries to kick.. tries to struggle.. but the tentacles are fueled by anger.")

		saynn("[say=sci1]Let me go! Let me..[/say]")

		if (choseBoth):
			saynn("Looks like the wolf is first. The girl can wait.")

		saynn("His labcoat gets ripped off, buttons scattering across the floor. The rest of the cloth gets shredded too.. leaving the wolf suspended in the air naked, sheath and tight asshole out on display for everyone.")

		saynn("[say=sci1]Stop it, now! You f-fucking.. monster.[/say]")

		saynn("A thick, slick tendril presses against his lips.. and then forces itself inside when the guy was about to say something else, turning his speech into a muffled series of noises.")

		saynn("Another tentacles slithers between his legs, rubbing his sheath until the canine cock starts poking out of it, probably against the scientist's will. Another one presses against his tight anal entrance, circling, lubricating him with some slick, warm juices.")

		saynn("He managed to wiggle his head free from the mouth tentacle.")

		saynn("[say=sci1]No-no-no! Don't you fucking-.. AH![/say]")

		addButton("Continue", "See what happens next", "guy_fuck_fuck")
	if(state == "guy_fuck_fuck"):
		playAnimation(StageScene.TentaclesChoke, "sex", {pc=_tentacles.getScientist1CharID(), plant=true, pcCum=true, bodyState={naked=true, hard=true}})
		saynn("He gasps as the tip pushes inside, stretching his tailhole wide. He claws at the tentacles holding him.. but they don't budge, instead smacking his ass each time. His throat doesn't stay free for long too as the same tentacle as before forces itself past his teeth again.")

		saynn("[say=sci1]MMhh-h!.. mhh!..[/say]")

		saynn("The tentacles start fucking him raw, pounding his asshole and his throat, powered by pure hatred. The guy is still trying to resist.. to break free.. but his body seems to enjoy some of it, his cock getting fully erect.. and now twitching and leaking pre..")

		saynn("[say=sci1]Mhh.. mhh-h..[/say]")

		saynn("He gets pounded more and more.. his little inner pleasure spot keeps getting hammered.. until he suddenly cums. His body spasms, his body clenching around the invading tentacles as his knotted cock starts spilling onto the floor, dribbling lines of his seed..")

		saynn("A broken muffled moan slips from his throat.")

		saynn("The tentacles seem very lusty though.. they keep fucking him even while he is cumming, pushing through his clenching, overstimulating his poor holes, now drawing whimpers rather than moans from him.")

		saynn("Then something happens.. You notice that the tentacle that's fucking him has grown in one of the spots.. it gained a little orb of sorts. That orb has started traveling through the tentacle, getting closer and closer to the guy's tailhole.")

		saynn("He certainly feels it.. He feels something fat pressing against his ass, trying to stretch it further.")

		saynn("[say=pc]MHH-HH! MHHMM!..[/say]")

		addButton("Continue", "See what happens next", "guy_fuck_cum")
	if(state == "guy_fuck_cum"):
		playAnimation(StageScene.TentaclesChoke, "fast", {pc=_tentacles.getScientist1CharID(), plant=true, cum=true, pcCum=true, bodyState={naked=true, hard=true}})
		saynn("Despite his attempts, the first egg manages to stretch him out enough.. before getting stuffed inside. Kinky.")

		saynn("His belly gets slightly more bumpy as his whole body arches, his cock keeps dribbling seed weakly..")

		saynn("Another egg follows soon.. Then another..")

		saynn("Each one makes him squirm and moan into the mouth tentacle, his spent cock still twitching.. but now only leaking transparent stuff.. His stomach has swelled visibly.. making him look pregnant.. In a way, he is.")

		saynn("Even after that, the tentacles weren't.. done. You can see them begin to pulse.. all of them.")

		saynn("Then, seconds later, the poor wolf gets showered in some kind of sticky nectar. The tentacles that were inside him begin to pump him full of it, filling the empty space between all of the eggs to the brim.")

		saynn("[say=pc]That's what you get.[/say]")

		saynn("The wolf.. just whimpers weakly. He seems completely spaced out.. broken. Good.")

		saynn("The tentacles slowly withdraw, making sure not to spill too much juice.. before setting the guy onto the floor.. He is covered in fluids, his belly is swollen, his asshole is gaping.. He stares blankly at the ceiling.")

		saynn("[say=sci1]I.. I..[/say]")

		saynn("[say=pc]I know. You're a breeding stock for tentacles. Don't bother explaining.[/say]")

		if (choseBoth):
			addButton("Continue", "See what happens next", "fuck_girl")
		else:
			addButton("Continue", "See what happens next", "after_all_sex")
	if(state == "after_all_sex"):
		_tentacles.doAnim("idle")
		saynn("All is done. You got your revenge. It feels good.")

		saynn("You notice a paper. Oh yeah, that's the paper that the wolf was threatening you with. He didn't end up tearing it apart it seems. You pick it up.. and find that it was just some random stupid report.")

		saynn("[say=pc]Oh, fuck you.[/say]")

		saynn("What a liar.")

		saynn("You point at all of the computers and lab equipment around you.. And the tentacles begin destroying it all. This probably won't solve the core issue.. but it made you feel better.")

		saynn("After that.. it's time to leave.")

		addButton("Continue", "See what happens next", "docks")
	if(state == "docks"):
		removeCharacter(GM.main.PS.getScientist1CharID())
		removeCharacter(GM.main.PS.getScientist2CharID())
		aimCameraAndSetLocName("pstent_scientist_1")
		saynn("You head back into the docks.. but now with the tentacles.")

		saynn("Looks like there is only one escape pod left.. the one that has gotten stuck when the scientists were trying to board it.")

		saynn("The tentacles help you by forcibly spreading the doors open.")

		saynn("The pod.. is clearly too small for the tentacles. There is only space for two normal-sized people.")

		saynn("[say=pc]Well..[/say]")

		saynn("They might not be the smartest.. but they seem to understand.")

		saynn("Suddenly, bolts of plasma start flying past you. The rest of the guards are here.")

		saynn("The horny tentacles roar into the fight, leaving you be.")

		saynn("Looks like you won't get to say your goodbyes. Oh well.. what can you do..")

		saynn("You let the tentacles have their fun.. as you board the escape pod and press a button that would launch it..")

		addButton("Continue", "See what happens next", "in_space")
	if(state == "in_space"):
		removeCharacter(GM.main.PS.getTentaclesCharID())
		aimCameraAndSetLocName("pstent_escapepod")
		playAnimation(StageScene.Solo, "sit")
		saynn("You're drifting through space.. the fuel has long run-out. Your pod has a way of sending an SOS signal.. but that's about it.")

		saynn("Suddenly, your collar starts beeping.. faster and faster.. until it suddenly sends a shock so strong that you black out.")

		addButton("Continue", "See what happens next", "near_detective")
	if(state == "near_detective"):
		removeCharacter(GM.main.PS.getScientist1CharID())
		removeCharacter(GM.main.PS.getScientist2CharID())
		removeCharacter(_tentacles.getTentaclesCharID())
		addCharacter("intro_detective")
		playAnimation(StageScene.Solo, "sit")
		aimCameraAndSetLocName("intro_interogation")
		saynn("You wake up.. what feels like seconds later.. cuffed to a chair.")

		saynn("It's not the first time you've been in this place.")

		saynn("[say=intro_detective]Name is Jake, IIPF, threat assessment division.[/say]")

		saynn("[say=pc]Yeah, I remember you.[/say]")

		saynn("He raises a brow at you.")

		saynn("[say=pc]I've been naughty, I know.[/say]")

		saynn("He puts his glasses on and reads something off of an old-school wooden tablet.")

		saynn("[say=intro_detective]Let's see. You have a single case of felony escape. Hm. But it's a big one. Help me understand, how and why did it happen? You can start with the how.[/say]")

		saynn("Jake looks over his glasses at you, awaiting.")

		saynn("[say=pc]Do you wanna hear my story? How I was used as a test subject in an illegal bio-lab? And what happened next?[/say]")

		saynn("[say=intro_detective]My job is not to listen to fan fiction. It's to assess the level of risk. How likely is it that you're gonna try to pull this stunt again. So help me help you, will you?[/say]")

		saynn("You're not really sure what to say anymore. You can try to explain that you were held in a cell.. but he will probably not care. And telling him about what you did with the lab will probably put a few extra charges on you. Might as well try to play his game then.")

		saynn("[say=pc]This won't happen again, I can assure you.[/say]")

		saynn("Jake tilts his head ever slightly.. while you put your most innocent eyes.")

		saynn("[say=intro_detective]I see.[/say]")

		addButton("Continue", "See what happens next", "fastforward")
	if(state == "fastforward"):
		removeCharacter("intro_detective")
		GM.pc.setLocation(GM.pc.getCellLocation())
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("Next moment you know it.. you're being flown back to your concrete home.. first class, as usual.")

		saynn("The BDCC guards meet you and walk you to your cell.. where Risha is already waiting for you.")

		saynn("[say=risha]Here is your stupid crap.[/say]")

		saynn("[say=pc]What a warm welcome.[/say]")

		saynn("[say=risha]You know what's warm? My cock. Wanna welcome it?[/say]")

		saynn("Looks like you weren't gone long enough for her to start missing you.")

		saynn("[say=pc]I'm good.[/say]")

		saynn("[say=risha]No. You're a slut. C'mon, I ain't got all day.[/say]")

		saynn("You fetch your stupid crap off of her hands.. and watch her leave.")

		saynn("From one paradise to another.")

		addButton("Continue", "You had your fun", "doEndSlavery")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "fuck_both"):
		choseBoth = true
		setState("fuck_guy")
		return

	if(_action == "girl_fuck_cum"):
		var theChar = getCharacter(_tentacles.getScientist2CharID())
		var theTentacles = getCharacter(_tentacles.getTentaclesCharID())
		var theMenstrualCycle:MenstrualCycle = theChar.getMenstrualCycle()
		for _i in range(7):
			theMenstrualCycle.addTentacleEgg(_tentacles.getTentaclesCharID(), TentacleEggType.Plant, 12*60*60, OrificeType.Vagina)
		for _i in range(5):
			theMenstrualCycle.addTentacleEgg(_tentacles.getTentaclesCharID(), TentacleEggType.Plant, 12*60*60, OrificeType.Anus)
		for _i in range(3):
			theMenstrualCycle.addTentacleEgg(_tentacles.getTentaclesCharID(), TentacleEggType.Plant, 12*60*60, OrificeType.Throat)
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInVaginaBy(_tentacles.getTentaclesCharID())
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInAnusBy(_tentacles.getTentaclesCharID())
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInMouthBy(_tentacles.getTentaclesCharID())
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedOnBy(_tentacles.getTentaclesCharID())

	if(_action == "guy_fuck_cum"):
		var theChar = getCharacter(_tentacles.getScientist1CharID())
		var theTentacles = getCharacter(_tentacles.getTentaclesCharID())
		var theMenstrualCycle:MenstrualCycle = theChar.getMenstrualCycle()
		for _i in range(11):
			theMenstrualCycle.addTentacleEgg(_tentacles.getTentaclesCharID(), TentacleEggType.Plant, 12*60*60, OrificeType.Anus)
		for _i in range(3):
			theMenstrualCycle.addTentacleEgg(_tentacles.getTentaclesCharID(), TentacleEggType.Plant, 12*60*60, OrificeType.Throat)
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInVaginaBy(_tentacles.getTentaclesCharID())
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInAnusBy(_tentacles.getTentaclesCharID())
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInMouthBy(_tentacles.getTentaclesCharID())
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedOnBy(_tentacles.getTentaclesCharID())

	if(_action == "fastforward"):
		processTime(60*42)

	if(_action == "doEndSlavery"):
		endScene()
		GM.main.endCurrentScene()
		GM.main.stopPlayerSlavery()
		GM.pc.setLocation(GM.pc.getCellLocation())
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["choseBoth"] = choseBoth

	return data

func loadData(data):
	.loadData(data)

	choseBoth = SAVE.loadVar(data, "choseBoth", false)
