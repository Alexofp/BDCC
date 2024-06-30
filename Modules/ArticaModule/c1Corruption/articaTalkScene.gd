extends SceneBase

var corruption = 0.0
var isNaked = false
var isCaged = false
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var pickedReplayEvent = ""

func _init():
	sceneID = "articaTalkScene"

func _run():
	if(state == ""):
		addCharacter("artica")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		corruption = getModule("ArticaModule").getCorruption()
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		if (getModule("ArticaModule").isLusty() || getFlag("ArticaModule.LQArticaGotBrainwashed")):
			saynn("Artica is swaying and fidgeting a lot, her cheeks blushing slightly."+str(" Her heavy belly is protruding out a lot, her paws support and caress it lovingly.." if getCharacter("artica").isVisiblyPregnant() else "")+""+str(" Her eyes are sparkling with lust and eternal obedience as she is looking at you.." if getFlag("ArticaModule.LQArticaGotBrainwashed") else "")+"")

		else:
			if (nakedAndShy):
				saynn("Artica is covering herself up as much as she can, her lack of clothes is making her blush. "+str(" Her heavy belly is protruding out a lot, clearly carrying a whole litter.." if getCharacter("artica").isVisiblyPregnant() else "")+"")

			elif (isNaked):
				saynn("Artica is swaying about like her usual self, her paws aren't hiding her private bits, allowing anyone to check them out.. Including you."+str(" Her heavy belly is protruding out a lot, clearly carrying a whole litter.." if getCharacter("artica").isVisiblyPregnant() else "")+"")

			else:
				saynn("Artica is swaying about, rarely standing still for longer than a few seconds."+str(" Her heavy belly is protruding out a lot, her paws caressing it gently.." if getCharacter("artica").isVisiblyPregnant() else "")+"")

		saynn("[say=artica]"+str(getModule("ArticaModule").getReaction())+"[/say]")

		saynn("Corruption: "+str(Util.roundF(corruption*100.0, 1))+"%")

		addButton("Talk", "Chat about stuff", "talk_menu")
		addButton("Tease", "Do something half-lewd with her", "tease_menu")
		if (getModule("ArticaModule").isLusty() || getFlag("ArticaModule.LQArticaGotBrainwashed")):
			addButton("Sex", "See what kind of kinky things you can do with her", "sex_menu")
		else:
			addDisabledButton("Sex", "Artica is not horny enough")
		if (getCharacter("artica").hasEffect(StatusEffect.HasBodyWritings) || getCharacter("artica").hasEffect(StatusEffect.CoveredInCum)):
			addButton("Shower", "Wait until Artica heads to the showers on her own..", "start_showers")
		else:
			addDisabledButton("Shower", "Artica won't go to the showers unless she is messy")
		if (getModule("ArticaModule").hasAnyWaitScenesLeft()):
			if (getModule("ArticaModule").isLusty() || getFlag("ArticaModule.LQArticaGotBrainwashed")):
				if (getModule("ArticaModule").canTriggerWaitScene()):
					saynn("Artica is gonna do something if you wait for her to do so..")

					addButton("Wait..", "See what Artica will do if left alone", "trigger_wait")
				else:
					addDisabledButton("Wait..", "Conditions aren't met to start the next scene!\n"+getModule("ArticaModule").getBlockingReqs())
			else:
				addDisabledButton("Wait..", "Nothing will happen if you do this. Can try to make Artica horny to encourage her to explore the station")
		if (getFlag("ArticaModule.LQArticaGotDreamCatcher") || getFlag("ArticaModule.LQArticaGotBrainwashed")):
			addButton("Memories", "Replay one of the old lewd scenes", "replay_menu")
		addButton("Leave", "Time to go", "endthescene")
		if (getFlag("ArticaModule.TentaclesPcHasFlower") && !getFlag("ArticaModule.TentaclesArticaHasFlower")):
			addButton("Flower!", "Give Artica the flower that she is looking for", "do_give_flower")
	if(state == "ask_lilac"):
		saynn("[say=pc]So why are you a lilac? What did you do to earn that purple color?[/say]")

		if (getFlag("ArticaModule.LQArticaGotBrainwashed")):
			saynn("[say=artica]Um.. I d-don't remember actually.. All I know is.. I'm your fucktoy slut.. Nothing else matters.. haha..[/say]")

			saynn("Artica chrrrrs softly as she nuzzles your cheek.")

		elif (getFlag("ArticaModule.LQArticaGotDreamCatcher")):
			saynn("[say=artica]That corporation.. AlphaCorp?.. It invaded my planet.. Destroyed the careful balance.. I don't know why..[/say]")

			saynn("Artica looks down on herself..")

			saynn("[say=artica]So I.. wrote words of encouragement.. on my body.. everywhere.. I w-wasn't gonna fight myself.. But I didn't want to do n-nothing.. And then I.. tried to make everyone s-see me..[/say]")

			saynn("That's one way to spread the message..")

			saynn("[say=artica]I h-hope I helped other Jogauni not to give up.. but I s-soon got caught..[/say]")

			saynn("[say=pc]Sounds like simple public indecency.[/say]")

			saynn("[say=artica]M-maybe.. they w-were very mean to me though.. S-something about.. setting the precedent..[/say]")

			saynn("Makes sense.")

		else:
			saynn("[say=artica]I.. um.. it's a long story.. our planet got invaded..[/say]")

			saynn("Artica looks at her paws.")

			saynn("[say=artica]I couldn't r-really fight.. but.. d-doing nothing was a-also bad.. t-that's what they wanted.. T-they wanted to convince us that everything was g-gonna be alright soon..[/say]")

			saynn("Sounds like AlphaCorp alright.")

			saynn("[say=artica]I knew that we had to resist if we wanted to stay the Jogauni that we are.. I.. I d-don't know.. I d-did what I could.. I.. um.. I w-was spreading the message.. message that they didn't like..[/say]")

			saynn("Huh.")

			saynn("[say=pc]Still.. What are your crimes? They charged you with something sexual related, right?[/say]")

			saynn("Artica lowers her gaze and scratches behind her ear.")

			saynn("[say=artica]Y-.y.. yea..h..[/say]")

			saynn("Looks like you're not gonna get that out of her.")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_gym"):
		saynn("[say=pc]You like going to the gym?[/say]")

		if (getFlag("ArticaModule.LQArticaGotBrainwashed")):
			saynn("[say=artica]I.. I j-just wanted to get flexible enough to be able to suck my own cock..[/say]")

			saynn("Wow. What a bold fluff.")

			saynn("[say=artica]So I can p-pleasure myself between all the times that you fuck me.. haha..[/say]")

		else:
			saynn("[say=artica]Me? Not really.. no.. why are you asking?..[/say]")

			saynn("Hah. Interesting.")

			saynn("[say=pc]No reason.[/say]")

			saynn("[say=artica]I was going out on hunts sometimes.. I was often the slowest fluff though.. K-Kept getting lost..[/say]")

			saynn("Tribal life, huh.")

			saynn("[say=pc]How does your old life compare to.. this?[/say]")

			saynn("Artica shrugs.")

			saynn("[say=artica]I miss my tribe.. but.. y-yeah.. it's v-very different..[/say]")

			if (getFlag("ArticaModule.eventSelfsuck", 0) >= 2):
				saynn("[say=pc]I think I know why you were going to the gym, Artica~.[/say]")

				saynn("She blushes deeply.")

				saynn("[say=artica]Eep..[/say]")

				saynn("You pat her on the head, offering some comfort.")

				saynn("[say=pc]You can keep trying, I liked what I saw.[/say]")

				saynn("She chrrrrrs softly..")

				if (getFlag("ArticaModule.LQArticaGotDreamCatcher")):
					saynn("[say=artica]Y-yeah.. I just wanted to.. you know.. become more flexible.. I w-was really curious h-how my cock tasted..[/say]")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_mommy"):
		saynn("[say=pc]How do you feel.. now that you're a mommy?[/say]")

		var gaveBirthAmount = getFlag("ArticaModule.gaveBirthTimes", 0)
		saynn("[say=artica]First time was.. s-scary.. and painful.. but the nurses were n-nice to me..[/say]")

		saynn("Artica looks down at her belly..")

		saynn("[say=artica]They let me feed my pups for a bit.. it felt strange.. but kinda good..[/say]")

		if (gaveBirthAmount >= 2):
			saynn("[say=pc]It's not your first time though.[/say]")

			saynn("[say=artica]Y-yeah.. I t-think it's not the last too.. haha..[/say]")

		if (gaveBirthAmount >= 4):
			saynn("She scratches behind her ear.")

			saynn("[say=artica]Is it s-strange to say.. t-that I want more..[/say]")

			saynn("[say=pc]It's not. You're a good mommy, Artica.[/say]")

			saynn("She chrrrrrs happily and nuzzles your cheek, her tail swishing happily.")

		if (gaveBirthAmount >= 7):
			saynn("[say=artica]T-thank you.. f-for m-making mommy so many times.. I l-love being your little slutty b-breeding bitch..[/say]")

			saynn("Awww, so cute.")

		if (gaveBirthAmount >= 10):
			saynn("Looks like she wants to add some more to her last sentence..")

			saynn("[say=artica]I'm like.. a total slut for more pups.. nyaah.. I w-wanna be filled with c-cum always.. I wanna b-be bred.. again and again..[/say]")

			saynn("You really messed with her mind, huh.. Looks like she can not get any more eager about pregnancy.. You can only pat yourself for accomplishing this!")

		saynn("You recall that Artica gave birth.. exactly "+str(gaveBirthAmount)+" "+str("times" if gaveBirthAmount  != 1 else "time")+".")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_sizequeen"):
		saynn("[say=pc]Would you consider yourself.. a size queen?[/say]")

		saynn("[say=artica]A size q-queen? W-what's that..[/say]")

		saynn("[say=pc]Well, you know, a queen of big sizes.[/say]")

		saynn("Artica scratches her chin.")

		saynn("[say=artica]I'm n-not r-really a q-queen of anything..[/say]")

		if (getFlag("ArticaModule.eventDildo", 0) >= 2):
			saynn("[say=pc]Yeah, that would be stretching it, really.. haha..[/say]")

			saynn("Artica instantly realizes what you mean.. her cheeks red like fire..")

		if (getFlag("ArticaModule.eventDildo", 0) >= 3):
			saynn("[say=artica]I g-guess.. then.. y-yeah.. I m-might be..[/say]")

			saynn("You tilt your head.")

			saynn("[say=pc]What was that?[/say]")

			saynn("[say=artica]D-does it count if it's my.. mmm..[/say]")

			saynn("[say=pc]It definitely counts, Artica.[/say]")

			saynn("[say=artica]..hah..[/say]")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_tentacles"):
		saynn("[say=pc]Do you have interest in.. tentacles.. Artica?[/say]")

		saynn("Artica blinks and coughs.")

		saynn("[say=artica]Tentacles?..[/say]")

		saynn("[say=pc]Yeah, tentacles, long flexible tendrils.[/say]")

		saynn("She scratches behind her head.")

		saynn("[say=artica]Well.. when I was young.. I got lost and ran into some mystical creature.. it d-did had t-those..[/say]")

		saynn("[say=pc]So.. you are?[/say]")

		saynn("She blushes deeply..")

		if (getFlag("ArticaModule.eventTentacles", 0) >= 3):
			saynn("[say=artica]Um.. Just..[/say]")

			saynn("[say=pc]C'mon. I saw your belly, it wasn't a pregnant belly~.[/say]")

			saynn("She covers her face.")

			saynn("[say=artica]Eep.. I..[/say]")

			saynn("She speaks very quietly.")

			saynn("[say=artica]..g-guess..[/say]")

			saynn("Such a shy fluff. You saw it though, you know the full truth.")

			if (getFlag("ArticaModule.gaveBirthToEggs")):
				saynn("[say=artica]I d-did find s-some..[/say]")

				saynn("Find huh. Interesting choice of words.")

				saynn("[say=artica]And it d-did.. s-stuff me full of.. some kind of eggs..[/say]")

				saynn("[say=pc]Must have felt awful, huh~?[/say]")

				saynn("[say=artica]You s-saw it yourself.. S-so many e-eggs.. eep.. I t-think I c-came j.just laying them..[/say]")

				saynn("[say=pc]You're a slut for tentacles, Artica~.[/say]")

				saynn("[say=artica]..haha.. y-yeah.. I g-guess..[/say]")

		else:
			saynn("[say=artica]Um.. Just.. fascinated..[/say]")

			saynn("Interesting..")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "talk_menu"):
		saynn("What do you want to talk about?")

		addButton("Lilac", "Ask why Artica is a lilac", "ask_lilac")
		if (getFlag("ArticaModule.eventSelfsuck", 0) >= 1):
			addButton("Gym", "Ask Artica if she likes doing sport activities", "ask_gym")
		else:
			addDisabledButton("Gym", "You have no reason to ask that yet..")
		if (getFlag("ArticaModule.gaveBirthTimes", 0) > 0):
			addButton("Mommy", "Ask Artica about how she feels to be a mommy", "ask_mommy")
		else:
			addDisabledButton("Mommy", "Artica never gave birth.. yet..")
		if (getFlag("ArticaModule.eventDildo", 0) >= 1):
			addButton("Size queen", "Ask Artica if she is a size queen", "ask_sizequeen")
		else:
			addDisabledButton("Size queen", "You have no reason to ask that yet..")
		if (getFlag("ArticaModule.eventTentacles", 0) >= 2):
			addButton("Tentacles", "Ask Artica if she likes tentacles", "ask_tentacles")
		else:
			addDisabledButton("Tentacles", "You have no reason to ask that yet..")
		if (getFlag("ArticaModule.eventPortalPanties", 0) >= 2):
			addButton("Portal panties", "Ask Artica to put on or remove the portal panties", "toggle_portal_panties")
		else:
			addDisabledButton("Portal panties", "Artica doesn't yet have portal panties.. Let her explore the station and maybe find some")
		addButton("Back", "Enough chatting", "")
	if(state == "toggle_portal_panties"):
		if (getFlag("ArticaModule.wearsPortalPanties", false)):
			saynn("[say=pc]Those panties that you have.. Can I take a look?[/say]")

			saynn("Artica's ears twitch nervously, her cheeks flushing a bit. She pulls the purple panties out and presents them. They look generic enough, with a cute red heart on them.. but the inner sides hides a few thin metal rings that have closed apertures on them..")

			saynn("[say=artica]Here..[/say]")

			saynn("[say=pc]Can you put them on?[/say]")

			saynn("[say=artica]Oh.. um.. Here?[/say]")

			saynn("You nod confidently, making the fluff blush more.")

			saynn("[say=artica]Oki..[/say]")

			if (isNaked):
				saynn("Artica carefully steps into the panties and pulls them up, adjusting the fit until they rest comfortably on her hips, the cold portal rings brushing against her sensitive bits don't seem to bother her at all..")

			else:
				saynn("Artica pulls her shorts down, exposing her private bits to you.. Then she carefully steps into the panties and pulls them up, adjusting the fit until they rest comfortably on her hips. The cold portal rings brushing against her sensitive bits don't seem to bother her at all..")

			saynn("[say=artica]Here..[/say]")

			saynn("[say=pc]Thank you, Artica.[/say]")

			saynn("She offers you a cute smile.")

		else:
			saynn("[say=pc]Can you take off your portal panties, Artica.[/say]")

			saynn("She nods.")

			saynn("[say=artica]Sure..[/say]")

			saynn("Artica pulls her purple panties off and stores them. Enough fun with portals for now.")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "replay_menu"):
		saynn("Pick which event you want to see again.")

		addEventReplayButtons()
		if (false):
			addButton("Error", "You shouldn't see this", "do_pick_replay_event")
		addButton("Back", "You changed your mind", "")
	if(state == "do_pick_replay_event"):
		saynn("Which scene of that event do you want to see again?")

		addEventReplaySceneButtons()
		if (false):
			addButton("Error", "You shouldn't see this", "do_start_replay_scene")
		addButton("Back", "You changed your mind", "replay_menu")
	if(state == "trigger_wait"):
		playAnimation(StageScene.Solo, "stand", {pc="artica"})
		var firstTimeWait = getFlag("ArticaModule.firstTimeWait", false)
		if (!firstTimeWait):
			setFlag("ArticaModule.firstTimeWait", true)
			saynn("Artica is looking around intently.. you get a feeling that she wants to do something.. on her own.. but her inherent shyness prevents her from telling you that outright.")

			saynn("So you just leave her alone. You find a spot from where you can watch her.. and then just wait.")

			saynn("And, not even a few minutes later, Artica starts heading somewhere, her desire makes her eager to explore the prison.")

		else:
			saynn("Artica's behavior makes it obvious that she wants to explore the station on her own more.")

			saynn("So you just leave her alone. You find a spot from where you can watch her.. and then just wait. Soon enough, Artica starts heading somewhere..")

		addButton("Follow", "See what Artica will do", "start_corruption_event")
	if(state == "sex_menu"):
		saynn("Artica is horny. How do you wanna solve that?")

		addButton("Breed her", "Try for some pups", "sex_breed")
		addButton("Ride her", "Artica has a nice cock.. why not ride it", "sex_ride")
		if (corruption >= 0.2):
			addButton("Pawjob", "Make Artica cum with just your feet", "sex_pawjob")
		else:
			addDisabledButton("Pawjob", "Artica's corruption needs to be above 20% for her to agree to this")
		if (corruption >= 0.3):
			addButtonWithChecks("Ropes!", "Use some ropes to suspend Artica above the floor.. and then have some fun with her (Requires a rope harness!)", "sex_ropes", [], [[ButtonChecks.HasItemWithTag, ItemTag.RopeHarness]])
		else:
			addDisabledButton("Ropes!", "Artica's corruption needs to be above 30% for her to agree.. also.. prepare a rope harness")
		if (corruption >= 0.5):
			if (!isCaged):
				addButton("Mutual pawjob", "Help each other out with your paws", "sex_mutualpawjob")
			else:
				addDisabledButton("Mutual pawjob", "Artica can not be caged for this scene. Sorry!")
		else:
			addDisabledButton("Mutual pawjob", "Artica's corruption needs to be above 50% for her to be kinky enough to do this!")
		if (corruption >= 0.8):
			addButtonWithChecks("Hypnovisor fun..", "Mess with Artica's mind a little.. You will need a hypnovisor for this", "sex_hypnovisorfun", [], [[ButtonChecks.HasItemWithTag, ItemTag.Hypnovisor]])
		else:
			addDisabledButton("Hypnovisor fun..", "Artica's corruption needs to be above 80% for her to be kinky enough to do this.. also don't forget to bring a hypnovisor!")
		if (getFlag("ArticaModule.LQArticaGotDreamCatcher")):
			addButton("Invite Rahi..", "Let Rahi and Artica do some kinky stuff together..", "do_invite_rahi")
		addButton("Back", "Never mind", "")
	if(state == "tease_menu"):
		saynn("What do you want to do?")

		addButton("Canteen", "(Pawplay) Invite Artica to go eat", "do_tease_canteen")
		addButton("Your cell", "Invite Artica to your cell", "do_tease_cell")
		if (corruption >= 0.25):
			addButton("Grope her", "Casually grope Artica out in the public", "do_grope")
		else:
			addDisabledButton("Grope her", "Artica's corruption needs to be at least 25% for you to casually grope her out in the public")
		if (corruption >= 0.5):
			addButton("Dirty language", "Get Artica horny with just words", "do_dirtylanguage")
		else:
			addDisabledButton("Dirty language", "Artica's corruption needs to be at least 50% for you to be able to get her horny with just your words")
		addButton("Back", "Go back to the previous menu", "")
	if(state == "do_dirtylanguage"):
		playAnimation(StageScene.Grope, "tease", {pc="artica", npc="pc", bodyState={hard=true}})
		var isPregnant = getCharacter("artica").isVisiblyPregnant()
		saynn("You lean in close to Artica, making her feel your hot breath against her ear.")

		var theTopic = RNG.pick(["naked", "whore", "paws"])
		#if (isCaged && RNG.chance(40)):
		#	theTopic = "chastity"
		if (isPregnant && RNG.chance(30)):
			theTopic = "preg"
		if (!isPregnant && RNG.chance(30) && GM.pc.hasReachablePenis()):
			theTopic = "breed"
		if (theTopic == "naked"):
			saynn("[say=pc]You look so beautiful when you're naked, Artica.[/say]")

			saynn("Artica instantly lowers her gaze, her tail curling around her leg.")

			saynn("[say=pc]I just.. love.. seeing your tits.. cock.. your pussy.. all on display for me to see.[/say]")

			saynn(""+str("She is not naked right now.. but you can still see her nipples becoming perky and stiff behind the shirt" if !isNaked else "You notice her nipples becoming perky and stiff as you say that..")+"")

			saynn("[say=artica]Mm-m.. t-thank you.. for the c-compliment..[/say]")

			saynn("[say=pc]You're such a good pet. You're always ready to show off your body for me.[/say]")

			if (!isNaked):
				saynn("Her breathing becomes deeper, "+str("something in her shorts twitching" if isCaged else "her shorts bulging")+"..")

			else:
				saynn("Her breathing becomes deeper, "+str("her caged up cock becoming all cute and drippy" if isCaged else "her cock peeking out of its sheath, the tip leaking pre..")+"")

			saynn("[say=artica]Y-y.. y-yes.. I-I.. I.. love.. I love being a.. e-exhibionist little slut..[/say]")

			saynn("So cute to hear her say that.")

			saynn("[say=pc]Good girl.[/say]")

			saynn("Her chin is low.. but her"+str(" naked" if isNaked else "")+" chest is puffed out, her butt swaying sensually while her paws slide along the white fur on her sides.")

		elif (theTopic == "whore"):
			saynn("[say=pc]You're so obedient, Artica. Always ready to spread your legs for me.. or anyone really.. who wants to use you."+str(". Always ready to offer me your cock to play with too~." if GM.pc.hasVagina() else "")+"[/say]")

			saynn("Your words make her blink many times, her cheeks blush deep red as she stands up on her toes.")

			saynn("[say=pc]Right?[/say]")

			saynn("[say=artica]I.. um.. m-maybe..[/say]")

			saynn("You don't touch her at all.. but your eyes are drilling her, making the white fluff squirm in place.."+str(" while her nips are becoming visibly aroused behind the shirt." if !isNaked else " while her nips become visibly hard and stiff..")+"")

			saynn("[say=pc]Maybe? C'mon, you can do better than that.[/say]")

			saynn("Her voice is trembling.")

			saynn("[say=artica]I.. I love being.. a f-fucktoy..[/say]")

			saynn("Wow, brave words.")

			saynn("[say=pc]What else? Tell me.[/say]")

			saynn("[say=artica]I'm.. I.. a cocksleeve.. a plaything.. I-I w-wanna be u-used.. f-forced..[/say]")

			saynn("Her shy voice.. coupled with the dirty things that she is saying.. arouses even you.")

			saynn("[say=pc]Good girl.[/say]")

		elif (theTopic == "paws"):
			saynn("[say=pc]You have a thing for paws..[/say]")

			saynn("Artica lowers her gaze, her legs shuffling slowly..")

			saynn("[say=artica]I.. um.. d-don't what you are t-talking a-about..[/say]")

			saynn("[say=pc]Oh yeah? Saying that you don't like them would be a lie and you know it~.[/say]")

			saynn("[say=artica]I.. I.. am a pawslut..[/say]")

			saynn("Wow, so bold.")

			saynn("[say=artica]I like the way t-they feel.. the s-softness.. the warmth.. I like the way they smell..[/say]")

			saynn("She swallows audibly.")

			saynn("[say=artica]I l-ll..love.. sucking on toes.. a-and.. licking paw pads.. a.and aa..ah..and.. having my cock stroked with hind paws..[/say]")

			if (isNaked):
				saynn("She swallows again.. and again.. but her mouth is still watering itself.."+str(" Her caged cock twitching in its tight little prison.." if isCaged else " Her cock getting out of the sheath and becoming erect fast..")+"")

			else:
				saynn("She swallows again.. and again.. but her mouth is still watering itself.."+str(" Something in her shorts is twitching.." if isCaged else " Her shorts bulging fast, there is wet spot on the cloth already..")+"")

			saynn("[say=artica]I-I'm a h-huge.. slut.. for paws.. b-being stepped on.. s-sucking.. licking.. ah.. p-please.. hh-hh..[/say]")

			saynn("You smile while Artica is panting softly..")

			saynn("[say=artica]Ah.. hh-h.. ah.. t-that's about it..[/say]")

			saynn("She said more than enough.")

		elif (theTopic == "preg"):
			saynn("[say=pc]You're glowing, Artica. Pregnancy looks good on you.[/say]")

			saynn("Her gaze directed down, towards her round belly.")

			saynn("[say=artica]T-thank you.. I'm so.. f-fertile.. R-ready to carry litter after l-litter..[/say]")

			saynn("You smile while she gently embraces herself.")

			saynn("[say=artica]I'm.. a l-little breeding bitch.. m-made to b-breed and c-carry pups.. and k-kittens.. a-and.. a-.. ah.. hah..[/say]")

			saynn("[say=pc]Little litter carrier.[/say]")

			saynn("Her eyes.. so lusty..")

			saynn("[say=artica]I-I want to carry all"+str(" your" if GM.pc.hasReachablePenis() else "")+" pups.. t-to be filled with"+str(" your" if GM.pc.hasReachablePenis() else "")+" seed.. again and again..[/say]")

			saynn("Her shy tongue is saying some very naughty things..")

			saynn("[say=artica]I'm such a.. a c-cum dumpster.. a c-cock sleeve.. breeding sow.. m-meat hole.. s-seed receptacle.. a slut pup..[/say]")

			saynn("Wow.. she can keep going and going.. and going..")

		elif (theTopic == "breed"):
			if (getCharacter("artica").isInHeat()):
				saynn("[say=pc]You're glowing today, Artica. Feeling that heat again?[/say]")

			else:
				saynn("[say=pc]You like being bred, don't you~?[/say]")

			saynn("Her tail is swishing behind her as you say that.")

			saynn("[say=artica]I.. y-yes.. I c-can't s-stop thinking a-about i-it..[/say]")

			saynn("[say=pc]About what?[/say]")

			saynn("She bites her lip.")

			saynn("[say=artica]A-about.. b-being b-bred.. About f-feeling"+str(" your" if GM.pc.hasReachablePenis() else "")+" cock inside me.. filling me up with seed..[/say]")

			saynn("The scent her fur gives off.. is so arousing right now.")

			saynn("[say=pc]You like that, don't you? Being filled up, feeling that warm cum flooding your pussy.[/say]")

			saynn("She nods eagerly.")

			saynn("[say=artica]I.. I.. I d-don't know.. I.. I t-think I love it.. I l-love b-being f-fucked by big cocks, f-feeling them stretch m-me wide.. r-ravanging m-my h-holes.. i-inflating my b-belly with that.. t-thick v-virile seed.. ahh-h..[/say]")

			if (isNaked):
				saynn("She is shivering, her "+str("caged up cock is pulsing wildly inside.. her pussy is so needy she is making the floor wet." if isCaged else "canine cock leaves its sheath and is pulsing wildly.. her pussy is so needy that she is making the floor wet.")+"")

			else:
				saynn("She is shivering, her "+str("caged up cock is pulsing wildly inside her shorts.. her pussy is so needy it's making a big wet spot on the cloth." if isCaged else "canine cock is pulsing wildly inside her shorts.. her pussy is so needy it's making a big wet spot on the cloth.")+"")

			saynn("[say=artica]I..I'm a.. a dirty c-cumslut.. A-.. ah.. b-breeding whore who craves c-cock.. w-who begs to b-be filled with cum.. I.I.. l-love b-being used.. fucked.. i-impregnated.. any way y-you want..[/say]")

			saynn("You smile while watching the poor needy fluff squirm.")

			saynn("[say=pc]Good girl.[/say]")

		saynn("Making her horny is so easy now, Artica's libido seems to be off the charts..")

		addButton("Continue", "See what happens next", "")
	if(state == "do_grope"):
		playAnimation(StageScene.Grope, "grope", {pc="artica", npc="pc", bodyState={hard=true}})
		var isPregnant = getCharacter("artica").isVisiblyPregnant()
		var acceptCaged = getFlag("ArticaModule.cagedAcceptStage", 0)
		if (isPregnant):
			saynn("Seeing Artica pregnant.. you just can't stop yourself from doing this first..")

			saynn("Without much warning, your hands"+str(" undo the buttons of her shirt and open it. They then" if !isNaked else "")+" land on her swollen tits and cup then, her dark cyan nips dribble milk even from just a small amount of pressure.")

			saynn("[say=artica]Ahh..[/say]")

			saynn("[say=pc]You have some juicy tits, Artica..[/say]")

			saynn("[say=artica]T-thanks.. t-they just.. you k-know.. from b-breeding.. Ahh-h~..[/say]")

			saynn("You squeeze her lactating tits firmly, causing many little squirts of breast milk! You really get her going, Artica is arching her back while lots of little rivers of milk start trailing down from her nips.")

			saynn("[say=pc]I know.[/say]")

			saynn("After that, your hands slide lower and land on her pregnant belly. Gently, you begin to rub it.")

			saynn("[say=pc]Enough to feed many pups.. Like the ones that you are carrying.[/say]")

			saynn("[say=artica]Nnhh-h.. ah.. y-yeah.. haha.. h-ah.. I'm s-such a.. puppy maker..[/say]")

		else:
			saynn("Without much warning, your hands"+str(" undo the buttons of her shirt and open it. They then" if !isNaked else "")+" land on Artica's {artica.breasts} and cup them, emphasizing their form."+str(" Some lonely drops of breast milk leak from her dark cyan nips as you do that.." if getCharacter("artica").canBeMilked() else "")+"")

			saynn("[say=artica]Eep..[/say]")

			saynn("She looks around, checking if anyone is looking while you're casually groping her tits.")

			saynn("[say=pc]Afraid that someone might see this? Or maybe.. you want to be seen?[/say]")

			saynn("One hand stays and teases her nips, playing with the fancy purple piercings that the girl has.. while another slides down along her belly.. tracing around the belly button.. before reaching around and suddenly pulling"+str(" her shorts down and yanking her tail high" if !isNaked else " on her tail")+", exposing Artica's fluffy ass to any random onlookers. Her tail tries to curl down.. but you keep it high and use your second hand to spread her ass, making sure Artica's tight asshole and"+str(" creamed dripping cunt" if getCharacter("artica").hasEffect(StatusEffect.HasCumInsideVagina) else "wet need cunt")+" are visible.")

			saynn("[say=artica]Ah!..[/say]")

			saynn("[say=pc]Don't like it? Why don't you bite me then?[/say]")

			saynn("[say=artica]Eep.. I-I know better t-than to bite..[/say]")

			if (isVerySlut):
				saynn("Random inmates walk past.. staring at Artica's holes. This makes her.. drip eagerly.. the fluff is squirming in your hands while you grope her ass.")

				saynn("[say=pc]Good slut.[/say]")

			else:
				saynn("Random inmates walk past.. staring at Artica's holes. This makes her lower her gaze and.. and just take their teasing looks.")

				saynn("[say=pc]Good girl.[/say]")

		if (!isCaged):
			if (isLusty):
				saynn("The fluff is blushing.. while her cock is peeking out more and more from its sheath. It's gotten quite hard from you teasing her so much..")

			else:
				saynn("The fluff is blushing.. while her hard cock is throbbing more and more. It feels like any touch can set it off now..")

		else:
			if (isLusty):
				saynn("The fluff is blushing.. while her cock is throbbing inside the chastity cage.. It feels like any touch can set it off, her cyan shaft putting an immense amount of pressure on the metal.")

			else:
				saynn("The fluff is blushing.. while her cock is trying more and more to get out of its sheath.. failing as the metal keeps forced inside with only the drippy tip peeking.")

			if (acceptCaged <= 1):
				saynn("[say=artica]T-the c-cage.. hh-hurts a bit.. m-maybe you s-should..[/say]")

				saynn("[say=pc]Are you telling me what to do?[/say]")

				saynn("[say=artica]N-nno.. of course n-not.. nhh.. gods..[/say]")

				saynn("You let go of her ass and cup her fluffy balls instead, gently squeezing.")

				saynn("[say=pc]This stays on until I say otherwise.[/say]")

				saynn("Maybe you should bring the fluff into your cell sometime and train her to be less reliant on her dick for pleasure..")

			elif (acceptCaged <= 2):
				saynn("[say=artica]T-the c-cage.. S-sits so tight..[/say]")

				saynn("[say=pc]Are you complaining? Think I should unlock you?[/say]")

				saynn("[say=artica]Nn-no.. Its f-for you to d-decide..[/say]")

				saynn("You let go of her ass and cup her fluffy balls instead, gently squeezing.")

				saynn("[say=pc]Good.[/say]")

				saynn("She looks like she needs slightly more training to rely less on her dick.")

			else:
				saynn("[say=artica]M-my useless-s.. c-cock.. ah..[/say]")

				saynn("[say=pc]It is, indeed.[/say]")

				saynn("[say=artica]I'm.. a f-fucktoy.. nh-h..[/say]")

		saynn("You've gotten the fluff pent up in seconds.. good..")

		addButton("Continue", "See what happens next", "")
