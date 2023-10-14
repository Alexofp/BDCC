extends SceneBase

var anger = 0.0
var corruption = 0.0
var lust = 0.0
var hasUnderwear = false

func _init():
	sceneID = "jackiCh2s2GymScene"

func _reactInit():
	getCharacter("jacki").updateBodyparts()

func _run():
	if(state == ""):
		anger = getFlag("JackiModule.jackiAnger", 0.0)
		corruption = getFlag("JackiModule.jackiCorruption", 0.0)
		lust = getFlag("JackiModule.jackiLust", 0.0)
		hasUnderwear = getModule("JackiModule").shouldUnderwear()
		addCharacter("jacki")
		saynn("Jacki's anger: "+str(anger)+"")

		saynn("Jacki's corruption: "+str(corruption)+"")

		saynn("Jacki's lust: "+str(lust)+"")

		playAnimation(StageScene.Solo, "kneel", {pc="jacki", bodyState={underwear=hasUnderwear}})
		if (anger >= 0.1):
			saynn("Jacki is"+str(" extremely" if anger > 0.5 else "")+" angry at you so it's best for you not to come too close to her. Not until you decide to act.")

			saynn("You take a spot in some shadow and just watch her exercise.")

		elif (anger >= -0.1):
			saynn("Jacki is not angry at you. But you're also weren't exactly kind to her. So it's best to stay some distance away. Until you decide to do something.")

			saynn("You take a spot near some tall bush and just watch her exercise.")

		else:
			saynn("You walk up to Jacki. She smiles"+str(" very kindly" if anger < -0.5 else "")+" when she sees you.")

			saynn("[say=jacki]Hey there. Wruff.[/say]")

			saynn("She seems to be doing some exercises.")

		if (corruption >= 1.0):
			saynn("The way she acts is extremely slutty. Bending over often and showing off her ass to anyone who wishes to even glance at it.")

		elif (corruption > 0.7):
			saynn("The way she acts is quite slutty. Each time she bends over, she catches a few hungry glances from other inmates.")

		elif (corruption > 0.4):
			saynn("You notice Jacki acting a bit more.. provocative. Often attracting some extra glances from inmates around.")

		elif (corruption > 0.2):
			saynn("Jacki is a little more brave with what kinds of poses she chooses.")

		if (lust >= 1.0):
			saynn("There is always a visible damp spot on Jacki's shorts where her stitched up pussy is. She is dripping like a slut. You can't walk past without sensing her lusty scent.")

		elif (lust > 0.7):
			saynn("When Jacki bends, her pussy leaves a wet spot on her shorts that fades away after some time. And the smell of juices is quite arousing.")

		elif (lust > 0.4):
			saynn("You get a slight lusty scent from Jacki. Occasionally you notice the outline of her pussy")

		elif (lust > 0.2):
			saynn("You get a slight lusty scent from Jacki.")

		if (anger >= -0.1):
			addButton("Perv", "Watch her do yoga from a far", "do_perv")
			addButton("Gift", "Offer a gift that Jacki might forgive you for. In case you want that", "pick_gift")
			addButton("Follow", "See where Jacki usually jogs", "do_pullaway")
			addButton("Chain up", "Chain Jacki up like she is a punching bag", "do_chainup")
			addButton("Public fuck", "Fuck Jacki right here in the public", "do_publicfuck")
		else:
			addButton("Watch", "Watch her do yoga", "kind_watch")
			addButton("Yoga", "Do yoga with Jacki", "kind_yoga")
			addButton("Jogging", "Offer Jacki to jog together", "kind_jog")
		addDisabledButton("Enslave", "Jacki's corruption and lust must be at 100%")
		addButton("Leave", "Never mind", "endthescene")
	if(state == "do_perv"):
		saynn("You sneakily sit on one of the benches near the yoga mats which puts you in a prime position to watch Jacki do yoga.")

		if (corruption < 0.2):
			playAnimation(StageScene.Yoga, "camel", {pc="jacki", bodyState={underwear=hasUnderwear}})
			saynn("She chooses a pretty tame camel pose that focuses mostly on bending the back.")

			saynn("And so Jacki gets on her knees, pulls her chest high and extends her paws backwards as she arches her back, creating quite an enticing curve. Her fit butt is raised enticingly, drawing your attention like a magnet. She closes her eyes.")

			saynn("As she holds the pose, a little suspicion spawns in her mind. It's like she feels someone watching her. But at the same time, she has to actively maintain this graceful pose or she will fall.")

			saynn("Her breathing gets deeper. At this point you are watching her closely. Maybe you can do more?")

		elif (corruption < 0.5):
			playAnimation(StageScene.Yoga, "dog", {pc="jacki", bodyState={underwear=hasUnderwear}})
			saynn("It's obvious that something about Jacki is changing because she chose a slightly more lewd yoga pose today. A downward-facing dog.")

			saynn("The elegance in her movements is still there but you can just.. feel the difference. Jacki slowly and carefully stretches her body into the posture. Her tail, long and fluffy, sways gently behind her as she raises her hips high.")

			saynn("This pose makes you wish that the wolfie was wearing something more tight. Like spandex. But still, you are able to see the roundness of her fit ass quite clearly. That butt was sculpted by years of exercises.")

			saynn("Jacki is probably still feeling someone watching her. But it's like she doesn't care. She proudly raises her tail as she holds the pose, her bare feet and paws pressed firmly into the mat, her back arches in perfect alignment. Is that a moan you hear coming from her?")

		else:
			playAnimation(StageScene.Yoga, "catcow", {pc="jacki", bodyState={underwear=hasUnderwear}})
			saynn("Jacki gracefully gets on all fours, preparing to do a cat-cow yoga pose. Her fit slim curves are on full display. "+str("It seems she even found a uniform that is a few sizes smaller than she is supposed to wear, allowing the cloth to tightly wrap around her nice butt and small tits." if !hasUnderwear else "It seems the sporty underwear that you gave her are helping with that.")+"")

			saynn("The wolfie arches her back as low as she can, her modest chest pressing forward, her gaze directed high up. Just like her tail. Jacki is shivering and moaning softly, her ass wiggling a bit.. so inviting.")

			saynn("With a sinful sway of her hips, Jacki transitions to the second pose. Her back gently curves, her ass loses some of its perceived volume.. But it's still a great butt.")

			saynn("Yet again, Jacki is panting and moaning softly as she tries to hold the pose. Eventually her neediness wins over, causing her to wiggle again, her tail wagging seductively.")

			saynn("[say=jacki]Ngh..[/say]")

		addButton("Leave", "That was enough watching", "endthescene")
		addButton("Spank", "Give that ass a sudden spank", "perv_spank")
	if(state == "perv_spank"):
		saynn("That ass is too enticing. You decide to walk up to her and deliver a firm smack that resonates through the whole gym area.")

		if (corruption < 0.5):
			saynn("Jacki gasps in surprise and breaks out of her pose. She then whips her head around until she sees you. Her eyes are flashing with pain and frustration.")

			saynn("[say=jacki]What do you think you're doing?[/say]")

			saynn("Her voice is trembling with a mixture of anger and.. something else. You offer her a devilish grin.")

			saynn("[say=pc]Couldn't resist.[/say]")

			saynn("[say=jacki]Huff.[/say]")

			addButton("Leave", "Enough spanking", "endthescene")
		else:
			saynn("Jacki moans suddenly. Which is not entirely surprising for you. But it is for her. She looks at you while trying to hide her blush.")

			saynn("[say=jacki]Hey.. What do you think you are doing..[/say]")

			saynn("Her voice is trembling with anger.. but also nervousness. You offer her a devilish grin.")

			saynn("[say=pc]That ass was just too good to pass up.[/say]")

			saynn("[say=jacki]Well suck it if you like it so much..[/say]")

			saynn("Is that.. an invitation?")

			addButton("Nah", "Enough spanking", "endthescene")
			addButton("Suck her ass", "Might as well", "perv_suckass")
	if(state == "perv_suckass"):
		playAnimation(StageScene.SexRimming, "fast", {npc="pc", pc="jacki", bodyState={exposedCrotch=true}})
		saynn("And so you suddenly pull Jacki's shorts and force your face between her fluffy buns, spreading them wide, allowing you to whip your tongue out and start licking her tailhole.")

		saynn("That was.. unexpected.. to say the least. Jacki gasps as she feels your tongue caressing her sensitive ring.")

		saynn("[say=jacki]H-hey..[/say]")

		saynn("She tries to pry you off her sweaty rear so you wrap your arms around her legs and just keep lapping away at her ass, ignoring all the eyes of others that are glued to you. They're just jealous of the treat that you have found.")

		saynn("[say=jacki]Stop licking.. that's my dirty asshole.. fuck..[/say]")

		saynn("You listen to her.. and switch from licking to sucking, pressing your mouth against her wet star and letting your lips brush against her skin in a very teasing manner. Little smooches that you deliver causes the wolfie to suddenly start squirming.")

		saynn("[say=jacki]Oh fuck..[/say]")

		saynn("It's hard to see.. but her stitched up cunt is getting wet from this. So you must be on the right track. Her paw lands on your head and keeps trying to pull you away.. but you're stronger.")

		saynn("The slut is blushing, little moans escape from her when you decide to use your tongue again, thrusting it inside and exploring there, lapping away at the inner walls of her asshole.")

		saynn("[say=jacki]Fucking asswhore.. ah..[/say]")

		saynn("At this point you're not sure who she is referring to.")

		saynn("After a few minutes of ass sucking, you decide to pull your tongue out and give that ass a final smack.")

		saynn("[say=jacki]Ah..[/say]")

		saynn("[say=pc]Slut.[/say]")

		addButton("Kiss her", "Make it even more humiliating for her", "perv_suckass_kiss")
		addButton("Enough", "That was enough lewding for one time", "endthescene")
	if(state == "perv_suckass_kiss"):
		playAnimation(StageScene.Hug, "kiss", {npc="jacki", npcBodyState={underwear=hasUnderwear}})
		saynn("You get up and suddenly initiate a kiss, forcibly pulling the wolfie close and letting your lips collide.")

		saynn("[say=jacki]H-hey!.. Mmh!..[/say]")

		saynn("You slip your tongue into her mouth and let her get a taste of her own ass. And that only makes the wolf blush even harder.")

		saynn("In the end, she manages to push you back.")

		if (anger > 0.4):
			saynn("[say=jacki]Fucking.. creep..[/say]")

		else:
			saynn("[say=jacki]Fucking.. ngh..[/say]")

		saynn("You giggle and leave her alone for now.")

		addButton("Enough", "That was enough lewding for one time", "endthescene")
	if(state == "pick_gift"):
		saynn("What do you wanna gift Jacki? She might react differently depending on her corruption and lust.")

		addButton("Never mind", "You don't wanna gift anything", "")
		addButtonWithChecks("Apple", "Gift Jacki an apple", "gift_apple", [], [[ButtonChecks.HasItemID, "appleitem"]])
		addButtonWithChecks("Energy drink", "Gift Jacki an energy drink", "gift_energydrink", [], [[ButtonChecks.HasItemID, "EnergyDrink"]])
		addButtonWithChecks("5 credits", "Gift Jacki 5 credits", "gift_5credits", [], [[ButtonChecks.HasCredits, 5]])
		addButtonWithChecks("Heat pill", "Gift Jacki a little pill", "gift_heatpill", [], [[ButtonChecks.HasItemID, "HeatPill"]])
		if (!getFlag("JackiModule.jackiReceivedHorsecockDildo")):
			addButtonWithChecks("Horsecock dildo", "Gift Jacki a whole ass dildo", "gift_horsecockdildo", [], [[ButtonChecks.HasItemID, "HorsecockDildo"]])
		if (!getModule("JackiModule").shouldWearSportsBra()):
			addButtonWithChecks("Sporty Top", "Gift Jacki a sporty top for her to wear during exercises", "gift_sportybra", [], [[ButtonChecks.HasItemID, "sportyTop"]])
		if (!getModule("JackiModule").shouldWearSportsShorts()):
			addButtonWithChecks("Sporty Briefs", "Gift Jacki some sporty shorts for her to wear during exercises", "gift_sportyshorts", [], [[ButtonChecks.HasItemID, "sportyBriefs"]])
	if(state == "gift_sportybra"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		saynn("Since the wolfie likes to do exercises so much, you thought that you might as well give her some better clothing for that. Jacki gets a little surprised when you offer her a sporty top made out of some stretchy material.")

		if (anger > 0):
			saynn("[say=jacki]Huh? Is this a part of some kind of plan?[/say]")

			saynn("You shake your head and just give her the top. No strings attached.")

			saynn("[say=jacki]Well.. Thanks I guess.[/say]")

			saynn("Looks like she likes it. Maybe that will make her less mad towards you.")

		else:
			saynn("[say=jacki]Oh? Oh wow. Uh.. Do I have to pay?[/say]")

			saynn("You shake your head and just give her the top. No strings attached.")

			saynn("[say=jacki]Thank you! You're very kind.[/say]")

			saynn("Looks like she likes it.")

		if (!getModule("JackiModule").shouldWearSportsShorts()):
			saynn("Jacki would still need the sporty briefs as well if you wanna see her wear this.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "gift_sportyshorts"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		saynn("Since the wolfie likes to do exercises so much, you thought that you might as well give her some better clothing for that. Jacki gets a little surprised when you offer her some sporty briefs made out of some stretchy material.")

		if (anger > 0):
			saynn("[say=jacki]Huh? What? You think this will excuse you after everything you did?[/say]")

			saynn("You shake your head and just give her the briefs. No strings attached.")

			saynn("[say=jacki]Well.. Okay.. I guess.[/say]")

			saynn("Looks like she likes it. Maybe that will make her less mad towards you.")

		else:
			saynn("[say=jacki]Oh? Is that for me?[/say]")

			saynn("You shake your head and just give her the top. No strings attached.")

			saynn("[say=jacki]Thanks! I needed something like these.[/say]")

			saynn("Looks like she likes it.")

		if (!getModule("JackiModule").shouldWearSportsBra()):
			saynn("Jacki would still need the sporty top as well if you wanna see her wear this.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "appleitem"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		saynn("You offer Jacki an apple as a gesture of good will.")

		if (anger > 0.0):
			saynn("[say=jacki]What is this?[/say]")

			saynn("[say=pc]Just thought you might be hungry for some vitamins.[/say]")

			saynn("She grabs it and takes a closer look.")

			saynn("[say=jacki]Is it poisoned or something?[/say]")

			saynn("You raise a brow. But then shake your head.")

			saynn("[say=jacki]I don't even know what to expect from you.[/say]")

			saynn("She rubs the apple against the cloth and then takes a careful bite. And then another. And another. The fruit seems alright.")

			saynn("[say=jacki]Well.. Thanks?[/say]")

			saynn("You nod.")

		else:
			saynn("[say=jacki]Is that for me?[/say]")

			saynn("[say=pc]Yeah. Vitamins for a sporty wolfie.[/say]")

			saynn("You hand her the apple and watch her rub it against the cloth before taking a bite with her sharp claws. And then another. Some juices flowing down her maw.")

			saynn("[say=jacki]Thankies![/say]")

			saynn("You nod.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "gift_energydrink"):
		saynn("You offer Jacki an unopened energy drink of some generic brand that everyone here drinks.")

		if (anger > 0.0):
			saynn("She is looking extremely skeptical.")

			saynn("[say=jacki]Is that like a bribe? Or is there piss in there or something?[/say]")

			saynn("You shake your head and show her that the can wasn't tampered with. She carefully takes it and pops it open before sniffing the contents.")

			saynn("[say=jacki]Doesn't smell like piss..[/say]")

			saynn("She takes a refreshing gulp and sighs.")

			saynn("[say=jacki]Thanks.[/say]")

			saynn("Even though she doesn't like you, she can still appreciate a kind gesture it seems.")

		else:
			saynn("She smiles when she sees you.")

			saynn("[say=jacki]Oh, thank you! Do I have to..[/say]")

			saynn("[say=pc]Free.[/say]")

			saynn("She nods and grabs the can before opening it and taking a sip.")

			saynn("[say=jacki]Thank you. I needed that.[/say]")

			saynn("What a kind wolfie.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_perv"):
		getModule("JackiModule").addCorruption(3)
		processTime(6*60)

	if(_action == "perv_spank"):
		processTime(5*60)
		getModule("JackiModule").addAnger(20)
		getModule("JackiModule").addCorruption(5)

	if(_action == "perv_suckass"):
		processTime(15*60)
		getModule("JackiModule").addCorruption(5)

	if(_action == "perv_suckass_kiss"):
		processTime(5*60)
		getModule("JackiModule").addCorruption(3)
		getModule("JackiModule").addAnger(10)

	if(_action == "gift_apple"):
		GM.pc.getInventory().removeXOfOrDestroy("appleitem", 1)
		getModule("JackiModule").addAnger(-15)

	if(_action == "gift_energydrink"):
		GM.pc.getInventory().removeXOfOrDestroy("EnergyDrink", 1)
		getModule("JackiModule").addAnger(-10)

	if(_action == "gift_horsecockdildo"):
		if(corruption > 0.5 || lust > 0.5):
			setFlag("JackiModule.jackiReceivedHorsecockDildo", true)
			GM.pc.getInventory().removeXOfOrDestroy("HorsecockDildo", 1)
			getModule("JackiModule").addCorruption(30)
		else:
			getModule("JackiModule").addAnger(10)

	if(_action == "gift_sportybra"):
		GM.pc.getInventory().removeXOfOrDestroy("sportyTop", 1)
		setFlag("JackiModule.jackiReceivedBra", true)
		getCharacter("jacki").updateBodyparts()
		getModule("JackiModule").addAnger(-20)

	if(_action == "gift_sportyshorts"):
		GM.pc.getInventory().removeXOfOrDestroy("sportyBriefs", 1)
		setFlag("JackiModule.jackiReceivedShorts", true)
		getCharacter("jacki").updateBodyparts()
		getModule("JackiModule").addAnger(-20)

	setState(_action)

func saveData():
	var data = .saveData()

	data["anger"] = anger
	data["corruption"] = corruption
	data["lust"] = lust
	data["hasUnderwear"] = hasUnderwear

	return data

func loadData(data):
	.loadData(data)

	anger = SAVE.loadVar(data, "anger", 0.0)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	lust = SAVE.loadVar(data, "lust", 0.0)
	hasUnderwear = SAVE.loadVar(data, "hasUnderwear", false)
