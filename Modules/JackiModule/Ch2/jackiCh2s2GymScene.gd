extends SceneBase

var anger = 0.0
var corruption = 0.0
var lust = 0.0
var hasUnderwear = false
var buttScore = 0
var soundScore = 0
var usedItemName = ""
var plasticBottleFluidID = ""
var waterLevel = 0

func _init():
	sceneID = "jackiCh2s2GymScene"

func _reactInit():
	getCharacter("jacki").resetEquipment()

func _run():
	if(state == ""):
		anger = getFlag("JackiModule.jackiAnger", 0.0)
		corruption = getFlag("JackiModule.jackiCorruption", 0.0)
		lust = getFlag("JackiModule.jackiLust", 0.0)
		hasUnderwear = getModule("JackiModule").shouldUnderwear()
		buttScore = getModule("JackiModule").getSkillScore("jackiSkillButtslut")
		soundScore = getModule("JackiModule").getSkillScore("jackiSkillSounding")
		addCharacter("jacki")
		if (anger < 0.0):
			saynn("Jacki's kindness: "+str(Util.roundF(-anger*100.0, 1))+"% ("+str(getModule("JackiModule").getAngerText())+")")

		else:
			saynn("Jacki's anger: "+str(Util.roundF(anger*100.0, 1))+"% ("+str(getModule("JackiModule").getAngerText())+")")

		saynn("Jacki's corruption: "+str(Util.roundF(corruption*100.0, 1))+"% ("+str(getModule("JackiModule").getCorruptionText())+")"+("\nJacki is broken, her anger will now go down from mean actions." if (corruption >= 1.0 && anger >= 0.0) else ""))

		saynn("Jacki's lust: "+str(Util.roundF(lust*100.0, 1))+"% ("+str(getModule("JackiModule").getLustText())+")"+("\nJacki is so lusty that any lewd action will now corrupt her." if (lust >= 1.0 && corruption < 1.0) else ""))

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

		var isEnslaved = getFlag("JackiModule.Jacki_ch2GotEnslaved", false)
		if (isEnslaved):
			var slaveText = getFlag("JackiModule.Jacki_ch2SlaveText", "")
			if (slaveText != ""):
				saynn("Jacki belongs to you. And she knows it. That tattoo on her ass that says '"+str(slaveText )+"' is a constant reminder.")

			else:
				saynn("Jacki belongs to you. And she knows it.")

		if (anger >= -0.1 || isEnslaved || lust >= 1.0):
			addButton("Perv", "Watch her do yoga from a far", "do_perv")
			if (!isEnslaved && lust < 1.0):
				addButton("Gift", "Offer a gift that Jacki might forgive you for. In case you want that", "pick_gift")
			addButton("Follow", "See what Jacki usually does after yoga", "do_creepfollow")
		if (anger < -0.1 || isEnslaved):
			addButton("Watch", "Watch her do yoga", "kind_watch")
			addButton("Gift", "Gift Jacki something", "pick_gift")
			if (anger < -0.3):
				addButton("Jogging", "Offer Jacki to jog together", "kind_jog")
			else:
				addDisabledButton("Jogging", "Jacki doesn't trust you enough")
		if (!isEnslaved):
			if (anger <= -1.0 && corruption >= 1.0 && lust >= 1.0):
				addButton("Enslave", "Make that wolfie your bitch", "do_enslave_jacki")
			else:
				addDisabledButton("Enslave", "Jacki's kindness, corruption and lust must be at 100%")
		else:
			addButton("Memories", "Replay some of the scenes", "memories_menu")
		addButton("Leave", "Never mind", "endthescene")
	if(state == "memories_menu"):
		saynn("Pick which scene you wanna see again.")

		addButton("Back", "Never mind", "")
		addButton("Stocks scene", "The scene where you can fuck Jacki in stocks", "mem_stocks")
		addButton("Punching bag", "The scene where you have to save Jacki from Risha", "mem_punch")
		addButton("Urinal scene", "The scene where you have to save Jacki from the bullies", "mem_urinal")
	if(state == "do_perv"):
		saynn("You sneakily sit on one of the benches near the yoga mats which puts you in a prime position to watch Jacki do yoga.")

		if (corruption < 0.2):
			if (RNG.chance(50)):
				playAnimation(StageScene.Yoga, "camel", {pc="jacki", bodyState={underwear=hasUnderwear}})
				saynn("She chooses a pretty tame camel pose that focuses mostly on bending the back.")

				saynn("And so Jacki gets on her knees, pulls her chest high and extends her paws backwards as she arches her back, creating quite an enticing curve. Her fit butt is raised enticingly, drawing your attention like a magnet. She closes her eyes.")

				saynn("As she holds the pose, a little suspicion spawns in her mind. It's like she feels someone watching her. But at the same time, she has to actively maintain this graceful pose or she will fall.")

				saynn("Her breathing gets deeper. At this point you are watching her closely. Maybe you can do more?")

			else:
				playAnimation(StageScene.Yoga, "warrior", {pc="jacki", bodyState={underwear=hasUnderwear}})
				saynn("She chooses a pretty tame pose, just to practice a bit. Her bare hind paws are firmly planted on the mat, one leg extended back, while the other is bent at a right angle, forming a strong 'warrior' pose. She raises her arms over her head and presses her paws together.")

				saynn("Her eyes are closed as seeks inner peace and balance.. breathing deeply..")

				saynn("As she holds this pose, a sense of calm envelops her.. But not for long.. as a feeling of someone watching her is getting brought up in her mind again and again. A feeling that doesn't wanna go away.")

				saynn("Her breathing deepens, and she does her best to maintain the warrior's poise with utmost concentration. Maybe you can do more?")

		elif (corruption < 0.5):
			if (RNG.chance(50)):
				playAnimation(StageScene.Yoga, "dog", {pc="jacki", bodyState={underwear=hasUnderwear}})
				saynn("It's obvious that something about Jacki is changing because she chose a slightly more lewd yoga pose today. A downward-facing dog.")

				saynn("The elegance in her movements is still there but you can just.. feel the difference. Jacki slowly and carefully stretches her body into the posture. Her tail, long and fluffy, sways gently behind her as she raises her hips high.")

				saynn("This pose makes you wish that the wolfie was wearing something more tight. Like spandex. But still, you are able to see the roundness of her fit ass quite clearly. That butt was sculpted by years of exercises.")

				saynn("Jacki is probably still feeling someone watching her. But it's like she doesn't care. She proudly raises her tail as she holds the pose, her bare feet and paws pressed firmly into the mat, her back arches in perfect alignment. Is that a moan you hear coming from her?")

			else:
				playAnimation(StageScene.Yoga, "cobra", {pc="jacki", bodyState={underwear=hasUnderwear}})
				saynn("It's obvious that something about Jacki is changing because she chose a slightly more lewd yoga pose today. A cobra pose.")

				saynn("The gracefulness in her movements is still present.. but there is also an undeniable sensuality to her motions. Jacki lies flat on the mat and begins to slowly and carefully extend her body into the right posture.")

				saynn("Her fluffy tail sways behind her as she raises her torso, arching her back while pressing her paws into the mat. This pose accentuates the natural curves of her body quite well.")

				saynn("This pose makes you wish that the wolfie was wearing something more tight. Like spandex. But still, you are able to see the roundness of her fit ass quite clearly. That butt was sculpted by years of exercises.")

				saynn("Jacki is probably still feeling someone watching her. But it's like she doesn't care. She proudly raises her tail as she holds the pose.")

		else:
			if (RNG.chance(50)):
				playAnimation(StageScene.Yoga, "catcow", {pc="jacki", bodyState={underwear=hasUnderwear}})
				saynn("Jacki gracefully gets on all fours, preparing to do a cat-cow yoga pose. Her fit slim curves are on full display. "+str("It seems she even found a uniform that is a few sizes smaller than she is supposed to wear, allowing the cloth to tightly wrap around her nice butt and small tits." if !hasUnderwear else "It seems the sporty underwear that you gave her are helping with that.")+"")

				saynn("The wolfie arches her back as low as she can, her modest chest pressing forward, her gaze directed high up. Just like her tail. Jacki is shivering and moaning softly, her ass wiggling a bit.. so inviting.")

				saynn("With a sinful sway of her hips, Jacki transitions to the second pose. Her back gently curves, her ass loses some of its perceived volume.. But it's still a great butt.")

				saynn("Yet again, Jacki is panting and moaning softly as she tries to hold the pose. Eventually her neediness wins over, causing her to wiggle again, her tail wagging seductively.")

				saynn("[say=jacki]Ngh..[/say]")

			else:
				playAnimation(StageScene.Yoga, "bridge", {pc="jacki", bodyState={underwear=hasUnderwear}})
				saynn("Jacki positions herself on the mod, preparing to do the 'bridge' pose. Her lithe fluffy body is on full display, her clothes emphasizing her slim curves and accentuating her figure.")

				saynn("She begins to arch her back as much as she can, her modest chest being pushed forward, her gaze directed upwards. The wolfie can't help but to moan softly, her alluring butt gently wiggling in a way that's impossible to ignore.")

				saynn("[say=jacki]Ngh..[/say]")

		addButton("Leave", "That was enough watching", "endthescene")
		addButton("Spank", "Give that ass a sudden spank", "perv_spank")
	if(state == "perv_spank"):
		saynn("That ass is too enticing. You decide to walk up to her and deliver a firm smack that resonates through the whole gym area.")

		if (corruption < 0.3):
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
			addButton("No u", "Make her suck your ass instead", "perv_makehersuckass")
	if(state == "perv_makehersuckass"):
		playAnimation(StageScene.SexRimming, "tease", {npc="jacki", pc="pc", bodyState={exposedCrotch=true}})
		saynn("It is a good proposal from her. But you have decided to alter it a bit.")

		saynn("[say=pc]No you.[/say]")

		saynn("Jacki only manages to say..")

		saynn("[say=jacki]Huh?[/say]")

		saynn("..before you get a hold of her ponytail and yank her down to her knees.")

		saynn("[say=jacki]Ow.. hey..[/say]")

		saynn("You silence her vocal protests by pulling her muzzle closer before shoving your {pc.thick} butt directly into her face! The wolfie is.. confused to say the least.. She doesn't even know how to react.")

		saynn("[say=pc]Suck.[/say]")

		saynn("[say=jacki]Umm..[/say]")

		saynn("You clearly need to teach her a little.")

		addButton("Force", "Apply some force", "perv_makehersuckass_force")
	if(state == "perv_makehersuckass_force"):
		playAnimation(StageScene.SexRimming, "fast", {npc="jacki", pc="pc", bodyState={exposedCrotch=true,hard=true}})
		saynn("You yank on her hair again, pushing her head into your {pc.masc} butt more, causing her muzzle to spread your buttcheeks and her snout to touch your {pc.analStretch} star. You can feel her warm breath on your sensitive bits.. and that makes you more eager to continue..")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your poor cock is getting hard in its little cage.. well, trying to..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your {pc.penis} is quickly getting hard, a drop of precum hanging from its tip.")

		elif (GM.pc.hasReachableVagina()):
			saynn("Even though you press her muzzle against your anus, your pussy slit becomes aroused too, your folds shining wet.")

		saynn("Jacki winces from pain, huffing and puffing more. She tries to pull away.. but she can't do that without losing some of her hair in the process.")

		saynn("[say=pc]Need another invitation?[/say]")

		saynn("You look behind you and see Jacki's red face. She finally decides to flick her tongue out and give your anus a few little licks. All the while all sorts of inmates around are doing their exercises, most of them not caring, but some eyes already have noticed you two.")

		saynn("[say=pc]You can do better. Suck on it, slut.[/say]")

		saynn("Jacki huffs again.. but then she presses her lips against your skin more and starts to gently suck, creating negative pressure with her mouth around your tailhole while also still prodding it with her canine tongue.")

		saynn("And that starts to feel.. quite good. You use your digits to scratch her head while she keeps rimming you, switching between sucking and licking. Your tailhole reacts to the teasing by clenching and twitching.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your locked away cock is dripping pre a lot.. Without being able to stimulate it, what Jacki does feels so much better..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your hard cock is twitching too.. from just how good this feels.")

		elif (GM.pc.hasReachableVagina()):
			saynn("Your dripping pussy folds twitch too.. from just how good this feels.")

		saynn("[say=pc]There we go. I knew you had it in you.[/say]")

		saynn("Jacki closes her eyes from embarrassment.. and just continues, giving your asshole little kisses before prodding it with her tongue more.. until the tip slips inside. The wolfie starts to wiggle her tongue inside, exploring your inner walls.")

		if (GM.pc.isWearingChastityCage()):
			saynn("She quickly finds your swole prostate.. and begins focusing on it, kneading and rubbing it. And her doing that makes your legs shake, your poor cock putting an immense amount of pressure onto its cage.")

		elif (GM.pc.hasReachablePenis()):
			saynn("She quickly finds your swole prostate.. and begins focusing on it, kneading and rubbing it. And her doing that makes your legs shake, your cock is leaking more transparent stuff while throbbing..")

		elif (GM.pc.hasReachableVagina()):
			saynn("Her strong tongue manages to find and massage your g-spot through the inner wall, making your legs shake. Moans are escaping from you while your pussy is dripping more juices..")

		saynn("Quite a few eyes are directed towards you.. but Jacki doesn't care, she keeps lapping at your inner walls, bringing you so much pleasure that you already feel close..")

		saynn("[say=pc]Such a good slut..[/say]")

		addButton("Cum", "Feels too good", "perv_makehersuckass_cum")
	if(state == "perv_makehersuckass_cum"):
		playAnimation(StageScene.SexRimming, "sex", {npc="jacki", pc="pc", pcCum=true, bodyState={exposedCrotch=true,hard=true}})
		saynn("You don't even have to encourage her anymore, Jacki is treating your ass so well.. that you can't hold back anymore..")

		if (GM.pc.isWearingChastityCage()):
			saynn("You arch your back and let out a cute passionate moan as your locked throbbing cock starts shooting weak lines of {pc.cum} through the little hole of the metal cage. Your hand grips Jacki's hair harder, bringing her some discomfort.. while you feel amazing..")

		elif (GM.pc.hasReachablePenis()):
			saynn("You arch your back and grunt as your {pc.penis} starts to throb and shoot thick lines of {pc.cum}, one after another. Your hand grips Jacki's hair harder, bringing her some discomfort.. while you feel amazing..")

		elif (GM.pc.hasReachableVagina()):
			saynn("You arch your back and let out a cute passionate moan while your neglected pussy releases a fountain of juices. You squirt while moaning loudly, your hand grips Jacki's hair harder, bringing her some discomfort.. while you feel amazing..")

		else:
			saynn("You arch your back and moan loudly while a powerful orgasm is overwhelming your body. Your hand grips Jacki's hair harder, bringing her some discomfort.. while you feel amazing..")

		saynn("After that great time.. you finally let go of her hair.")

		saynn("[say=pc]Nhh.. What a good slut.[/say]")

		saynn("[say=jacki]Huff..[/say]")

		addButton("Continue", "See what happens next", "endthescene")
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
		addButtonWithChecks("Lube", "Gift Jacki a tube of lube", "gift_lube", [], [[ButtonChecks.HasItemID, "lube"]])
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
	if(state == "gift_apple"):
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
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
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
	if(state == "gift_lube"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		saynn("You decide to give Jacki a little tube of lube. An item that seems to be.. essential.. in this prison.")

		if (corruption > 0.8):
			saynn("Jacki looks at it and smiles.")

			saynn("[say=jacki]Yay. Is that for me?[/say]")

			saynn("You nod and hand her the item.")

			saynn("[say=jacki]With all the fucking my fuckholes are always so stretched. This is perfect against that. Thank you~. Wruff.[/say]")

			saynn("That's.. pretty direct. But you don't mind.")

		elif (anger > -0.1):
			saynn("Jacki looks at it.. and then at you.. her brow raised.")

			saynn("[say=jacki]Are you implying something?[/say]")

			saynn("You shake your head. After some deliberating, Jacki decides to take it.")

			saynn("[say=jacki]Okay.. well.. thanks?[/say]")

			saynn("You nod and just leave.")

		else:
			saynn("Jacki looks at it.")

			saynn("[say=jacki]Oh?[/say]")

			saynn("You explain that it helps against excessive stretching.. which obviously happens a lot when you exercise.")

			saynn("[say=jacki] Oh. Well thank you. You're so kind.[/say]")

		saynn("From now on her holes should be less loose by about 50%.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "gift_5credits"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		saynn("Everybody likes credits, right? You walk up to Jacki and offer her a chip that contains five of them.")

		if (corruption > 0.5):
			saynn("Jacki looks at it.. and frowns at first.")

			saynn("[say=jacki]What is this?[/say]")

			saynn("[say=pc]Credits.[/say]")

			saynn("[say=jacki]I'm not a slut.. But.. How much is there?[/say]")

			saynn("Oh. Huh. Did your little offer intrigued her?")

			saynn("[say=pc]Enough not to work for a few days in the mines.[/say]")

			saynn("She huffs and raises her chin high. But her eyes keep looking at the credits in your hand.")

			saynn("[say=jacki]Gimme.[/say]")

			addButton("Just give", "Give her the credits for no return", "gift_credits_free")
			addButtonWithChecks("Hand job", "Ask for a favor first", "gift_credits_handjob", [], [ButtonChecks.HasReachablePenis])
		elif (anger > -0.1):
			saynn("Jacki looks at it.. and then frowns."+str(" Even though you do notice a slight hesitation at first." if corruption > 0.2 else "")+"")

			saynn("[say=jacki]What is this?[/say]")

			saynn("[say=pc]Credits.[/say]")

			saynn("[say=jacki]Yeah, I'm not stupid. Is this some kind of bribe?[/say]")

			saynn("She snarls at you.")

			saynn("[say=jacki]Or are you treating me like a prostitute?[/say]")

			saynn("Well, looks like giving her credits was too obvious. Or maybe she is just not corrupted enough.")

			addButton("Continue", "See what happens next", "endthescene")
		else:
			saynn("Jacki looks at it.. and then frowns slightly."+str(" Even though you do notice a slight hesitation at first." if corruption > 0.2 else "")+"")

			saynn("[say=jacki]This kinda feels like you're trying to pay me for something.[/say]")

			saynn("You shrug while Jacki gets in a very defensive position, her arms crossed under her small chest.")

			saynn("[say=jacki]I'm not one of those purple inmates that walk around. You know? I'm not a prostitute.[/say]")

			saynn("Well, looks like Jacki is not into you being her sugar mommy/daddy.")

			addButton("Continue", "See what happens next", "endthescene")
	if(state == "gift_credits_free"):
		saynn("You give her the credits and the wolfie happily takes them. She presses the chip against the collar, transferring them to her inmate account.")

		if (corruption > 0.8):
			saynn("After that she even kisses you on the check real fast.")

		saynn("[say=jacki]But I'm not a slut, okay?[/say]")

		saynn("[say=pc]Sure~.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "gift_credits_handjob"):
		playAnimation(StageScene.SexHandjob, "tease", {pc="pc", npc="jacki", bodyState={naked=true, hard=true}})
		saynn("Jacki leans to take the chip but your hand suddenly raises it high out of her reach. The wolfie pouts.")

		saynn("[say=jacki]Give![/say]")

		saynn("[say=pc]Not so fast. I want something back.[/say]")

		saynn("[say=jacki]What?[/say]")

		saynn("Your gaze moves down to your crotch."+str(" A crotch that has a visible bump, outlining your boner." if !GM.pc.isFullyNaked() else "")+" Jacki follows your gaze.. and pouts more.")

		saynn("[say=jacki]..fine.[/say]")

		saynn("You and Jacki hide behind some tall green bushes where nobody can see you. A somewhat private spot.")

		saynn("Jacki slowly lowers herself down to her knees and awkwardly pulls your {pc.penis} out. She can't hide a slight blush from the sight.. and the situation that she has found herself in.")

		saynn("You wiggle the chip in front of her face.")

		saynn("[say=pc]Use your mouth maybe?[/say]")

		saynn("[say=jacki]No.[/say]")

		saynn("The slut still has some sense of dignity left, huh.")

		addButton("Continue", "See how Jacki treats you", "gift_credits_hj_do")
	if(state == "gift_credits_hj_do"):
		playAnimation(StageScene.SexHandjob, "sex", {pc="pc", npc="jacki", bodyState={naked=true, hard=true}})
		saynn("And so Jacki wraps her digits around the shaft of your member, getting a feel for it. She raises a brow when she senses how your heart is pumping blood through it. Your member is only getting more hard and twitchy from that grasp.")

		saynn("Jacki keeps watching it pulse as she starts stroking it with short repetitive motions. The wolfie is clearly not an expert at this.. but she is trying.")

		saynn("[say=pc]You can do better than that.[/say]")

		saynn("She frowns.. but then listens, stroking your cock a little faster, causing a drop of pre to hang off of its tip. Your smile makes her pout.")

		saynn("[say=jacki]What?..[/say]")

		saynn("[say=pc]Awfully obedient for not a slut.[/say]")

		saynn("It starts to feel good real quick. Looks like teasing the wolfie makes her more eager to prove you wrong, her paw working your dick real fast now.")

		saynn("[say=pc]NGh..[/say]")

		saynn("[say=jacki]I just want the credits. I'm not a slut.[/say]")

		saynn("[say=pc]Uh huh~. Will you agree to receive a nice facial?[/say]")

		saynn("[say=jacki]Of course not.. I still need to exercise![/say]")

		saynn("A little groan escapes your lips. Your legs are getting weaker as your cock starts twitching and throbbing more in her paw.")

		saynn("[say=pc]What if I double those creds~?[/say]")

		saynn("She instantly gets quiet. Looks like she is deliberating and just needs a little push. Just like you..")

		addButtonWithChecks("Double creds", "Give her twice as much credits and see what she will do", "gift_creds_hj_double", [], [[ButtonChecks.HasCredits, 10]])
		addButton("Just cum", "Five creds is enough", "gift_creds_hj_cum")
	if(state == "gift_creds_hj_cum"):
		playAnimation(StageScene.SexHandjob, "tease", {pc="pc", npc="jacki", pcCum=true, bodyState={naked=true, hard=true}})
		saynn("You decide not to sweeten the deal, the girl is receiving enough already. But you also decide not to warn her.")

		saynn("And so, suddenly, strings of thick {pc.cum} get pushed out of your {pc.penis} as your orgasm takes over. Jacki gasps as she fails to dodge the first few, causing her to receive some onto her muzzle and hair.")

		saynn("[say=jacki]H-hey!..[/say]")

		saynn("Hah. Obviously she pulls away after that, avoiding the rest of your load. But it felt good either way.")

		saynn("[say=jacki]You could have told me![/say]")

		saynn("You shrug and smile.")

		saynn("[say=pc]My bad~. Catch.[/say]")

		saynn("You give the wolfie exactly zero time to react before throwing the chip at her, causing it to bounce off her snout and land into your {pc.cum} on the floor.")

		saynn("[say=pc]Oops.[/say]")

		saynn("[say=jacki]Grr-r-r..[/say]")

		saynn("You watch her deliberate for a bit. But eventually she succumbs to the greed and picks up the chip, getting some of your seed onto her paws too.")

		saynn("[say=pc]Good slut.[/say]")

		saynn("[say=jacki]Huff! Now I have to go wash..[/say]")

		saynn("[say=pc]It's not that much, it's fine~.[/say]")

		saynn("[say=jacki]You think so? Fine..[/say]")

		saynn("Jacki gets up and walks away swiftly.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "gift_creds_hj_double"):
		playAnimation(StageScene.SexHandjob, "tease", {pc="pc", npc="jacki", pcCum=true, bodyState={naked=true, hard=true}})
		saynn("Everything has a price. You flash Jacki the second chip of the same value. And she seems to understand everything without you saying anything.")

		saynn("Why? Because she positions herself right in front of your cock and raises her chin high while closing her eyes. All the while her paw keeps stroking you more and more.. Until the orgasm takes over.")

		saynn("Strings of your thick {pc.cum} begin landing on Jacki's face.. and she welcomes them with a strong posture, allowing your load to leave a sticky mess on her muzzle. You grunt softly as you watch her receive it all like a champ.")

		saynn("[say=pc]Good little slut.[/say]")

		saynn("Some of it lands on her shoulders and clothing of course. And now she can't even open her eyes or mouth either.")

		saynn("[say=jacki]Huff..[/say]")

		saynn("You drop the two credit chips in front of her, causing her to start searching for them blindly.")

		saynn("[say=pc]Thank you. You can always just wipe it with your paws.[/say]")

		saynn("She huffs again. And just like that, you leave her be.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "gift_heatpill"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		saynn("A pill can fix a lot of problems. So you decide to give Jacki one that would make all her current problems seem silly.")

		if (corruption <= 0.5):
			saynn("[say=jacki]Huh?[/say]")

			saynn("She grabs the pill and looks at it.")

			saynn("[say=jacki]What is it for?[/say]")

			saynn("[say=pc]Can't tell. Just try it.[/say]")

			saynn("Jacki tilts her head slightly. And then gives you the unknown pill back.")

			saynn("[say=jacki]I'm not a test subject. Please don't use me to test your drugs.[/say]")

			saynn("That's fair. Seems like she won't eat it willingly in her current state. Oh well.")

			addButton("Continue", "See what happens next", "endthescene")
		else:
			saynn("[say=jacki]Umm..[/say]")

			saynn("She grabs the pill and looks at it.")

			saynn("[say=jacki]What is it for?[/say]")

			saynn("[say=pc]Can't tell. Just try it.[/say]")

			saynn("Jacki tilts her head slightly while looking at you.")

			saynn("[say=jacki]Ah, what the hell, why not.[/say]")

			saynn("And then throw the pill into her mouth.")

			saynn("Nothing is different at first. But as the drug starts circulating in her bloodflood, the wolfie suddenly starts to act a little differently. She feels a need to start rubbing her body against yours while a little soft moan escapes her lips.")

			saynn("[say=jacki]Thankies~.[/say]")

			saynn("Looks like it worked. Maybe she is going to be more eager now.")

			addButton("Continue", "See what happens next", "endthescene")
	if(state == "gift_horsecockdildo"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		saynn("Go big or go home. You offer Jacki a giant horsecock dildo.")

		if (corruption > 0.5 || lust > 0.5):
			saynn("Her eyes go wide.")

			saynn("[say=jacki]Wow.. Why is it so fucking big.[/say]")

			saynn("Huh? Her answer is a bit different from what you would expect from a kind shy wolfie.")

			saynn("[say=pc]It's a gift. Do you want it?[/say]")

			saynn("She blushes deeply as you catch her blatantly staring at it, drooling even.")

			saynn("[say=jacki]Uhm.. Why would I? But you can leave it here on the floor if you don't need it.. Maybe somebody would like to have such a big flared horsecock shoved up their dirty asshole..[/say]")

			saynn("Wow. You decide not to argue any further and just place the toy on the floor tiles.")

			saynn("Jacki stands on the mat and pretends to do some exercises while looking high at the ceiling. But as soon as you leave the space, you hear someone's rear paws sprinting away.")

			saynn("When you turn around.. there is no toy anymore. Or Jacki. She only returns a few minutes later and pretends like nothing has happened.")

			addButton("Continue", "See what happens next", "endthescene")
		else:
			saynn("Her eyes instantly go wide.")

			saynn("[say=jacki]Wha.. The fuck?[/say]")

			saynn("[say=pc]It's a gift.[/say]")

			saynn("She blushes while looking at that giant girthy shaft with a flared tip. But then shakes her head.")

			saynn("[say=jacki]Listen. I appreciate the gesture. But I'm not that desperate. You know?[/say]")

			saynn("Not yet she isn't.")

			addButton("Continue", "See what happens next", "endthescene")
	if(state == "kind_watch"):
		saynn("You ask Jacki if you can just watch her do yoga.")

		if (lust < 0.2 || RNG.chance(25)):
			saynn("[say=jacki]Oh. Uh. Sure. Why not. I'm not the best at it.[/say]")

			saynn("You sit on the nearest bench and watch Jacki go through a series of yoga poses.")

			if (RNG.chance(50)):
				playAnimation(StageScene.Yoga, "camel", {pc="jacki"})
				saynn("The last one interests you the most. Her lithe body gracefully arches backwards, her paws reaching for her legs. The way she stretches is quite captivating.")

			else:
				playAnimation(StageScene.Yoga, "warrior", {pc="jacki", bodyState={underwear=hasUnderwear}})
				saynn("The last one interests you the most. Her lithe body gracefully arches backwards, her paws reaching high up. The way she stretches is quite captivating.")

			saynn("[say=pc]Oh, I think you're pretty good.[/say]")

			saynn("[say=jacki]You think so?.. Ah..[/say]")

			saynn("The wolfie starts to pant softly the longer she holds this pose. So strong. And yet. So vulnerable.")

			saynn("She keeps standing like this for some time, blushing when your gazes collide. As Jacki finally eases out of this pose, her breathing makes her chest rise and fall. A modest and yet still feminine chest.")

			saynn("[say=jacki]Thanks for watching.. wruff..[/say]")

			saynn("You just chuckle.")

		elif (lust < 0.5 || RNG.chance(25)):
			saynn("[say=jacki]Of course~. I like when you watch me, wruff.[/say]")

			saynn("You sit on the nearest bench and watch the wolfie go through a series of yoga poses, warming up on simple ones before proceeding to do one special one.")

			if (RNG.chance(50)):
				playAnimation(StageScene.Yoga, "dog", {pc="jacki"})
				saynn("This time she decides to put the most focus on the pose called 'downward-facing dog'. Her hips rise high into the air while her hands are pressed firmly into the mat. She maintains this pose, the curves of her fit butt full on display, while gazing towards the ground.")

				saynn("[say=pc]Very nice.[/say]")

				saynn("[say=jacki]Thanks.. ah..[/say]")

				saynn("While stretching all her limbs out like that, she can't help but to produce a soft moan. And that, combined with sticking her butt out so provocatively, makes her all blushy.")

			else:
				playAnimation(StageScene.Yoga, "cobra", {pc="jacki"})
				saynn("This time she decides to put the most focus on the pose called cobra. She is lying on the floor, her paws are pressed firmly into the mat as she proceeds to arch her back as much as she can. She maintains this pose, the curves of her fit butt and modest breasts are all on display.")

				saynn("[say=pc]Very nice.[/say]")

				saynn("[say=jacki]Thanks.. ah..[/say]")

				saynn("While stretching like that, she can't help but to produce a soft moan. And that makes her all blushy.")

			saynn("As Jacki finally eases out of this pose, her breathing makes her chest rise and fall. A modest and yet still feminine chest.")

			saynn("[say=jacki]Well. Hope you liked the view, wruff.[/say]")

			saynn("You smile and nod.")

		else:
			saynn("[say=jacki]I thought you would never ask, wruff~.[/say]")

			saynn("You take a comfortable seat, watching Jacki begin her yoga practice.")

			saynn("She starts with some basic yoga poses, moving gracefully through her routine, starting off with simple stretching and ending at something quite.. lewd.")

			if (RNG.chance(50)):
				playAnimation(StageScene.Yoga, "catcow", {pc="jacki", bodyState={underwear=hasUnderwear}})
				saynn("Jacki stands on all fours and then bends her back low while sticking her butt provocatively, emphasizing the curves of her rear. Even her fluffy tail moves out of the way to let you see her pinched clothing hugging her crotch tightly.")

				saynn("After that she bends her back in the other direction, arching it instead, completing the cat-cow pose. Little moans occasionally escape from her as she moves from one pose to another.")

			else:
				playAnimation(StageScene.Yoga, "bridge", {pc="jacki", bodyState={underwear=hasUnderwear}})
				saynn("Jacki lies on her back before using her hind paws to raise her butt provocatively high. She arches her back as much as she can, her pose emphasizing the curves of her rear. Little moans occasionally escape from her as she tries to hold it.")

			saynn("[say=jacki]Always makes me feel like I'm in heat..[/say]")

			saynn("A bold statement. But a welcomed one.")

			saynn("[say=pc]You're doing great.[/say]")

			saynn("[say=jacki]Wruff~.[/say]")

		addButton("Enough", "That was cute", "endthescene")
		if (anger < -0.3):
			addButton("Yoga together", "Ask to do some exercises together", "kind_yoga_together")
		else:
			addDisabledButton("Yoga together", "Jacki needs to trust you more")
		if (anger < -0.5):
			addButton("Offer massage", "Offer Jacki a massage to relax her muscles", "kind_massage")
		else:
			addDisabledButton("Offer massage", "Jacki needs to trust you more")
	if(state == "kind_yoga_together"):
		playAnimation(StageScene.Solo, "allfours")
		saynn("A little cute idea comes into your mind.")

		saynn("[say=pc]Can we do something together?[/say]")

		if (lust > 0.7):
			saynn("[say=jacki]We can do many things together, wruff~.[/say]")

			saynn("The wolfie is quite horny, huh.")

			saynn("[say=pc]I mean.. yoga.[/say]")

			saynn("[say=jacki]Oh. Sure.[/say]")

		else:
			saynn("[say=jacki]Sure. I can show you a few poses.[/say]")

		saynn("Her eyes light up. Jacki invites you to the middle of the mat and shows you a few simple exercises that warm up your muscles.")

		saynn("[say=jacki]Let's do the cat-cow. Get on all fours.[/say]")

		saynn("A bit kinky to hear that from her. But you obey, planting your hands and knees onto the soft mat. Jacki helps you, positioning your neck and limbs to avoid any possible overstretching.")

		saynn("[say=jacki]Imagine a hissy cat. They stick their backs up.[/say]")

		saynn("You do just that. Jacki angles your head so you would be looking down.")

		saynn("[say=jacki]Great, wruff~. Now imagine a cow who wants to moo very loudly. Lower your belly as low as you can and have your chin high.[/say]")

		saynn("She is being very helpful. Makes you wonder how far she would go.")

		addButton("Try your best", "Do the pose as best as you can", "kind_yoga_togehter_try")
		addButton("Slack purposefully", "Do it badly so Jacki has to help you more", "kind_yoga_togehter_slack")
	if(state == "kind_yoga_togehter_try"):
		playAnimation(StageScene.Yoga, "catcow")
		saynn("You do your best to follow the instructions, slowly transitioning from one pose to another and back, making sure to arch your back and move your head when needed.")

		saynn("[say=jacki]Aw. Very good![/say]")

		saynn("And looks like you are doing it correctly. Jacki only occasionally fixes your posture.")

		saynn("It's exhausting.. but strangely liberating. You feel better now.")

		saynn("[say=pc]Thanks.[/say]")

		saynn("You're panting by the end of it. Jacki smiles kindly.")

		saynn("[say=jacki]You're welcome.[/say]")

		saynn("Nothing about this training session was lewd. But maybe it doesn't have to be?")

		addButton("Continue", "That was nice", "endthescene")
	if(state == "kind_yoga_togehter_slack"):
		playAnimation(StageScene.ButtStack, "idle", {pc="pc", npc="jacki"})
		saynn("You follow her instructions.. but not quite exactly. You don't bend and arch your back enough no matter how much Jacki points it out.")

		saynn("At some point the wolfie gets too tired of you failing it.")

		saynn("[say=jacki]Huff.. It's very easy. Let me show.[/say]")

		saynn("She suddenly stands on top of you, lowering herself onto your back while still being on all fours.")

		saynn("[say=jacki]Let's bend very low.[/say]")

		if (lust < 0.5 && corruption < 0.5):
			saynn("Jacki guides your movement, her form brushing against yours as she helps you get into the 'cow' pose. The friction of your bodies rubbing against each other creates a little intimate feeling.. A feeling that becomes evident to Jacki a bit too late.")

			saynn("[say=jacki]Oh. Um..[/say]")

			saynn("When she realizes how kinky it must look from the side, Jacki gets off you and clears her throat while blushing softly.")

			saynn("[say=jacki]You're doing good.. much better now.. yeah..[/say]")

			saynn("You can tell everything just by her voice.")

			saynn("[say=pc]You mounting me helped, thank you~.[/say]")

			saynn("That's when Jacki's face goes fully red.")

		else:
			saynn("Jacki guides your movement, her form brushing against yours as she helps you get into the 'cow' pose. The friction of your bodies rubbing against each other creates a little intimate feeling.. A feeling that both of you seem to welcome.")

			saynn("[say=jacki]Very good.. wruff..[/say]")

			saynn("Even though this is probably looking quite.. kinky.. from the side.. Jacki continues to guide you into the right pose with her own body.")

			saynn("[say=jacki]Sometimes a good mounting can fix everything..[/say]")

			saynn("She isn't even trying to hide it, is she. You can feel her subtly humping you, her crotch spreading the lewd scent coming from her constrained desperate flower to you.")

			saynn("[say=jacki]There we go..[/say]")

			saynn("Both of you pant softly while remaining intertwined in this.. weird kind of embrace.. for a while longer.")

			saynn("[say=pc]Thank you, wolfie.[/say]")

			saynn("She licks your ear and gets off you.")

		addButton("Continue", "That was lewd", "endthescene")
	if(state == "kind_massage"):
		playAnimation(StageScene.Massage, "back", {npc="jacki"})
		saynn("After that yoga practice session the wolfie is probably feeling tensed up. So you decide to offer some help.")

		saynn("[say=pc]Would you want a little massage, Jacki? To help you relax.[/say]")

		saynn("[say=jacki]Oh.. That actually sounds kinda nice.[/say]")

		saynn("There aren't really any spots for that.. so you just help her lie down on the mat. Then you kneel nearby and put your hands on her back.")

		saynn("You begin simple, kneading the tension away from her shoulders and then doing the same to her shoulder plates and the back muscles.")

		saynn("[say=jacki]You can be.. a little harder if you want.[/say]")

		saynn("She likes it a little rougher huh? You listen to her and put a little more pressure into your massage.")

		saynn("Jacki sighs in pleasure enjoying the sensations of your strong hands working their magic on her tense muscles. After dealing with the shoulders, your hands slide lower to her waist, your fingers lightly grazing her sides, your thumbs tracing the contours of her spine.")

		saynn("[say=jacki]That feels good..[/say]")

		saynn("Hm. Kneading her there has an opposite effect of growing the tension instead. The good kind of tension. It's like Jacki has a lot of.. sensual energy.. that is stored deep within her.")

		saynn("She arches her back slightly as a quiet moan escapes her lips.. an invitation for you to explore further.")

		saynn("Your hands continue to wander, gradually sliding lower and lower across her curves until you begin to knead and caress her firm rear. That wiggly tail moves out of the way, giving you full access to her butt.")

		saynn("[say=jacki]Wruff..[/say]")

		saynn("You can feel.. heat.. radiating from her crotch. But you don't dare to go there.. just caressing her thighs instead, sometimes rubbing their inner side too. More little moans can be heard as you are nearing the end of that sensual massage.")

		saynn("[say=pc]Did you like it, wolfie?[/say]")

		saynn("[say=jacki]Yeah.. that feels really good..[/say]")

		addButton("Continue", "That was lewd", "endthescene")
		addButtonWithChecks("Forced anal fuck", "Betray Jacki and have have rough sex with her right there", "kind_massage_forcedfuck", [], [ButtonChecks.HasReachablePenis])
		addButton("Forced fisting", "Betray Jacki and fist her ass right there", "kind_massage_forcedfisting")
	if(state == "kind_massage_forcedfuck"):
		playAnimation(StageScene.SexBehind, "fast", {npc="jacki", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("Since the wolfie is not suspecting anything.. Now is the perfect time to strike.")

		saynn("With a sudden, forceful movement, you pin Jacki against the mat, pushing one hand into her back while the second is already pulling her shorts down. She yelps and instinctively arches her back, trying to look behind her as you already expose her ass. She realizes your evil intentions way too late.")

		saynn("[say=jacki]What are you![/say]")

		saynn("[say=pc]Shut up, whore.[/say]")

		saynn("The bitch still has her cunt stitched up and hidden behind a rich red bush of pubic hair so you opt to go for her other hole.. her dirty asshole that seems to be {jackiButt}."+str(" Which gives you a good reason to stretch that ring more." if buttScore < 5 else " Which makes you wonder why is that buttslut even resisting.")+"")

		saynn("[say=jacki]Somebody! Help![/say]")

		saynn("You expose your {pc.penis} after pulling Jacki's shorts down and then use that free hand to force her muzzle into the floor, muffling her calls for help. All the while you give every wanna-be hero an evil glance.. which seems to calm them down. While other hungry eyes are watching you with great interest.")

		saynn("After that, you quickly align yourself with her ass.. before forcing yourself inside, your cock violating her ass and stretching her anal star painfully wide, forcing a moan of discomfort out of the wolfie.")

		if (buttScore < 5):
			saynn("[say=pc]Ngh. What a tight bitch.[/say]")

		else:
			saynn("[say=pc]How many horsecocks can fit in there? More than one it feels.[/say]")

		saynn("And so you start fucking her at a furious pace, your hips slapping against her fluffy buttchecks as you shove your dick in and out. This raw brutal act causes Jacki to squirm and resist out of desperation, her moans and gasps turning into pleas for mercy. The amount of roughness that you apply while pounding her ass makes her start sobbing.")

		saynn("[say=jacki]Stop.. please!..[/say]")

		saynn("It was so-o-o worth it to pretend to be her friend for some time. The slut is clenching so hard that you can't keep yourself from grunting. Betrayal? Pff. You're just turning Jacki into who she is supposed to be.. a cock-addicted slut.")

		saynn("[say=pc]Keep clenching whore, I'm close.[/say]")

		saynn("Her asshole isn't exactly lubed which leads to some wear and tear.. but who cares when you are having such a good time. If she doesn't like it.. why is her ass practically sucking your cock in?")

		addButton("Cum inside", "Give that slut what she deserves", "kind_massage_forcedfuck_cum")
	if(state == "kind_massage_forcedfuck_cum"):
		playAnimation(StageScene.SexBehind, "inside", {npc="jacki", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("After a few last rough thrusts, that clenching ass easily pushes you over the edge. Jacki's body quivers under you as you shove your throbbing {pc.penis} deep inside and start flooding her guts full of your sticky {pc.cum}.")

		saynn("When the orgasm is over, you pull out and stop pinning the wolfie. And she is just.. sobbing.. while her used {jackiButt} asshole is leaking your seed. All the accumulated trust.. shattered.. her body bruised.")

		saynn("[say=jacki]H-huff..[/say]")

		saynn("[say=pc]You're nothing but a buttslut.[/say]")

		saynn("But not all is bad. Maybe now she will understand her real place in this prison.")

		saynn("You give her some rest.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "kind_massage_forcedfisting"):
		playAnimation(StageScene.SexFisting, "sex", {npc="jacki", npcBodyState={exposedCrotch=true}})
		saynn("Since the wolfie is not suspecting anything.. Now is the perfect time to strike.")

		saynn("With a sudden, forceful movement, you pin Jacki against the mat, pushing one hand into her back while the second is already pulling her shorts down. She yelps and instinctively arches her back, trying to look behind her as you already expose her ass. She realizes your evil intentions way too late.")

		saynn("[say=jacki]What are you![/say]")

		saynn("[say=pc]Shut up, whore.[/say]")

		saynn("The bitch still has her cunt stitched up and hidden behind a rich red bush of pubic hair so you opt to go for her other hole.. her dirty asshole that seems to be {jackiButt}."+str(" Which gives you a good reason to stretch that ring more." if buttScore < 5 else " Which makes you wonder why is that buttslut even resisting.")+"")

		saynn("[say=jacki]Somebody! Help![/say]")

		saynn("You didn't even do anything yet! What a whiny bitch. But it's about time. Inmates around are watching.. but one stern glance is enough to scare away any wanna-be heroes.")

		saynn("You start by prodding her asshole with a few digits. She is clenching tightly.. but you are stronger, violating her ass with three fingers at once, stretching her sorry hole somewhat wide. The wolfie surely doesn't like that, she is squirming like hell.")

		saynn("[say=jacki]Nghh!..[/say]")

		saynn("[say=pc]Quit resisting, bitch.[/say]")

		saynn("A few firm spanks makes the girl whine and sob.. but also not move as much. Which lets you start working her ass out and adding another digit.. and then another.. until your whole palm is now forcibly going into Jacki's ass.")

		saynn("[say=jacki]T-too much..[/say]")

		saynn("It was too much indeed, Jacki's asshole looks stretched comically wide. At the same time you also notice a little wet spot appearing on the mat underneath, creating from juices that drip from her stitched up cunt. Bitch might actually be enjoying it.")

		saynn("Which is why you start moving your hand in and out, fisting that wolfie's firm butt, leaving it pretty much empty before stuffing it full seconds later.")

		saynn("Jacki huffs and whines louder, her asshole struggling to keep up with your onslaught.")

		saynn("[say=pc]Too much? I think it's just right for a buttslut like you.[/say]")

		saynn("The most you pound her ass, the closer she gets to something.. her inner walls gripping your fist so well..")

		addButton("Forced orgasm", "See what happens next", "kind_massage_forcedfisting_cum")
	if(state == "kind_massage_forcedfisting_cum"):
		playAnimation(StageScene.SexFisting, "tease", {npc="jacki", npcCum=true, npcBodyState={exposedCrotch=true}})
		saynn("Suddenly, Jacki starts arching her back and crying out loudly as her stretched asshole is pulsing around your hand. You're not sure if this is an orgasm.. or something caused by you overstimulating her.. but it's sure a welcomed addition.")

		saynn("When that is over, you pull your fist out and stop pinning the wolfie. While she is just.. sobbing.. her {jackiButt} asshole is struggling to close completely. All the accumulated trust.. shattered.. her body bruised.")

		saynn("[say=jacki]H-huff..[/say]")

		saynn("[say=pc]You're nothing but a buttslut.[/say]")

		saynn("But not all is bad. Maybe now she will understand her real place in this prison.")

		saynn("You give her some rest.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "kind_jog"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		saynn("Being in a prison does limit your range of available activities a lot. But luckily jogging is something that doesn't require much, just some empty space.")

		saynn("[say=pc]Wonder if you would like to jog together?[/say]")

		saynn("[say=jacki]Oh. Sure.[/say]")

		saynn("Jacki gets up from the mat and invites you to follow her to her usual route.")

		addButton("Jog", "Jog with Jacki", "jog_do")
	if(state == "jog_do"):
		aimCameraAndSetLocName("yard_eastCorridor")
		playAnimation(StageScene.Duo, "jog", {npc="jacki", npcAction="jog", flipNPC=true})
		saynn("And so you two begin jogging around the only green area of the prison. The air here is nice and fresh.")

		saynn("Jacki leads the way so you just jog behind her. You run past some rocks and even trees.")

		saynn("The more the wolfie jogs, the more you begin to notice something. She is panting way more than you would expect her to do. The fabric of her clothes rubbing against her sensitive spots might be the reason..")

		saynn("Since you're not jogging that fast, you can also try to chat.")

		addButton("Skip chat", "You'd rather not chat", "jog_afterchat")
		addButton("This is nice", "Say this", "jog_chat_nice")
		addButton("Why is she here", "Ask how Jacki has ended up here", "jog_chat_whyprison")
		addButton("Chastity piercings", "Ask Jacki about her chastity piercings", "jog_chat_chastitypiercings")
	if(state == "jog_chat_nice"):
		saynn("[say=pc]This is nice, isn't it?[/say]")

		saynn("[say=jacki]Yeah, it is.. wruff.. I like that I get to do this.[/say]")

		saynn("You jog past some little artificial waterfall. The sound of running water helps calm you both down.")

		saynn("[say=jacki]This prison has been growing on me. As sad as that might sound.[/say]")

		saynn("[say=pc]What about the fact that you got put into stocks?[/say]")

		saynn("[say=jacki]Eh, it was kinda kinky.[/say]")

		saynn("Huh.")

		addButton("Continue", "See what happens next", "jog_afterchat")
	if(state == "jog_chat_whyprison"):
		saynn("[say=pc]How did you end up here, Jacki? What crime did you do?[/say]")

		saynn("[say=jacki]Me? I didn't do anything. I like to think that I'm a friendly person.[/say]")

		saynn("A kind friendly innocent wolfie huh.")

		saynn("[say=pc]So why did AlphaCorp decide to send you into the middle of nowhere?[/say]")

		saynn("She stops for a second to think. And then just shrugs and continues jogging.")

		saynn("[say=jacki]Dunno. One day I wake up and there were photos on my bed of me fucking with some old guy. He had a white uniform. I honestly never saw him even once in my life.[/say]")

		saynn("You think to yourself.. could be drugs.. could be image manipulation.. or maybe she actually did it.")

		saynn("[say=jacki]There also was a note. It told me to come to a certain place alone or these would be posted everywhere.[/say]")

		saynn("[say=pc]Sounds like someone was trying to blackmail you. Did you do it?[/say]")

		saynn("[say=jacki]Nah, I just went to the police. But when they saw the photos.. It made me wish that I did.[/say]")

		saynn("[say=pc]Why?[/say]")

		saynn("[say=jacki]I got charged with.. don't remember exactly.. I think it was.. unsolicited breeding.. or something like that. I obviously never did that.[/say]")

		saynn("Breeding is illegal now? Looks like somebody just wanted to earn an extra star. Makes sense why she is here then and not in a normal prison.")

		saynn("[say=pc]I see.[/say]")

		saynn("[say=jacki]I'm not even that special.[/say]")

		addButton("Continue", "See what happens next", "jog_afterchat")
	if(state == "jog_chat_chastitypiercings"):
		saynn("[say=pc]Couldn't help but to notice your unique piercings. Why do you have them?[/say]")

		saynn("[say=jacki]It's a long story..[/say]")

		saynn("You can try to ask to hear it. But obviously that story is not gonna be the prettiest..")

		addButton("Listen to story", "(Genital torture) Ask Jacki to tell you what happened", "jog_chat_asklistenfull")
		addButton("Short version", "You're fine with a story without much details", "jog_chat_asklistenshort")
	if(state == "jog_chat_asklistenfull"):
		saynn("[say=pc]I wanna hear it. The whole story.[/say]")

		if (anger > -0.8):
			saynn("[say=jacki]Sorry. It's also kinda intimate, you know?[/say]")

			saynn("Looks like Jacki doesn't trust you enough yet.")

			addButton("Continue", "See what happens next", "jog_afterchat")
		else:
			playAnimation(StageScene.Duo, "sit", {npc="jacki", npcAction="sit"})
			saynn("Jacki stops near the closest bench and sits down.")

			saynn("[say=jacki]Okay. I think I trust you enough to share it.[/say]")

			saynn("You approach her and sit near. All the while Jacki is gathering courage.")

			saynn("[say=jacki]It happened during my intake. There was a doctor..[/say]")

			saynn("You can't help but to get immersed in her story immediately..")

			addButton("See it", "See it with your own eyes", "jacki_piercing_story_start")
	if(state == "jog_chat_asklistenshort"):
		saynn("[say=pc]You don't have to tell me everything. Just a.. short version is fine.[/say]")

		if (anger > -0.8):
			saynn("[say=jacki]Sorry. It's also kinda intimate, you know?[/say]")

			saynn("Looks like Jacki doesn't trust you enough yet.")

			addButton("Continue", "See what happens next", "jog_afterchat")
		else:
			saynn("Jacki stops for a second and turns towards you.")

			saynn("[say=jacki]I think I can tell you.[/say]")

			saynn("She looks down at her body.")

			saynn("[say=jacki]Some doctor chose me for some program.. Something about.. obedience training? She was kinda mean. And so I returned the favor.[/say]")

			saynn("[say=pc]Did she choose you randomly?[/say]")

			saynn("[say=jacki]I don't know. She wanted to inject me with something. Said it against STDs? I wasn't planning on fucking here with anyone, you know? I made that very clear.[/say]")

			saynn("Jacki looks away for a second.")

			saynn("[say=jacki]She said that my plans are not gonna last long. And then she stitched my pussy with those piercings.. even added a fancy little bell on a chain.[/say]")

			saynn("[say=pc]I see.[/say]")

			if (lust > 0.5):
				saynn("[say=jacki]She was right.. You can't imagine how much I wanna be.. Anyway..[/say]")

			else:
				saynn("[say=jacki]So far it feels like she might be right.. Anyway..[/say]")

			saynn("Makes you wonder how chastity can make someone eager to be fucked?")

			saynn("After sharing that little story, she gets up and returns to jogging.")

			addButton("Continue", "See what happens next", "jog_afterchat")
	if(state == "jacki_piercing_story_start"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="jacki", npc="eliza"})
		aimCameraAndSetLocName("intro_medicalarea")
		saynn("Chained up Jacki follows the arrows on the floor that direct her towards the special little medical area. Closed drawers, lots of lights, sterile white wall and floor materials, a medical table.")

		saynn("Inside she also finds a doctor, a new face for her. The loud clang of chains made that doctor aware of the inmate long ago before the wolfie even stepped into the area.")

		saynn("[say=jacki]Um.. Hi?[/say]")

		saynn("[say=eliza]You can call me Doctor Quinn. Take a seat, patient.[/say]")

		addButton("Sit down", "Might as well obey", "jacki_piercing_story_sit")
	if(state == "jacki_piercing_story_sit"):
		playAnimation(StageScene.Duo, "sit", {pc="jacki", npc="eliza"})
		saynn("Jacki awkwardly climbs onto the special sturdy-looking table and sits on it.")

		saynn("[say=eliza]First, a quick visual check.[/say]")

		saynn("Doctor grabs a penlight and shines it into the wolfie's eyes, testing her reflexes. Then she checks the girl's fangs to make sure they're not too sharp. She quickly trims her claws too.")

		saynn("[say=eliza]Mhm. Now.. I have runned out of Spacecillin pills so an injection will have to do.[/say]")

		saynn("[say=jacki]Huh?[/say]")

		saynn("Doctor quickly puts on some white latex gloves and grabs a syringe full of some white drug. Jacki leans away when that sharp needle moves closer and closer to her.")

		saynn("[say=jacki]I don't like drugs. What is it?[/say]")

		saynn("The feline sighs, her free paw sneakily reaches for a shock remote already.")

		saynn("[say=eliza]Very strong antibiotics. Works against most current STDs.[/say]")

		saynn("That only confuses the wolfie more.. and makes her avoid the needle harder.")

		saynn("[say=jacki]STDs? Why would I need protection against STDs in a prison? Most of them are transferred through sexual acts.[/say]")

		saynn("Doctor tilts her head and looks at Jacki with very mean strict eyes.")

		saynn("[say=eliza]And you think you won't have any?[/say]")

		saynn("[say=jacki]Yes, obviously I don't plan to fuck with anyone here. Um.. What kind of prison is this?! Get that syringe away from me![/say]")

		saynn("Doctor's mean eyes don't go away.. But the little smile is added on top.")

		saynn("[say=eliza]Your plans will have to change.[/say]")

		saynn("The feline gets tired of arguing with the wolfie.. and suddenly presses a button that sends a powerful shock through Jacki's collar.")

		saynn("[say=jacki]ARGH!!..[/say]")

		saynn("Poor wolfie cries out from extreme pain before collapsing and losing consciousness..")

		addButton("Continue", "See what happens to the wolfie next", "jacki_piercing_story_table")
	if(state == "jacki_piercing_story_table"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {pc="jacki", bodyState={naked=true}, noDildos=true})
		saynn("As Jacki opens her eyes.. She realizes that she is now lying on the table, her arms and legs firmly held by some mechanical arms that also keep her whole body still.")

		saynn("All of the muscles hurt..")

		saynn("[say=jacki]What the..[/say]")

		saynn("Jacki also realizes that she is completely naked, her small tits, pussy and ass are all on display. Doctor Quinn is standing nearby.. with an empty used syringe. The feline disposes of it.")

		saynn("[say=eliza]Things go so much smoother when you use a little bit of force.[/say]")

		saynn("[say=jacki]You.. bitch..[/say]")

		saynn("[say=eliza]What? I don't make the rules. You will get fucked in here, trust me. Maybe you will even become someone's favorite slut. That's just how this place works. Don't blame me for that.[/say]")

		saynn("[say=jacki]I am not fucking with anyone here..[/say]")

		saynn("Doctor grabs her datapad and pulls up some records.")

		saynn("[say=eliza]Wait. Shouldn't you be a lilac? Your recorded crime is.. Unsolicited breeding with AlphaCorp's official. Wow. How many pups did you make already?[/say]")

		saynn("AlphaCorp?")

		saynn("[say=jacki]I never! I got blackmailed, okay? I am innocent![/say]")

		saynn("[say=eliza]I see. Obviously you are~. Hm.. I think I can help you.. let's try something interesting.. Yes-s..[/say]")

		saynn("Doctor Quinn goes ahead and searches through some drawers until she finds some.. tools.")

		saynn("[say=jacki]What are you gonna do?[/say]")

		saynn("The feline presents Jacki something that looks like a.. piercing gun.. and a bunch of little metal rings. Just looking at all that makes the wolfie shiver.")

		saynn("[say=eliza]I enrolled you into the obedience training research program. I usually do it for male bits.. but we can try female ones too, right~?[/say]")

		saynn("The tone of her voice.. It doesn't mean anything good for Jacki.")

		saynn("[say=jacki]What the hell are you talking about?[/say]")

		saynn("[say=eliza]I'm just helping you~.[/say]")

		saynn("She pressed some button on the table.. that caused the mechanical arms to forcibly spread Jacki's legs further, giving the doctor full access to her unshaved crotch..")

		saynn("The feline starts leaning in closer and closer, that piercing tool is being brought closer and closer to the exposed pussy..")

		saynn("[say=jacki]H-hey.. No.. wait![/say]")

		saynn("Doctor Quinn isn't a monster obviously.. She takes some time to disinfect the area with some alcohol wipes first.. before using her free paw to bring the girl's pussy lips together.. pressing the tool against the sensitive flesh.. and then pulling the trigger..")

		addButton("Continue", "Ow", "jacki_piercing_story_piercings")
	if(state == "jacki_piercing_story_piercings"):
		playAnimation(StageScene.BDSMMachineFuck, "wand", {pc="jacki", bodyState={naked=true}, noDildos=true})
		saynn("Jacki yelps loudly as the tool pierces her labia in two places and also inserts a little metal ring through the two new holes at the same time..")

		saynn("[say=jacki]Argh! What the fuck are you doing?![/say]")

		saynn("[say=eliza]What does it feel like~?[/say]")

		saynn("Doctor Quinn moves the tool a little higher.. and presses the trigger again, causing it to pierce through the two layers of sensitive flesh yet again before inserting another metal ring that connects them both.")

		saynn("[say=jacki]Gh-h.. Like you're ripping my cunt out!..[/say]")

		saynn("[say=eliza]Hah. Nah. You didn't want to be fucked right? I'm helping you~.[/say]")

		saynn("She repeats her action.. making another two new holes in Jacki's labia and forcing them closed with a little ring.")

		saynn("[say=jacki]Ugh.. Helping me how exactly?![/say]")

		saynn("[say=eliza]By stitching your little pussy up permanently~. Much better than those bulky chastity belts~. And sexier too.[/say]")

		saynn("Permanently!? The pain becomes worse and worse.. It feels like Jacki's pussy is burning.. And yet, Doctor Quinn keeps stitching it up with more of those rings.. until her pussy looks like an.. extremely virgin slit.. but with extra fancy piercings.")

		saynn("[say=jacki]Fuck me-e-e.. It hurts..[/say]")

		saynn("[say=eliza]It does? Good. You always could have just done what I wanted. You would have kept your cunt then. But this is more fun arguably.[/say]")

		saynn("Jacki pants heavily.. resisting those mechanical arms is impossible.. She is forced to endure it..")

		saynn("[say=eliza]See? Now you won't ever be fucked~. Well, vaginally. That pussy is now reserved exclusively for that AlphaCorp higher-up~.[/say]")

		saynn("[say=jacki]F-fuck.. y-you..[/say]")

		saynn("[say=eliza]Oh? You want more? I can do more~.[/say]")

		saynn("Jacki's eyes turn big.. The pain near her crotch region makes her whine constantly.. her pussy looking extremely irritated. And yet, the doctor goes ahead and presses the tool against the girl's sensitive clit.")

		saynn("Ow.. One second later.. And Jacki arches her back before letting out a gut-wrenching scream.. Her poor tortured pussy starts pulsing and even squirting juices onto the table.")

		saynn("[say=eliza]Ohh~. Are you orgasming from pain? Fascinating~.[/say]")

		saynn("And now, Jacki's clit has a ring going through it too. Doctor Quinn tugs on it, causing the exhausted wolfie to squirm more.")

		saynn("[say=jacki]W-Why..[/say]")

		saynn("[say=eliza]Why do we do anything? To become happy. Seeing this.. makes me happy~.[/say]")

		saynn("The feline goes ahead and attaches a little bell on a chain to her clit ring.. before also plugging the little urethra hole with a very small dildo-like object.. something that would normally make Jacki gasp.. but for now she doesn't even care.")

		saynn("[say=eliza]Aw. Don't look so sad. I'm sure you will be happy too. When you decide to start fucking~. Too bad you will have to use your other holes now.[/say]")

		saynn("Jacki is so exhausted.. her vision starts turning darker and darker.. until the world fades away..")

		addButton("End of story", "That was intense", "jacki_piercing_story_end")
	if(state == "jacki_piercing_story_end"):
		removeCharacter("eliza")
		playAnimation(StageScene.Duo, "sit", {npc="jacki", npcAction="sit"})
		aimCameraAndSetLocName("yard_eastCorridor")
		GM.pc.setLocation("yard_eastCorridor")
		saynn("[say=jacki]So yeah. That's about it. My first experiences here weren't exactly pleasant.[/say]")

		saynn("Getting your pussy stitched up like that? Obviously no one would like that.")

		saynn("[say=jacki]But I'm getting used to it, you know?[/say]")

		saynn("[say=pc]To the prison life?[/say]")

		saynn("[say=jacki]To that too. The worst thing is that I can't even rub it out.. I have to seek.. alternative ways to.. you know.. But I can't find any..[/say]")

		saynn("Seems you can try helping her with that.")

		saynn("[say=jacki]Talking about it made me kinda exhausted. I will go rest, okay?[/say]")

		saynn("[say=pc]Sure. Take care.[/say]")

		saynn("Jacki gets up and starts jogging away.. leaving a little wet trail behind.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "jog_afterchat"):
		aimCameraAndSetLocName("yard_northCorridor")
		GM.pc.setLocation("yard_northCorridor")
		if (lust < 0.2):
			playAnimation(StageScene.Duo, "stand", {npc="jacki"})
			saynn("By the end of your jogging session, Jacki is panting softly. She leans against one of the big rocks and holds her other paw on her thigh, rubbing it.")

			saynn("[say=jacki]Ooh.. These can be quite exhausting, huh?[/say]")

			saynn("You panting slightly too but not that much.")

			saynn("[say=jacki]Fresh air is nice, isn't it? I like this place.[/say]")

			saynn("She pulls out a plastic bottle filled with fresh water and raises it high above her head, catching some into her mouth while the rest streams down her fur and cools down her body. The wet fabric starts gluing to her body, emphasizing her {jacki.breasts}.")

			saynn("[say=jacki]Ah.. So good.. Well. It was nice chatting with you. But I think I will return back now.[/say]")

		elif (lust < 0.4):
			playAnimation(StageScene.Duo, "stand", {npc="jacki"})
			saynn("By the end of that jogging session, Jacki is clearly exhausted. She is huffing and sticking her tongue out,  her paws traveling all over her waist and sides.")

			saynn("[say=jacki]Damn.. Why is it so hot here all of the sudden..[/say]")

			saynn("Hot? You don't really feel that. The temperature is the same as it always was. Looks like Jacki is talking about a different kind of heat. You notice her sneaking off and leaning against one of the trees.")

			saynn("Jacki's paws sneak out of your sight between her thighs. You can hear bell jingling noises..")

			saynn("[say=jacki]I'm so.. Huff..[/say]")

			saynn("After some alone time, Jacki returns to you, her cheeks blushing. She takes a few good gulps out of her personal plastic bottle and empties the rest onto her head, trying to cool down.")

			saynn("[say=jacki]It was nice to chat with you. I will go now. Wruff.[/say]")

		elif (lust < 0.8):
			playAnimation(StageScene.Duo, "stand", {npc="jacki"})
			saynn("Jacki is panting softly after that jogging session. She empties her water bottle onto herself and produces a cute moan.")

			saynn("[say=jacki]Damn heat.. Or whatever it is..[/say]")

			saynn("After that her paws sneak under her clothing, cupping her {jacki.breasts} and playing with the piercings between her legs. Her cheeks blush red as she does that.. she is clearly ashamed.. but can't stop herself.")

			saynn("[say=jacki]It won't go away..[/say]")

			saynn("Looks like her paws alone are not enough because of those chastity piercings. Maybe you can offer her some solutions?")

		else:
			playAnimation(StageScene.Duo, "stand", {npc="jacki"})
			saynn("Jacki is moaning softly as her clothing keeps getting caught by the piercings while she jogs around. At some point she can't continue anymore and stops by some tree. Her paws instantly slide under her shorts and start rubbing her sensitive parts.")

			saynn("[say=jacki]I'm so needy..[/say]")

			saynn("She looks you in the eyes.. while there is zero shame in hers. She pulls her shorts down for you even, exposing her unshaved crotch which features a rich red bush that's hiding her stitched up pussy slit. Looks like she gave up shaving it after some time completely.")

			saynn("Jacki plays with the little jingly bell and tugs on it, causing her to moan.")

			if (corruption < 0.6 || RNG.chance(50)):
				saynn("[say=jacki]Wanna help me maybe?.. My cunt is useless.. but you can fuck my dirty asshole if you want..[/say]")

				saynn("So direct. Looks like the lust is making her extremely eager.")

			else:
				saynn("[say=jacki]Fuck me.. Any way you can.. As rough as you can.. Use me like the whore that I am..[/say]")

				saynn("So naughty.")

		addButton("Nod", "Enough is enough", "jog_afterchat_nod")
		addButton("Shower", "Offer her to go take a refreshing shower", "jog_afterchat_shower")
		addButton("Ask to jog more", "Ask to jog even more together", "jog_afterchat_askmore")
		if (lust >= 0.4):
			addButton("Lick her", "Try to make Jacki cum by licking and rubbing her stiched up pussy", "jog_try_piercings")
			addButton("Sounding", "Jacki still has that little dildo in her urerthra..", "jog_sounding")
		if (lust >= 0.8):
			addButtonWithChecks("Rough anal", "Fuck Jacki's ass", "jog_anal_fuck", [], [ButtonChecks.HasReachablePenis])
			addButtonWithChecks("Strapon anal", "Fuck Jacki's ass with a strapon", "jog_anal_strapon_pick", [], [ButtonChecks.HasStraponAndCanWear])
		if (getFlag("JackiModule.Jacki_ch2GotPussyFreed")):
			addButtonWithChecks("Breed her", "Fuck Jacki's pussy", "jog_breed_fuck", [], [ButtonChecks.HasReachablePenis])
	if(state == "jog_afterchat_shower"):
		saynn("[say=pc]Wanna go take a shower? You know, to wash all that sweat away.[/say]")

		saynn("Jacki raises her arm and suddenly sniffs her armpit.")

		saynn("[say=jacki]Yeah.. I could use one. I'm still afraid of the bullies so I don't visit it often..[/say]")

		saynn("Could be why she has such a.. anyway.")

		saynn("You and Jacki head to the showers.")

		addButton("Showers", "See what's there", "jog_afterchat_shower_do")
	if(state == "jog_afterchat_shower_do"):
		aimCameraAndSetLocName("main_shower2")
		GM.pc.setLocation("main_shower2")
		addCharacter("jacki", ["naked"])
		saynn("You enter the dressing room.")

		if (corruption < 0.4):
			playAnimation(StageScene.Duo, "stand", {npc="jacki", bodyState={naked=true}, npcBodyState={naked=true}})
			saynn("Jacki quickly takes off her clothes and puts them in the locker. She runs past you while covering herself up using her paws and tail. You follow.")

			saynn("She doesn't seem to be eager to.. shower together. So you stand under separate shower heads and just wash yourselves in peace.")

			saynn("After you both are done, Jacki waves to you and heads to the dressing room. Looks like she is not corrupted enough to do more.")

		else:
			playAnimation(StageScene.SexStanding, "tease", {npc="jacki", pc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
			saynn("Jacki takes off her clothes and waits for you to do the same, standing near. After that, you head further, entering the showering area.")

			saynn("You stand under one of the shower heads.")

			saynn("[say=jacki]Could you rub me a little?..[/say]")

			saynn("[say=pc]Sure.[/say]")

			saynn("And so she joins you, offering you her back. You gently knead it while water washing any dirt off of you two.")

			saynn("[say=jacki]Wruff..[/say]")

			saynn("Your hands rub her shoulders, sides, waist.. When you are done with that, her tail boops your hands towards the directions of her butt. So you proceed to knead it too, groping and squeezing her buttcheeks.")

			saynn("[say=jacki]So nice.. Thank you.[/say]")

			saynn("She does the same to you, kneading your back and {pc.masc} ass. In a friendly way.")

			saynn("You and Jacki return to the dressing room clean and refreshed.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "jog_afterchat_nod"):
		saynn("You nod.")

		saynn("[say=pc]Take care.[/say]")

		saynn("Jacki offers you a kind smile.")

		saynn("[say=jacki]You too![/say]")

		saynn("..before walking away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "jog_afterchat_askmore"):
		saynn("[say=pc]Can't we maybe jog a little more? I would really like to do it with you.[/say]")

		saynn("Jacki rubs her wet muzzle and looks puzzled by your offer.")

		saynn("[say=jacki]Ooh.. You planning to run a marathon or something?[/say]")

		saynn("[say=pc]Pretty please?[/say]")

		saynn("One eye contact is enough to make her melt.")

		saynn("[say=jacki]Alright.. Let's jog some more.[/say]")

		addButton("Jog", "Jog together with Jacki", "jog_afterchat_jogmore")
	if(state == "jog_afterchat_jogmore"):
		aimCameraAndSetLocName("yard_firstroom")
		GM.pc.setLocation("yard_firstroom")
		playAnimation(StageScene.Duo, "jog", {npc="jacki", npcAction="jog", flipNPC=true})
		saynn("And so you continue jogging with Jacki. There is not much to chat about anymore so you just enjoy the scenery.")

		saynn("But the wolfie is not sharing your love to the lush environment at the moment. She is busy panting and huffing as she jogs around the yard while also swaying her hips more widely.")

		saynn("[say=jacki]Huff.. uff..[/say]")

		saynn("[say=pc]All good Jacki?[/say]")

		saynn("[say=jacki]Y-yeah.. I'm okay.[/say]")

		saynn("She gives you a thumbs up and does her best to keep up with the pace.")

		saynn("This jog gives you some energy back.")

		addButton("Continue", "See what happens next", "jog_afterbigjog")
	if(state == "jog_afterbigjog"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		saynn("At some point Jacki just has to stop. She grabs onto the nearest tree and starts panting heavily.")

		saynn("[say=pc]If you need something..[/say]")

		saynn("[say=jacki]I'm good.. trust me.. Just have to get my breath back.[/say]")

		saynn("The wolfie leans against that tree harder and looks at you with hungry eyes. But then she quickly snaps out of it and pulls out her plastic bottle.")

		saynn("She does the same motion, bringing it high above her muzzle and waiting for the refreshing fluid to hit her tongue and fur.. but nothing comes out..")

		saynn("[say=jacki]Aw.[/say]")

		saynn("She looks at you again.")

		saynn("[say=jacki]Hate to ask but. Maybe you have something to clench the thirst?[/say]")

		saynn("Looks like you can give her one of your plastic bottles if you have any filled ones.")

		addButton("Nah", "You won't give her anything", "jog_afterbigjog_nobottle")
		addPlasticBottleButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "jog_afterbigjog_givebottle")
	if(state == "jog_afterbigjog_nobottle"):
		saynn("[say=pc]Nah, sorry. I've got nothing.[/say]")

		saynn("She sighs and nods.")

		saynn("[say=jacki]Okay.. well.. I'm gonna go refill my bottle then. Take care.[/say]")

		saynn("And just like that, the exhausted wolfie walks away, her thirst unclenched.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "jog_afterbigjog_givebottle"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		saynn("You give Jacki the "+str(usedItemName)+" and she quickly tries to clench her thirst with it, raising it high above her muzzle and catching the contents onto her tongue and face, her eyes closed.")

		if (plasticBottleFluidID == "Milk"):
			saynn("Even though it's not water in that bottle but breast milk.. Jacki still empties it completely and gets some onto her fur too.")

			saynn("[say=jacki]Ah! So sweet and refreshing. Where did you get milk here? I love the taste.[/say]")

			saynn("You decide that it's best to not tell her the origin of that milk.")

			saynn("[say=jacki]Well, either way, thank you! That helped a lot! I'm gonna go now though.[/say]")

			saynn("You nod and let Jacki jog away.")

		elif (plasticBottleFluidID == "Piss"):
			if (waterLevel <= 2):
				saynn("You decided to be very naughty today and gave Jacki a bottle of piss..")

				saynn("As soon as she makes the first gulp, Jacki realizes that something is wrong and tries to spew everything out. But it's too late, she even gets some of the yellow smelly fluid onto her fur.")

				saynn("[say=jacki]Gross! The fuck is this? Piss?![/say]")

				saynn("You pretend that it was just a mistake.")

				saynn("[say=pc]Oops.. I think I gave you the wrong bottle. My bad.[/say]")

				saynn("[say=jacki]Urgh.. Why do you even have that..[/say]")

				saynn("She spills the rest of the contents onto the floor.. And walks away.")

				saynn("Maybe you can make her get used to the taste if you try hard enough..")

			elif (waterLevel <= 5):
				saynn("You decided to be very naughty today and gave Jacki a bottle of piss..")

				saynn("Jacki sighs when she makes the first gulp.. and then just keeps swallowing it.. probably just to spite you.")

				saynn("[say=jacki]Gross.. I can feel that it's piss from the second I start drinking it.[/say]")

				if (waterLevel  == 5):
					saynn("[say=pc]Then why do you keep drinking it?[/say]")

					saynn("The blush appears on Jacki's face.")

					saynn("[say=jacki]Because.. Just because.. I'm thirsty, okay?[/say]")

					saynn("Jacki covers her wet piss-marked face and walks away.")

				else:
					saynn("She growls at you.")

					saynn("[say=jacki]Gave me piss instead of water again, very funny..[/say]")

					saynn("Makes you wonder why she drinks it at all then. Is her thirst that strong?")

			else:
				saynn("Judging from the yellow color, It's obviously not water in that bottle.. But it's like doesn't care, she eagerly swallows the warm piss while also receiving a little golden shower in the process.")

				saynn("[say=jacki]Ah~.. Refreshing..[/say]")

				saynn("Surprising. Jacki notices your confused stare.")

				saynn("[say=jacki]What? It's better than nothing. Thank you.[/say]")

				saynn("Well, looks like you accidentally turned Jacki into a piss slut. Oh well.")

				saynn("She walks away, proudly wearing that gross scent.")

		elif (plasticBottleFluidID == "GirlCum"):
			saynn("It's not water in that bottle.. but its transparency fools Jacki enough for her to empty the whole thing. Her face is now covered in girlcum..")

			saynn("[say=jacki]A little salty.. but it's not bad. What was in it?[/say]")

			saynn("You decide that it's best if she doesn't know what was in that bottle..")

			saynn("[say=jacki]Well, either way, thank you! That helped a lot! I'm gonna go now though.[/say]")

			saynn("You nod and let Jacki jog away.")

		elif (plasticBottleFluidID == "Water"):
			saynn("Jacki empties half the bottle and pours the rest on her face.")

			saynn("[say=jacki]Ah.. that feels good..[/say]")

			saynn("You smile and grab the bottle back.")

			saynn("[say=jacki]Thank you! That helped a lot! I'm gonna go now though.[/say]")

			saynn("You nod and let Jacki jog away.")
		elif (plasticBottleFluidID == "Cum"):
			saynn("Thick sticky cum starts flowing down Jacki's tongue as she gulps it all up.. She understands what it is way too late..")

			saynn("[say=jacki]Salty.. Um.. Is that.. What I think it is?[/say]")

			saynn("She opens her eyes and sees that she is now covered in seed.")

			if (corruption > 0.7):
				saynn("[say=jacki]You know.. I actually kinda like it.. Lots of protein. Thank you. I'm gonna go now~.[/say]")

				saynn("She licks her lips and walks away proudly.")

			else:
				saynn("[say=jacki]Why did you.. Give me that.. Urgh..[/say]")

				saynn("She coughs and then dashes away! Probably wasn't the best idea. But oh well.")

		else:
			saynn("It's not water in that bottle.. It's some strange fluid. Jacki starts coughing after drinking it.")

			saynn("[say=jacki]That's a weird taste.. Can't even describe it.. Are you sure it's drinkable even?[/say]")

			saynn("You shrug.")

			saynn("[say=jacki]Oh well. Thanks I guess. I'm gonna go now though.[/say]")

			saynn("You nod and let Jacki jog away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "jog_try_piercings"):
		playAnimation(StageScene.SexOral, "lick", {pc="jacki", npc="pc", bodyState={exposedCrotch=true}})
		saynn("[say=pc]I can try to help you.[/say]")

		saynn("[say=jacki]Wruff![/say]")

		saynn("You find a secluded place and get on your knees before the wolfie. As you pull her shorts down, you reveal her unremovable chastity piercings that hold her wet pussy closed shut, preventing any direct penetration. Above it is an untrimmed red bush of pubes.")

		saynn("Certainly a very unique view.")

		saynn("[say=jacki]Do you like how my useless cunt looks?..[/say]")

		saynn("Sure. You nod and bring your mouth close to it. You catch the little cyan bell that's hanging from her clit and tug on it with your teeth, causing her to bite her lip.")

		saynn("[say=jacki]Ngh-h..[/say]")

		saynn("So sensitive. Her stitched-up pussy starts dripping juices onto your nose the more you play with her bell. After it, you roll your tongue out and start dragging it over her constrained folds, trying to lick between the little metal rings that hold her labia closed")

		saynn("Moans begin to escape from the wolfie, she spreads her legs more for you, her paws land on her small breasts and knead them while you are lapping up her juices.")

		saynn("[say=jacki]Mgh-h..[/say]")

		saynn("A few minutes pass. No matter how much you eat her out, she can't reach her orgasm, always just hovering near it instead.")

		saynn("[say=jacki]Huff..[/say]")

		saynn("Looks like stimulating her pussy alone won't be enough. And you obviously can't stop now..")

		addButton("Finger ass", "Finger Jacki's ass as the same time as licking her", "jog_try_piercings_finger")
		if (buttScore >= 4):
			addButton("Anal fisting", "Focus fully on her ass", "jog_try_piercings_fisting")
		else:
			addDisabledButton("Anal fisting", "Jacki needs her ass to be trained more first")
	if(state == "jog_try_piercings_finger"):
		saynn("Your hands are free anyway so you decide to start groping Jacki's ass while you keep dragging your tongue over her closed folds. She doesn't seem to mind, her tail even moves out of the way.")

		saynn("[say=jacki]Wruff..[/say]")

		saynn("That does seem to help so you continue, holding her ass spread while the second hand slides closer and closer to her asshole. As your digits begin to prod it, you begin to feel that it is {jackiButt}.")

		saynn("[say=jacki]Ohh.. Interested in my ass, are you..[/say]")

		if (buttScore >= 5):
			saynn("Her ass is very trained by now so slipping a few digits in doesn't prove to be difficult. Jacki bites her lip again when you manage to fit.. almost your whole palm in that deep stretched asshole..")

		elif (buttScore >= 2):
			saynn("Her ass is somewhat trained by now already so slipping two digits at once is not too difficult. Jacki bites her lip again as you test her asshole more by trying to fit another one.. but two is enough for now.")

		else:
			saynn("Her ass is not very trained so slipping even a single digit inside proves to be difficult. But after massaging her ring enough, you manage to work your way into her tailhole, making Jacki bite her lip hard.")

		saynn("And just by fingering her butt a little bit, Jacki is already moaning more passionately than before, her stitched-up pussy twitching as you explore her inner walls. Her own paws squeeze her little tits harder.")

		saynn("[say=jacki]Fuck-k~.. Harder.. I need this so much..[/say]")

		saynn("So needy. You keep lapping her pussy up while your digits slide in and out of her {jackiButt} ass, never letting her star to close up completely. You can feel that she is close.. so you close your teeth around her bell again and tug on her clit, causing Jacki to suddenly arch her back and produce a loud scream of passion.")

		saynn("[say=jacki]AGH-H!.. ah.. Fuck me-e-e!..[/say]")

		saynn("Her tortured pussy suddenly showers you with Jacki's girlcum, her anus clenching around your fingers so tightly that it cuts off the blood flow to them for a few seconds.")

		saynn("[say=jacki]Yeah-h-h~.. That did it.. Fuck I'm such a slut..[/say]")

		saynn("As pull away from her crotch, Jacki pulls you in for a little short kiss.")

		saynn("[say=jacki]Thank you~. I needed that. Wruff.. I will be at my spot..[/say]")

		saynn("She pulls her shorts up and quickly runs off.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "jog_try_piercings_fisting"):
		playAnimation(StageScene.SexFisting, "tease", {npc="jacki", npcBodyState={exposedCrotch=true}})
		saynn("Time to switch focus entirely. You put Jacki on all fours and take a spot behind her, your hands already groping and kneading that fluffy butt. A single spank makes Jacki throw her head back and moan.")

		saynn("[say=jacki]Wrufff~.[/say]")

		saynn("Your digits find her {jackiButt} tailhole and begin to gently trace around it. With deliberate care, you start to insert a single digit, avoiding putting too much pressure. When that's in, you also add a second, slowly stretching Jacki's asshole wider inch by inch, sending waves of pleasure through her body.")

		saynn("[say=jacki]More.. harder.. Ruin this asshole~.[/say]")

		saynn("So mouthy. You slide in two more digits at once, causing the wolfie to gasp and wag her tail playfully, her anal ring clenching around your intruding fingers. You wiggle your digits inside, trying to fit the last one.. but it proves to be a challenge without some lube. Maybe it's better not to ruin anything yet.")

		saynn("Instead of pushing through, you pull your hand away and collect some of her arousal instead, rubbing it around her ring and coating your digits with it.")

		saynn("[say=jacki]Fuck.. I'm so needy..[/say]")

		saynn("[say=pc]Because you're a buttslut.[/say]")

		saynn("[say=jacki]Wruff~.[/say]")

		addButton("Fist", "Insert the whole fist now", "jog_try_piercings_fisting_fist")
	if(state == "jog_try_piercings_fisting_fist"):
		playAnimation(StageScene.SexFisting, "inside", {npc="jacki", npcBodyState={exposedCrotch=true}})
		saynn("After lubing your fingers up, you return, quickly stretching her asshole with four before proceeding to add the last one. Jacki lowers her head and moans as you manage to slide the whole palm inside, all your digits completely surrounded by the warm inner walls of her ass.")

		saynn("[say=jacki]Yes-s-s~.. Stretch my dirty fuckhole..[/say]")

		saynn("Her body is quivering as it slowly gets used to the size of your hand. You can feel it each time she clenches.. and she clenches a lot, her neglected pussy dripping juices onto the ground.")

		addButton("Thrusts", "Start thrusting your fist in and out", "jog_try_piercings_fisting_thrusts")
	if(state == "jog_try_piercings_fisting_thrusts"):
		playAnimation(StageScene.SexFisting, "sex", {npc="jacki", npcBodyState={exposedCrotch=true}})
		saynn("You turn your hand into a fist to make it even bigger and begin moving it inside Jacki's ass, causing her body to tighten even more around your wrist, new intense pleasure waves washing over her.")

		saynn("[say=jacki]Fuck yeah.. I can probably take an entire horsecock..[/say]")

		saynn("[say=pc]I bet you can, whore.[/say]")

		saynn("Oh wow, calling her dirty names makes her squirm and clench again. But you push through the resistance of her ass, fisting the wolfie so much she sticks her tongue out and starts to drool.")

		saynn("Her moans quickly become more urgent, her need for any kind of release pushing her body to meet your motions, letting you explore and stretch her out deeply. Judging from her pussy twitching and the frequency of her muscles tensing.. you can tell that she is close.")

		addButton("Faster", "Make that wolfie cum", "jog_try_piercings_fisting_faster")
	if(state == "jog_try_piercings_fisting_faster"):
		playAnimation(StageScene.SexFisting, "fast", {npc="jacki", npcBodyState={exposedCrotch=true}})
		saynn("At some point her tailhole gets so stretched, it allows you to ramp up the pace, thrusting your first in and out while the poor wolfie is gripping tightly onto the ground.")

		saynn("[say=jacki]NGhh-hgGh!..[/say]")

		saynn("Her stiched up pussy is pulsing hard.. before releasing a strong stream of her girlcum. She arches her back as you shove your fist as deep as that ass allows.. which turned out to be extremely deep.")

		saynn("[say=jacki]I'm s-such a buttslut-t-t-t..[/say]")

		saynn("She is right about that. While she is busy orgasming from her butt, you just grope her rear more with your free hand. As you withdraw your hands, her body is still trembling. Jacki pants heavily as her destroyed asshole is struggling to close fully.")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("[say=jacki]Thank you-u-u-u.. ah.. wruff-f-f..[/say]")

		saynn("You spank her butt for the last time and get up, leaving her to rest there.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "jog_breed_fuck"):
		playAnimation(StageScene.SexAllFours, "tease", {npc="jacki", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("After you received that key to her piercings, it only makes sense to do this more. You find a secluded spot where you put Jacki on all fours. You pull her shorts down and begin to slowly unlock each padlock that holds her pussy folds together.")

		saynn("[say=jacki]Fuck, I can't wait~.[/say]")

		saynn("After you are finished unlocking her slit, Jacki is already dripping juices onto the ground.")

		addButton("Fuck", "Start fucking her", "jog_breed_fuck_start")
	if(state == "jog_breed_fuck_start"):
		playAnimation(StageScene.SexAllFours, "sex", {npc="jacki", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("One of your hands reaches out and pulls on her ponytail while the other one quickly aligns your {pc.penis} with her needy cunt. One rough thrust spreads Jacki's sensitive folds and stretches her pussy hole enough for you to slide inside.")

		saynn("[say=jacki]Nghh-h!..[/say]")

		saynn("You smack her fluffy ass, making her clench harder while you fuck her.")

		saynn("[say=pc]You like having your pussy fucked?[/say]")

		saynn("[say=jacki]Y-yes! Wruff!![/say]")

		saynn("You smack her butt again and pull on her hair more, making Jacki moan.")

		saynn("[say=pc]More than your ass?[/say]")

		saynn("[say=jacki]Oh.. Both are nice..[/say]")

		saynn("Her answer makes you think like she is still a buttslut at heart. You grab her tail near the base with four digits while the big thumb is prodding her {jackiButt} asshole.")

		addButton("Faster", "Fuck her faster", "jog_breed_fuck_faster")
	if(state == "jog_breed_fuck_faster"):
		playAnimation(StageScene.SexAllFours, "fast", {npc="jacki", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("The faster you pound her slutty pussy, the louder she moans. Fingering her tailhole at the same time makes the poor wolfie squirm and shiver, both her holes pulsing.. until she cums.")

		saynn("Jacki arches her back and sticks her tongue out more, her body shuddering, her slick inner walls gripping your shaft.")

		saynn("[say=jacki]Nghh-h! You're fucking my pussy rough![/say]")

		saynn("The extreme tightness that her slit provides makes you eager to continue thrusting deep inside until your own orgasm begins to draw near..")

		addButton("Cum inside", "Breed Jacki", "jog_breed_fuck_cuminside")
		addButton("Pull out", "Pull your cock out just before you cum", "jog_breed_fuck_pullout")
	if(state == "jog_breed_fuck_cuminside"):
		playAnimation(StageScene.SexAllFours, "inside", {npc="jacki", pcCum=true, npcCum=true, bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("You commit to it, shoving your cock as deep as that wolfie's pussy allows, breaking into her womb before cumming inside, your {pc.cum} stuffing her full to the brim. Your hands keep tugging on her hair and tail, making Jacki feel pain too as you breed her.")

		saynn("[say=jacki]Ngh-h-h! I'm such a whore![/say]")

		saynn("You both are left panting after that quick fuck. You pull out and let Jacki rest on the ground while her used pussy leaking your seed. You grab the key and begin to close up the padlocks, making her pussy folds look like a very tight slit again.")

		saynn("Jacki seems to be satisfied. Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "jog_breed_fuck_pullout"):
		playAnimation(StageScene.SexAllFours, "tease", {npc="jacki", pcCum=true, bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("You decide against breeding that wolfie and pull out just before your cock starts throbbing and covering that ass with strings of your thick {pc.cum}. One of your hands keep tugging on her hair, making Jacki feel pain too as you mark her.")

		saynn("[say=jacki]Ngh-h-h! I'm such a cum whore![/say]")

		saynn("You both are left panting after that quick fuck. Jacki rests on the ground while you begin to close up the padlocks, making her pussy folds look like a very tight slit again.")

		saynn("Jacki seems to be satisfied. Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "jog_anal_fuck"):
		playAnimation(StageScene.SexStanding, "tease", {npc="jacki", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("No need to ask permission anymore. You're here to take it.")

		saynn("With a firm grasp on Jacki's hair, you pin her against the cold surface of some rock, your other hand already yanking her shorts down and aligning your cock.")

		saynn("The bitch's cunt is out of reach. But that doesn't mean she doesn't have any fuckable holes. In fact, her asshole has much more.. potential.. Potential to be stretched and abused.")

		saynn("Jacki is whining softly while you keep her muzzle pressed against stone.. and yet her slit is as wet as it can be.")

		saynn("[say=jacki]Ngh..[/say]")

		saynn("You growl into her ear as your {pc.penis} is already prodding her {jackiButt} tailhole.")

		if (buttScore <= 1):
			saynn("[say=pc]Why are you still so tight, slut? We're gonna change that.[/say]")

			saynn("Her anus ring is clenched hard, making penetration pretty much impossible. But nothing is impossible with some force. You use some of her pussy juices as lube and start trying to shove your member down that pucker with thrusting motions, making Jacki gasp and squirm under you.")

			saynn("[say=pc]Stop clenching already.[/say]")

			saynn("[say=jacki]You're tearing my asshole.. Ah!.. Fuck~..[/say]")

		elif (buttScore <= 3):
			saynn("[say=pc]Still so tight. You need your ass pounded more.[/say]")

			saynn("Her anus ring is clenching hard enough to make penetration pretty tricky. But as you rub some of her pussy juices into her pucker, it relaxes enough for you to start making progress. But Jacki is still squirming under you as you work on stretching on her tailhole.")

			saynn("[say=pc]Stop clenching already.[/say]")

			saynn("[say=jacki]You're tearing my asshole.. Ah!.. Fuck~..[/say]")

		elif (buttScore <= 6):
			saynn("[say=pc]Oh yeah. You're almost a proper buttslut by now.[/say]")

			saynn("After all that training that you did with her butt, her anus ring is now eagerly stretching to accommodate your size. Still, you use some of her pussy juices as lube in order to avoid harming her inner walls too much.. Even if it looks like that's exactly what she wants, Jacki is squirming under you as you work on stretching her out.")

			saynn("[say=pc]Oh yeah, you love this, don't you.[/say]")

			saynn("[say=jacki]You're tearing my asshole.. Ah!.. Fuck~..[/say]")

		else:
			saynn("[say=pc]What a buttslut.[/say]")

			saynn("Her ass is so trained by now, her anus ring is basically sucking you in. You don't even need to use any lube, the slut's inner walls lube themselves up just from her being horny. Jacki is squirming as you easily stretch her out.")

			saynn("[say=pc]Oh yeah, you love this, don't you.[/say]")

			saynn("[say=jacki]You're tearing my asshole.. Ah!.. Fuck~..[/say]")

		addButton("Ram it in", "Start fucking Jacki", "jog_anal_fuck_inside")
	if(state == "jog_anal_fuck_inside"):
		playAnimation(StageScene.SexStanding, "sex", {npc="jacki", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true}})
		if (buttScore <= 1):
			saynn("As you smack her ass, Jacki's tailhole pulses open enough for you to force yourself inside, stretching that ring so wide, the wolfie is producing a cry and scratching the rock in front of her with her claws.")

			saynn("[say=jacki]Ah!..[/say]")

		elif (buttScore <= 3):
			saynn("Carefully, you fight through the resistance of Jacki's tight tailhole, forcing yourself inside, slowly but steadily. The wolfie is only moaning and scratching the rock in front of her with her claws as her ring gets stretched wide.")

			saynn("[say=jacki]Ah..[/say]")

		elif (buttScore <= 6):
			saynn("Jacki's ass is trained enough so you just put a little more pressure and slide your cock inside down that needy hole. The wolfie is moaning softly, her paws gripping the rock in front of her.")

			saynn("[say=jacki]Ah.. nice..[/say]")

		else:
			saynn("Jacki's ass is so trained that you allow yourself to just ram it in, your hips slapping against her fluffy butt as your cock gets plunged deep down that wet needy hole. The wolfie loves it, moaning sluttily and spreading her legs more for you.")

			saynn("[say=jacki]Fuck~..[/say]")

		saynn("You don't wait for her to start begging and already start moving your hips, one of your hands keeps her back pressed against the rock while the second one yanks on her tail to make her meet your thrusts with her ass.")

		saynn("[say=pc]Such a great fucktoy.[/say]")

		saynn("Your dirty language only makes the needy wolfie produce more noises of eagerness, her neglected pussy dripping juices as you rail her {jackiButt} ass.")

		saynn("You hold her firmly as your thrusts are growing more powerful. Jacki's slutty moans fill the space, probably causing passing inmates to question what's going on in this little secluded spot.")

		saynn("It doesn't take long for you to start feeling your orgasm approaching you. The way that fuckhole wraps around your dick is just too good. You can't get her pregnant since.. obviously.. but you can still pull out just to make a mess if you want.")

		addButton("Cum inside", "Stuff that asshole", "jog_anal_fuck_cuminside")
		addButton("Pull out", "Make a mess on Jacki's back", "jog_anal_fuck_pullout")
	if(state == "jog_anal_fuck_cuminside"):
		playAnimation(StageScene.SexStanding, "inside", {npc="jacki", pcCum=true, npcCum=true, bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("No reason to pull gives you a good reason to do the opposite. As your powerful thrusts continue, Jacki's body starts to tremble with overwhelming pleasure. She cums just from having her ass railed.. while you cum from her inner walls stimulating your shaft to the point of no return..")

		saynn("[say=jacki]Yes-s!.. Cum inside that whore's ass![/say]")

		saynn("Your cock throbs as it stuffs her butt full of your sticky seed. Her legs are shaking, just like her tail and arms.")

		saynn("[say=jacki]Nghh-h!..[/say]")

		saynn("As your orgasm ends, you pull out, leaving her wrecked ass to gape and leak your {pc.cum} proudly.")

		saynn("But luckily her ass is not gonna stay like that forever. Jacki moans as her pulsing star eventually closes up, trapping all your jizz inside.")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("[say=jacki]Wruff-f-f..[/say]")

		saynn("You leave the slut alone and walk away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "jog_anal_fuck_pullout"):
		playAnimation(StageScene.SexStanding, "tease", {npc="jacki", pcCum=true, npcCum=true, bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("No reason to pull out.. but you don't need a good reason. As your powerful thrusts continue, Jacki's body starts to tremble with overwhelming pleasure. She cums just from having her ass railed.. while you pull your cock out just before her clenching tailhole brings you over the edge.")

		saynn("[say=jacki]Oh fuck-k..[/say]")

		saynn("The wolfie is busy cumming while your {pc.penis} throbs and shoots your sticky seed all over her ass and back, marking her fur with your {pc.cum}.")

		saynn("As your orgasm ends, you just proceed to admire Jacki's pulsing asshole struggling to close up. She is panting heavily.")

		saynn("[say=jacki]You could have.. inside..[/say]")

		saynn("[say=pc]I choose where to cum, slut. Enjoy.[/say]")

		saynn("[say=jacki]Huff..[/say]")

		saynn("You leave the messy slut alone and walk away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "jog_anal_strapon_pick"):
		saynn("Pick what strapon you wanna use to rail Jacki's ass.")

		addStraponButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "jog_anal_strapon")
	if(state == "jog_anal_strapon"):
		playAnimation(StageScene.SexStanding, "tease", {npc="jacki", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("No need to ask permission anymore. You're here to take it.")

		saynn("You quickly secure a strapon around your waist and then, with a firm grasp on Jacki's hair, you pin her against the cold surface of some rock, your other hand already yanking her shorts down and aligning your rubber toy.")

		saynn("The bitch's cunt is out of reach. But that doesn't mean she doesn't have any fuckable holes. In fact, her asshole has much more.. potential.. Potential to be stretched and abused.")

		saynn("Jacki is whining softly while you keep her muzzle pressed against stone.. and yet her slit is as wet as it can be.")

		saynn("[say=jacki]Ngh..[/say]")

		saynn("You growl into her ear as your strapon is already prodding her {jackiButt} tailhole.")

		if (buttScore <= 1):
			saynn("[say=pc]Why are you still so tight, slut? We're gonna change that.[/say]")

			saynn("Her anus ring is clenched hard, making penetration pretty much impossible. But nothing is impossible with some force. You use some of her pussy juices as lube and start trying to shove your rubber member down that pucker with thrusting motions, making Jacki gasp and squirm under you.")

			saynn("[say=pc]Stop clenching already.[/say]")

			saynn("[say=jacki]You're tearing my asshole.. Ah!.. Fuck~..[/say]")

		elif (buttScore <= 3):
			saynn("[say=pc]Still so tight. You need your ass pounded more.[/say]")

			saynn("Her anus ring is clenching hard enough to make penetration pretty tricky. But as you rub some of her pussy juices into her pucker, it relaxes enough for you to start making progress. But Jacki is still squirming under you as you work on stretching on her tailhole.")

			saynn("[say=pc]Stop clenching already.[/say]")

			saynn("[say=jacki]You're tearing my asshole.. Ah!.. Fuck~..[/say]")

		elif (buttScore <= 6):
			saynn("[say=pc]Oh yeah. You're almost a proper buttslut by now.[/say]")

			saynn("After all that training that you did with her butt, her anus ring is now eagerly stretching to accommodate the size of your toy. Still, you use some of her pussy juices as lube in order to avoid harming her inner walls too much.. Even if it looks like that's exactly what she wants, Jacki is squirming under you as you work on stretching her out.")

			saynn("[say=pc]Oh yeah, you love this, don't you.[/say]")

			saynn("[say=jacki]You're tearing my asshole.. Ah!.. Fuck~..[/say]")

		else:
			saynn("[say=pc]What a buttslut.[/say]")

			saynn("Her ass is so trained by now, her anus ring is basically sucking your strapon in. You don't even need to use any lube, the slut's inner walls lube themselves up just from her being horny. Jacki is squirming as you easily stretch her out.")

			saynn("[say=pc]Oh yeah, you love this, don't you.[/say]")

			saynn("[say=jacki]You're tearing my asshole.. Ah!.. Fuck~..[/say]")

		addButton("Ram it in", "Start fucking Jacki", "jog_anal_strapon_inside")
	if(state == "jog_anal_strapon_inside"):
		playAnimation(StageScene.SexStanding, "sex", {npc="jacki", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true}})
		if (buttScore <= 1):
			saynn("As you smack her ass, Jacki's tailhole pulses open enough for you to force yourself inside, stretching that ring so wide, the wolfie is producing a cry and scratching the rock in front of her with her claws.")

			saynn("[say=jacki]Ah!..[/say]")

		elif (buttScore <= 3):
			saynn("Carefully, you fight through the resistance of Jacki's tight tailhole, forcing yourself inside, slowly but steadily. The wolfie is only moaning and scratching the rock in front of her with her claws as her ring gets stretched wide.")

			saynn("[say=jacki]Ah..[/say]")

		elif (buttScore <= 6):
			saynn("Jacki's ass is trained enough so you just put a little more pressure and slide your rubber cock inside down that needy hole. The wolfie is moaning softly, her paws gripping the rock in front of her.")

			saynn("[say=jacki]Ah.. nice..[/say]")

		else:
			saynn("Jacki's ass is so trained that you allow yourself to just ram it in, your hips slapping against her fluffy butt as your rubber cock gets plunged deep down that wet needy hole. The wolfie loves it, moaning sluttily and spreading her legs more for you.")

			saynn("[say=jacki]Fuck~..[/say]")

		saynn("You don't wait for her to start begging and already start moving your hips, one of your hands keeps her back pressed against the rock while the second one yanks on her tail to make her meet your thrusts with her ass.")

		saynn("[say=pc]Such a great fucktoy.[/say]")

		saynn("Your dirty language only makes the needy wolfie produce more noises of eagerness, her neglected pussy dripping juices as you rail her {jackiButt} ass.")

		saynn("You hold her firmly as your thrusts are growing more powerful. Jacki's slutty moans fill the space, probably causing passing inmates to question what's going on in this little secluded spot.")

		saynn("You don't really feel much stimulation from the strapon other than it pressing on your crotch. But you can sure feel the friction increasing as Jacki's hungry ass is wrapping around your toy tightly. It looks like she is about to cum.")

		addButton("Make her cum", "Stuff that asshole", "jog_anal_strapon_cum")
	if(state == "jog_anal_strapon_cum"):
		playAnimation(StageScene.SexStanding, "inside", {npc="jacki", pcCum=true, npcCum=true, bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("No reason to pull gives you a good reason to do the opposite. As your powerful thrusts continue, Jacki's body starts to tremble with overwhelming pleasure. She cums just from having her ass railed.. while you cum from her inner walls stimulating your shaft to the point of no return..")

		saynn("[say=jacki]Yes-s!.. Cum inside that whore's ass![/say]")

		saynn("Your cock throbs as it stuffs her butt full of your sticky seed. Her legs are shaking, just like her tail and arms.")

		saynn("[say=jacki]Nghh-h!..[/say]")

		saynn("As your orgasm ends, you pull out, leaving her wrecked ass to gape and leak your {pc.cum} proudly.")

		saynn("But luckily her ass is not gonna stay like that forever. Jacki moans as her pulsing star eventually closes up, trapping all your jizz inside.")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("[say=jacki]Wruff-f-f..[/say]")

		saynn("You leave the slut alone and walk away.")

		addButton("Continue", "See what happens next", "endthescene_unequpstrapon")
	if(state == "jog_sounding"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		if (soundScore <= 0):
			saynn("Jacki's pussy has those piercings in it that hold it shut.. but you wonder if you can still reach one of her little holes.. her urethra in particular.")

			saynn("[say=pc]Have you heard of sounding?[/say]")

			saynn("[say=jacki]The what?[/say]")

			saynn("Huh. Jacki has absolutely zero experience in this.. So you might have to start slow.")

			saynn("[say=pc]Would you be interested in that?[/say]")

			saynn("[say=jacki]Anything that can make this feeling go away..[/say]")

			addButton("Sounding intro", "Introduce Jacki to sounding", "jog_sounding_intro")
		elif (soundScore <= 2):
			saynn("Jacki has some sounding experience.. but not that much yet. Gives you a good reason to train her urethra a little.")

			saynn("[say=pc]Let's do some sounding.[/say]")

			saynn("[say=jacki]Oh?[/say]")

		elif (soundScore <= 5):
			saynn("Jacki is getting quite experienced in sounding. This might be a good opportunity to test her limits and play with her urethra.")

			saynn("[say=pc]Let's do some sounding.[/say]")

			saynn("[say=jacki]Oh, you're gonna stretch out my little hole~?[/say]")

			saynn("She seems to be liking that idea.")

		else:
			saynn("Jacki is probably a total slut for sounding by now. As soon as you say..")

			saynn("[say=pc]Let's do some..[/say]")

			saynn("She already cuts you off with..")

			saynn("[say=jacki]OH! You're gonna fuck my little pisshole~? Stretch it wide and deep~?[/say]")

			saynn("The wolfie can't live without sounding anymore it seems.")

		if (soundScore >= 1):
			addButton("Dildo", "Play with the toy in her urethra", "jog_sounding_dildo")
			if (soundScore >= 3):
				addButton("Finger", "Try to use a finger instead", "jog_sounding_finger")
			else:
				addDisabledButton("Finger", "Jacki is not ready for this yet")
		addButton("Never mind", "You changed your mind", "endthescene")
	if(state == "jog_sounding_intro"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="jacki", bodyState={exposedCrotch=true}})
		saynn("You and Jacki find a secluded spot behind some tall bushes. You think about it a bit and realize that a blindfold might help to keep the wolfie calm.")

		saynn("[say=pc]I'm gonna blindfold you, alright?[/say]")

		saynn("[say=jacki]Um.. sure.[/say]")

		saynn("She didn't even ask why. But you feel like you should explain anyway.")

		saynn("[say=pc]I want you to focus on how it will feel, not how it will look.[/say]")

		saynn("Jacki nods, allowing you to tie a little piece of cloth around her eyes. Then you help her to get down on some stone tiles before pulling her shorts down. The first thing that you see is her red bush of pubic hair that she clearly keeps untrimmed.")

		saynn("[say=pc]You're not shaving, wolfie?[/say]")

		saynn("[say=jacki]I've given up, piercings make it too hard.. but I kinda like the look now. Fits the whole.. useless cunt thing..[/say]")

		saynn("Looks like she is slowly getting used to that. But that's besides the point. You spread Jacki's legs more, uncovering the moist stitched up slit. As you caress Jacki's inner sides of her thighs, she starts to wiggle a little, her breath getting deeper.")

		saynn("[say=pc]I'm gonna start touching.[/say]")

		saynn("[say=jacki]Wruff..[/say]")

		saynn("She is probably still confused about what sounding even is. Your digits land on her folds and gently part her labia as much as the metal rings allow.. which is not very much. Still, your action reveals her urethral opening.. that still seems to have a little rod stuck in it. A rod that is attached by a little chain to her clit ring. Touching it makes the wolfie squirm more.")

		saynn("[say=pc]You are still wearing it in your urethra?[/say]")

		saynn("[say=jacki]Um.. I can't throw it out because it's connected.. but it also makes too much noise when left out to dangle.. So.. yeah. Why?[/say]")

		saynn("So Jacki does have experience. She just doesn't know it yet.")

		addButton("Rod", "Focus on it", "jog_sounding_intro_rod")
	if(state == "jog_sounding_intro_rod"):
		playAnimation(StageScene.GivingBirth, "birth", {pc="jacki", bodyState={exposedCrotch=true}})
		saynn("Without saying anything, you grab onto that little chain.. and begin to tug on it, gently pulling the rod out. Jacki is quick to whine.")

		saynn("[say=jacki]Nhh!.. My.. hole.[/say]")

		saynn("Obviously what you're doing is quite dangerous.. so you are taking it very slow.")

		saynn("[say=pc]Tell me if it hurts too much.[/say]")

		saynn("[say=jacki]It's.. I can certainly feel it.. moving inside.[/say]")

		saynn("Plop. As you pull it out completely, you realize that the rod has the shape of a small canine dildo. It's small, smaller than your pinky finger even.. but still has a little knot at its base. Jacki is certainly quite kinky if she pulls it out each time she needs to pee.")

		saynn("[say=jacki]So what are you gonna..[/say]")

		saynn("You cut her off by aligning the little dildo with her urethra again and proceeding to prod her sensitive spot.")

		saynn("[say=jacki]Ah..[/say]")

		saynn("There is no rush, you take your time, massaging the entering with the pointy tip.. until the little hole allows it inside. Such a simple action.. and yet it makes Jacki's toes curl, her paws holding onto the stone tiles tightly.")

		saynn("With small deliberate pushes, you slide that dildo deeper within Jacki's urethra. Being unable to see makes her focus on the tactile sensations more.")

		saynn("Slowly, you slide inside almost the full length.. apart from the knot. But with a little extra pressure, it slips inside too, causing Jacki to arch her back a little in the process.")

		saynn("[say=jacki]Aw fuck~.. Feels so different when someone else does it..[/say]")

		saynn("You continue, slowly withdrawing the toy before working it back inside, each motion sending waves of weird sensations through Jacki's body.. but not the unpleasant kind. Her moans and desperate whimpers fill the space..")

		saynn("[say=jacki]Please.. harder.. I so wanna..[/say]")

		saynn("Despite what she says, you can already notice the skin becoming red near her urethra.. so you slide the little dildo fully inside and call it there.")

		saynn("[say=pc]Not today.[/say]")

		saynn("[say=jacki]Aw..[/say]")

		saynn("You pat the wolfie and help her to get up, your hands untying her blindfold.")

		addButton("Continue", "See what happens next", "endthescene_freejackieyes")
	if(state == "jog_sounding_dildo"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="jacki", bodyState={exposedCrotch=true}})
		saynn("You and Jacki find a secluded place behind some tall bushes and prepare yourself for this. Jacki pulls her shorts down and spreads her legs for you, exposing her wet pussy slit that is forced closed with some unremovable chastity piercings.")

		saynn("[say=pc]So eager.[/say]")

		saynn("[say=jacki]Here.. I'm usually using this.[/say]")

		saynn("She hands you a little tube of water-based lube. Huh. That will certainly help. You take a spot between her legs and use your digits to carefully spread Jacki's labia as much as her piercings allow, exposing the little plugged urethra.")

		saynn("You carefully pull that dildo-shaped sounding rod out and apply some lube to it. The wolfie watches intently, her anticipation growing with each passing moment.. just like the wetness of her pussy.")

		addButton("Continue", "See what happens next", "jog_sounding_dildo_cum")
	if(state == "jog_sounding_dildo_cum"):
		playAnimation(StageScene.GivingBirth, "birth", {pc="jacki", bodyState={exposedCrotch=true}})
		if (soundScore <= 1):
			saynn("Jacki's little hole is still quite tight so sliding the toy in it takes some patience. You start off slow, working in just the pointy tip at first, before proceeding to slide it deeper and deeper.")

		elif (soundScore <= 3):
			saynn("Jacki's little needy hole is a bit trained by now, allowing you to slide the dildo-shaped rod inside with relative ease. Still, this hole wasn't really designed to be stretched so stretching it will take some time.")

			saynn("?els")

			saynn("Jacki's little needy pisshole is quite stretchy by now so sliding the dildo-shaped rod inside was quite easy, her urethra is just begging to be stretched wide.")

		saynn("Jacki's body welcomes the intrusion, she lets out a cute moan, her breath becomes deep as you slide the toy further inside her.")

		saynn("[say=jacki]Yeah~.[/say]")

		saynn("You begin to fuck her urethra with the little dildo, creating a rhythm that stimulates her in the most unusual way. Jacki's hips are rocking in time with your actions, the sensations are causing her to start moaning again and again.")

		if (lust > 0.9):
			saynn("[say=jacki]Ah~.. Keep doing it.. keep fucking the hole that was never supposed to be fucked~.[/say]")

		else:
			saynn("[say=jacki]Ah.. Feels so good..[/say]")

		saynn("Her pussy twitches more and more, her muscles tensing up as you keep pleasuring her.. arguably wrong.. hole. And yet, she is actively squirming while her orgasm is approaching her, building like a tidal wave..")

		saynn("[say=jacki]Fuck-k~..[/say]")

		saynn("As the climax crashes over Jacki, her body starts shaking from the immense pleasure. You use this moment to slide the full length of the toy inside, including the little knot, and holding it there. Getting so deeply stimulated makes Jacki throw her head back and grab onto the ground tightly, her urethra pulsating, probably trying to squirt something out.. but the dildo prevents it.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("When Jacki finally comes down from her orgasmic high, you offer her some headpats")

		saynn("[say=jacki]Wruff-f-f.. Thank you-u-u..[/say]")

		saynn("And just like that, you leave the wolfie alone to rest and come back to senses.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "jog_sounding_finger"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="jacki", bodyState={exposedCrotch=true}})
		saynn("Jacki's urethra is quite trained by now, allowing you to try something more.. kinky.")

		saynn("You bring her into a secluded place and position her on the ground. Jacki pulls her shorts down and spreads her legs for you, exposing her bush and the stitched-up pussy slit. You spread her folds as much as the piercings allow and carefully withdraw the canine cock-shaped sounding rod out of her pisshole and let it dangle on its chain.")

		saynn("[say=jacki]Wruff?[/say]")

		saynn("No need for lube when the wolfie is so needy. You gather some of her arousal onto your digits and begin rubbing her little hole, trying to insert your index finger. It's way bigger than that toy that was in there so Jacki is suddenly squirming a lot.")

		saynn("[say=jacki]Nh-h.. kinky.. Yeah.. keep stretching it..[/say]")

		addButton("Continue", "See what happens next", "jog_sounding_finger_cum")
	if(state == "jog_sounding_finger_cum"):
		playAnimation(StageScene.GivingBirth, "birth", {pc="jacki", bodyState={exposedCrotch=true}})
		saynn("Soon enough, you manage to work inside the tip of your digit, making that urethra look unnaturally stretched. But you don't stop there, gradually applying more pressure until you manage to slide your finger inside completely.")

		saynn("[say=jacki]Nghh-h-h.. fuck me..[/say]")

		saynn("And fuck her you do, wiggling that finger inside and proceeding to move it back and forth, fingering Jacki's pisshole. Her body responds by squirming and creating an arch, little moans escaping her muzzle.")

		saynn("That's not what this hole is supposed to be for.. but you don't care. You keep pounding it at an increasing pace, making Jacki's pussy twitch and her anus clench. That hole is extremely sensitive.. its inner walls are clenching around your finger so tightly you have to fight the friction.")

		saynn("[say=pc]Come on, slut. Cum for me.[/say]")

		saynn("[say=jacki]F-fuck!.. Fuck-fuck-k..[/say]")

		saynn("As Jacki reaches the peak, her body shudders with the force of her orgasm. You stimulate her so much that a burst of transparent juices pushes your finger out as Jacki squirts all over the floor. It's an explosive release that leaves her gasping for air and trembling hard.")

		saynn("You continue to gently stimulate around her pisshole that is now struggling to close, pulsing instead under your touch.")

		saynn("[say=jacki]That felt so good.. I wouldn't mind you tearing my little hole completely~.[/say]")

		saynn("So lusty..")

		saynn("[say=pc]Good little slut. I'd rather preserve your ability to hold in piss.[/say]")

		saynn("[say=jacki]Aw-w.. Wruff..[/say]")

		saynn("And just like that, you leave the wolfie alone to rest and come back to senses.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_creepfollow"):
		playAnimation(StageScene.Solo, "stand", {pc="jacki"})
		saynn("You decide to wait until Jacki stops doing exercises and gets up. She quickly wipes any dirt and dust off her clothes and heads somewhere.")

		if (!getFlag("JackiModule.jackiGotFollowed")):
			saynn("You don't really know yet what Jacki usually does when she is not at the gym area.")

		else:
			saynn("You know the rough route that Jacki usually takes when she is jogging. And you can take advantage of that if you want.")

		addButton("Just watch", "Observe Jacki", "do_creepfollow_follow")
		if (getFlag("JackiModule.jackiGotFollowed")):
			addButton("Block path", "Find a good spot to block Jacki's path", "do_creepfollow_block")
		addButton("Nevermind", "Let Jacki go whenever she wants", "endthescene")
	if(state == "do_creepfollow_follow"):
		playAnimation(StageScene.Solo, "jog", {pc="jacki"})
		aimCameraAndSetLocName("yard_eastCorridor")
		GM.pc.setLocation("yard_eastCorridor")
		saynn("You quietly follow Jacki, trying to stay in the shadows of tall greenery when can. After leaving the gym, Jacki switches from a normal walk to a jog. Huh, looks like this is her way of staying fit.")

		saynn("Or maybe this just gives her a small semblance of freedom. Either way, you step behind as fast as you can without raising suspicion.")

		saynn("Jacki's lithe figure gracefully follows the stone pathways as she moves through the yard. Devious thoughts come into your mind as you watch her body move. Bad thoughts? Come on, the slut clearly wants it herself. Otherwise she wouldn't be jogging past all those secluded or isolated spots..")

		if (corruption > 0.4):
			saynn("And yeah, you do notice that Jacki is swaying her ass a little wider than usual.")

		if (lust > 0.7):
			saynn("Occasionally you notice little wet spots on the stone pathway.. clearly Jacki's.")

		saynn("At some point you begin to think that Jacki senses your presence behind her back. She trusts her intuition and increases her pace, her tail flicking with a mixture of uneasy and.. curiosity.")

		saynn("Well. That should be enough info to figure out her route. Jacki is going on a second lap anyway.")

		if (getFlag("JackiModule.jackiReceivedHorsecockDildo")):
			saynn("Wait. Is that moans that you hear?")

		addButton("Leave", "Enough being creepy", "endthescene")
		if (getFlag("JackiModule.jackiReceivedHorsecockDildo")):
			addButton("Moans", "Follow them", "do_creepfollow_horsedildo")
		else:
			addDisabledButton("Moans", "Jacki needs to have a horsecock dildo")
	if(state == "do_creepfollow_horsedildo"):
		aimCameraAndSetLocName("yard_vaulthere")
		GM.pc.setLocation("yard_vaulthere")
		playAnimation(StageScene.Solo, "struggle", {pc="jacki", bodyState={exposedCrotch=true}})
		saynn("You follow the faint noises that are coming from some secluded corner of the yard.. until you stumble upon something quite interesting.")

		saynn("It's Jacki. You catch her during the moment when her shorts are pulled. She hasn't spotted you yet luckily, allowing you to see what she is doing.")

		saynn("The wolfie is in the middle of fun times it seems. She is trying her best to rub her pussy but the chastity piercings make it very awkward to rub her folds.")

		saynn("[say=jacki]Huff..[/say]")

		saynn("And since her clit is pierced and has two little chains dangling from it, rubbing it doesn't bring that much pleasure either. Jacki is wet.. and desperate.")

		saynn("After some time, she gives up and starts moving rocks around, uncovering.. a stash. A stash that has your gift in it.. the giant horsecock.")

		saynn("Jacki sighs.. and places it on the floor, its wobbly tip already makes her mind rush.")

		addButton("Continue", "See what happens next", "do_creepfollow_horsedildo_start")
	if(state == "do_creepfollow_horsedildo_start"):
		playAnimation(StageScene.HorsecockDildoSex, "tease", {pc="jacki", bodyState={exposedCrotch=true}})
		if (buttScore <=2):
			saynn("After placing the hefty toy on the ground, Jacki positions her body above it. At first, she lets the big flared tip brush against her pussy.. but the piercings are relentless, keeping her pussy closed no matter how hard she tries.")

			saynn("[say=jacki]I guess I have to..[/say]")

			saynn("And so she shifts and angles her body a bit such that now her other hole is being prodded by the giant dildo.. her {jackiButt} asshole.")

			saynn("Jacki spreads her legs more.. and begins trying to lower herself onto the giant rubber shaft. It proves to be quite a challenge, her pucker is clenching tightly when Jacki is forcibly trying to stretch it so wide.")

			saynn("[say=jacki]Ngh-h.. come on-n-n.. I need this..[/say]")

			saynn("The girl is trying, she truly does. But each time her asshole begins to stretch to accommodate that flared tip.. the discomfort is making her whine and pull away instead.")

			saynn("[say=jacki]Huff..[/say]")

			saynn("Jacki gives up. Looks like she will need her butt trained first.. or a set of helping hands.")

			addButton("Leave", "No need to make it worse", "endthescene")
			addButton("Apply force", "Step in and force Jacki to take that toy", "do_creepfollow_horsedildo_force")
		elif (buttScore <= 6):
			saynn("After placing the hefty toy on the ground, Jacki positions her body above it. She knows well enough that she won't be able to ride it with her pussy so she aligns it with her {jackiButt} asshole.")

			saynn("[say=jacki]Here goes nothing..[/say]")

			saynn("She angles herself a little better.. and begins trying to lower herself onto the big ass toy. It proves to be quite a challenge, her pucker is clenching tightly when Jacki is forcibly trying to stretch it so wide. But, inch by inch, Jacki is slowly stretching herself wider..")

			addButton("Continue", "See what happens next", "do_creepfollow_horsedildo_ride")
			addButton("Apply force", "Step in and force Jacki to take that toy", "do_creepfollow_horsedildo_force")
		else:
			saynn("After placing the hefty toy on the ground, Jacki positions her body above it. She guides the flared tip straight to her {jackiButt} asshole, angling her body just right.")

			saynn("[say=jacki]Here goes everything~.[/say]")

			addButton("Continue", "See what happens next", "do_creepfollow_horsedildo_ride")
			addButton("Apply force", "Step in and force Jacki to take that toy", "do_creepfollow_horsedildo_force")
	if(state == "do_creepfollow_horsedildo_force"):
		playAnimation(StageScene.HorsecockDildoSex, "inside", {pc="jacki", bodyState={exposedCrotch=true}})
		saynn("She will never sit on it like this.. so you decide to help.")

		saynn("Swiftly but silently, you approach Jacki from behind.. and slip one hand around her waist while the second one grabs her by the hair.")

		saynn("[say=jacki]Eep![/say]")

		saynn("Jacki jerks to the side, spooked by your sudden appearance. But you pull her back.")

		saynn("[say=pc]Where do you think you're going?[/say]")

		saynn("[say=jacki]H-hey!.. Let me go. What are you doing?![/say]")

		saynn("[say=pc]Helping you with my gift.[/say]")

		saynn("Her eyes become wide when you proceed to pull her body down, applying stretching to overcome the tightness of Jacki's {jackiButt} asshole.")

		saynn("[say=jacki]Ah.. H-hey.. w-wait! It hurts.. Somebody![/say]")

		saynn("A loud cry for help tries to escape from her.. but one of your hands lands on her muzzle and holds it shut.")

		saynn("[say=pc]Shut up, whore. I'm only helping you.[/say]")

		saynn("[say=jacki]Nh-h-h!!..[/say]")

		saynn("Looks like the amount of force that you are applying isn't enough. Jacki's asshole is stretching but the flared tip is still too thick for her to take. You don't stop putting more pressure though, causing Jacki to start squirming and flailing her arms.")

		saynn("And soon enough, the fat flared part pops inside. Having even just it inside Jacki makes her asshole look incredibly stretched and have a red tint, her pulsing pussy getting squished down.")

		saynn("[say=pc]There we fucking go. I knew that there is a buttslut in you.[/say]")

		saynn("Tears stream down Jacki's cheeks. She is whining as you keep 'helping' her take more of that giant shaft. Poor wolfie is shaking.. until her pussy suddenly squirts all over the ground, the crazy mix of sensations causing an overstimulation.")

		saynn("[say=pc]Enjoy.[/say]")

		saynn("And just like that, you pull your hands away, keeping Jacki sitting on the toy. It's not fully inside yet.. but at least some of it is.")

		saynn("[say=jacki]Huff-f-f.. my ass.. so stretched..[/say]")

		saynn("Jacki gradually pulls herself up.. until the flared tip slips out with a wet 'plop' noise, leaving her irritated asshole to gape.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_creepfollow_horsedildo_ride"):
		playAnimation(StageScene.HorsecockDildoSex, "sex", {pc="jacki", bodyState={exposedCrotch=true}})
		saynn("A cute stifled moan escapes Jacki's lips as the horsecock dildo suddenly stretches her anal ring for her to sit on it. Her body is shaking as she is struggling to get used to this feeling of being full.")

		saynn("[say=jacki]Fuck-k.. wish it was a real one..[/say]")

		saynn("And so she proceeds to ride that silicon shaft with her ass, pulling herself up just to bring her body down onto it. Her pussy is looking quite squished in the process, the toy's size is taking up all the space.")

		saynn("Pretty bold of her to do this in the yard where anyone can spot her. But maybe she likes the thrill that comes with that. The girl is certainly becoming quite horny and putting up an incredible show.")

		saynn("More stifled moans escape from Jacki, her legs begin to shake again, her pussy pulsing.. until a shower of girlcum bursts from it.")

		saynn("[say=jacki]Yes-s-s-s~..[/say]")

		saynn("The wolfie throws her head back and lets her tailhole try to clench around the giant shaft, most of which is inside her.")

		saynn("Only when her anal orgasm is over and her senses begin to return to her, Jacki leans her body forward, causing the toy to slip out with a 'plop' noise when it gets tilted to its side.")

		saynn("Time to go before she spots you.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_creepfollow_block"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		aimCameraAndSetLocName("yard_vaulthere")
		GM.pc.setLocation("yard_vaulthere")
		saynn("You let Jacki follow her normal route while you yourself head straight for one of the secluded spots.. Spots that she usually passes. It's a dead end.. which is perfect.")

		saynn("The shadow between some tall bushes is your best friend. A few minutes later you hear a familiar noise of someone's hindpaws stepping on a stonepath at a pace that's faster than normal walking. Good.")

		saynn("You wait for them to rush past you before stepping out and blocking the path. Yeah, it's Jacki.")

		saynn("She runs into you on her way back.")

		if (corruption > 0.95):
			saynn("[say=jacki]Oh, hey there, wruff~. I thought you would never force me again~.[/say]")

			saynn("Looks like you corrupted the girl into liking this..")

		elif (corruption > 0.6):
			saynn("[say=jacki]Let's.. let's just get it over with.[/say]")

			saynn("Looks like she understands what you are gonna do. Will she resist though?")

		else:
			saynn("Jacki gives you a strange look and tries to jog past.. but you are like a wall.")

			if (!getFlag("JackiModule.jackiFirstTimeBlocked")):
				setFlag("JackiModule.jackiFirstTimeBlocked", true)
				saynn("[say=jacki]Um.. what are you doing?[/say]")

				saynn("Her voice sounds frustrated.")

				saynn("[say=jacki]Were you following me? Why are you so interested in where I jog?[/say]")

			else:
				saynn("[say=jacki]You.. again..[/say]")

				saynn("She sounds desperate.. But she knew that this would happen again.")

				saynn("[say=jacki]Can we not maybe?..[/say]")

		addButton("Grab", "Grab Jacki by the neck", "do_grab")
		addButton("Let her go", "You changed your mind", "do_grab_letgo")
	if(state == "do_grab_letgo"):
		playAnimation(StageScene.Solo, "jog", {pc="jacki"})
		saynn("At the last possible moment.. you decide to change your mind and let Jacki go by stepping out of her way.")

		if (corruption > 0.95):
			saynn("[say=jacki]Aw.. You're not gonna pound my ass or stretch my pisshole?[/say]")

			saynn("She sounds.. genuinely disappointed.")

			saynn("[say=jacki]Not even some choking?..[/say]")

			saynn("You shake your head and just invite Jacki to jog away. She sighs and obeys.")

		elif (corruption > 0.3):
			saynn("[say=jacki]Oh.. you're not gonna force me? Why not?[/say]")

			saynn("She blushes when realizes what she said.")

			saynn("[say=jacki]I mean.. What changed your mind?[/say]")

			saynn("You're obviously not gonna explain yourself. So you just let her jog away.")

		else:
			saynn("Jacki quickly walks past and then switches to jogging.")

			saynn("[say=jacki]..what a creep.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_grab"):
		addCharacter("jacki", ["naked"])
		playAnimation(StageScene.Choking, "idle", {npc="jacki", npcBodyState={exposedCrotch=true}})
		saynn("You suddenly grab Jacki by the neck, your hand squeezing her throat just above the collar. All the while she tries to pull your hands off her neck with so little strength.. that she might as well just be suggesting you.")

		if (corruption > 0.95):
			saynn("[say=jacki]Force m-me..[/say]")

		elif (corruption > 0.6):
			saynn("[say=jacki]Not t-too rough..[/say]")

			saynn("It seems the wolfie knows that this won't end well. She does her best to pry your digits off her neck.")

		else:
			saynn("[say=jacki]Hey.. L-let go.. I'm gonna scream..[/say]")

			saynn("Not while you choke her, she is not. She does her best to pry your digits off her neck and even uses her legs to kick you.")

		saynn("While she is busy resisting, you use your other hand to forcibly pull her shorts down, exposing Jacki's red bush between her legs as well as her stitched up pussy that has a bell dangling from her clit piercing and also a little something in her urethra.")

		saynn("None of this is gonna be pretty..")

		addButton("Anal fisting", "Make that slut take your whole fist", "do_grab_fisting")
		addButtonWithChecks("Anal", "Fuck Jacki's ass", "do_grab_anal", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Strapon anal", "Fuck Jacki's ass with a strapon", "do_grab_strapon_pick", [], [ButtonChecks.HasStraponAndCanWear])
		addButton("Sounding", "Jacki has something in her pisshole..", "do_grab_sounding")
		if (soundScore >= 2):
			addButtonWithChecks("Urethra fuck", "There is still a way to fuck her pussy even if it's stiched up.. It just won't be pretty", "do_grab_urethra_fuck", [], [ButtonChecks.HasReachablePenis])
		else:
			addDisabledButton("Urethra fuck", "Jacki's needs more experience with sounding or this will kill her")
	if(state == "do_grab_fisting"):
		playAnimation(StageScene.SexFisting, "tease", {npc="jacki", npcBodyState={exposedCrotch=true}})
		saynn("Enough playing around. You throw Jacki onto the ground and holds her in place with one hand.. while the second reaches for her wolf tail and yanks it high.")

		saynn("The wolfie whines as you put her {jackiButt} ass on full display. Then you forcibly make her spread her legs more, giving you more access.")

		if (buttScore <= 3):
			saynn("Prodding Jacki's tailhole with a few digits makes her squirm.. She is clenching tight, preventing any penetration.")

		elif (buttScore <= 6):
			saynn("Prodding Jacki's tailhole with a few digits makes her squirm.. She is clenching tight but her asshole is somewhat used to being penetrated by now.")

		else:
			saynn("Prodding Jacki's tailhole with a few digits makes her squirm.. She is making her best attempts to clench.. but her asshole is loose you can probably fit more than one fist in there.. and it's even lubricating itself in response to the stimulation.")

		if (buttScore <= 0):
			if (corruption > 0.5):
				saynn("[say=jacki]Ohh.. What are you gonna do to my virgin asshole..[/say]")

			else:
				saynn("[say=jacki]H-hey! I don't do butt stuff![/say]")

		elif (buttScore <= 3):
			if (corruption > 0.5):
				saynn("[say=jacki]Are you gonna stretch my tight asshole more?[/say]")

			else:
				saynn("[say=jacki]H-hey! That's my ass![/say]")

		elif (buttScore <= 6):
			if (corruption > 0.5):
				saynn("[say=jacki]If you keep this up I will become a buttslut..[/say]")

			else:
				saynn("[say=jacki]H-hey! Stop! My ass is trained enough already..[/say]")

		else:
			if (corruption > 0.5):
				saynn("[say=jacki]Shove your whole fist into this buttslut![/say]")

			else:
				saynn("[say=jacki]H-hey! You already made my ass loose, what more do you want..[/say]")

		if (buttScore <= 3):
			saynn("Inserting fingers one by one? Fuck that. You quickly spit on your clenched fist and start trying to stretch Jacki's asshole with it. The anal ring is extremely tight which makes this process hard.. but you keep pushing through her resistance.. All the while Jacki is arching her back, her legs shaking, whining escapes from her muzzle.")

		elif (buttScore <= 6):
			saynn("Inserting fingers one by one? Fuck that. You quickly spit on your clenched fist and start trying to stretch Jacki's asshole with it. Her anal ring is used to small penetrations.. but a whole fist is still too much for it.. Jacki is whining while her legs are shaking")

		else:
			saynn("Inserting fingers one by one? Fuck that. You gather some of Jacki's arousal onto your fist and start trying to stretch her asshole with it. And surprisingly, you don't feel much resistance. Moans escape from Jacki as you slowly work that fist in, inch by inch..")

		addButton("Continue", "See what happens next", "do_grab_fisting_fisting")
	if(state == "do_grab_fisting_fisting"):
		if (buttScore <= 6):
			playAnimation(StageScene.SexFisting, "sex", {npc="jacki", npcBodyState={exposedCrotch=true}})
		else:
			playAnimation(StageScene.SexFisting, "fast", {npc="jacki", npcBodyState={exposedCrotch=true}})
		if (buttScore <= 3):
			saynn("A loud cry escapes from Jacki as her asshole gives you enough leeway to shove your whole fist and hand inside it. Poor wolfie is whining and whimpering as you proceed to puppeteer her, forcing your hand even deeper while the second one is holding her in place.")

			saynn("She is clenching tight.. but you keep adding more pressure, forcing your way through her resistance.")

			saynn("[say=jacki]Fu-uck-k.. you're tearing my ass..[/say]")

			saynn("And yeah.. you notice some minor bleeding already. Doing this to an untrained butt will tend to do that.. Still, it's just extra lube in the end.")

		elif (buttScore <= 6):
			saynn("A loud cry escapes from Jacki as you manage to stretch her asshole enough to shove your whole fist and hand inside. Poor wolfie is whining and whimpering from the discomfort caused by your roughness. Your second hand is holding her pinned while you make her get used to this painful feeling.")

			saynn("It's not as bad as it could be, training Jacki's ass did make it somewhat stretchy. She is clenching tight.. but you keep adding more pressure, forcing your way through her resistance.")

			saynn("[say=jacki]Fu-uck-k.. you're tearing my ass..[/say]")

		else:
			saynn("A passionate cry escapes from Jacki as you work your whole fist into her asshole, stretching it extremely wide. Poor wolfie is whining and whimpering from the discomfort caused by your roughness. Your second hand is holding her pinned while you slide your forearm inside too.")

			saynn("And wow, her trained asshole is practically sucking you in. She is trying to clench.. but you find almost no resistance.")

			saynn("[say=jacki]Fuck-k~.. you're tearing my ass..[/say]")

		saynn("After showing your hand inside, you begin moving it back and forth, fucking Jacki's {jackiButt} ass like that. It doesn't take long for the poor wolfie to start shivering and squirming, her noises getting louder and longer.")

		saynn("It's so hot inside her at the moment. Soon enough, her useless pussy suddenly starts squirting all over the ground, her inner walls kneading your hand.")

		saynn("[say=jacki]NGhGhh-h!..[/say]")

		saynn("Looks like the wolfie is quickly losing touch with reality, her body about to flop before you catch her and put her chest on the floor carefully.")

		addButton("Pull fist out", "Enough fisting", "do_grab_fisting_enoughfist")
	if(state == "do_grab_fisting_enoughfist"):
		playAnimation(StageScene.SexAllFours, "teaseflop", {npc="jacki", pc="pc", npcBodyState={exposedCrotch=true}})
		saynn("As you pull your wet fist out of her ass, that stretched ring is left gaping wide open. Jacki moans each time she tries to close it.")

		saynn("[say=jacki]Nhh-h..[/say]")

		saynn("Her eyes show.. a weird kind of bliss.")

		saynn("[say=pc]What a whore.[/say]")

		saynn("Looks like it will take her a while to recover after that. So you leave her at that.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_grab_anal"):
		playAnimation(StageScene.SexBehind, "tease", {npc="jacki", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("That girl is not walking away unbroken. You stop choking her.. just so you can push her down and then pin her with the weight of your own {pc.thick} body. One of your hands holds her face pressed into the ground while the second already aligns your {pc.penis} with her {jackiButt} asshole.")

		if (buttScore <= 0):
			saynn("Jacki feels your cock prodding her super tight star.. and does her best to resist, trying to crawl away from under you.")

			saynn("[say=jacki]H-hey.. I don't do butt stuff.. please..[/say]")

			saynn("Sounds like not your problem. You just smack her against the floor to keep her from resisting while also putting more strain on her virgin asshole.")

			saynn("[say=pc]Shut up and quit clenching.[/say]")

			saynn("[say=jacki]Ow.. ah.. N-no..[/say]")

			saynn("Well, she asked for it.")

		elif (buttScore <= 3):
			saynn("Jacki feels your cock prodding her tight star.. and keeps resisting, trying to crawl away from under you. She has some experience but it's obvious that she isn't eager to receive more today.")

			saynn("[say=jacki]H-hey.. Not my butt.. please..[/say]")

			saynn("It's not like she got any other holes to fuck between her legs. You just smack her against the floor to keep her from resisting while also putting more strain on her tight asshole.")

			saynn("[say=pc]Shut up and quit clenching.[/say]")

			saynn("[say=jacki]Ow.. ah.. N-no..[/say]")

			saynn("Well, she asked for it.")

		elif (buttScore <= 6):
			saynn("Jacki feels your cock prodding her anal star that received some training by now. But having a stretched asshole doesn't make her resist any less than before. The whore is trying to throw you off her.. but she isn't strong enough.")

			saynn("[say=jacki]That's my asshole.. please..[/say]")

			saynn("She is not wrong. But she sure is annoying. You smack her against the floor to keep her from resisting while also putting more strain on her dirty asshole.")

			saynn("[say=pc]Shut up and quit clenching.[/say]")

			saynn("[say=jacki]Ow.. ah.. N-no..[/say]")

			saynn("Well, she asked for it.")

		else:
			saynn("Jacki's ass is trained extremely well, her sensitive star obediently stretching while your cock is prodding it. But having a stretched asshole doesn't make her resist any less than before. The whore is trying to throw you off her.. but she isn't strong enough.")

			saynn("[say=jacki]My asshole.. getting forcibly stretched.. So rough.. ah..[/say]")

			saynn("Almost like she gets off it. Maybe constant ass-fucking has finally gotten to her head. You smack her against the floor to keep her from resisting while also putting more strain on her dirty asshole.")

			saynn("[say=pc]Shut up and quit clenching.[/say]")

			saynn("[say=jacki]Ow.. ah.. N-no..[/say]")

			saynn("Well, she asked for it.")

		addButton("Ram it in", "Fuck that asshole", "do_grab_anal_ramitin")
	if(state == "do_grab_anal_ramitin"):
		playAnimation(StageScene.SexBehind, "sex", {npc="jacki", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		if (buttScore <= 0):
			saynn("Your hands maintain a firm grasp on her body as you keep guiding your cock into her with increasing power. Poor Jacki is whining and squirming while her virgin-like asshole is being forcibly spread wide open.")

			saynn("[say=jacki]It h-hurts..[/say]")

			saynn("Good. You ram the rest of the length inside, causing Jacki to gasp and attempt to arch her back.. a loud cry escapes her lungs shortly after.")

			saynn("[say=jacki]Agh!.. you fuck..[/say]")

			saynn("You pull your cock a bit back just to ram it inside yet again, sending another powerful impulse through that wolfie, her legs and arms shaky, her toes curling.")

			saynn("Jacki is whining and clinging onto the stone tiles as you keep fucking her ass, gradually stretching her inner walls to accommodate your size. There is some bleeding as your cock is bruising her from the inside.. but that just provides extra lube.")

		elif (buttScore <= 3):
			saynn("Your hands maintain a firm grasp on her body as you keep guiding your cock into her with increasing power. Poor Jacki is whining and squirming while her tight asshole is being forcibly spread wide open.")

			saynn("[say=jacki]Fuck.. my ass..[/say]")

			saynn("You get tired of it and suddenly ram the rest of the length inside, making Jacki gasp and produce a loud painful cry, her inner walls clenching around your cock tightly.")

			saynn("[say=jacki]AGH!..[/say]")

			saynn("You pull your cock a bit back just to ram it inside yet again, sending another powerful impulse through that wolfie, her legs and arms shaky, her toes curling.")

			saynn("Jacki is whining and clinging onto the stone tiles as you keep fucking her ass, gradually stretching her inner walls to accommodate your size. At least there is no bleeding, Jacki's ass seems to be somewhat stretchy by now.")

		elif (buttScore <= 6):
			saynn("Your hands maintain a firm grasp on her body as you keep guiding your cock into her with increasing power. Then, a few seconds later, you ram your whole length inside, making Jacki gasp and produce a loud noise that is a mix between pain and.. pleasure.")

			saynn("[say=jacki]Fuck!.. Agh!.. my ass..[/say]")

			saynn("Her inner walls clench around your cock tightly as you keep forcing your {pc.penis} deeper and deeper, testing the limits of that buttslut. More little noises escape from the girl, her legs and arms shaky, her toes curling.")

			saynn("Jacki is whining and clinging onto the stone tiles as you keep fucking her ass, gradually stretching her inner walls to accommodate your size. Jacki's ass is quite stretchy by now.. but still tight enough to make you feel good.")

		else:
			saynn("Since that ass is so stretchy, you easily ram your whole length inside, making Jacki gasp and produce a loud noise that is a mix between pain and.. passion.")

			saynn("[say=jacki]Fuck!.. Agh!.. my ass.. so stretched..[/say]")

			saynn("Her inner walls still clench around your cock as you keep forcing your {pc.penis} deeper and deeper, testing the limits of that buttslut. More little noises escape from the girl, her legs and arms shaky, her toes curling.")

			saynn("Jacki is whining and clinging onto the stone tiles as you keep pounding her ass relentlessly.")

		addButton("Faster", "Fuck her faster", "do_grab_anal_faster")
	if(state == "do_grab_anal_faster"):
		playAnimation(StageScene.SexBehind, "fast", {npc="jacki", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("Each your thrust is forceful and unrelenting, designed to fuck Jacki into the ground. By this point she isn't resisting anymore.. there is no point.. Jacki is just whining quietly as your hips slap against her fluffy butt.")

		if (corruption > 0.7):
			saynn("[say=jacki]So fucking g-good.. ngh-h..[/say]")

		else:
			saynn("[say=jacki]Nghh-h..[/say]")

		saynn("Her body is trembling.. until she cums. Her neglected pussy is pulsing against the piercings and creates a puddle of girlcum on the ground. Her painful cry of ecstasy grow louder, her walls gripping your cock tightly.")

		saynn("Looks like you are close too..")

		addButton("Cum inside", "Stuff that ass", "do_grab_anal_cuminside")
		addButton("Pull out", "Rather not stuff that ass", "do_grab_anal_pullout")
	if(state == "do_grab_anal_cuminside"):
		playAnimation(StageScene.SexBehind, "inside", {npc="jacki", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("Fuck it. You ram your cock deep into that ass and let her clenching anal ring push you over the hill. Grunts and growls escape from you.. as you stuff your thick load into Jacki's ass, painting her guts white.")

		saynn("She is still whining and sobbing softly.. You give her rear a loud smack, making her clench more.")

		saynn("[say=jacki]Ah..[/say]")

		saynn("[say=pc]What a whore.[/say]")

		if (corruption > 0.9):
			saynn("[say=jacki]T-thank you.. nh-h..[/say]")

			saynn("Looks like you have corrupted her into a complete buttslut by now.")

		else:
			saynn("[say=jacki]N-no..[/say]")

			saynn("Looks like she still needs more forced fucking.")

		saynn("After that great pounding, you finally pull your cock out, leaving that {jackiButt} asshole to gape and leak your seed. Jacki is panting heavily, her anal ring pulsing at the rate of her heartbeat.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_grab_anal_pullout"):
		playAnimation(StageScene.SexBehind, "tease", {npc="jacki", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("You pull your cock out at the last possible moment before your shaft starts throbbing and unleashing its load all over Jacki's fluffy ass.")

		saynn("She is still whining and sobbing softly.. You give her rear a loud smack, making her clench more.")

		saynn("[say=jacki]Ah..[/say]")

		saynn("[say=pc]What a whore.[/say]")

		if (corruption > 0.9):
			saynn("[say=jacki]T-thank you.. nh-h..[/say]")

			saynn("Looks like you have corrupted her into a complete buttslut by now.")

		else:
			saynn("[say=jacki]N-no..[/say]")

			saynn("Looks like she still needs more forced fucking.")

		saynn("After that great pounding, you leave that {jackiButt} asshole to gape and get up. Jacki is panting heavily, her anal ring pulsing at the rate of her heartbeat.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_grab_strapon_pick"):
		saynn("Pick what strapon you wanna use to rail Jacki's ass.")

		addStraponButtons2()
		if (false):
			addButton("Nope", "You shouldn't see this", "do_grab_strapon")
	if(state == "do_grab_strapon"):
		playAnimation(StageScene.SexBehind, "tease", {npc="jacki", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("That girl is not walking away unbroken. You stop choking her.. just so you can push her down, put a strapon harness around your waist, and then pin her with the weight of your own {pc.thick} body. One of your hands holds her face pressed into the ground while the second already aligns your new toy with her {jackiButt} asshole.")

		if (buttScore <= 0):
			saynn("Jacki feels your strapon prodding her super tight star.. and does her best to resist, trying to crawl away from under you.")

			saynn("[say=jacki]H-hey.. I don't do butt stuff.. please..[/say]")

			saynn("Sounds like not your problem. You just smack her against the floor to keep her from resisting while also putting more strain on her virgin asshole.")

			saynn("[say=pc]Shut up and quit clenching.[/say]")

			saynn("[say=jacki]Ow.. ah.. N-no..[/say]")

			saynn("Well, she asked for it.")

		elif (buttScore <= 3):
			saynn("Jacki feels your strapon prodding her tight star.. and keeps resisting, trying to crawl away from under you. She has some experience but it's obvious that she isn't eager to receive more today.")

			saynn("[say=jacki]H-hey.. Not my butt.. please..[/say]")

			saynn("It's not like she got any other holes to fuck between her legs. You just smack her against the floor to keep her from resisting while also putting more strain on her tight asshole.")

			saynn("[say=pc]Shut up and quit clenching.[/say]")

			saynn("[say=jacki]Ow.. ah.. N-no..[/say]")

			saynn("Well, she asked for it.")

		elif (buttScore <= 6):
			saynn("Jacki feels your strapon prodding her anal star that received some training by now. But having a stretched asshole doesn't make her resist any less than before. The whore is trying to throw you off her.. but she isn't strong enough.")

			saynn("[say=jacki]That's my asshole.. please..[/say]")

			saynn("She is not wrong. But she sure is annoying. You smack her against the floor to keep her from resisting while also putting more strain on her dirty asshole.")

			saynn("[say=pc]Shut up and quit clenching.[/say]")

			saynn("[say=jacki]Ow.. ah.. N-no..[/say]")

			saynn("Well, she asked for it.")

		else:
			saynn("Jacki's ass is trained extremely well, her sensitive star obediently stretching while your strapon is prodding it. But having a stretched asshole doesn't make her resist any less than before. The whore is trying to throw you off her.. but she isn't strong enough.")

			saynn("[say=jacki]My asshole.. getting forcibly stretched.. So rough.. ah..[/say]")

			saynn("Almost like she gets off it. Maybe constant ass-fucking has finally gotten to her head. You smack her against the floor to keep her from resisting while also putting more strain on her dirty asshole.")

			saynn("[say=pc]Shut up and quit clenching.[/say]")

			saynn("[say=jacki]Ow.. ah.. N-no..[/say]")

			saynn("Well, she asked for it.")

		addButton("Ram it in", "Fuck that asshole", "do_grab_strapon_ramitin")
	if(state == "do_grab_strapon_ramitin"):
		playAnimation(StageScene.SexBehind, "sex", {npc="jacki", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		if (buttScore <= 0):
			saynn("Your hands maintain a firm grasp on her body as you keep guiding your rubber cock into her with increasing power. Poor Jacki is whining and squirming while her virgin-like asshole is being forcibly spread wide open.")

			saynn("[say=jacki]It h-hurts..[/say]")

			saynn("Good. You ram the rest of the length inside, causing Jacki to gasp and attempt to arch her back.. a loud cry escapes her lungs shortly after.")

			saynn("[say=jacki]Agh!.. you fuck..[/say]")

			saynn("You pull your toy a bit back just to ram it inside yet again, sending another powerful impulse through that wolfie, her legs and arms shaky, her toes curling.")

			saynn("Jacki is whining and clinging onto the stone tiles as you keep fucking her ass, gradually stretching her inner walls to accommodate the size of your strapon. There is some bleeding as it is bruising her from the inside.. but that just provides extra lube.")

		elif (buttScore <= 3):
			saynn("Your hands maintain a firm grasp on her body as you keep guiding your rubber cock into her with increasing power. Poor Jacki is whining and squirming while her tight asshole is being forcibly spread wide open.")

			saynn("[say=jacki]Fuck.. my ass..[/say]")

			saynn("You get tired of it and suddenly ram the rest of the length inside, making Jacki gasp and produce a loud painful cry, her inner walls clenching around your toy tightly.")

			saynn("[say=jacki]AGH!..[/say]")

			saynn("You pull that cock a bit back just to ram it inside yet again, sending another powerful impulse through that wolfie, her legs and arms shaky, her toes curling.")

			saynn("Jacki is whining and clinging onto the stone tiles as you keep fucking her ass, gradually stretching her inner walls to accommodate your new size. At least there is no bleeding, Jacki's ass seems to be somewhat stretchy by now.")

		elif (buttScore <= 6):
			saynn("Your hands maintain a firm grasp on her body as you keep guiding your rubber cock into her with increasing power. Then, a few seconds later, you ram your whole length inside, making Jacki gasp and produce a loud noise that is a mix between pain and.. pleasure.")

			saynn("[say=jacki]Fuck!.. Agh!.. my ass..[/say]")

			saynn("Her inner walls clench around your toy tightly as you keep forcing it deeper and deeper, testing the limits of that buttslut. More little noises escape from the girl, her legs and arms shaky, her toes curling.")

			saynn("Jacki is whining and clinging onto the stone tiles as you keep fucking her ass, gradually stretching her inner walls to accommodate your size. Jacki's ass is quite stretchy by now.. but still tight enough to make you feel good.")

		else:
			saynn("Since that ass is so stretchy, you easily ram your whole rubber length inside, making Jacki gasp and produce a loud noise that is a mix between pain and.. passion.")

			saynn("[say=jacki]Fuck!.. Agh!.. my ass.. so stretched..[/say]")

			saynn("Her inner walls still clench around your toy as you keep forcing it deeper and deeper, testing the limits of that buttslut. More little noises escape from the girl, her legs and arms shaky, her toes curling.")

			saynn("Jacki is whining and clinging onto the stone tiles as you keep pounding her ass relentlessly.")

		addButton("Faster", "Fuck her faster", "do_grab_strapon_faster")
	if(state == "do_grab_strapon_faster"):
		playAnimation(StageScene.SexBehind, "fast", {npc="jacki", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("Each your thrust is forceful and unrelenting, designed to fuck Jacki into the ground. By this point she isn't resisting anymore.. there is no point.. Jacki is just whining quietly as your hips slap against her fluffy butt.")

		if (corruption > 0.7):
			saynn("[say=jacki]So fucking g-good.. ngh-h..[/say]")

		else:
			saynn("[say=jacki]Nghh-h..[/say]")

		saynn("Her body is trembling.. until she cums. Her neglected pussy is pulsing against the piercings and creates a puddle of girlcum on the ground. Her painful cry of ecstasy grow louder, her walls gripping your strapon tightly.")

		addButton("Continue", "See what happens next", "do_grab_strapon_pullout")
	if(state == "do_grab_strapon_pullout"):
		playAnimation(StageScene.SexBehind, "tease", {npc="jacki", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("No point in keeping that rubber cock inside her anymore. You pull it out and rub it dry between her buttcheeks, humiliating that slut more.")

		saynn("She is still whining and sobbing softly.. You give her rear a loud smack, making her clench more.")

		saynn("[say=jacki]Ah..[/say]")

		saynn("[say=pc]What a whore.[/say]")

		if (corruption > 0.9):
			saynn("[say=jacki]T-thank you.. nh-h..[/say]")

			saynn("Looks like you have corrupted her into a complete buttslut by now.")

		else:
			saynn("[say=jacki]N-no..[/say]")

			saynn("Looks like she still needs more forced fucking.")

		saynn("After that great pounding, you leave that {jackiButt} asshole to gape and get up. Jacki is panting heavily, her anal ring pulsing at the rate of her heartbeat.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene_unequpstrapon")
	if(state == "do_grab_sounding"):
		if (soundScore <= 0):
			saynn("The girl's pussy hole is obviously out of question, the metal rings are holding it shut. But what about the other hole that's just under her clit? You use your digits to spread those folds as much as the piercings allow and notice that she already has something in there.")

			saynn("[say=jacki]Hey, don't touch there.. Agh![/say]")

			saynn("You pull out a little dildo-shaped sounding rod that is connected to the clit ring by a little chain. This dildo is smaller than your pinky finger.. but still has a knot at the base.")

			saynn("[say=pc]You are into fucking your urethra, huh?[/say]")

			saynn("[say=jacki]What? No! Stop it, please..[/say]")

			saynn("She says no but what you see paints a different picture. One of your hands still holds her throat while the second one presses it's index finger against that little hole and starts to prod the opening, trying to work itself in.")

			saynn("[say=jacki]Ngh-h! It hurts!..[/say]")

			saynn("You manage to slip just the tip of your finger.. while tearing through her sensitive flesh in the moment, causing a little bleeding. Looks like she hasn't trained that hole enough.. so might as well help her.")

			saynn("You catch that dangling little dildo and press it against her urethra instead. Jacki throws her head back as you force it inside her bruised hole and proceed to slide it inside back and forth.")

			saynn("[say=jacki]Ngh-h!..[/say]")

			saynn("Her stitched-up pussy responds swiftly by twitching, her muscles tensing up actively. That little hole is incredibly tight but with some extra force you manage to shove the little knot it as well, knot-fucking that pisshole and causing more bleeding.")

			saynn("Soon enough, a painful cry escapes her lips as her pisshole pushes the dildo out with a strong stream of transparent fluids. Jacki is squirting while her body is shaking under your relentless onslaught.")

			saynn("[say=jacki]Fuck..[/say]")

			saynn("She is panting heavily, her little pisshole pulsing with the afterglow of that strange climax. You decide to leave her urethra in the state that you found it in and plug it with the little rod, causing Jacki to whine.")

		elif (soundScore <= 2):
			saynn("You spread Jacki's cunt and see that the little dildo-rod is still shoved into her pussy. She shivers as you tug on it.")

			saynn("[say=jacki]Hey.. ah.. please.. not that..[/say]")

			saynn("That was a weak attempt at begging. So you purposefully yank the rod out, causing Jacki to arch her back and let out a painful cry, her pisshole twitching, the skin around it looking a bit red.")

			saynn("[say=jacki]F-fuck..[/say]")

			saynn("You decide to test that hole with your digit, kneading and prodding it. The tip of your digit slides in somewhat easily but after that it encounters very tight inner walls, almost like a barricade.")

			saynn("So after fingering it for a bit, you switch back to the knotted urethra rod and use it instead, sliding it inside Jacki's hole, fucking it like that.")

			saynn("[say=jacki]It hurts-s..[/say]")

			saynn("You're not sure if that's true. Jacki is whining.. but also moaning occasionally, her body responds by making her constrained pussy wet. You keep choking her at the same time, adding to the sensations.")

			saynn("And soon enough, Jacki reaches some kind of peak. Her body starts convulsing with the force of her orgasm, leaving her trembling and gasping for breath. A stream of her girlcum pushes the rod out of her pisshole as she squirts, her whole body is quivering under your onslaught.")

			saynn("[say=jacki]Nhh-h-h!..[/say]")

			saynn("After that powerful moment, Jacki is left breathless, the fur on her thighs wet from her arousal. You decide to plug her little hole after training it, making Jacki moan again.")

			saynn("[say=pc]Slut.[/say]")

		else:
		#elif (soundScore <= 4):
			saynn("You spread Jacki's cunt and see that the little dildo-rod is still shoved into her pussy. She shivers as you tug on it.")

			saynn("[say=jacki]Hey.. ah.. you stretched that hole enough already..[/say]")

			saynn("That is for you to decide. You purposefully yank the rod out, causing Jacki to arch her back and let out a painful cry, her pisshole twitching. After that, you quickly move your digits to her urethral opening and begin kneading it with your index finger.")

			saynn("[say=jacki]F-fuck..[/say]")

			saynn("Gradually, the muscles there relax enough for you to slip the tip of your finger inside. You're not happy with that though, you keep wiggling it inside and stretching the wet inner walls while Jacki is whining and huffing.")

			saynn("[say=jacki]My pisshole is burning..[/say]")

			saynn("Doesn't sound like a problem to you. You keep fingering her urethra, gradually working in more of your finger, spreading the fleshy walls. After that you just switch to finger-fucking it, pulling your digit out just to slide it fully inside.")

			saynn("[say=jacki]Ah-h!..[/say]")

			saynn("Clearly it brings a lot of discomfort to her. But at the same time, her pussy is only getting more wet, dripping juices onto the floor while your second hand keeps lightly choking the girl.")

			saynn("Jacki's shaky eyes keep rolling up, her maw opened, her tongue drooling. She is blushing deeply while you finger her hole.. hole that is not supposed to be fingered at all. And yet, the slut is squirming actively, little moans keep escaping from her.")

			saynn("And soon, the sensations become overwhelming. Jacki is producing a long passionate cry while her pussy squirts, pushing your digit out and showering your hand with her juices.")

			saynn("You decide to slap that pussy with your palm while she is still cumming, causing Jacki to jerk and produce another cry, her pussy pulses and squirts a little more.")

			if (corruption > 0.5):
				saynn("[say=jacki]F-f-fu-uck!.. Feels so fucking good!..[/say]")

				saynn("Her corruption is messing with her mind it seems.")

			else:
				saynn("[say=jacki]F-f-fu-uck!..[/say]")

			saynn("Even after that powerful orgasm, Jacki is still quivering from the afterglow, her little stretched pisshole twitching. You plug it back and let go of the girl's neck.")

			if (corruption > 0.9):
				saynn("[say=jacki]T-thank you for.. stretching my pisshole..[/say]")

				saynn("So cute. You can't help but to smack her ass.")

		saynn("That was fun. But it's time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_grab_urethra_fuck"):
		playAnimation(StageScene.Choking, "tease", {npc="jacki", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("You feel like you trained that pisshole enough.. so it's time to have actual fun with it.")

		saynn("Jacki's eyes widen as you expose your {pc.penis} and guide it towards her slit.")

		saynn("[say=jacki]H-hey.. what are you..[/say]")

		saynn("Her question is answered when the tip of your member finds her urethra and begins putting pressure on it. That instantly causes Jacki to start resisting. She pulls her body away and starts trying to pry your fingers off her neck..")

		saynn("[say=jacki]N-no! Not there! F-fuck off!.. You will kill me![/say]")

		saynn("[say=pc]If you want roughness so much..[/say]")

		saynn("You smack Jacki against one of the rocks, sending a painful impulse through her back. After that you increase the pressure on her throat, choking the wolfie hard. She opens her mouth.. but no noises can come out anymore.")

		saynn("[say=pc]I can kill you anyway, see?[/say]")

		saynn("Her eyes turn desperate, tears stream down her cheeks. You align your cock with her pisshole again and start trying to penetrate it. Her little hole is incredibly tight no matter how trained it is.. but you don't stop applying more pressure. Jacki gasps silently as her hole that was never supposed to be stretched is getting stretched open wide..")

		addButton("Ram it in", "Time to have fun", "do_grab_urethra_fuck_ram")
	if(state == "do_grab_urethra_fuck_ram"):
		playAnimation(StageScene.Choking, "inside", {npc="jacki", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("Somehow, miraculously, you manage to shove some of your cock inside that little hole. Jacki's eyes roll up from the unimaginative pain that she can't even explain. Her urethra is looking unnaturally stretched with the sensitive skin being very red and bleeding in a few places. This is the definition of sticking it up the wrong hole.. but it feels so good, the tightness is making you grunt.")

		saynn("[say=pc]Such a tight bitch.[/say]")

		saynn("You see that Jacki is about to black out and relax the grip on her neck, letting her breath. The poor wolfie is gasping and whining, her body squirming non-stop.")

		addButton("Fuck", "Start moving", "do_grab_urethra_fuck_move")
	if(state == "do_grab_urethra_fuck_move"):
		playAnimation(StageScene.Choking, "sex", {npc="jacki", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("Penetrating that pisshole was fun.. but you want more. And so you begin to move your hips gently, pulling your cock back just to slide it inside again, trying to shove it a little deeper each time. That sends new waves of weird sensations through Jacki, pretty much her whole body is fighting this.")

		saynn("[say=jacki]H-hurts-s-s..[/say]")

		saynn("Yeah, you notice some blood smears on your dick as you start fucking her.. but that blood just acts like lube, making it easier for you to start ramping up the pace.")

		saynn("[say=pc]Maybe your cunt isn't so useless after all.[/say]")

		saynn("[say=jacki]Nghh-h-h..[/say]")

		saynn("Very soon Jacki throws her head back, her body is shaking as her body goes through some kind of weird climax. Climax during which she can't stop whining. And then another one not even a minute later. The painful stimulation is making Jacki stick her tongue out and drool, her eyes defocus.")

		saynn("All the while you are having the time of your life, fucking one of the most tight holes that you ever fucked. The pleasure is so strong that you have already reached the edge..")

		saynn("Obviously you're not gonna miss the chance to creampie her.. This might be the closest you get to breeding her.")

		addButton("Cum inside", "Breed Jacki's pisshole", "do_grab_urethra_fuck_cum")
	if(state == "do_grab_urethra_fuck_cum"):
		playAnimation(StageScene.Choking, "inside", {npc="jacki", pcCum=true, npcCum=true, bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("You welcome that orgasm and shove your cock as deep as that pisshole allows. Moans leave your mouth as your throbbing member starts stuffing Jacki's bladder full of your thick virile {pc.cum}..")

		saynn("[say=jacki]Nh-h-h!.. M-my.. p-pisshole..[/say]")

		saynn("So strange. And yet. So good. As you pull out, Jacki's stretched fuckhole starts leaking your seed, mixed with her blood. Yeah.. Jacki will need that hole patched up after what you did.")

		saynn("[say=jacki]Nh-h.. ow-w..[/say]")

		saynn("Is that your problem though? Well.. not really.. but it would be nice if this slut didn't somehow die. So you should probably help her a bit.")

		addButton("Medical", "Bring Jacki there", "bring_jacki_to_medical")
	if(state == "bring_jacki_to_medical"):
		aimCameraAndSetLocName("med_lobby_start")
		GM.pc.setLocation("med_lobby_start")
		playAnimation(StageScene.Solo, "stand")
		saynn("And so you grab Jacki and forcibly pull her behind you while she leaves a red and white trail behind her.")

		saynn("[say=jacki]Ow-ow.. f-fuck..[/say]")

		saynn("[say=pc]If you tell anyone about who did this, it's gonna get worse.[/say]")

		saynn("[say=jacki]O-okay..[/say]")

		saynn("You bring her to the medical wing and give her to the nurses. People here are used to this kind of stuff.. but even they look surprised when they see what someone managed to do with Jacki's urethra.")

		saynn("When asked, you just say that you found her like this. Problem solved. Jacki won't die now.")

		saynn("Surely this redeems you. Yes.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene_removeurethracum")
	if(state == "do_enslave_jacki"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		saynn("After everything that happened.. you feel like Jacki is finally ready. You walk up to her and catch her slutty gaze.")

		saynn("[say=pc]How is this little whore doing?[/say]")

		saynn("Calling her dirty words only makes her more eager to get up and turn around for you, presenting her butt. Her paws spread and the tail sways out of the way.")

		saynn("[say=jacki]I'm doing good! Do you wanna use this ass? Wruff~.[/say]")

		saynn("Always so eager. Almost too eager.")

		saynn("[say=pc]Nah, I wanted to tell you something else.[/say]")

		saynn("[say=jacki]Oh?[/say]")

		saynn("Your hand reaches for her ponytail and yanks on it, causing pain to Jacki. And yet, she still somehow manages to sound slutty.")

		saynn("[say=jacki]Ah-h~..[/say]")

		saynn("[say=pc]I wanna make you mine.[/say]")

		saynn("Jacki's pupils visibly increase, her tail starts wagging on its own.")

		saynn("[say=jacki]You do? You wanna make me your personal buttslut??[/say]")

		saynn("Suddenly you hear a different voice.")

		saynn("[say=eliza]Oh hey. I've been looking for you.. two.[/say]")

		addButton("Continue", "See what happens next", "do_enslave_eliza")
	if(state == "do_enslave_eliza"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="jacki", npc="eliza"})
		saynn("You turn your head and see a cute feline doctor. She smiles while your hand is still holding Jacki's hair tightly.")

		saynn("[say=eliza]Doctor Quinn here. Did I arrive at the wrong time?[/say]")

		saynn("[say=jacki]Hey, doctor. I'm being made into a personal fucktoy~.[/say]")

		saynn("She said it so proudly. Absolutely zero shame.")

		saynn("[say=eliza]I kinda heard that, sorry~.[/say]")

		saynn("Jacki doesn't seem to be mad at the feline. Huh.")

		saynn("[say=pc]Why are you here, doctor?[/say]")

		saynn("Doctor Quinn looks around and shrugs.")

		saynn("[say=eliza]I wanted to check something. But now I wanna help you instead~.[/say]")

		saynn("The feline slowly approaches you two. She reaches her hand out and pats Jacki, causing her to bark happily.")

		saynn("[say=eliza]Jacki is so much more obedient lately. I check on her occasionally. To make sure her piercings are not tampered with. Before you, I had to be.. a little forceful.[/say]")

		saynn("[say=jacki]Eliza was trying to break me~. But she couldn't.[/say]")

		saynn("The feline chuckles softly as she scritches the wolfie under the chin.")

		saynn("[say=eliza]That's a little extreme. Nah, I was seeking a little more obedience, you know? It's an experiment.[/say]")

		saynn("Doctor Quinn looks at you now.")

		saynn("[say=eliza]And it looks like female chastity doesn't really work on its own. There is always gotta be someone to help.. accelerate.. the process. So.. Thank you for that~. Invaluable data right there.[/say]")

		saynn("[say=pc]So.. sounds like your experiment is over. Are you gonna remove Jacki's piercings?[/say]")

		saynn("Doctor Quinn raises a brow.")

		saynn("[say=eliza]You know.. Let's talk about that in a different place. Follow me.[/say]")

		saynn("Here's hoping she doesn't decide to do something similar to you.")

		addButton("Follow", "See where she brings you", "do_enslave_follow")
	if(state == "do_enslave_follow"):
		aimCameraAndSetLocName("medical_confessionary")
		saynn("You follow the feline through the whole prison until you end up in the medical wing. Doctor Quinn walks you through the staff-only doors and then invites you to enter a special room.")

		saynn("It's.. dimly lit. Your feet instantly feel the soft carpet. There is a big chair, sofa, and a little dorky table. But the cozy furniture is contrasted by a few metal racks and hooks.. clearly designed for heavy bondage. If you didn't know this prison, you might as well think that it's some sort of torture room.")

		saynn("[say=eliza]Alright. I will need you here, in this spot, Jacki.[/say]")

		saynn("The feline points at the spot right under one of those metal hooks.")

		saynn("[say=pc]What are you..[/say]")

		saynn("[say=eliza]Don't worry~.[/say]")

		saynn("Her saying that only makes you worry. But Jacki does exactly as told, positioning herself in the told spot.")

		saynn("[say=eliza]Alright. Now..[/say]")

		addButton("Continue", "See what happens next", "do_enslave_choice")
	if(state == "do_enslave_choice"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="pc", pc="jacki", bodyState={naked=true}})
		saynn("Doctor undresses the wolfie and then grabs two cuffs before putting them on Jacki's wrists. These cuffs already have chains that are attached to the hook at the ceiling. All the doctor has to do now is tighten them up, causing Jacki to pull her paws up and stand on her toes.")

		saynn("[say=jacki]Wruff~. Kinky.[/say]")

		saynn("She talks with you while doing a quick visual check of Jacki's body and her piercings.")

		saynn("[say=eliza]You know.. Jacki did tell me about you. How wet she becomes the moment you appear anywhere close. Right, Jacki?[/say]")

		saynn("[say=jacki]Yes.. I'm wet right now in fact..[/say]")

		saynn("The feline chuckles and then looks at you.")

		saynn("[say=eliza]Me and Jacki didn't really start on the right foot. But thanks to you, we are friends now~.[/say]")

		saynn("[say=jacki]Wruff..[/say]")

		saynn("[say=pc]So..[/say]")

		saynn("She nods-nods and quickly grabs some things. Tools and such.")

		saynn("[say=eliza]I wonder. Jacki. Do you want those piercings removed?[/say]")

		saynn("[say=jacki]My cunt is useless and I'm totally okay with that.. I remember missing it at first.. But I got forcibly trained to be a buttslut and I love it~.[/say]")

		saynn("The feline hums and grabs some extra tools. Then she returns to you.")

		saynn("[say=eliza]Well.. I was thinking of not doing this. But since you helped me and Jacki so much, I wanna give you a choice.[/say]")

		saynn("She presents you some kind of.. little padlocks.. and a key.")

		saynn("[say=eliza]Jacki likes her piercings. So we'd rather keep them. But I can replace her current permanent ones with these. With them on, you, and only you, will be able to temporarily.. unlock.. Jacki's pussy at any time.[/say]")

		saynn("Huh. That would probably mean Jacki will lose her buttslut status. After that, the doctor presents you something else.. in her paws are a piercing tool, a tattoo gun and some piercings.")

		saynn("[say=eliza]Or, in case you want Jacki to keep her current piercings, I can offer you an opportunity to add some extra piercings to Jacki's body. Her nips are still not pierced and there is also a good spot for an extra one on her pussy~.[/say]")

		saynn("That explains the piercings..")

		saynn("[say=pc]What's the tattoo gun for?[/say]")

		saynn("[say=eliza]Oh, well.. from what I've gathered, Jacki is not a fan of branding. But for you she can make an exception, right Jacki?[/say]")

		saynn("[say=jacki]Anything, yes.. wruff.. I'm your slave~.[/say]")

		saynn("[say=eliza]Good girl. So yeah, you can tattoo something on her butt if you want. Anything you want really. Just know that there would be no way of removing it.[/say]")

		saynn("[say=pc]Can I choose both?[/say]")

		saynn("The feline raises a brow and puts on a cute cunning smile.")

		saynn("[say=eliza]I know you like stretching things but my gratitude can only span so long~.[/say]")

		saynn("So this is it, huh. This is where you decide.")

		addButton("Free pussy", "Replace her permanent chastity piercings with the unlockable ones", "do_enslave_freepussy")
		addButton("Extra piercings", "Just add some extra piercings to Jacki's body", "do_enslave_extrapiercings")
		addButton("Piercings+Branding", "Add extra piercings to Jacki's body and brand her as your slave", "do_enslave_brand")
	if(state == "do_enslave_extrapiercings"):
		saynn("Well, might as well keep Jacki as a buttslut forever.")

		saynn("[say=pc]Give me the piercing tool.[/say]")

		saynn("The feline smiles and hands you the tool loaded with 3 piercings.")

		saynn("You walk up to Jacki and look at her small chest.")

		saynn("[say=pc]Time to leave my mark on you.[/say]")

		saynn("[say=jacki]Wruff.. making this whore squirm, owner..[/say]")

		saynn("She is already getting into the role, huh. You bring the tool to one of her hard perky nipples.. and pull the trigger.. causing it to make a little hole in it and wire the fancy piercing through it.")

		saynn("Jacki gasps and recoils away instinctively.. but it's too late. Her nipple now has a fancy little ring with a cyan gem. You move the tool to her other nipple.. and press the trigger again, adding a piercing there too.")

		saynn("[say=jacki]Ah!.. F-fuck.. My nips burn~.[/say]")

		saynn("[say=pc]Good.[/say]")

		saynn("You look at the doctor.")

		saynn("[say=pc]Where was the other good spot?[/say]")

		saynn("The feline takes a spot behind Jacki.. and then points at her ass.. at that small area between her anus and her pussy.")

		saynn("[say=pc]Her taint?[/say]")

		saynn("Jacki gets more wet just from hearing that. She bites her lip.")

		saynn("[say=pc]Alright. Tail up, slut. This is gonna hurt.[/say]")

		saynn("Wolfie obediently moves the tail, giving you full access to her {jackiButt} ass.")

		saynn("This requires you to be careful. You move the tool to her anal ring and angle it towards her stiched-up pussy.. As you pull the trigger, Jacki lets out a powerful cry. The tool puts a big ring right through the inner wall that divides her two holes, now looking like a little bridge between the two.")

		saynn("[say=jacki]Ah, fuck-k!.. My ass..[/say]")

		saynn("Now you see why the feline chained her up. Jacki is squirming actively, thrashing against her restraints.")

		saynn("[say=pc]You are now my slave. Understand?[/say]")

		saynn("[say=jacki]Ngh-h.. Y-yes~. I'm your personal buttslut slave. Fuck me any time you want~. As rough as you want~.[/say]")

		saynn("That's the spirit. You begin to unchain the wolfie.")

		addButton("Continue", "See what happens next", "do_enslave_end")
	if(state == "do_enslave_end"):
		aimCameraAndSetLocName("med_lobby_start")
		GM.pc.setLocation("med_lobby_start")
		playAnimation(StageScene.Hug, "hug", {npc="jacki"})
		saynn("Doctor Quinn guides you back into the medical lobby after you unchain the wolfie.")

		saynn("Jacki decides to suddenly hug you tightly. She seems to be happy with your choice. So you hug her back.")

		saynn("[say=jacki]Wruf-f-f~. Thank you, for everything.[/say]")

		saynn("[say=pc]It's nothing really.[/say]")

		saynn("[say=jacki]I will be your obedient whore forever~.[/say]")

		saynn("The feline giggles softly and leaves you two be.")

		saynn("You spend some time like that, hugging.")

		saynn("[say=jacki]I will be where I usually am if you wanna come find me~.[/say]")

		saynn("[say=pc]Good.[/say]")

		saynn("You end the hug and smack her ass firmly, sending her off.")

		saynn("- - - - - -")

		saynn("(( This is where Jacki's content ends. Thank you for playing <3 ))")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_enslave_brand"):
		saynn("Well, might as well keep Jacki as a buttslut forever and also brand her as your property.")

		saynn("[say=pc]Give me the tools.[/say]")

		saynn("The feline smiles and hands you the piercing tool loaded with 3 piercings.")

		saynn("You walk up to Jacki and look at her small chest.")

		saynn("[say=pc]Time to leave my mark on you.[/say]")

		saynn("[say=jacki]Wruff.. making this whore squirm, owner..[/say]")

		saynn("She is already getting into the role, huh. You bring the tool to one of her hard perky nipples.. and pull the trigger.. causing it to make a little hole in it and wire the fancy piercing through it.")

		saynn("Jacki gasps and recoils away instinctively.. but it's too late. Her nipple now has a fancy little ring with a cyan gem. You move the tool to her other nipple.. and press the trigger again, adding a piercing there too.")

		saynn("[say=jacki]Ah!.. F-fuck.. My nips burn~.[/say]")

		saynn("[say=pc]Good.[/say]")

		saynn("You look at the doctor.")

		saynn("[say=pc]Where was the other good spot?[/say]")

		saynn("The feline takes a spot behind Jacki.. and then points at her ass.. at that small area between her anus and her pussy.")

		saynn("[say=pc]Her taint?[/say]")

		saynn("Jacki gets more wet just from hearing that. She bites her lip.")

		saynn("[say=pc]Alright. Tail up, slut. This is gonna hurt.[/say]")

		saynn("Wolfie obediently moves the tail, giving you full access to her {jackiButt} ass.")

		saynn("This requires you to be careful. You move the tool to her anal ring and angle it towards her stiched-up pussy.. As you pull the trigger, Jacki lets out a powerful cry. The tool puts a big ring right through the inner wall that divides her two holes, now looking like a little bridge between the two.")

		saynn("[say=jacki]Ah, fuck-k!.. My ass..[/say]")

		saynn("Now you see why the feline chained her up. Jacki is squirming actively, thrashing against her restraints. That's when the feline doctor offers you the tattoo gun.")

		saynn("[say=eliza]What are you gonna write on her ass? I can give some suggestions~.[/say]")

		addSlaveTattooNames()
		if (false):
			addButton("Error", "You shouldn't see this", "do_enslave_brand_pick")
		addButton("CUSTOM", "Type in your own tattoo", "do_enslave_brand_type")
	if(state == "do_enslave_brand_type"):
		saynn("Type what you want to tattoo on Jacki's ass:")

		addTextbox("jacki_tattoo")
		addButton("Confirm", "You made your choice", "do_enslave_brand_dotype")
		addButton("Back", "Never mind", "do_enslave_brand")
	if(state == "do_enslave_brand_pick"):
		saynn("And so, after making your choice, you bring the tattoo gun to Jacki's ass and begin to leave a tattoo on it, branding your slave.")

		saynn("[say=jacki]Nhh-h-h![/say]")

		saynn("Jacki whines and squirms as you slowly write '"+str(getFlag("JackiModule.Jacki_ch2SlaveText", "buttslut"))+"' on her. The feline doctor is helping you by holding the wolfie still.")

		saynn("After some time, you finish the work. It looks glorious, exactly how you wished it to look. Jacki will now carry your mark forever.")

		saynn("[say=pc]You are now my slave. Understand?[/say]")

		saynn("Jacki is still panting softly, recovering from having new piercings and being branded.")

		saynn("[say=jacki]Ngh-h.. Y-yes~. I'm your personal buttslut slave. Fuck me any time you want~. As rough as you want~.[/say]")

		saynn("That's the spirit. You begin to unchain the wolfie.")

		addButton("Continue", "See what happens next", "do_enslave_end")
	if(state == "do_enslave_freepussy"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="eliza", pc="jacki", bodyState={naked=true}})
		saynn("Obviously, you'd rather help the wolfie enjoy life to its fullest.")

		saynn("[say=pc]Remove her chastity piercings.[/say]")

		saynn("The feline smiles and nods before grabbing some special tool that looks like pliers and approaches Jacki.")

		saynn("[say=eliza]Try not to move, dear.[/say]")

		saynn("[say=jacki]Wruff.[/say]")

		saynn("She brings the tool to the metal rings that hold Jacki's pussy closed and begins to carefully cut through them, one ring at a time. She keeps the clit piercing, the bell and the little urethra rod untouched though. After pulling each ring out, she replaces them with small padlocks that are roughly the same size and shape but now they each have a keyhole.")

		saynn("The feline makes sure each one can be unlocked with the special key.. before handing it to you.")

		saynn("[say=eliza]Don't break it~.[/say]")

		saynn("[say=pc]I won't.[/say]")

		saynn("The feline giggles and then looks at Jacki and her chains.")

		saynn("[say=eliza]Since Jacki is still chained up.. maybe you would like to try her pussy~? I can look away if you want.[/say]")

		if (!GM.pc.hasReachablePenis()):
			saynn("[say=pc]I can't really..[/say]")

			saynn("The feline nods-nods and quickly grabs some strapon harness and offers it to you. This one has a knotted canine dildo installed. Jacki bites her lip when she sees it.")

			saynn("[say=eliza]You can use this~.[/say]")

			saynn("Looks like she is offering..")

			addButton("Strapon pussy", "Strapon Jacki's pussy with the offered toy", "do_enslave_strapon")
		else:
			saynn("Huh. Jacki bites her lip when she hears that.")

			addButton("Fuck Jacki", "Fuck Jacki's pussy while she is still chained", "do_enslave_fuck")
		addButton("No fucking", "It's fine", "do_enslave_nofuck")
	if(state == "do_enslave_nofuck"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="pc", pc="jacki", bodyState={naked=true}})
		saynn("You shake your head.")

		saynn("[say=pc]It's fine, really. Thank you.[/say]")

		saynn("You walk up to Jacki and present the key to her pussy.")

		saynn("[say=pc]You are now my slave. Understand?[/say]")

		saynn("Jacki pants softly, getting heated just watching it.")

		saynn("[say=jacki]Ngh-h.. Y-yes~. I'm your personal slave. You control my holes and can fuck me any time as rough as you want~.[/say]")

		saynn("That's the spirit. You begin to unchain the wolfie.")

		addButton("Continue", "See what happens next", "do_enslave_end")
	if(state == "do_enslave_fuck"):
		playAnimation(StageScene.HangingSex, "tease", {pc="jacki", npc="pc", npcBodyState={naked=true, hard=true}, bodyState={naked=true}})
		saynn("Why not? You walk up closer to Jacki and bring the key to her pussy. As you unlock each padlock that holds her pussy folds together, little moans escape from the wolfie, her slit dripping juices onto your digits.")

		saynn("[say=jacki]You wished to breed this slutty cunt for so long, didn't you~.[/say]")

		saynn("Since she is so cocky, you can't help but to slap her pussy lightly. But even that small impact is enough to make Jacki arch her back and gasp.")

		saynn("[say=jacki]Ah.. fuck~..[/say]")

		saynn("After unlocking her pussy, you position yourself behind her and expose your {pc.penis} before thrusting it between her thighs, dangerously close to the unbound flower.")

		saynn("[say=pc]You are my slave. Understand?[/say]")

		saynn("[say=jacki]I don't know, am I~?[/say]")

		saynn("Ohh. She is being quite brave for someone in such a vulnerable position.")

		addButton("Penetrate", "Start fuckin'", "do_enslave_fuck_penetrate")
	if(state == "do_enslave_fuck_penetrate"):
		playAnimation(StageScene.HangingSex, "sex", {pc="jacki", npc="pc", npcBodyState={naked=true, hard=true}, bodyState={naked=true}})
		saynn("And so you align your cock directly with her pussy hole.. and thrust inside. Jacki moans passionately while her slit finally gets penetrated after so much chastity time. Her inner walls are slick and tight, kneading their first cock in a great while.")

		saynn("[say=jacki]Fuck, this is amazing~..[/say]")

		saynn("Your hand lands on her ass and spreads it, giving full access to Jacki's {jackiButt} anus. You decide to prod and rub it with your thumb, letting Jacki feel some familiar sensations as you fuck her.")

		saynn("Chains dangle as you go balls deep on Jacki's cunt. Her wetness allows you to easily reach her cervix and start hammering away at it, sending shivers through her spine.")

		saynn("[say=jacki]Nhh-h~!..[/say]")

		addButton("Faster", "Fuck her faster", "do_enslave_fuck_faster")
	if(state == "do_enslave_fuck_faster"):
		playAnimation(StageScene.HangingSex, "fast", {pc="jacki", npc="pc", npcBodyState={naked=true, hard=true}, bodyState={naked=true}})
		saynn("You increase the pace, fucking that needy slit faster and harder, your hips slamming against her fluffy butt. Loud slutty moans echo around the room, Jacki's tongue is out and drooling.")

		saynn("[say=jacki]I'm.. I'm.. Nh-h-h!..[/say]")

		saynn("With such an onslaught, it doesn't take long for Jacki to reach her peak. She throws her head back and cries out from pleasure while her unconstrained pussy gets all tight around your cock. At the same time, her cervix does the opposite and becomes softer, allowing you to slowly stretch the little hole with each thrust.")

		saynn("Stimulations are so intense that Jacki squirts, pushing the little urethra rod out of her pisshole, followed by a strong stream of transparent juices.")

		saynn("[say=jacki]I'm your slave! Ah~! Your bitch, your little whore, your plaything, cocksleeve, slut~.[/say]")

		saynn("Such a dirty slut. Makes you wonder if you should make her even more dirty on the inside or outside. You're close..")

		addButton("Inside", "Cum inside Jacki's womb", "do_enslave_fuck_cuminside")
		addButton("Pull out", "Cum all over her butt instead", "do_enslave_fuck_pullout")
	if(state == "do_enslave_fuck_cuminside"):
		playAnimation(StageScene.HangingSex, "inside", {pc="jacki", npc="pc", pcCum=true, npcCum=true, npcBodyState={naked=true, hard=true}, bodyState={naked=true}})
		saynn("Why hold back now? Jacki is yours.")

		saynn("Her pussy is basically milking your cock already anyway, pushing you over the edge. You welcome that, shoving your dick deep inside, breaking into Jacki's womb.")

		saynn("[say=jacki]AH-Hh-h!..[/say]")

		saynn("She throws her head back again and squirts while your throbbing member begins to shove its load directly into that babymaker, claiming and marking it with your {pc.cum}!")

		saynn("Jacki is squirming as much as those chains allow, she moans each time your dick pulses and fills her up more.")

		saynn("[say=jacki]F-fuck.. so much..[/say]")

		saynn("After breeding that pussy properly, you pull out, letting it drip your seed.")

		saynn("[say=pc]Good little breeding bitch.[/say]")

		saynn("[say=jacki]Wruff-f..[/say]")

		addButton("Continue", "See what happens next", "do_enslave_fuck_afterfuck")
	if(state == "do_enslave_fuck_pullout"):
		playAnimation(StageScene.HangingSex, "tease", {pc="jacki", npc="pc", pcCum=true, npcCum=true, npcBodyState={naked=true, hard=true}, bodyState={naked=true}})
		saynn("There is no need to breed her. A big belly will only ruin her slim curves.")

		saynn("Her pussy is basically milking your cock already anyway, pushing you over the edge. You catch that moment and pull moments before your member starts to throb and shoot thick {pc.cum} all over that fluffy ass!")

		saynn("[say=jacki]Wruf-f-f~.. Yes.. Turn me into a cum dumpster~.[/say]")

		saynn("You grunt while marking that fur with your seed. Jacki's pussy is still twitching after her own intense orgasm. The wolfie is panting softly.")

		saynn("[say=pc]Good little fucktoy.[/say]")

		saynn("[say=jacki]Thank you~.[/say]")

		addButton("Continue", "See what happens next", "do_enslave_fuck_afterfuck")
	if(state == "do_enslave_fuck_afterfuck"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="pc", pc="jacki", bodyState={naked=true}})
		saynn("After that great fuck, you return back to the position before her.")

		saynn("[say=pc]So? Who are you.[/say]")

		saynn("[say=jacki]I'm.. I'm your slave~. Use me, abuse me, all you want~.[/say]")

		saynn("[say=pc]Good.[/say]")

		saynn("You grab the key and begin to slowly lock her pussy padlocks again, forcing her folds to stay closed together again.")

		saynn("[say=pc]Your pussy is mine now.[/say]")

		saynn("[say=jacki]Yes.. All my holes are..[/say]")

		saynn("That's the spirit. You begin to unchain the wolfie.")

		addButton("Continue", "See what happens next", "do_enslave_end")
	if(state == "do_enslave_strapon"):
		playAnimation(StageScene.HangingSex, "tease", {pc="jacki", npc="pc", npcBodyState={naked=true, hard=true}, bodyState={naked=true}})
		saynn("Why not? You grab the offered strapon harness and secure it around your waist.")

		saynn("Then you walk up closer to Jacki and bring the key to her pussy. As you unlock each padlock that holds her pussy folds together, little moans escape from the wolfie, her slit dripping juices onto your digits.")

		saynn("[say=jacki]You wished to fuck this slutty cunt for so long, didn't you~.[/say]")

		saynn("Since she is so cocky, you can't help but to slap her pussy lightly. But even that small impact is enough to make Jacki arch her back and gasp.")

		saynn("[say=jacki]Ah.. fuck~..[/say]")

		saynn("After unlocking her pussy, you position yourself behind her and thrust your new rubber cock between her thighs, dangerously close to the unbound flower.")

		saynn("[say=pc]You are my slave. Understand?[/say]")

		saynn("[say=jacki]I don't know, am I~?[/say]")

		saynn("Ohh. She is being quite brave for someone in such a vulnerable position.")

		addButton("Penetrate", "Start fuckin'", "do_enslave_strapon_penetrate")
	if(state == "do_enslave_strapon_penetrate"):
		playAnimation(StageScene.HangingSex, "sex", {pc="jacki", npc="pc", npcBodyState={naked=true, hard=true}, bodyState={naked=true}})
		saynn("And so you align that strapon directly with her pussy hole.. and thrust inside. Jacki moans passionately while her slit finally gets penetrated after so much chastity time. Her inner walls are slick and tight, kneading their first cock in a great while. It's not exactly a real cock.. but it's good enough.")

		saynn("[say=jacki]Fuck, this is amazing~..[/say]")

		saynn("Your hand lands on her ass and spreads it, giving full access to Jacki's {jackiButt} anus. You decide to prod and rub it with your thumb, letting Jacki feel some familiar sensations as you fuck her.")

		saynn("Chains dangle as you go balls deep on Jacki's cunt. Her wetness allows you to easily reach her cervix and start hammering away at it, sending shivers through her spine.")

		saynn("[say=jacki]Nhh-h~!..[/say]")

		addButton("Faster", "Fuck her faster", "do_enslave_strapon_faster")
	if(state == "do_enslave_strapon_faster"):
		playAnimation(StageScene.HangingSex, "fast", {pc="jacki", npc="pc", npcBodyState={naked=true, hard=true}, bodyState={naked=true}})
		saynn("You increase the pace, fucking that needy slit faster and harder, your hips slamming against her fluffy butt. Loud slutty moans echo around the room, Jacki's tongue is out and drooling.")

		saynn("[say=jacki]I'm.. I'm.. Nh-h-h!..[/say]")

		saynn("With such an onslaught, it doesn't take long for Jacki to reach her peak. She throws her head back and cries out from pleasure while her unconstrained pussy gets all tight around your rubber cock. At the same time, her cervix does the opposite and becomes softer, allowing you to slowly stretch the little hole with each thrust.")

		saynn("Stimulations are so intense that Jacki squirts, pushing the little urethra rod out of her pisshole, followed by a strong stream of transparent juices.")

		saynn("[say=jacki]I'm your slave! Ah~! Your bitch, your little whore, your plaything, cocksleeve, slut~.[/say]")

		saynn("Such a dirty slut. Makes you want to be rougher..")

		addButton("Knot her", "Knot Jacki's pussy", "do_enslave_strapon_knot")
	if(state == "do_enslave_strapon_knot"):
		playAnimation(StageScene.HangingSex, "inside", {pc="jacki", npc="pc", npcBodyState={naked=true, hard=true}, bodyState={naked=true}})
		saynn("Why hold back now? Jacki is yours.")

		saynn("You pull that rubber cock almost fully out.. just to shove it fully inside moments later. The fat rubber orb puts a crazy amount of pressure on her slit.. until suddenly slipping inside, the tip breaking into Jacki's womb.")

		saynn("[say=jacki]AH-Hh-h!..[/say]")

		saynn("She throws her head back again and squirts while her slit clenches around your toy, making thrusting pretty much impossible.")

		saynn("Jacki is squirming as much as those chains allow, she moans each time you try to tug your strapon out. There is a visible bump on her belly, caused by the toy.")

		saynn("[say=jacki]F-fuck.. so big..[/say]")

		saynn("You let that girl enjoy the feeling of being full for some time.. before finally yanking that knotted toy out.")

		saynn("[say=pc]Good little bitch.[/say]")

		saynn("[say=jacki]Ah! Wruff-f..[/say]")

		addButton("Continue", "See what happens next", "do_enslave_fuck_afterfuck")
func addPlasticBottleButtons():
	var items = GM.pc.getInventory().getItemsWithTag(ItemTag.PlasticBottle)
	for item in items:
		if(item.getFluids().isEmpty()):
			addDisabledButton(item.getStackName(), item.getVisisbleDescription())
		else:
			addButton(item.getStackName(), item.getVisisbleDescription(), "jog_afterbigjog_givebottle", [item])

func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "jog_anal_strapon", [strapon])

func addStraponButtons2():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "do_grab_strapon", [strapon])

func addSlaveTattooNames():
	var possible = ["Buttslut", str(GM.pc.getName())+"'s slut", str(GM.pc.getName())+"'s whore", str(GM.pc.getName())+"'s Slave", "Cum In My Ass", "Slave", str(GM.pc.getName())+"'s Bitch"]

	for t in possible:
		addButton(t, "Tattoo this on Jacki's ass", "do_enslave_brand_pick", [t])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_perv"):
		getModule("JackiModule").addCorruption(4)
		processTime(15*60)

	if(_action == "do_creepfollow"):
		processTime(20*60)

	if(_action == "kind_watch"):
		processTime(15*60)
		getModule("JackiModule").addAnger(-8)
		getModule("JackiModule").addLust(3)

	if(_action == "kind_jog"):
		processTime(2*60)

	if(_action == "do_enslave_jacki"):
		processTime(5*60)
		setFlag("JackiModule.Jacki_ch2GotEnslaved", true)

	if(_action == "mem_stocks"):
		aimCameraAndSetLocName("main_punishment_spot")
		GM.pc.setLocation("main_punishment_spot")
		runScene("JackiStuckInStocksScene")
		endScene()
		return

	if(_action == "mem_punch"):
		runScene("jackiPunchingBagScene")
		endScene()
		return

	if(_action == "mem_urinal"):
		runScene("jackiUrinalScene")
		endScene()
		return

	if(_action == "perv_spank"):
		processTime(5*60)
		getModule("JackiModule").addAnger(20)
		getModule("JackiModule").addCorruption(3)

	if(_action == "perv_suckass"):
		processTime(15*60)
		getModule("JackiModule").addLust(2)
		getModule("JackiModule").addCorruption(3)

	if(_action == "perv_makehersuckass"):
		processTime(15*60)
		getModule("JackiModule").addAnger(5)

	if(_action == "perv_makehersuckass_force"):
		processTime(5*60)
		getModule("JackiModule").addCorruption(5)

	if(_action == "perv_makehersuckass_cum"):
		processTime(3*60)
		GM.pc.orgasmFrom("jacki")

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

	if(_action == "gift_lube"):
		GM.pc.getInventory().removeXOfOrDestroy("lube", 1)
		getModule("JackiModule").addAnger(-6)
		getModule("JackiModule").degradeSkill("jackiSkillButtslut", 4)
		getModule("JackiModule").degradeSkill("jackiSkillSounding", 4)

	if(_action == "gift_5credits"):
		if(corruption <= 0.5):
			getModule("JackiModule").addAnger(10)

	if(_action == "gift_heatpill"):
		if(corruption > 0.5):
			GM.pc.getInventory().removeXOfOrDestroy("HeatPill", 1)
			getModule("JackiModule").addLust(10)
			getCharacter("jacki").forceIntoHeat()
		else:
			getModule("JackiModule").addAnger(10)

	if(_action == "gift_horsecockdildo"):
		if(corruption > 0.4 || lust > 0.4):
			setFlag("JackiModule.jackiReceivedHorsecockDildo", true)
			GM.pc.getInventory().removeXOfOrDestroy("HorsecockDildo", 1)
			getModule("JackiModule").addCorruption(10)
		else:
			getModule("JackiModule").addAnger(10)

	if(_action == "gift_sportybra"):
		GM.pc.getInventory().removeXOfOrDestroy("sportyTop", 1)
		setFlag("JackiModule.jackiReceivedBra", true)
		getCharacter("jacki").resetEquipment()
		getModule("JackiModule").addAnger(-20)

	if(_action == "gift_sportyshorts"):
		GM.pc.getInventory().removeXOfOrDestroy("sportyBriefs", 1)
		setFlag("JackiModule.jackiReceivedShorts", true)
		getCharacter("jacki").resetEquipment()
		getModule("JackiModule").addAnger(-20)

	if(_action == "gift_credits_free"):
		GM.pc.addCredits(-5)
		getModule("JackiModule").addAnger(-20)
		getModule("JackiModule").addCorruption(10)

	if(_action == "gift_credits_hj_do"):
		processTime(15*60)
		

	if(_action == "gift_creds_hj_double"):
		processTime(10*60)
		getModule("JackiModule").addCorruption(10)
		GM.pc.addCredits(-10)
		getCharacter("jacki").cummedOnBy("pc")
		GM.pc.orgasmFrom("jacki")

	if(_action == "gift_creds_hj_cum"):
		processTime(10*60)
		getModule("JackiModule").addAnger(5)
		getModule("JackiModule").addCorruption(6)
		GM.pc.addCredits(-5)
		getCharacter("jacki").cummedOnBy("pc", FluidSource.Penis, 0.05)
		GM.pc.orgasmFrom("jacki")

	if(_action == "kind_yoga_together"):
		processTime(5*60)
		getModule("JackiModule").addLust(6)

	if(_action == "kind_massage"):
		processTime(20*60)
		getModule("JackiModule").addLust(7)
		getModule("JackiModule").addAnger(-5)

	if(_action == "kind_yoga_togehter_try"):
		processTime(10*60)
		GM.pc.addEffect(StatusEffect.Yoga)
		GM.pc.addStamina(-30)
		getModule("JackiModule").addAnger(-5)

	if(_action == "kind_yoga_togehter_slack"):
		processTime(10*60)
		getModule("JackiModule").addLust(5)

	if(_action == "kind_massage_forcedfuck"):
		processTime(10*60)
		getModule("JackiModule").doBetray()

	if(_action == "kind_massage_forcedfisting"):
		processTime(10*60)
		getModule("JackiModule").doBetray()

	if(_action == "kind_massage_forcedfuck_cum"):
		processTime(6*60)
		getModule("JackiModule").advanceSkill("jackiSkillButtslut")
		getModule("JackiModule").makeJackiBusy()
		getCharacter("jacki").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("jacki")

	if(_action == "kind_massage_forcedfisting_cum"):
		processTime(6*60)
		getModule("JackiModule").advanceSkill("jackiSkillButtslut")
		getModule("JackiModule").makeJackiBusy()

	if(_action == "jog_do"):
		processTime(15*60)
		getModule("JackiModule").addAnger(-5)
		getModule("JackiModule").addLust(6)
		GM.pc.addStamina(-10)

	if(_action == "jog_afterchat"):
		processTime(10*60)

	if(_action == "jog_chat_asklistenshort"):
		if(anger <= -0.8):
			processTime(20*60)

	if(_action == "jacki_piercing_story_start"):
		getCharacter("jacki").resetEquipment()
		getCharacter("jacki").getInventory().removeItemFromSlot(InventorySlot.Vagina)
		getCharacter("jacki").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		getCharacter("jacki").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))

	if(_action == "jacki_piercing_story_table"):
		getCharacter("jacki").resetEquipment()
		getCharacter("jacki").getInventory().removeItemFromSlot(InventorySlot.Vagina)

	if(_action == "jacki_piercing_story_piercings"):
		getCharacter("jacki").resetEquipment()

	if(_action == "jacki_piercing_story_end"):
		processTime(30*60)
		getCharacter("jacki").resetEquipment()
		getModule("JackiModule").addLust(5)

	if(_action == "jog_afterchat_shower"):
		processTime(3*60)

	if(_action == "jog_try_piercings"):
		processTime(5*60)

	if(_action == "jog_anal_fuck"):
		processTime(5*60)

	if(_action == "jog_breed_fuck"):
		processTime(5*60)

	if(_action == "jog_afterchat_shower_do"):
		processTime(10*60)
		getCharacter("jacki").afterTakingAShower()
		GM.pc.afterTakingAShower()
		GM.pc.addStamina(20)

	if(_action == "jog_afterchat_jogmore"):
		processTime(10*60)
		GM.pc.addStamina(10)

	if(_action == "jog_afterbigjog"):
		processTime(10*60)
		getModule("JackiModule").addLust(2)

	if(_action == "jog_afterbigjog_nobottle"):
		getModule("JackiModule").addAnger(1)

	if(_action == "jog_afterbigjog_givebottle"):
		processTime(5*60)
		var item = _args[0]
		if(item != null):
			usedItemName = item.getVisibleName()
			plasticBottleFluidID = item.getFluids().getDominantFluidID()
			if(plasticBottleFluidID == null):
				plasticBottleFluidID = "Milk"
			item.getFluids().transferTo(getCharacter("jacki"), 0.6)
			item.getFluids().transferTo(getCharacter("jacki").getBodypart(BodypartSlot.Head), 1.0)
		
		if(plasticBottleFluidID == "Milk"):
			getModule("JackiModule").addAnger(-2)
		if(plasticBottleFluidID == "GirlCum"):
			getModule("JackiModule").addAnger(-1)
		if(plasticBottleFluidID == "Cum"):
			if(corruption > 0.7):
				getModule("JackiModule").addCorruption(5)
			else:
				getModule("JackiModule").addCorruption(5)
				getModule("JackiModule").addAnger(50)
		if(plasticBottleFluidID == "Piss"):
			waterLevel = getModule("JackiModule").getSkillScore("jackiSkillWatersports")
			getModule("JackiModule").advanceSkill("jackiSkillWatersports")
			if(waterLevel <= 2):
				getModule("JackiModule").addAnger(40)
				getModule("JackiModule").addCorruption(2)
			elif(waterLevel <= 5):
				getModule("JackiModule").addAnger(10)
				getModule("JackiModule").addCorruption(3)
			else:
				getModule("JackiModule").addAnger(-4)
				getModule("JackiModule").addCorruption(5)

	if(_action == "jog_try_piercings_finger"):
		processTime(15*60)
		GM.pc.cummedInMouthBy("jacki", FluidSource.Vagina, 0.7)
		GM.pc.cummedOnBy("jacki", FluidSource.Vagina, 0.3)
		getModule("JackiModule").advanceSkill("jackiSkillButtslut")
		getModule("JackiModule").addAnger(-5)
		getModule("JackiModule").addCorruption(3)

	if(_action == "jog_try_piercings_fisting"):
		processTime(6*60)

	if(_action == "jog_try_piercings_fisting_fist"):
		processTime(5*60)
		getModule("JackiModule").addCorruption(2)

	if(_action == "jog_try_piercings_fisting_thrusts"):
		processTime(5*60)
		getModule("JackiModule").addCorruption(2)

	if(_action == "jog_try_piercings_fisting_faster"):
		processTime(5*60)
		getModule("JackiModule").addCorruption(2)
		getModule("JackiModule").addAnger(-2)

	if(_action == "jog_breed_fuck_start"):
		processTime(5*60)

	if(_action == "jog_breed_fuck_faster"):
		processTime(5*60)

	if(_action == "jog_breed_fuck_cuminside"):
		processTime(10*60)
		getCharacter("jacki").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("jacki")
		getModule("JackiModule").addLust(10)
		getModule("JackiModule").addCorruption(5)

	if(_action == "jog_breed_fuck_pullout"):
		processTime(10*60)
		getCharacter("jacki").cummedOnBy("pc")
		GM.pc.orgasmFrom("jacki")
		getModule("JackiModule").addLust(5)
		getModule("JackiModule").addCorruption(10)

	if(_action == "jog_anal_fuck_inside"):
		processTime(3*60)

	if(_action == "jog_anal_fuck_cuminside"):
		processTime(15*60)
		getCharacter("jacki").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("jacki")
		getModule("JackiModule").addCorruption(3)
		getModule("JackiModule").addAnger(-2)
		getModule("JackiModule").advanceSkill("jackiSkillButtslut")

	if(_action == "jog_anal_fuck_pullout"):
		processTime(15*60)
		getCharacter("jacki").cummedOnBy("pc")
		GM.pc.orgasmFrom("jacki")
		getModule("JackiModule").addLust(3)
		getModule("JackiModule").addAnger(2)
		getModule("JackiModule").advanceSkill("jackiSkillButtslut")

	if(_action == "jog_anal_strapon"):
		processTime(5*60)
		var strapon = _args[0]
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)

	if(_action == "jog_anal_strapon_inside"):
		processTime(3*60)

	if(_action == "jog_anal_strapon_cum"):
		processTime(15*60)
		getCharacter("jacki").cummedInAnusBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("jacki")
		getModule("JackiModule").addCorruption(3)
		getModule("JackiModule").addAnger(-2)
		getModule("JackiModule").advanceSkill("jackiSkillButtslut")

	if(_action == "endthescene_unequpstrapon"):
		endScene()
		GM.pc.unequipStrapon()
		return

	if(_action == "jog_sounding_intro"):
		processTime(6*60)
		getCharacter("jacki").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))

	if(_action == "jog_sounding_dildo"):
		processTime(5*60)

	if(_action == "jog_sounding_intro_rod"):
		processTime(13*60)
		getModule("JackiModule").advanceSkill("jackiSkillSounding")
		getModule("JackiModule").addCorruption(3)

	if(_action == "endthescene_freejackieyes"):
		endScene()
		getCharacter("jacki").removeAllRestraints()
		return

	if(_action == "jog_sounding_dildo_cum"):
		processTime(13*60)
		getModule("JackiModule").advanceSkill("jackiSkillSounding")
		getModule("JackiModule").addCorruption(3)

	if(_action == "jog_sounding_finger_cum"):
		processTime(13*60)
		getModule("JackiModule").advanceSkill("jackiSkillSounding")
		getModule("JackiModule").addCorruption(4)

	if(_action == "do_creepfollow_follow"):
		processTime(10*60)
		setFlag("JackiModule.jackiGotFollowed", true)
		getModule("JackiModule").addCorruption(4)

	if(_action == "do_creepfollow_block"):
		processTime(10*60)
		if(corruption <= 0.6):
			getModule("JackiModule").addAnger(10)

	if(_action == "do_creepfollow_horsedildo"):
		processTime(5*60)

	if(_action == "do_creepfollow_horsedildo_start"):
		processTime(20*60)
		getModule("JackiModule").addLust(3)

	if(_action == "do_creepfollow_horsedildo_force"):
		processTime(10*60)
		getModule("JackiModule").advanceSkill("jackiSkillButtslut")
		getModule("JackiModule").addAnger(30)
		getModule("JackiModule").addCorruption(4)

	if(_action == "do_creepfollow_horsedildo_ride"):
		processTime(10*60)
		getModule("JackiModule").advanceSkill("jackiSkillButtslut")
		getModule("JackiModule").addCorruption(4)

	if(_action == "do_grab"):
		processTime(2*60)

	if(_action == "do_grab_letgo"):
		getModule("JackiModule").addCorruption(-10)
		getModule("JackiModule").addLust(-10)
		if(anger > 0.0):
			getModule("JackiModule").addAnger(-10)

	if(_action == "do_grab_fisting"):
		processTime(10*60)

	if(_action == "do_grab_anal"):
		processTime(5*60)

	if(_action == "do_grab_sounding"):
		processTime(15*60)
		getModule("JackiModule").advanceSkill("jackiSkillSounding")
		getModule("JackiModule").addCorruption(4)

	if(_action == "do_grab_urethra_fuck"):
		processTime(6*60)
		getModule("JackiModule").advanceSkill("jackiSkillSounding")
		getModule("JackiModule").makeJackiBusy()

	if(_action == "do_grab_fisting_fisting"):
		processTime(6*60)
		getModule("JackiModule").advanceSkill("jackiSkillButtslut")
		#getModule("JackiModule").makeJackiBusy()
		getModule("JackiModule").addCorruption(5)

	if(_action == "do_grab_fisting_enoughfist"):
		processTime(3*60)

	if(_action == "do_grab_anal_ramitin"):
		processTime(3*60)

	if(_action == "do_grab_anal_faster"):
		getModule("JackiModule").advanceSkill("jackiSkillButtslut")
		#getModule("JackiModule").makeJackiBusy()
		getModule("JackiModule").addCorruption(5)
		GM.pc.addLust(50)

	if(_action == "do_grab_anal_cuminside"):
		getModule("JackiModule").addCorruption(2)
		getCharacter("jacki").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("jacki")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "do_grab_anal_pullout"):
		getModule("JackiModule").addLust(2)
		getCharacter("jacki").cummedOnBy("pc")
		GM.pc.orgasmFrom("jacki")
		GM.pc.addSkillExperience(Skill.SexSlave, 40)

	if(_action == "do_grab_strapon"):
		processTime(5*60)
		var strapon = _args[0]
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)

	if(_action == "do_grab_strapon_ramitin"):
		processTime(3*60)

	if(_action == "do_grab_strapon_faster"):
		getModule("JackiModule").advanceSkill("jackiSkillButtslut")
		#getModule("JackiModule").makeJackiBusy()
		getModule("JackiModule").addCorruption(6)
		getCharacter("jacki").cummedInAnusBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("jacki")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "do_grab_strapon_pullout"):
		processTime(3*60)

	if(_action == "do_grab_urethra_fuck_ram"):
		processTime(10*60)

	if(_action == "do_grab_urethra_fuck_move"):
		processTime(5*60)

	if(_action == "do_grab_urethra_fuck_cum"):
		processTime(6*60)
		getCharacter("jacki").addEffect(StatusEffect.JackiCumInUrethra)
		GM.pc.orgasmFrom("jacki")
		getModule("JackiModule").addCorruption(8)

	if(_action == "bring_jacki_to_medical"):
		processTime(6*60)

	if(_action == "endthescene_removeurethracum"):
		getCharacter("jacki").removeEffect(StatusEffect.JackiCumInUrethra)
		endScene()
		return

	if(_action == "do_enslave_eliza"):
		processTime(3*60)

	if(_action == "do_enslave_follow"):
		processTime(10*60)

	if(_action == "do_enslave_choice"):
		processTime(5*60)
		getCharacter("jacki").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))

	if(_action == "do_enslave_freepussy"):
		setFlag("JackiModule.Jacki_ch2GotPussyFreed", true)

	if(_action == "do_enslave_extrapiercings"):
		setFlag("JackiModule.Jacki_ch2GotExtraPiercings", true)

	if(_action == "do_enslave_brand"):
		setFlag("JackiModule.Jacki_ch2GotExtraPiercings", true)

	if(_action == "do_enslave_end"):
		getCharacter("jacki").removeAllRestraints()
		processTime(20*60)
		addExperienceToPlayer(500)

	if(_action == "do_enslave_brand_pick"):
		setFlag("JackiModule.Jacki_ch2SlaveText", _args[0])

	if(_action == "do_enslave_brand_dotype"):
		if(getTextboxData("jacki_tattoo") == ""):
			return
		var theText = getTextboxData("jacki_tattoo")
		if(theText == null):
			theText = "buttslut"
		theText = Util.sanitizePlayerEnteredString(theText, "buttslut")
		setFlag("JackiModule.Jacki_ch2SlaveText", theText)
		setState("do_enslave_brand_pick")
		return

	if(_action == "do_enslave_strapon"):
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("StraponCanine"))
		processTime(3*60)

	if(_action == "do_enslave_fuck"):
		processTime(3*60)

	if(_action == "do_enslave_nofuck"):
		processTime(5*60)

	if(_action == "do_enslave_fuck_penetrate"):
		processTime(6*60)

	if(_action == "do_enslave_fuck_faster"):
		processTime(5*60)

	if(_action == "do_enslave_fuck_cuminside"):
		getCharacter("jacki").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("jacki")
		GM.pc.addSkillExperience(Skill.SexSlave, 50)

	if(_action == "do_enslave_fuck_pullout"):
		getCharacter("jacki").cummedOnBy("pc")
		GM.pc.orgasmFrom("jacki")
		GM.pc.addSkillExperience(Skill.SexSlave, 50)

	if(_action == "do_enslave_fuck_afterfuck"):
		processTime(10*60)
		GM.pc.removeStrapon()

	if(_action == "do_enslave_strapon_penetrate"):
		processTime(6*60)

	if(_action == "do_enslave_strapon_faster"):
		processTime(5*60)

	if(_action == "do_enslave_strapon_knot"):
		GM.pc.orgasmFrom("jacki")
		GM.pc.addSkillExperience(Skill.SexSlave, 50)

	setState(_action)

func saveData():
	var data = .saveData()

	data["anger"] = anger
	data["corruption"] = corruption
	data["lust"] = lust
	data["hasUnderwear"] = hasUnderwear
	data["buttScore"] = buttScore
	data["soundScore"] = soundScore
	data["usedItemName"] = usedItemName
	data["plasticBottleFluidID"] = plasticBottleFluidID
	data["waterLevel"] = waterLevel

	return data

func loadData(data):
	.loadData(data)

	anger = SAVE.loadVar(data, "anger", 0.0)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	lust = SAVE.loadVar(data, "lust", 0.0)
	hasUnderwear = SAVE.loadVar(data, "hasUnderwear", false)
	buttScore = SAVE.loadVar(data, "buttScore", 0)
	soundScore = SAVE.loadVar(data, "soundScore", 0)
	usedItemName = SAVE.loadVar(data, "usedItemName", "")
	plasticBottleFluidID = SAVE.loadVar(data, "plasticBottleFluidID", "")
	waterLevel = SAVE.loadVar(data, "waterLevel", 0)