func getDebugActions():
	return [
	{
	"id": "setCorruption",
	"name": "Set Corruption",
	"args": [
	{
	"id": "corruption",
	"name": "How much (0-100)",
	"type": "number",
	"value": 100,
	},
	],
	},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "setCorruption"):
		setFlag("ArticaModule.corruption", clamp(_args["corruption"]/100.0, 0.0, 1.0))
		corruption = getModule("ArticaModule").getCorruption()

func addEventReplayButtons():
	var replayScenes = getModule("ArticaModule").getReplayMenuScenes()
	for eventID in replayScenes:
		addButton(replayScenes[eventID]["name"], "Pick this event", "do_pick_replay_event", [eventID])

func addEventReplaySceneButtons():
	var replayScenes = getModule("ArticaModule").getReplayMenuScenes()
	for sceneInfo in replayScenes[pickedReplayEvent]["scenes"]:
		if(sceneInfo["canstart"]):
			addButton(sceneInfo["name"], sceneInfo["desc"], "do_start_replay_scene", [sceneInfo["scene"]])
		else:
			addDisabledButton(sceneInfo["name"], sceneInfo["desc"])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_showers"):
		endScene()
		runScene("articaShowerScene")
		return

	if(_action == "do_give_flower"):
		setFlag("ArticaModule.TentaclesArticaHasFlower", true)
		runScene("articaEventTentacles1dot5Scene")
		return

	if(_action == "toggle_portal_panties"):
		setFlag("ArticaModule.wearsPortalPanties", !getFlag("ArticaModule.wearsPortalPanties", false))
		getCharacter("artica").getInventory().clearSlot(InventorySlot.UnderwearBottom)
		getCharacter("artica").resetEquipment(true, true, true)

	if(_action == "do_pick_replay_event"):
		if(_args.size() > 0):
			pickedReplayEvent = _args[0]

	if(_action == "do_start_replay_scene"):
		runScene(_args[0])
		endScene()
		return

	if(_action == "start_corruption_event"):
		var nextSceneInfo = getModule("ArticaModule").getNextWaitSceneInfo()
		
		var nextSceneID = nextSceneInfo[0]
		var flagToIncrease = nextSceneInfo[1]
		
		increaseFlag("ArticaModule."+flagToIncrease)
		
		addExperienceToPlayer(50)
		
		endScene()
		runScene(nextSceneID)
		return

	if(_action == "sex_breed"):
		endScene()
		runScene("articaSexBreedScene")
		return

	if(_action == "sex_ride"):
		endScene()
		runScene("articaSexRideScene")
		return

	if(_action == "sex_pawjob"):
		endScene()
		runScene("articaSexPawjobScene")
		return

	if(_action == "sex_ropes"):
		endScene()
		runScene("articaSexRopesScene")
		return

	if(_action == "sex_mutualpawjob"):
		endScene()
		runScene("articaSexMutualPawjobScene")
		return

	if(_action == "sex_hypnovisorfun"):
		endScene()
		runScene("articaSexHypnovisorScene")
		return

	if(_action == "do_invite_rahi"):
		endScene()
		runScene("articaPlusRahiScene")
		return

	if(_action == "do_tease_canteen"):
		runScene("articaCanteenTeaseScene")
		endScene()
		return

	if(_action == "do_tease_cell"):
		runScene("articaCellTeaseScene")
		endScene()
		return

	if(_action == "do_grope"):
		processTime(2*60)
		getModule("ArticaModule").makeLusty()

	if(_action == "do_dirtylanguage"):
		processTime(2*60)
		getModule("ArticaModule").makeLusty()

	setState(_action)

func saveData():
	var data = .saveData()

	data["corruption"] = corruption
	data["isNaked"] = isNaked
	data["isCaged"] = isCaged
	data["isSlut"] = isSlut
	data["isVerySlut"] = isVerySlut
	data["isLusty"] = isLusty
	data["nakedAndShy"] = nakedAndShy
	data["pickedReplayEvent"] = pickedReplayEvent

	return data

func loadData(data):
	.loadData(data)

	corruption = SAVE.loadVar(data, "corruption", 0.0)
	isNaked = SAVE.loadVar(data, "isNaked", false)
	isCaged = SAVE.loadVar(data, "isCaged", false)
	isSlut = SAVE.loadVar(data, "isSlut", false)
	isVerySlut = SAVE.loadVar(data, "isVerySlut", false)
	isLusty = SAVE.loadVar(data, "isLusty", false)
	nakedAndShy = SAVE.loadVar(data, "nakedAndShy", false)
	pickedReplayEvent = SAVE.loadVar(data, "pickedReplayEvent", "")
