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
		saynn("Slowly, almost involuntarily, Artica begins to strip off her uniform. Her hands unbutton her shirt, revealing her {artica.breasts} to you.. followed by her pulling her shorts down and then wiggling out of them, exposing her"+str(" hard" if !isCaged else "")+" {artica.penis} and a wet pussy slit.")

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
			playAnimation(StageScene.Zonked, "rubcum", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		else:
			playAnimation(StageScene.Zonked, "rubcum", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Then, with a cute moan, pent-up Artica suddenly throws her head back, her {artica.penis} erupting in a torrent of hot, sticky cum that splatters across her tits and stomach. Each pulse is sending waves of pleasure through her body, her toes curling in ecstasy, her needy pussy gushing with girlcum!")

		saynn("Completely spent, Artica lays panting on the floor, her body covered in her own cum as she enjoys the afterglow of her orgasm.")

		saynn("[say=pc]Good.. very good..[/say]")

		addButton("Hypnovisor", "Turn it off", "pet_turnoffvisor")
	if(state == "pet_cum_handsfree"):
		playAnimation(StageScene.Zonked, "cum", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
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
