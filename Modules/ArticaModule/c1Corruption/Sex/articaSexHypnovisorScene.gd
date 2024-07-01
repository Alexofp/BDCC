extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var visorID = ""
var didFeed = false
var cagedByNova = false

func _init():
	sceneID = "articaSexHypnovisorScene"

func _run():
	if(state == ""):
		addCharacter("artica")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		saynn("Which hypnovisor do you want to put on Artica?")

		addPumpButtons("do_pick_visor")
		addButton("Cancel", "You changed your mind", "endthescene")
		if (false):
			addButton("Nope", "You shouldn't see this", "do_pick_visor")
			addButton("Nope2", "Shouldn't see this either", "endthescene2")
	if(state == "do_pick_visor"):
		saynn("You show Artica some fancy hi-tech goggles. Curiosity flashes in her eyes.")

		saynn("[say=artica]Mmm.. What is that?..[/say]")

		saynn("[say=pc]Wanna try it? It's more of a toy than anything.[/say]")

		saynn("[say=artica]I.. I d-don't know..[/say]")

		saynn("Despite her hesitation, you just put the thing on her.")

		saynn("[say=artica]Eep..[/say]")

		saynn("What program do you want to run?")

		addButton("Obedient pet", "Make Artica act like a good obedient puppy", "obedient_pet")
		addButton("Public use slut", "(Sharing!) Turn Artica into a mindless whore that will be fucked by everyone..", "public_use")
	if(state == "obedient_pet"):
		addCharacter("artica", ["hypno"])
		saynn("You turn on the visor and choose a program..")

		saynn("[sayOther]Running pet.exe.. please stand by..[/sayOther]")

		saynn("[say=artica]W-wha.. W-what is it g-gonna do?[/say]")

		saynn("[say=pc]It will make you feel good, don't worry.[/say]")

		saynn("She is clearly still nervous, her cornered eyes looking through the glass of the visor.. until a warm yellow glow begins to spread throughout it.")

		saynn("[sayOther]Subject detected.. Artica.. Checking and suppressing resistance..[/sayOther]")

		saynn("The fluff is blinking rapidly, her gaze struggles to focus now..")

		saynn("[say=artica]Um.. c-can w-we.. w-wha.. what is.. ohh-h..[/say]")

		saynn("[sayOther]No resistance detected.. Creating a personality backup.. done.. Initiating a mind reprogramming procedure..[/sayOther]")

		saynn("[say=artica]Wait.. What was t-tha.. ah.. haha..[/say]")

		saynn("Artica forgets to close her mouth after her last sentence, her tongue rolls out, drooling, while various hypnotic lights dance before her eyes.. creating patterns.. gradients and spirals.. which for some reason.. reflect in her own eyes..")

		saynn("The fluff is swaying in place, her tail curling around her leg.. her hind paws stand high on her toes.. her arms spread slightly..")

		saynn("[sayOther]High levels of psycho-neutral hyperplasticity detected.. Subject's mind is highly receptive to suggestion.. Brainwashing.. 0%.. 20%.. 40%..[/sayOther]")

		saynn("Wow, that is going fast indeed. Artica is standing completely still, just watching the glowing colors and drooling, all her fidgeting seems to be gone..")

		saynn("[sayOther]60%.. 80%.. 90%.. 99%.. Done. Uploading a new personality.. Done.. Obedience levels set to 100%, willpower set to 0%.. Pet.exe returned status 0.[/sayOther]")

		saynn("The visor continues to idly shine a warm yellow glow into Artica's hypnotized eyes..")

		saynn("[say=pc]Artica?[/say]")

		saynn("She notices you..")

		addButton("Continue", "See what happens next", "artica_brainwashed")
	if(state == "artica_brainwashed"):
		addCharacter("artica", ["naked", "hypno"])
		playAnimation(StageScene.Duo, "stand", {npc="artica", npcAction="kneel", npcBodyState={hard=true,naked=true}})
		if (!isNaked):
			saynn("Slowly, almost involuntarily, Artica begins to strip off her uniform. Her hands unbutton her shirt, revealing her {artica.breasts} to you.. followed by her pulling her shorts down and then wiggling out of them, exposing her"+str(" hard" if !isCaged else "")+" {artica.penis} and a wet pussy slit.")

			saynn("After fully exposing herself to you, Artica lowers herself to her knees before you and smiles, her gaze directed up at you.. an extremely obedient gaze..")

		else:
			saynn("Slowly, almost involuntarily, Artica begins to run her paws along her fur, first bringing them to her {artica.breasts} and cupping them.. before teasing her"+str(" hard" if !isCaged else "")+" {artica.penis} and a wet pussy slit.")

			saynn("After fully exposing herself to you, Artica lowers herself to her knees before you and smiles, her gaze directed up at you.. an extremely obedient gaze..")

		addButton("Tricks", "See if she will really obey", "do_tricks")
	if(state == "do_tricks"):
		playAnimation(StageScene.Beg, "beg", {pc="artica", npc="pc", bodyState={naked=true, hard=true, leashedBy="pc"}})
		saynn("Artica doesn't resist as you attach a leash to her collar.. She smiles with her tongue out and awaits your commands, her ears perked up.")

		saynn("[say=pc]Voice?[/say]")

		saynn("[say=artica]Yip..[/say]")

		saynn("You hear the response instantly.")

		saynn("[say=pc]Louder.[/say]")

		saynn("[say=artica]Yip! Yip![/say]")

		saynn("Kinda adorable. Inmates around you begin to take note of the obedient puppy that you have.. a little crowd starts gathering around.")

		saynn("[say=pc]Give paw.[/say]")

		saynn("Artica darts her hand out as soon as she hears the order.. You shake it and hum..")

		saynn("[say=pc]Beg.[/say]")

		saynn("The fluff instantly brings her arms close to her chest, her clenched hands imitating paws. She is bouncing cutely.. proudly displaying you her tits,"+str(" pregnant belly," if getCharacter("artica").isVisiblyPregnant() else "")+", "+str("locked drippy cock that twitches from every command" if isCaged else "hard canine cock that twitches from every command")+" and her wet cyan slit.")

		saynn("[say=artica]Yip.. yi-i-ip..[/say]")

		saynn("She looks up at you with her big hypnotized eyes, her lips still parted, her tongue out..")

		addButtonWithChecks("Feed her", "She clearly wants a big bone", "bj_pet", [], [[ButtonChecks.HasReachablePenis]])
		addButton("Good girl", "Praise her for being such a good puppy", "pet_goodgirl")
	if(state == "bj_pet"):
		playAnimation(StageScene.SexOral, "sex", {pc="pc", npc="artica", bodyState={exposedCrotch=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Might as well reward the obedient puppy for doing so well. The crowd watches as you present Artica your {pc.penis}.")

		saynn("[say=pc]Want this bone? Come here.[/say]")

		saynn("With a hungry look in her eyes, Artica eagerly complies and crawls towards you, her tongue making her lips wet in anticipation.")

		saynn("Without any hesitation, Artica buries her face in your crotch, her snout nuzzling against your balls as she inhales deeply, savoring the intoxicating scent that makes her pussy drip.. She lets out a needy yip as her tongue darts out to lap up the shiny drop of precum from the tip of your cock, her own canine member twitching as she does it..")

		saynn("Then, while everyone is watching, she takes you into her mouth, her lips wrapping tightly around the shaft as she starts working head back and forth, sucking you off. With each thrust, you feel your dick hitting the back of her throat.. until Artica suddenly impales herself onto your member, letting it curve down her throat, stretching it.")

		saynn("[say=pc]Ah. Wow, your throat is tight, puppy.[/say]")

		saynn("The crowd admires the pup's ability to deepthroat you, some are enjoying themselves..")

		addButton("Continue", "See what happens next", "bj_pet_cum")
	if(state == "bj_pet_cum"):
		playAnimation(StageScene.SexOral, "fast", {pc="pc", npc="artica", bodyState={exposedCrotch=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Artica looks up at you with her obedient hypnotized eyes as she completely ignores her gag-reflex, throwing her head forward each time until her snout hits your crotch, your cock bulging her neck and making her choke.")

		saynn("The way her long canine tongue is still swirling around your shaft is making your legs want to give, you put your hand on the back of Artica's head.. and then wait for a moment when you're just about to cum.. before forcing her to take your full length..")

		saynn("[say=pc]GHrr.. Ah..[/say]")

		saynn("With a grunt, her wet tight walls push you over the edge, your {pc.penis} pulsing in Artica's throat as you release your load.. Inmates are cheering as they see your {pc.cum} flooding her mouth.. so much that the poor fluff is clearly choking on it, the excesses flying out of her nostrils, making her look like a messy slut..")

		saynn("[say=pc]Yeah.. swallow it all, girl.[/say]")

		saynn("Her throat is doing her best, gulping your seed as much as she can while she is struggling to breathe..")

		addButton("Good girl", "Praise her for being such a good puppy", "pet_goodgirl")
	if(state == "pet_goodgirl"):
		if (didFeed):
			playAnimation(StageScene.Beg, "pat", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
			saynn("You yank your cock out and let Artica clean it up while you're patting her on the head.")

			saynn("[say=pc]Good girl.. such a good girl..[/say]")

			saynn("The fluff chrrrs happily while licking up the mess before swallowing it all.")

		else:
			playAnimation(StageScene.Beg, "pat", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
			saynn("You pat Artica on the head while she is still bouncing.")

			saynn("[say=pc]Good girl.. such a good girl..[/say]")

		saynn("You notice that each time you praise her, a wave of pleasure seems to be rocking through her, causing her cock to throb"+str(" in its little cage" if isCaged else"")+" and her pussy to drip juices more.")

		saynn("Makes you wonder how far you can push this hypnotized cutie.. You better get a good view out of it too.")

		saynn("[say=pc]Present yourself, Artica. I wanna see all your fuckholes. The whole crowd does.[/say]")

		addButton("Continue", "See what happens next", "pet_presents")
	if(state == "pet_presents"):
		playAnimation(StageScene.Zonked, "tease", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Without any hesitation, Artica lays down on the floor and spreads her legs wide, exposing every inch of her body to your gazes."+str(" Her canine cock stands proudly erect, knot pulsing as precum slides down the cyan shaft" if !isCaged else " Her caged cock is pulsing in its cage")+" while her wet pussy and tight asshole are begging for attention.")

		saynn("[say=artica]Yip![/say]")

		saynn("She is panting softly, reveling in all the attention that she is getting. She was such a shy girl before.. but now she is eagerly presenting her fuckholes to anyone..")

		addButton("Stroke!", "Order the girl to touch herself in front of you all", "pet_cum_stroke")
		addButton("Cum!", "Order the girl to cum hands-free", "pet_cum_handsfree")
	if(state == "pet_cum_stroke"):
		if (isCaged):
			playAnimation(StageScene.Zonked, "rub", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
			saynn("[say=pc]Touch yourself, Artica.[/say]")

			saynn("Her paws instantly dart to her cock.. but the chastity cage prevents her from getting any kind of erection. The fluff makes noises of frustration as she tugs on her cage.. until she gives up and reaches her paws under her balls, spreading her needy pussy for everyone, little ropes of juices hanging between her folds..")

			saynn("She stuffs her exposed fuckhole with her digits, fingering herself while everyone is staring at her..")

		else:
			playAnimation(StageScene.Zonked, "stroke", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
			saynn("[say=pc]Touch yourself, Artica.[/say]")

			saynn("Her paws instantly dart to her cock.. digits wrap around the shaft and start stroking it as soon as you allow it. The fluff is moaning cutely while her whole body reacts to the influx of pleasure, her needy holes visibly clenching while her canine shaft leaks pre that she quickly spreads along the whole length..")

			saynn("She keeps stroking while everyone is staring at her.. Her knot is inflating to its full size..")

		addButton("Continue", "See what happens next", "pet_cum_stroke_cum")
	if(state == "pet_cum_stroke_cum"):
		if (isCaged):
			playAnimation(StageScene.Zonked, "rubcum", {pc="artica", npc="pc", pcCum=true, bodyState={naked=true, hard=true}})
		else:
			playAnimation(StageScene.Zonked, "rubcum", {pc="artica", npc="pc", pcCum=true, bodyState={naked=true, hard=true}})
		saynn("Then, with a cute moan, pent-up Artica suddenly throws her head back, her {artica.penis} erupting in a torrent of hot, sticky cum that splatters across her tits and stomach. Each pulse is sending waves of pleasure through her body, her toes curling in ecstasy, her needy pussy gushing with girlcum!")

		saynn("Completely spent, Artica lays panting on the floor, her body covered in her own cum as she enjoys the afterglow of her orgasm.")

		saynn("[say=pc]Good.. very good..[/say]")

		addButton("Hypnovisor", "Turn it off", "pet_turnoffvisor")
	if(state == "pet_cum_handsfree"):
		playAnimation(StageScene.Zonked, "cum", {pc="artica", npc="pc", pcCum=true, bodyState={naked=true, hard=true}})
		saynn("You notice that Artica is already on the edge of her orgasm. Makes you curious..")

		saynn("[say=pc]Cum, Artica. Paws away from your cock and cunt though.[/say]")

		saynn("Whimpers of desire escape her lips as she hears that. Her cock is throbbing in anticipation, her pussy clenching around the air, her hips bucking involuntarily..")

		saynn("The fluff is wiggling more and more on the floor, her hypnotized eyes watching you as you await patiently. Pressure seems to be rising in her cock, her muscles tensing up..")

		saynn("Then, with a cute moan, pent-up Artica suddenly throws her head back, her {artica.penis} erupting in a torrent of hot, sticky cum that splatters across her tits and stomach. Each pulse is sending waves of pleasure through her body, her toes curling in ecstasy, her needy pussy gushing with girlcum!")

		saynn("Completely spent, Artica lays panting on the floor, her body covered in her own cum as she enjoys the afterglow of her orgasm.")

		saynn("[say=pc]Good.. very good..[/say]")

		addButton("Hypnovisor", "Turn it off", "pet_turnoffvisor")
	if(state == "pet_turnoffvisor"):
		playAnimation(StageScene.Duo, "stand", {npc="artica", npcBodyState={naked=true}})
		addCharacter("artica", ["naked"])
		saynn("After all this fun, it was finally time to stop. You press a button on the hypnovisor to stop the session..")

		saynn("[sayOther]Do you wanna restore the old personality?[/sayOther]")

		saynn("As much as you don't mind having a mindless obedient fucktoy.. You'd rather let Artica keep her memories. You press the yes button.")

		saynn("[sayOther]Restoring personality backup.. Done.. Shutting down..[/sayOther]")

		saynn("The warm yellow glow in front of Artica's hypnotized eyes fades away.. You snap your fingers in front of her face a few times and then help her to get up.")

		saynn("[say=artica]Hah.. Um.. oh.. what..[/say]")

		saynn("Artica looks down at her and sees the mess on her tits. She confirms her suspicions by grabbing some of it and licking it..")

		saynn("[say=artica]T-that's.. my cum..[/say]")

		saynn("Then she looks around and finally realizes how big of a crowd is surrounding her.")

		saynn("[say=artica]..yip.. uhm-m.. eep..[/say]")

		saynn("She covers up and hides behind you, her cheeks burning red.")

		saynn("[say=artica]What is..[/say]")

		saynn("[say=pc]It's okay, Artica. You were such a good puppy.[/say]")

		saynn("[say=artica]Y-yip.. yy-yip.. I mean.. e-eep..[/say]")

		saynn("Looks like she remembers something. Her mind does. Since the show is over, the crowd begins to disperse.")

		saynn("[say=pc]Do you remember what happened?[/say]")

		saynn("She rubs her snout..")

		saynn("[say=artica]I.. was on my knees.. and it was.. f-fun..[/say]")

		saynn("You chuckle and pat her. But not too much.. you don't want her lusty so soon.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "public_use"):
		addCharacter("artica", ["hypno"])
		saynn("You turn on the visor and choose a program..")

		saynn("[sayOther]Running public_use.exe.. please stand by..[/sayOther]")

		saynn("[say=artica]W-wha.. P-public use?..[/say]")

		saynn("[say=pc]It will be fun for a slut like you, trust me.[/say]")

		saynn("She is clearly still nervous, her cornered eyes looking through the glass of the visor.. until a warm yellow glow begins to spread throughout it.")

		saynn("[sayOther]Subject detected.. Artica.. Checking and suppressing resistance..[/sayOther]")

		saynn("The fluff is blinking rapidly, her gaze struggles to focus now..")

		saynn("[say=artica]Um.. c-can w-we.. w-wha.. what is.. ohh-h..[/say]")

		saynn("[sayOther]No resistance detected.. Creating a personality backup.. done.. Initiating a mind reprogramming procedure..[/sayOther]")

		saynn("[say=artica]Wait.. What was t-tha.. ah.. haha..[/say]")

		saynn("Artica forgets to close her mouth after her last sentence, her tongue rolls out, drooling, while various hypnotic lights dance before her eyes.. creating patterns.. gradients and spirals.. which for some reason.. reflect in her own eyes..")

		saynn("The fluff is swaying in place, her tail curling around her leg.. her hind paws stand high on her toes.. her arms spread slightly..")

		saynn("[sayOther]High levels of psycho-neutral hyperplasticity detected.. Subject's mind is highly receptive to suggestion.. Brainwashing.. 0%.. 20%.. 40%..[/sayOther]")

		saynn("Wow, that is going fast indeed. Artica is standing completely still, just watching the glowing colors and drooling, all her fidgeting seems to be gone..")

		saynn("[sayOther]60%.. 80%.. 90%.. 99%.. Done. Uploading a new personality.. Done.. Desire levels set to 100%, willpower set to 0%.. Public_use.exe returned status 0.[/sayOther]")

		saynn("The visor continues to idly shine a warm yellow glow into Artica's hypnotized eyes..")

		saynn("[say=pc]Artica?[/say]")

		saynn("She notices you..")

		addButton("Continue", "See what happens next", "slut_brainwashed")
	if(state == "slut_brainwashed"):
		addCharacter("artica", ["naked", "hypno"])
		playAnimation(StageScene.Grope, "watchrub", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("The fluff admires your face.. and your crotch.. while one of her hands reaches straight for her pussy, sneaking under the balls and spreading her folds, revealing how wet they are.")

		saynn("Artica shows zero shame as she starts masturbating out in public, her digits plunging in and out of her sex, making wet noises.")

		saynn("[say=pc]Hah. I guess it worked.[/say]")

		saynn("A sight like that is quick to attract people.. A crowd begins to gather around the girl.. But she keeps fingering her needy cyan pussy, her back arched so anyone would be able to see her slick folds and her twitching {artica.penis}..")

		saynn("[sayMale]Look at this whore! She is really going at it, ahaha.[/sayMale]")

		saynn("Brave ones already step out and get closer.. Artica rubs her heated body against them, her tongue is still out, her lips curled into a smile, her hypnotized eyes enjoying the attention. Inmates are spreading her ass while she obediently pulls her tail up for them, exposing her tight asshole..")

		saynn("[sayMale]I knew she would snap![/sayMale]")

		saynn("[sayFemale]It's only because of the hypnovisor, you dumb fucks.[/sayFemale]")

		saynn("[sayMale]I don't care, I'm breeding the slut![/sayMale]")

		saynn("[say=risha]The fuck is going on here? Let me through or I will step on your dicks.[/say]")

		saynn("It's her..")

		addButton("Continue", "See what happens next", "risha_encounter")
	if(state == "risha_encounter"):
		addCharacter("risha")
		playAnimation(StageScene.Zonked, "rub", {pc="artica", npc="risha", bodyState={naked=true, hard=true}})
		saynn("Risha, the lady that she is, rams her way through the crowd, hitting Artica in the process as well. Artica collapses.. but doesn't stop touching herself, inviting anyone to finally use her slutty holes.")

		saynn("[say=risha]Oh, wow, look at that. The girl finally made her choice. I knew that you would never be a mineshaft slave anyway. Now come here, slut.[/say]")

		saynn("Things are getting heated..")

		addButton("Continue", "See what happens next", "artica_fucked_by_risha")
	if(state == "artica_fucked_by_risha"):
		playAnimation(StageScene.SexPinnedBehind, "sex", {pc="risha", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		aimCameraAndSetLocName("main_hallroom5")
		saynn("Risha picks up the girl by the collar and pins her against the nearest wall..")

		if (getCharacter("artica").isVisiblyPregnant()):
			saynn("[say=risha]Someone knocked your slutty cunt up already, what a shame.[/say]")

		else:
			saynn("[say=risha]Do you bark while getting bred, slut?[/say]")

		saynn("Seconds later, a big barbed cock pierces Artica's slit. Risha forces herself inside the fluff and already starts pounding her raw. Why waste time with the foreplay if that pussy is begging to be stretched already..")

		saynn("Even though Artica's inner walls get scratched by the barbs and her face is pressed against the cold concrete, she is chrrring happily, her"+str(" swollen lactating" if getCharacter("artica").isLactating() else " perky ")+" tits bouncing during each thrust.")

		saynn("[say=risha]Oh yeah, you love that cock, don't you? Gonna get you addicted to it, make you a painslut that craves her pussy to be torn each time.[/say]")

		addButton("Continue", "See what happens next", "risha_cums_in_artica")
	if(state == "risha_cums_in_artica"):
		playAnimation(StageScene.SexPinnedBehind, "fast", {pc="risha", npc="artica", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn(""+str("Artica's caged cock shoots weak spurts of cum onto the concrete wall in front of her" if isCaged else "Artica's hard cock shoots spurts of cum onto the concrete wall in front of her")+", legs shaking, pussy clenching hard around Risha's feline member..")

		saynn("The guard grabs Artica's face by the cheek, her clawed digits inside that cyan mouth.. while the fluff is just chrrring and drooling, her hypnotized eyes show only desire..")

		if (getCharacter("artica").isVisiblyPregnant()):
			saynn("[say=risha]Ngh.. Enjoy your new life, breeding bitch.[/say]")

		else:
			saynn("[say=risha]Ngh.. Enjoy the kittens, bitch.[/say]")

		saynn("And with that, Risha rams her full length inside, breaking into Artica's womb and creating a bump on her belly.. that only gets bigger as her cock starts pumping it full of her thick semen, the barbs keep scratching at the womb's walls.")

		saynn("Artica stands high on her toes, her tail curling around Risha's waist.. while her pussy already gets creampied.")

		saynn("Risha yanks her cock out, leaving Artica's stuffed pussy to pulse-drip seed.. The guard quickly scribbles something on Artica's snow-white fur..")

		saynn("[say=risha]Glad I got to be the first, sweetheart. Now, who here is a cockslave that will clean my messy shaft?[/say]")

		addButton("Continue", "See what happens next", "artica_after_risha")
	if(state == "artica_after_risha"):
		removeCharacter("risha")
		playAnimation(StageScene.Grope, "watchrub", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		aimCameraAndSetLocName("yard_firstroom")
		saynn("After Risha fucks off to use someone else's throat, Artica is just following along the wall of the hall, stumbling occasionally, her gaze spaced out and lusty.. still lusty..")

		saynn("She leaves a trail of white behind her.. so it's not too hard to keep track of her. Other inmates are still surrounding her, some reach out to grope her tits and ass, stroke her fluffy tail.. and some sick fucks just seem to want to hold her hand..")

		saynn("They all scatter off when another guard announces her presence..")

		saynn("[say=nova]Wow, who is this cutie~? Are you lost?[/say]")

		addButton("Continue", "See what happens next", "artica_finds_nova")
	if(state == "artica_finds_nova"):
		addCharacter("nova")
		aimCameraAndSetLocName("yard_westCorridor")
		playAnimation(StageScene.Beg, "beg", {pc="artica", npc="nova", bodyState={naked=true, hard=true}})
		saynn("Artica notices a husky.. and drops to all fours before crawling closer to her. White fluff bounces happily, holding her paws close to her chest, like a puppy.")

		saynn("[say=nova]That is so adorable~."+str(" With a cage on your cock and everything.." if isCaged else "")+" Cute goggles you got there, hope you weren't forced to wear them. Should I take them off?[/say]")

		saynn("When Nova reaches out to do that, Artica quickly nuzzles her crotch, probably sniffing a big bone that's hiding under that fancy armor.. That nuzzling makes the guard stop and reconsider, her crotch bulging..")

		saynn("[say=nova]Or.. maybe we can have some fun first.[/say]")

		addButton("Continue", "See what happens next", "nova_sniff_balls")
	if(state == "nova_sniff_balls"):
		playAnimation(StageScene.SexOral, "tease", {pc="nova", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Nova unzips her undersuit, exposing her own sheath that has a hard red rocket peeking out of it already. Artica is quick to push her snout into it and start licking the tip, making Nova get nice and hard while her own member is locked tight in its cage..")

		saynn("You're just watching Artica's adventures from a far away, making sure she doesn't get into trouble.")

		saynn("[say=nova]Such a hungry girl.. You want mommy's cock, don't you?"+str(" You seem to be a future mommy yourself, hah.." if getCharacter("artica").isVisiblyPregnant() else "")+"[/say]")

		saynn("Artica keeps obediently sniffing and licking Nova's member while the husky is scratching her behind the ears in return.")

		addButton("Continue", "See what happens next", "artica_sucks_nova_off")
	if(state == "artica_sucks_nova_off"):
		playAnimation(StageScene.SexOral, "sex", {pc="nova", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("The fluff isn't afraid to part her lips and let the tip of that rocket past her teeth.. and then more.. Artica eagerly swallows more of that shaft, letting it hit the back of her mouth and go down her throat while her long canine tongue swirls around it.")

		saynn("[say=nova]Ooh~.. You're making me so needy too, cutie..[/say]")

		saynn("Nova moans and pants softly while Artica casually stretches her throat against that cock, bobbing her head back and forth, sucking it well. Her gag-reflex is making her choke, wet slurps making Nova eager for more..")

		saynn("[say=nova]Mommy might cum already.. Let's switch pose before she does, shall we?[/say]")

		addButton("Continue", "See what happens next", "nova_start_fucks_artica")
	if(state == "nova_start_fucks_artica"):
		if (!isCaged):
			playAnimation(StageScene.SexPawLick, "stroketease", {pc="nova", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		else:
			playAnimation(StageScene.SexPawLick, "tease", {pc="nova", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Nova settles the fluff on one of the flat rocks and positions herself between her legs, Artica's wet pussy and {artica.penis} was on full display..")

		if (!isCaged):
			saynn("The husky presses her shaft against Artica's and wraps her digits around both, stroking them casually.")

			saynn("[say=nova]One thing though..[/say]")

			addButton("Continue", "See what happens next", "nova_cages_artica")
		else:
			saynn("The husky admires that caged member and smiles, her free paw gently tugging on it to check how tight it sits.")

			saynn("[say=nova]Wonder who has the key~.[/say]")

			saynn("Artica looks at her locked cock.. and doesn't look sad about it, her fuckhole is dripping just as much..")

			saynn("[say=nova]Now..[/say]")

			addButton("Continue", "See what happens next", "nova_fucks_artica")
	if(state == "nova_cages_artica"):
		playAnimation(StageScene.SexPawLick, "tease", {pc="nova", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, caged=true}})
		saynn("Nova reaches into her pouches and produces a small metal object.. a cage.")

		saynn("[say=nova]Let's lock that cute cock~. What do you say?[/say]")

		saynn("Artica just licks her lips playfully while the guard sits near. Nova slides the cockring part of the cage along Artica's cyan shaft.. before pulling her balls through it. Then she puts the second piece on the pointy canine cock head.. and starts trying to make the two parts meet, battling squirming Artica's erection.. until the cage clicks together, forcing that cyan cock to stay in its sheath..")

		saynn("[say=nova]There we go.. A proper pet should be locked~.[/say]")

		saynn("Artica looks at her locked cock.. and doesn't look sad about it, her fuckhole is dripping just as much..")

		saynn("[say=nova]Now..[/say]")

		addButton("Continue", "See what happens next", "nova_fucks_artica")
	if(state == "nova_fucks_artica"):
		playAnimation(StageScene.SexPawLick, "sex", {pc="nova", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, caged=true}})
		saynn("Gripping one of Artica's legs firmly, Nova lines up herself with that slick inviting entrance.. Then with a single, powerful thrust, she buries herself inside, that red rocket of hers is displacing the cum that was already there, spreading and stretching Artica's folds and eliciting a cute moan from her.")

		saynn("[say=nova]Ah.. Such a nice obedient pussy.. Hope you don't mind me snowballing it, cutie~.[/say]")

		saynn("Hypnotized Artica is just busy moaning, her body reacting to the deep thrusts, squirming and arching, her toes sprawling in caressing Nova's cheek..")

		saynn("[say=nova]Mommy loves your beans..[/say]")

		saynn("Husky leans in to give Artica's hind paw some kisses, dotting them around her cyan paw pads, giggling when the toes curl up near her muzzle.")

		addButton("Continue", "See what happens next", "nova_fucks_artica_fast")
	if(state == "nova_fucks_artica_fast"):
		playAnimation(StageScene.SexPawLick, "fast", {pc="nova", npc="artica", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, caged=true}})
		saynn("Artica's cock is throbbing in its little cage while Nova is picking up the pace of her trusts, driving into that pussy with increasing eagerness, her cock delving deep into her slick folds, brushing against the pleasure spot.. which makes the girl's walls tighten around Nova's girth.")

		saynn("[say=nova]Is someone cumming already~? You have my permission, sweetheart.[/say]")

		saynn("Almost like she is ordered, Artica reaches her peak, long strings of cum erupt from the little hole of her chastity cage and land on her gray belly, a passionate noise escapes her lips while her pussy is spasming around Nova's cock.. making the husky grunt and shower that hind paw with more little kisses.")

		saynn("[say=nova]So messy, nhh-h~..[/say]")

		saynn("Nova's knot is inflating with blood while Artica's pussy continues to clench around it, too tight to accept it.. And yet, the husky keeps going, ramming her member as deep as the cyan pussy allows, stretching it further bit by bit..")

		addButton("Continue", "See what happens next", "nova_cums_in_artica")
	if(state == "nova_cums_in_artica"):
		playAnimation(StageScene.SexPawLick, "inside", {pc="nova", npc="artica", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, caged=true}})
		saynn("With one final, powerful thrust, Nova buries her cock deep inside Artica, the fat swollen knot slips past the tight folds, tying the two lovers together! The fluff moans again, a new impulse sends her body to squirm hard, her locked hard shooting more weak spurts of seed out of it, pussy clenching around the rod.")

		saynn("[say=nova]Ngh-h-hh~.. Sorry, cutie, I had to~. Here it comes..[/say]")

		saynn("Nova throws her head back as the clenching pussy walls push her over the edge, her {nova.penis} pulses and unloads its hot sticky load deep inside, stuffing Artica's womb to the brim.. while it still had the old cream inside it..")

		if (getCharacter("artica").isVisiblyPregnant()):
			saynn("[say=nova]Wonder if that belly is your litter.. or just all the cum that you have taken inside..[/say]")

		else:
			saynn("[say=nova]Nhh.. Find me if you get knocked up with my pups~.[/say]")

		saynn("They spend some time like that, tied together.. The husky is adding more writings on the messy snowy fur to kill the time..")

		saynn("Nova waits for her knot to deflate.. before finally yanking it out, making the used slit gush with seed..")

		if (!isCaged):
			saynn("[say=nova]Oh yeah, gimme that cage back~.[/say]")

			saynn("She unlocks Artica's locked member.. and puts her cage away..")

		saynn("The guard smooches the cyan beans for the last time and helps the white fluff to get up.")

		saynn("[say=nova]Please take care~.[/say]")

		addButton("Continue", "See what happens next", "artica_walks_into_gym")
	if(state == "artica_walks_into_gym"):
		removeCharacter("nova")
		playAnimation(StageScene.Solo, "stand", {pc="artica", bodyState={naked=true, hard=true}})
		aimCameraAndSetLocName("gym_yoga")
		saynn("Hypnotized fluff continues to explore the prison on her own, swaying from side to side as her used fuckhole is dripping seed.. She seems to be pretty determined, huh..")

		saynn("You continue to just watch her from afar, making sure she doesn't get into trouble.. wait.. Artica has stumbled upon the gym area..")

		saynn("An area that is full of sweaty dudes and gals..")

		addButton("Continue", "See what happens next", "artica_finds_gang")
	if(state == "artica_finds_gang"):
		addCharacter("gymbully")
		addCharacter("gymbully2")
		addCharacter("gymbully3")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="gymbully", bodyState={naked=true, hard=true}})
		saynn("A gang.. of three.. is quick to surround the fluff, all of them wearing red colors..")

		saynn("[say=gymbully]Look who we have here. Wait, what's up with your eyes?[/say]")

		saynn("The main guy crosses his arms and eyes the messy naked girl.")

		saynn("[say=gymbully3]Wowies! This slut is, like, totally zonked![/say]")

		saynn("The female inmate pushes herself closer to Artica's face, inspecting out the hypnovisor and Artica's eyes.")

		saynn("[say=gymbully3]Ohhh.. so spiral-y, HAHA. I can already feel myself wanting to suck cock more.. Cooooock..[/say]")

		saynn("[say=gymbully]That's your normal state.[/say]")

		saynn("[say=gymbully3]PFFF! You are soo-oo-o-o.. not exactly not right.[/say]")

		saynn("The third gang member is quiet, just blocking the only exit.")

		saynn("[say=gymbully]Huh.. She doesn't seem to have any credits on her.[/say]")

		saynn("[say=gymbully3]YEAH! Where are your pockets, MISS SLUT?[/say]")

		saynn("The crazy one pulls Artica's tail high up, exposing her used dripping cunt and a tight asshole.")

		saynn("[say=gymbully3]In there?! Should I shove my fist into her and look for some?![/say]")

		saynn("[say=gymbully]Huh.. I think there are better things that we can shove into her..[/say]")

		saynn("Artica just bleps back at them, her hypnotized eyes don't show any protest.")

		saynn("Well, hopefully they won't break her.. more than she is already broken.")

		addButton("Continue", "See what happens next", "gang_start")
	if(state == "gang_start"):
		playAnimation(StageScene.SexGangbang, "tease", {pc="artica", npc="gymbully2", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="gymbully", npc2BodyState={naked=true, hard=true}, npc3="gymbully3", npc3BodyState={naked=true, hard=true}})
		saynn("Right there, out in the public, the group forces Artica down onto her hands and knees. The main guy slides below her while the quiet one takes note of her tight ass that wasn't used yet by anyone.")

		saynn("[say=gymbully3]Wait for me! I wanna rail her TOO![/say]")

		saynn("With a menacing glint in her eye, the female bully quickly secures a strapon harness around her waist, a large knotted strapon is now dangling between her legs.")

		saynn("[say=gymbully3]You like it~? OF COURSE YOU DO, SLUT![/say]")

		saynn("Hypnotized Artica just spreads her legs more for them and keeps her mouth wide open, her tongue licking the rubber tip of that toy..")

		addButton("Continue", "See what happens next", "gang_sex")
	if(state == "gang_sex"):
		playAnimation(StageScene.SexGangbang, "sex", {pc="artica", npc="gymbully2", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="gymbully", npc2BodyState={naked=true, hard=true}, npc3="gymbully3", npc3BodyState={naked=true, hard=true}})
		saynn("The loud crazy girl is first, thrusting her rubber cock into Artica's mouth, resting it on her canine tongue as it quickly hits her throat and starts stretching it. As that is happening, the main bully grabs Artica's hips and impales her used dripping slit onto his cock, meeting that cunt with a thrust of his hips, ramming his member deep. Without a word, a quiet bully plunged into her as well, his cock stretching Artica's back entrance, forcing it to spread wide open.")

		saynn("[say=gymbully]Hah, she is still tight. Not for long.[/say]")

		saynn("The fluff's body was hit with intense pleasure as the bullies began ravaging her all three holes, they were making sure that at least one cock was always buried inside her at any point in time, "+str("her own member was swaying wildly and dripping pre" if !isCaged else "her own member was twitching wildly in its cage and dripping pre")+".")

		saynn("[say=gymbully3]OH YEAH, this is fun! Gag on this, bitch![/say]")

		addButton("Continue", "See what happens next", "gang_fastsex")
	if(state == "gang_fastsex"):
		playAnimation(StageScene.SexGangbang, "fast", {pc="artica", npc="gymbully2", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="gymbully", npc2BodyState={naked=true, hard=true}, npc3="gymbully3", npc3BodyState={naked=true, hard=true}})
		saynn("Artica's throat is making wet noises as she struggles to breathe under the onslaught of that crazy girl who forces most of her rubber shaft inside each time, making the fluff choke and gag on its length.")

		saynn("[say=gymbully3]Gonna have to raise the gym taxes, this is a great show that we're offering! LOOK AT THIS BITCH CHOKE![/say]")

		saynn("At the same time,the other two bullies keep pounding into her dripping pussy and tight ass, their thick cocks filling her up and stretching her fuckholes to their limits. Artica can't do anything but take it all.. it's not like she was against any of it though, her eyes show that she is enjoying serving as their fucktoy.")

		saynn("[say=gymbully]Grhh.. I'm close, her cunt feels amazing.[/say]")

		saynn("Their knots are pulsing, slapping against Artica's holes as they are trying to fit them in.. The girl is eager to make the fluff swallow her knot too.. The insane stimulation pushes the poor hypnotized girl over the edge fast, her body squirming and shivering as her"+str(" locked dick expels weak strings of cum through the cage" if isCaged else " hard throbbing dick expels strong strings of cum")+", her throat, pussy and ass clench tightly around the intruding cocks, rubber or otherwise, making knotting her even harder..")

		saynn("[say=gymbully3]NU HUH! You're taking my KNOT, SLUT![/say]")

		addButton("Continue", "See what happens next", "gang_knots_artica")
	if(state == "gang_knots_artica"):
		playAnimation(StageScene.SexGangbang, "inside", {pc="artica", npc="gymbully2", pcCum=true, npcCum=true, npc2Cum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="gymbully", npc2BodyState={naked=true, hard=true}, npc3="gymbully3", npc3BodyState={naked=true, hard=true}})
		saynn("All three bullies kept slamming into Artica's tight orgasming holes.. until all three knots suddenly slipped in! Her jaw almost dislocates as the crazy girl knots her mouth, her pussy and ass get stuffed full of throbbing meat.. before the two bullies' cocks release hot, sticky seed inside, filling her womb and ass to the brim, her body writhing and trembling with pure ecstasy as her hypnotized mind is flooded with more and more pleasure..")

		saynn("[say=gymbully3]HAH! Three cocks in one slut! ..fuck, I'm so wet..[/say]")

		saynn("[say=gymbully]Nghh-h..[/say]")

		saynn("The bullies grunt as Artica's clenching holes are milking them dry.")

		saynn("[say=gymbully3]Um.. I can't pull out.. OH WELL.[/say]")

		saynn("Impaled on three dicks, Artica is still shivering, barely getting enough air through her nostrils. The crazy girl grabs a pen and starts scribbling dirty things on that white fur..")

		saynn("[say=gymbully3]I always wanted to learn art.. Might as well practice now![/say]")

		saynn("[say=gymbully]Oh yeah, this girl is a grade S++ slut..[/say]")

		saynn("And so they spend time like that, until their knots start to finally deflate.. There is a whole queue of inmates behind Artica already, waiting.. Maybe it's time to stop..")

		addButton("Continue", "See what happens next", "artica_gets_found_by_avy")
	if(state == "artica_gets_found_by_avy"):
		removeCharacter("gymbully")
		removeCharacter("gymbully2")
		removeCharacter("gymbully3")
		addCharacter("avy")
		playAnimation(StageScene.SexFeetPlay, "head", {pc="avy", npc="artica", npcBodyState={naked=true, hard=true}})
		saynn("Eventually, the three bullies yank their knots out, leaving Artica to sprawl out on the floor, both of her stretched fuckholes leaking profusely..")

		saynn("You were about to get to her and pull her away from all the hungry inmates.. when someone else suddenly does it first, pinning Artica to the floor with her leg.")

		saynn("[say=avy]What's going on here?[/say]")

		saynn("Avy inspects the white spaced out fluff.. inspects her used holes.. and sighs.. while Artica just eagerly licks that offered hind paw, thrusting her long canine tongue between the round toes and nuzzling the paw pads.")

		saynn("[say=avy]I'm sick of snowballing, grrr.. Can I get a cunt that wasn't ravaged by ten cocks for once? Whatever.[/say]")

		saynn("Looks like Artica's public sex toy adventures aren't over yet..")

		addButton("Continue", "See what happens next", "avy_roughs_artica")
	if(state == "avy_roughs_artica"):
		playAnimation(StageScene.SexBehind, "sex", {pc="avy", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Avy wastes no time, pinning Artica to the floor, leaving her helpless as she aligns her hard cock with that gushing stuffed pussy.. before forcing herself inside, plunging her cock deep inside with a brutal thrust.")

		saynn("The black fox showed no mercy as she relentlessly pounded into Artica, her movement growing more forceful and aggressive. Her hand gets a firm grip on Artica's short hair.. while the girl is just taking it all, seemingly happy to be used as a mindless cum dumpster.")

		saynn("[say=avy]Grrr.. Scream already, you stupid bitch.[/say]")

		addButton("Continue", "See what happens next", "avy_kicks_the_visor_off")
	if(state == "avy_kicks_the_visor_off"):
		playAnimation(StageScene.SexBehind, "fast", {pc="avy", npc="artica", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Avy yanks on Artica's hair.. before slamming her against the cold floor.. [b]the hypnovisor flies off Artica's eyes as she does it![/b]")

		saynn("[sayOther]Visual Link is lost, shutting down..[/sayOther]")

		saynn("Oh shit. You quickly grab the visor before anyone else can reach it. All the while, Avy just continues her assault, thrusting deep inside and even forcing her knot in and out when hers begins to swell.")

		saynn("Even though Artica is being abused, being knot-fucked by Avy's cock pushes her over the edge, her body arches as she cums, "+str("her caged member twitching and dripping cum a bit" if isCaged else "her hard member twitching and dripping cum a bit")+", her balls have been drained multiple times by now.. but her stretched pussy is still clenching tightly around the knotted cock..")

		saynn("[say=avy]GRrr.. Fine! I will give you what you want, you stupid mindless fucktoy.[/say]")

		addButton("Continue", "See what happens next", "avy_breeds_artica")
	if(state == "avy_breeds_artica"):
		playAnimation(StageScene.SexBehind, "inside", {pc="avy", npc="artica", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("With a final, savage throw of her hips, Avy buries her entire length inside Artica, her knot stretching that pussy wide while her womb is getting another load of creamy sticky stuff pumped into it, making Artica's belly quite bumpy by now..")

		saynn("[say=avy]Fuck you, whore..[/say]")

		saynn("Avy leaves some dirty words on Artica's fur.. as seems to be a tradition.. before finally leaving the fluff alone.")

		saynn("Artica is panting on the floor, her fuckholes are destroyed and stretched beyond belief, pulsing and leaking cum..")

		addButton("Help her", "Artica clearly needs some help now", "pc_tries_to_help")
	if(state == "pc_tries_to_help"):
		aimCameraAndSetLocName("yard_westCorridor")
		removeCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="artica", npcBodyState={hard=true,naked=true}})
		saynn("Before anyone else can, you grab Artica's hand and help to get up.. before quickly pulling her out of a crowd of annoyed horny inmates.")

		saynn("After you make your escape, you find a somewhat secluded spot and stop, letting the girl catch her breath.")

		saynn("[say=pc]Hey. Are you okay?[/say]")

		saynn("Wait.. Artica's eyes.. still have spirals swirling in them.. somehow.. You snap your fingers in front of her face.. but nothing changes.. Artica just sways her body, standing high on her toes, her tail swishing behind her.")

		saynn("Oh fuck, she still acts like she is brainwashed. Wait. The hypnovisor!")

		saynn("You put the thing over the girl's eyes and turn it on..")

		saynn("[sayOther]Initializing.. Damage detected, unable to proceed.. shutting down..[/sayOther]")

		saynn("Oh shit.. What now.. Artica's personality is still in here..")

		addButton("Medical", "Maybe they can fix Artica", "bring_artica_medical")
	if(state == "bring_artica_medical"):
		aimCameraAndSetLocName("med_lobbymain")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="eliza", bodyState={hard=true,naked=true, leashedBy="eliza"}})
		saynn("You bring Artica down into the medical wing while keeps rubbing against you and chrrrring into your ear, her drooly tongue peeking.")

		saynn("How are you even gonna explain it..")

		saynn("[say=eliza]Ohh, you had quite a day, huh. Doctor Quinn here.[/say]")

		saynn("The feline doctor inspects Artica who can barely stand.. but is somehow still horny.")

		saynn("[say=pc]Yeah, well, she did. I brainwashed her into a sex toy but now her personality is trapped in this hypnovisor.[/say]")

		saynn("[say=eliza]Fascinating. I have never seen such.. extreme.. pupil reaction. Can we keep her like this so I can do some experiments~? Pretty please?[/say]")

		saynn("[say=pc]Uhh, I'd rather just get her normal again.[/say]")

		saynn("The feline grabs the visor off of your hands.")

		saynn("[say=eliza]Normal is relative. Maybe this is her normal state, who knows~.[/say]")

		saynn("Doctor sees your unamused look.. and sighs.")

		saynn("[say=eliza]Fiiine, I think I can fix her. Let's get her prepared, looks like she needs more than just her brain fixed.[/say]")

		saynn("Artica smiles kindly as the feline doctor attaches a leash to her collar and starts pulling her somewhere.")

		addButton("Follow", "See how Doctor Quinn will fix Artica", "in_milking_room")
	if(state == "in_milking_room"):
		GM.pc.setLocation("med_lobbynw")
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.BDSMMachineFuck, "tease", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("Doctor Quinn brings you into a secluded room that has some.. specialized equipment. The feline presses a button and Artica gets grabbed and put onto a special table by some mechanical arms.")

		saynn("Doctor then connects the visor to some computer and starts downloading data off of it.")

		saynn("[say=pc]Looks like you've done this before.[/say]")

		saynn("[say=eliza]Uh.. There are no clones on this station if that is what you are implying.[/say]")

		saynn("Clones? Huh?")

		saynn("[say=pc]What?[/say]")

		saynn("[say=eliza]Umm.. oops.. it was nothing. Look, all the data seems to be fine![/say]")

		saynn("She shows you a digitized map.. of a whole brain.. wow..")

		saynn("[say=eliza]Wanna edit something~? C'mon, let's change a number or two~.[/say]")

		saynn("[say=pc]No, just upload it as it was.[/say]")

		saynn("[say=eliza]Fine-ee-e..[/say]")

		saynn("She presses a button and a screen moves closer to Artica's hypnotized eyes.. before a familiar yellow glow appears on it. Probably best not to look at it..")

		saynn("[sayOther]Brainwashing has began.. 0%.. 1%..[/sayOther]")

		saynn("That will take a while..")

		saynn("[say=eliza]Let's take care of her gaping holes too while we're at it![/say]")

		saynn("Doctor presses another button..")

		addButton("Continue", "See what happens next", "artica_holes_healed")
	if(state == "artica_holes_healed"):
		playAnimation(StageScene.BDSMMachineFuck, "sexdouble", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("The machine underneath Artica extends two smooth rubber rods.. that find Artica's holes and penetrate them with ease, displacing some of the cum. They don't just stay inside, instead sliding in and out, their tips painting Artica's inner walls with some kind of.. gel..")

		saynn("At the same time, her hypnotized eyes seem to be glued to the screen that shows her various colorful patterns..")

		saynn("[sayOther]3%.. 4%.. 5%..[/sayOther]")

		saynn("[say=pc]What is that?[/say]")

		saynn("[say=eliza]Healing gel. Speeds up the recovery of loose orifices.. quickly heals up any tearing or bruising too.[/say]")

		saynn("It sure does looks like Artica is just getting fucked again.. but by a machine this time.")

		saynn("[sayOther]6%.. 7%.. 8%..[/sayOther]")

		saynn("Cute moans start to escape from Artica, "+str("her caged cock pressing against its cage" if isCaged else "her member throbbing slightly")+". You can hear the motors whirring harder as the girl's holes clench around the rubber rods, more cum and healing gel leaking out of them as they tighten up..")

		saynn("[say=pc]Sure, do your thing.[/say]")

		saynn("[say=eliza]Heh. I will~.[/say]")

		saynn("[sayOther]9%.. 10%.. 20%.. 40%..[/sayOther]")

		saynn("Oh wow, that is fast now.")

		saynn("[say=eliza]Her mind is pretty weak to hypnosis.. Incredibly weak in fact. Wow.[/say]")

		saynn("[say=pc]I noticed.[/say]")

		saynn("[say=eliza]Not everyone can survive two full brainwashes in one day.. But she is taking it so casually.[/say]")

		saynn("That's.. kinda concerning.")

		addButton("Continue", "See what happens next", "artica_returns_to_normal")
	if(state == "artica_returns_to_normal"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.BDSMMachineFuck, "tease", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("The rods pump Artica's holes full of healing gel.. and slide out, letting them heal now.")

		saynn("[sayOther]60%.. 80%.. 95%.. 99%.. Done! Brainwash complete. New personality uploaded.[/sayOther]")

		saynn("Doctor snaps her fingers in front of the girl's face.. which makes her start blinking a lot, the spirals fading away from her eyes..")

		saynn("[say=artica]Ah.. wha.. oh.. wow.. oh-h.. where am..[/say]")

		saynn("[say=eliza]You're in medical. Remember your name?[/say]")

		saynn("[say=artica]Uh.. Artica? Inmate number.. s-something something..[/say]")

		saynn("The feline phews and pats the fluff on the head, making her chrrrr.")

		saynn("[say=pc]How do you feel?[/say]")

		saynn("[say=artica]I feel.. f-full.. v-very..[/say]")

		saynn("She looks down at her fur and sees all the mess.")

		saynn("[say=artica]Oh.. Looks like I.. g-got used..[/say]")

		saynn("[say=pc]More times than you can imagine.[/say]")

		saynn("You turn towards the feline.")

		saynn("[say=pc]Thank you, doc. We can go?[/say]")

		saynn("Quinn nods and hands you a fresh copy of your hypnovisor.")

		saynn("[say=eliza]Yeah. Just be careful with these toys~.[/say]")

		saynn("[say=artica]{pc.He} {pc.isAre} pretty c-careful with me..[/say]")

		saynn("The feline tilts her head.. Artica tilts her head back.. until the white fluff realizes something and her cheeks start glowing red.")

		addButton("Continue", "See what happens next", "in_lobby")
	if(state == "in_lobby"):
		removeCharacter("eliza")
		playAnimation(StageScene.Hug, "hug", {pc="pc", npc="artica", npcBodyState={naked=true}})
		aimCameraAndSetLocName("med_lobbynw")
		saynn("The feline lets you both out in the medical lobby. Artica nuzzles your cheek, her tail brushing against your leg.")

		saynn("[say=artica]It was f-fun.. I r-remember everything..[/say]")

		saynn("Artica chrrrrs and jumps into the lift when it arrives.")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "endthescene")
func addPumpButtons(go_id):
	var pumps = GM.pc.getInventory().getItemsWithTag(ItemTag.Hypnovisor)
	for pump in pumps:
		addButton(pump.getVisibleName(), pump.getVisibleDescription(), go_id, [pump])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_pick_visor"):
		var pump = _args[0]
		visorID = pump.getUniqueID()
		GM.pc.getInventory().removeItem(pump)
		getCharacter("artica").getInventory().forceEquipRemoveOther(pump)

	if(_action == "endthescene2"):
		if(visorID != ""):
			var visor = getCharacter("artica").getInventory().getItemByUniqueID(visorID)
			if(visor != null):
				getCharacter("artica").getInventory().removeEquippedItem(visor)
				GM.pc.getInventory().addItem(visor)
		endScene()
		return

	if(_action == "obedient_pet"):
		processTime(5*60)

	if(_action == "public_use"):
		processTime(5*60)

	if(_action == "artica_brainwashed"):
		processTime(5*60)

	if(_action == "do_tricks"):
		processTime(5*60)

	if(_action == "bj_pet"):
		processTime(5*60)
		didFeed = true

	if(_action == "pet_goodgirl"):
		processTime(5*60)

	if(_action == "bj_pet_cum"):
		processTime(5*60)
		getCharacter("artica").cummedInMouthBy("pc")
		GM.pc.orgasmFrom("artica")
		getModule("ArticaModule").addCorruption(0.01)

	if(_action == "pet_presents"):
		processTime(5*60)

	if(_action == "pet_cum_stroke"):
		processTime(5*60)

	if(_action == "pet_cum_handsfree"):
		processTime(5*60)
		getCharacter("artica").cummedOnBy("artica")
		getModule("ArticaModule").triggerCorruption(0.02)

	if(_action == "pet_cum_stroke_cum"):
		processTime(5*60)
		getCharacter("artica").cummedOnBy("artica")
		getModule("ArticaModule").triggerCorruption(0.02)

	if(_action == "pet_turnoffvisor"):
		if(visorID != ""):
			var visor = getCharacter("artica").getInventory().getItemByUniqueID(visorID)
			if(visor != null):
				getCharacter("artica").getInventory().removeEquippedItem(visor)
				GM.pc.getInventory().addItem(visor)
				visorID = ""

	if(_action == "slut_brainwashed"):
		processTime(5*60)

	if(_action == "risha_encounter"):
		processTime(5*60)

	if(_action == "artica_fucked_by_risha"):
		processTime(5*60)

	if(_action == "risha_cums_in_artica"):
		processTime(5*60)
		getModule("ArticaModule").triggerCorruption(0.01)
		getCharacter("artica").cummedInVaginaBy("risha")
		getCharacter("artica").addBodywritingRandom()
		getCharacter("artica").addBodywritingRandom()
		getCharacter("artica").addTallymarkCrotch()

	if(_action == "artica_after_risha"):
		processTime(5*60)

	if(_action == "artica_finds_nova"):
		processTime(5*60)

	if(_action == "nova_sniff_balls"):
		processTime(5*60)

	if(_action == "artica_sucks_nova_off"):
		processTime(5*60)

	if(_action == "nova_start_fucks_artica"):
		processTime(5*60)

	if(_action == "nova_cages_artica"):
		processTime(2*60)
		cagedByNova = true

	if(_action == "nova_fucks_artica"):
		processTime(5*60)

	if(_action == "nova_fucks_artica_fast"):
		processTime(5*60)
		getCharacter("artica").cummedOnBy("artica")

	if(_action == "nova_cums_in_artica"):
		processTime(5*60)
		getModule("ArticaModule").triggerCorruption(0.01)
		getCharacter("artica").cummedInVaginaBy("nova")
		getCharacter("artica").addBodywritingRandom()
		getCharacter("artica").addBodywritingRandom()
		getCharacter("artica").addTallymarkCrotch()

	if(_action == "artica_walks_into_gym"):
		processTime(5*60)

	if(_action == "artica_finds_gang"):
		processTime(3*60)

	if(_action == "gang_start"):
		getCharacter("gymbully3").getInventory().equipItem(GlobalRegistry.createItem("StraponCanine"))

	if(_action == "gang_sex"):
		processTime(5*60)

	if(_action == "gang_fastsex"):
		processTime(3*60)

	if(_action == "gang_knots_artica"):
		processTime(3*60)
		getModule("ArticaModule").triggerCorruption(0.01)
		getCharacter("artica").cummedInVaginaBy("gymbully")
		getCharacter("artica").cummedInAnusBy("gymbully2")
		getCharacter("artica").addBodywritingRandom()
		getCharacter("artica").addBodywritingRandom()
		getCharacter("artica").addBodywritingRandom()
		getCharacter("artica").addBodywritingRandom()
		getCharacter("artica").addTallymarkCrotch()
		getCharacter("artica").addTallymarkCrotch()
		getCharacter("artica").addTallymarkCrotch()

	if(_action == "artica_gets_found_by_avy"):
		processTime(3*60)
		getCharacter("gymbully3").removeStrapon()

	if(_action == "avy_roughs_artica"):
		processTime(5*60)

	if(_action == "avy_kicks_the_visor_off"):
		processTime(5*60)
		if(visorID != ""):
			var visor = getCharacter("artica").getInventory().getItemByUniqueID(visorID)
			if(visor != null):
				getCharacter("artica").getInventory().removeEquippedItem(visor)
				GM.pc.getInventory().addItem(visor)
				visorID = ""

	if(_action == "avy_breeds_artica"):
		processTime(5*60)
		getModule("ArticaModule").triggerCorruption(0.01)
		getCharacter("artica").cummedInVaginaBy("avy")
		getCharacter("artica").addBodywritingRandom()
		getCharacter("artica").addBodywritingRandom()
		getCharacter("artica").addTallymarkCrotch()

	if(_action == "pc_tries_to_help"):
		processTime(5*60)

	if(_action == "bring_artica_medical"):
		processTime(10*60)

	if(_action == "in_milking_room"):
		processTime(3*60)

	if(_action == "artica_holes_healed"):
		processTime(10*60)

	if(_action == "artica_returns_to_normal"):
		processTime(5*60)
		getCharacter("artica").getBodypart(BodypartSlot.Vagina).addFluidOrifice("HealingGel", RNG.randf_range(250.0, 350.0), null)
		getCharacter("artica").getBodypart(BodypartSlot.Anus).addFluidOrifice("HealingGel", RNG.randf_range(250.0, 350.0), null)

	if(_action == "in_lobby"):
		processTime(3*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isNaked"] = isNaked
	data["isCaged"] = isCaged
	data["corruption"] = corruption
	data["isSlut"] = isSlut
	data["isVerySlut"] = isVerySlut
	data["isLusty"] = isLusty
	data["nakedAndShy"] = nakedAndShy
	data["visorID"] = visorID
	data["didFeed"] = didFeed
	data["cagedByNova"] = cagedByNova

	return data

func loadData(data):
	.loadData(data)

	isNaked = SAVE.loadVar(data, "isNaked", false)
	isCaged = SAVE.loadVar(data, "isCaged", false)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	isSlut = SAVE.loadVar(data, "isSlut", false)
	isVerySlut = SAVE.loadVar(data, "isVerySlut", false)
	isLusty = SAVE.loadVar(data, "isLusty", false)
	nakedAndShy = SAVE.loadVar(data, "nakedAndShy", false)
	visorID = SAVE.loadVar(data, "visorID", "")
	didFeed = SAVE.loadVar(data, "didFeed", false)
	cagedByNova = SAVE.loadVar(data, "cagedByNova", false)
