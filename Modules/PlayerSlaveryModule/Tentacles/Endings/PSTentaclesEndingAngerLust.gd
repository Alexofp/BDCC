extends SceneBase

func _init():
	sceneID = "PSTentaclesEndingAngerLust"

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
		aimCameraAndSetLocName("pstent_fridge")
		saynn("They made a huge mistake, trapping you here with those tentacles. And it's time to make them regret that decision.")

		saynn("You look around.. The door into your cell is probably too strong. Breaking it would take way too long. And even the reinforced windows.. your tentacles aren't strong enough to just bust through those.")

		saynn("Think.. you gotta think.. A thin tentacles presses against your thighs, trembling with barely contained need. Another one wraps loosely around your waist, pulling you closer. They certainly are quite needy.")

		saynn("All you need.. is to get out of this cell.. The tentacles will do the rest.")

		saynn("Hm.. An idea sparks in your mind.")

		saynn("You pull away from the tentacles and open the fridge. Yes.. perfect.")

		saynn("You grab the old chicken.. and then use the injector on it, stuffing it with that weird drug. You don't need the chicken anymore.. but the empty injector could be very useful.")

		saynn("The tentacles are getting horny again.. and slightly annoyed with your shuffling. Their tips are oozing juices everywhere.")

		saynn("[say=pc]You're gonna get a lot of.. hole. I promise you. But right now you need to pretend that you're just a dumb plant, okay?[/say]")

		saynn("They're a little dumb already.. maybe it will work. You pull them back into the nest and do your best gesture of a sleeping person to try to get them to understand.")

		addButton("Continue", "See what happens next", "window")
	if(state == "window"):
		_tentacles.doAnim("sleep")
		aimCameraAndSetLocName("pstent_important")
		saynn("You walk up to the window that has the corridor behind it and wait until one of the guards walks past. You show him the empty injector and point at it, your expression stern.")

		saynn("The guard looks at you.. at the injector.. and at the sleepy tentacles behind you.. and then he says something over his headset.")

		saynn("Seconds later.. the intercom kicks in.")

		saynn("[say=sci1]Oh, already? We're still a little busy with our coffee break. I will send a few guards to bring you here. They will cuff and blindfold you, don't be stupid and obey them.[/say]")

		saynn("You will obey alright.")

		saynn("The door behind you hisses, it begins to unseal itself. Three guards enter the cell, all of them with plasma rifles.. but with a relaxed posture. One approaches you with cuffs, another holds a blindfold.")

		saynn("[say=pc]Finally. Get me out of here, {psTentacles}.[/say]")

		saynn("All the guards look at you with confused expressions behind their helmets. All the while you watch the tentacles rise behind them..")

		addButton("Continue", "See what happens next", "first_group")
	if(state == "first_group"):
		_tentacles.doAnim("glare")
		saynn("The first guard doesn't even have time to scream. A thick, slick tentacle wraps around his helmet and yanks it off.. before stuffing itself into his open mouth. His eyes go wide as his throat bulges, the tendril pushing itself deep, using him like a warm, wet sleeve.")

		saynn("The second guard raises his rifle.. but the tentacles are quick to smack it out of his hands and wrap around him. One particularly horny tentacle would rip some of his armor pieces off and force itself between his legs, down his clenched tailhole. He gasps as the wet tentacle suddenly begins to pump into him.")

		saynn("The third guard.. a girl.. tries to run.. but a tendril catches her ankle and drags her back. She is flipped onto her stomach, her armor torn away like paper.. Before two thick tips find her holes and stretch them wide, fucking her right there.")

		saynn("All of the tentacles are now busy with all the guards.. It certainly is a view. And the sounds.. hearing all of the wet, rhythmic pumping mixed together with muffled moans and groans.. It's cute.")

		saynn("[say=pc]Told. You'd get a lot of hole.[/say]")

		saynn("Suddenly, the alarm kicks in! Someone actually bothered to check the camera.")

		saynn("[say=sci1]What the.. Containment breach, we have a containment breach at cell 5! Code red, code red. All guards, the armory is unlocked, I order you to kill the specimen now. I repeat, shoot to kill![/say]")

		saynn("Time to move.. At least the tentacles seem to be done with their new sextoys.")

		addButton("Continue", "See what happens next", "corridor")
	if(state == "corridor"):
		aimCameraAndSetLocName("pstent_entrance")
		saynn("You step out into the corridor. The tentacles follow you, squeezing through the tight doorframe just in time for the door to begin sealing itself.")

		saynn("More boots are pounding against the concrete flooring..")

		saynn("[say=pc]Get ready.[/say]")

		saynn("You've never shot anything like what you're holding.. but you don't need to be accurate with it anyway.")

		saynn("Guards appear from behind the corner, wearing some kind of advanced armor and with plasma rifles in their hands. You catch their attention and pin them down by shooting plasma bolts in their rough direction.")

		saynn("This gives the tentacles enough time to leap at them, smack their guns away and grab them! They would then proceed to do a similar.. activity.. with them, stripping them naked and stuffing all of their holes!")

		saynn("Many moans and plaps echo around the corridor, the ones who try to crawl away get pulled back into the action, now with an extra tentacle getting shoved down their throats.")

		saynn("[say=pc]Some of you seem to enjoy it. Aw. So many sluts here.[/say]")

		saynn("The pounding continues until the tentacles start pumping each of the guards full of some kind of nectar, their bellies getting visibly bumpier from the sheer amount of it.")

		saynn("[say=pc]Perfect.[/say]")

		saynn("The tentacles leave the panting guards on the floor.. You don't see the reason to kill them, they're clearly not threats anymore.")

		saynn("Time to move on.")

		addButton("Continue", "See what happens next", "show_stuff")
	if(state == "show_stuff"):
		aimCameraAndSetLocName("pstent_scientist_2")
		saynn("You don't even need to point anymore, the tentacles just proceed to ravage through the bio-lab on their own, destroying any equipment in the process, showing their anger.. while you stay behind.")

		saynn("Actually, you decide to split when you notice small colorful signs that are placed on the walls of each intersection. The ones that you were interested in.. say 'docks'.")

		saynn("You run. And you were right.. As soon as you arrive, you see quick glimpses of the two scientists who were trying to board the escape pods.")

		saynn("A few shots from your plasma rifle has made them quickly reconsider. They stop trying to pry the airlocks open.. and instead run somewhere deeper into the bio-lab. Perfect.")

		saynn("After that, you trace your steps back and find the tentacles. It's not hard to find.. You just have to follow the path of.. cum.. nectar.. and fucked-silly guards.")

		saynn("During your exploration, you find more reinforced windows.. a whole row of them, each leaving into a separate containment cell.. just like yours. There are.. things.. inside them. Some have humanoid shapes.. some are just nothing but twisted forms.")

		saynn("Security doors close in front of you.. but the tentacles just smash through them. It takes them a few tries.. but eventually the metal caves.")

		saynn("All the corridors look the same.. but eventually you do reach some kind of checkpoint.. with more guards defending it. You hide behind the corner and take blind shots with your rifle while the tentacles do the.. messy.. work and charge forward.")

		saynn("[say=pc]Neutralize them.[/say]")

		saynn("You hear screams.. followed by thumps.. followed by moans. Makes you smile almost.")

		saynn("Feeling a bit curious, you peek your head out and watch as the tentacles penetrate all of the holes of a poor guard.. before stuffing them full of nectar. The rest are already fucked into submission.")

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

		saynn("The monster starts smashing into the reinforced blast shutters, trying to break through.")

		saynn("Suddenly, a voice cries through an intercom.")

		saynn("[say=sci1]Wait! Wait-wait-wait! We can make a deal! There is no need for any more bloodshed![/say]")

		saynn("Bloodshed.. they don't know the half of it.")

		saynn("Looks like you have struck gold. You look around and see that one of the security cameras is nearby. It's watching you and your little friend trying to get inside their shelter.")

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

		saynn("[say=pc]So that's how you live. Pretty miserable.[/say]")

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

		saynn("Should you obey these fuckers one more time? Nah. That's not why you came here.")

		saynn("[say=pc]You can shove that paper up your ass.[/say]")

		saynn("He really gets caught off-guard.")

		saynn("[say=pc]Oh? You think I care about getting out of here? My {psTentacles} here fucked a lot of holes today.. But it is still horny. I think it wants one of your butts~. Ain't that right?[/say]")

		saynn("The tentacles sway eagerly, some of their green tips are swollen and dripping juices profusely..")

		saynn("Now.. who is it gonna be..")

		addButton("Guy", "Make the tentacles fuck the guy!", "fuck_guy")
		addButton("Girl", "Make the tentacles fuck the girl!", "fuck_girl")
		addButton("Both", "Make the tentacles fuck the guy first.. and then fuck the girl too..", "fuck_both")
	if(state == "fuck_girl"):
		saynn("Seeing that the things aren't looking good for him, the wolf just sets off, dashing towards the exit. His foot almost leaves the lab.. almost.")

		saynn("A tendril wraps around his other ankle, yanking him back and pinning him into the wall. He struggles.. but fails to do anything.")

		saynn("[say=sci1]Let me go! Let me..[/say]")

		saynn("The tentacle gets tired quickly of his annoying voice too and shoves itself inside his mouth, gagging him that way.")

		saynn("The real target of the tentacles was the girl.. Carefully, the tentacles approach her. She is shivering.. but doesn't pull away.")

		saynn("[say=sci2]Hey.. uh.. I w-will do anything if you tell it to.. ah!..[/say]")

		saynn("The multiple tentacles grab onto her labcoat and rip it off of her. Her skirt and the top are next.. revealing a surprisingly sexy lace black bra and panties beneath. Sadly, those have to be torn into pieces as well.")

		saynn("[say=sci2]My underwear.. ah..[/say]")

		saynn("[say=pc]The tentacles think you don't need it. Who am I to say no to them?[/say]")

		saynn("[say=sci2]Huff..[/say]")

		saynn("The girl is trying to cover herself.. but the tentacles pull her hands away, revealing her cute perky tits and the pink slit between her legs. She actually seems to be dry, the fear probably destroying any bits of lust that she might have had..")

		saynn("[say=sci2]Stop, please. I will do anything! Really.. Just don't..[/say]")

		saynn("[say=pc]Too late for pleading. You could have just not locked me in with that cutie. Now you will have to endure the consequences.[/say]")

		saynn("Suddenly the tentacles pull the girl up by her waist, legs and arms. A thick, shiny tendril presses between her legs and starts teasing her pussy folds. She tries to clamp her legs shut.. but the tendrils are quick to forcefully spread them again.")

		saynn("[say=sci2]Ah..[/say]")

		saynn("Another one presses against her mouth. The girl desperately tries to keep her lips shut.. but the tip of the tentacles eventually manages to slip past her teeth, forcing itself in.")

		saynn("She gags, tears stream down her cheeks. But it looks like the rest of her body is responding, her slit getting all wet from the stimulation.")

		saynn("[say=sci2]Mhh-h.. mhh-..[/say]")

		saynn("The tendril in her mouth begins to move, slowly fucking her throat while she chokes and whimpers. Below, another tentacle joins the first, prodding her tight-looking tailhole.")

		saynn("[say=sci2]Mphh!! Mphhh!.. MPHHH![/say]")

		saynn("She clearly tries her best to clench.. but her shamefully-wet pussy and her tight asshole eventually get stretched enough for the tentacles to slide inside her!")

		saynn("Her hips desperately try to buck away.. but there is nothing to go. Some tentacles hold her helpless while other ones start pounding into all three holes at once. Her protests turn into weak whimpers.. and then into muffled moans.")

		saynn("[say=sci2]Mmh.. mm.. hh..[/say]")

		saynn("One particularly clever tendril snakes up to her clit, flicking and circling it.. which makes her girl arch her back, her eyes rolling back.")

		saynn("A wet, desperate cry escapes around the tendril in her throat as her first orgasm rips through her. She shakes hard.. cumming.. while the tentacles just keep pushing, keep fucking her. Their lust.. and their anger.. seem bottomless.")

		saynn("Some of the tendrils begin to look different. Something is moving inside them, creating visible bumps. That bump hits the girl's pussy.. and starts stretching her folds even wider.")

		saynn("[say=sci2]MHh!.. HH-hhmh!..[/say]")

		saynn("Then, the first egg gets pushed into her cunt.")

		saynn("Her eyes go wide. She tries to let out a cry but the tentacles in her mouth muffles it. Seeing that her belly has gotten slightly more bumpy.. the tentacle has probably stuffed the egg directly into her womb.")

		saynn("And then another.. And another..")

		saynn("Her belly begins to look more round, a very-visible bulge forming as eggs get shoved inside her pussy. The same happens in her ass too, her guts getting stuffed with the same eggs. She looks pregnant by now.. her stomach round.")

		saynn("[say=sci2]Mmmph! MMMPH-![/say]")

		saynn("She is cumming again, overloaded, overstimulated, still getting fucked by the tentacles who are now also using her as its breeder.")

		saynn("And that's now even the end of it. Suddenly, all of the tendrils begin to pulse.. before shooting a stream of nectar out of their tips, covering the feline with it. The tentacles that were inside her do that too, now pumping her holes full of that stuff, filling all of the empty space between the eggs..")

		saynn("[say=pc]Wow.[/say]")

		saynn("By the end of it, the girl.. just moans softly..")

		saynn("The tentacles slowly withdraw, making sure not to spill too much juice.. before setting the girl onto the floor.. She is covered in fluids, her belly is swollen, her holes are all gaping..")

		saynn("[say=sci2]Ah.. hh-h..[/say]")

		saynn("[say=pc]It really looks like you enjoyed it. Hah.[/say]")

		addButton("Continue", "See what happens next", "after_all_sex")
	if(state == "fuck_guy"):
		saynn("Seeing that the things aren't looking good for him, the wolf just sets off, dashing towards the exit. His foot almost leaves the lab.. almost.")

		saynn("A tendril wraps around his other ankle, yanking him back. Another one coils around his waist, lifting him clean off the floor. He tries to kick.. tries to struggle.. but the tentacles are fueled by anger.")

		saynn("[say=sci1]Let me go! Let me..[/say]")

		saynn("His labcoat gets ripped off, buttons scattering across the floor. The rest of the cloth gets shredded too.. leaving the wolf suspended in the air naked, sheath and tight asshole out on display for everyone.")

		saynn("[say=sci1]Stop it, now! You f-fucking.. monster.[/say]")

		saynn("A thick, slick tendril presses against his lips.. and then forces itself inside when the guy was about to say something else, turning his speech into a muffled series of noises.")

		saynn("Another tentacles slithers between his legs, rubbing his sheath until the canine cock starts poking out of it, probably against the scientist's will. Another one presses against his tight anal entrance, circling, lubricating him with some slick, warm juices.")

		saynn("He managed to wiggle his head free from the mouth tentacle.")

		saynn("[say=sci1]No-no-no! Don't you fucking-.. AH![/say]")

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

		addButton("Continue", "See what happens next", "after_all_sex")
	if(state == "after_all_sex"):
		_tentacles.doAnim("idle")
		saynn("All is done. You got your revenge. It feels good.")

		saynn("You notice a paper. Oh yeah, that's the paper that the wolf was threatening you with. He didn't end up tearing it apart it seems. You pick it up.. and find that it was just some random stupid report.")

		saynn("[say=pc]Oh, fuck you.[/say]")

		saynn("Every word of his, it's all a lie. A pathetic attempt at escaping with his life. Whatever, he can keep living in his stupid world.")

		saynn("You point at all of the computers and lab equipment around you.. And the tentacles begin destroying it all. This probably won't solve the core issue.. but it made you feel better.")

		saynn("Time to leave.")

		addButton("Continue", "See what happens next", "docks")
	if(state == "docks"):
		removeCharacter(GM.main.PS.getScientist2CharID())
		aimCameraAndSetLocName("pstent_scientist_1")
		saynn("You head back into the docks.. but now with the tentacles.")

		saynn("Looks like there is only one escape pod left.. the one that has gotten stuck when the scientists were trying to board it.")

		saynn("The tentacles help you by forcibly spreading the doors open.")

		saynn("The pod.. is clearly too small for the tentacles. There is only space for two normal-sized people.")

		saynn("[say=pc]Well..[/say]")

		saynn("They might not be the smartest.. but they seem to understand.")

		saynn("Suddenly, bolts of plasma start flying past you. The rest of the guards are here.")

		saynn("The tentacles roar into the fight, leaving you be.")

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

	if(_action == "fastforward"):
		processTime(60*42)

	if(_action == "doEndSlavery"):
		endScene()
		GM.main.endCurrentScene()
		GM.main.stopPlayerSlavery()
		GM.pc.setLocation(GM.pc.getCellLocation())
		return

	setState(_action)
