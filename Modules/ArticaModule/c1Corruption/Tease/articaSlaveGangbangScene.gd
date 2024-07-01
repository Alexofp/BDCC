extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var onlyCocksGlobal = true
var onlyStraponsGlobal = true
var sceneAmount = 1
var pickedSlaves = []
var pickPool = []
var npc1 = ""
var npc2 = ""
var npc3 = ""
var didFirst = false
var lastScene = ""

func _init():
	sceneID = "articaSlaveGangbangScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc1"):
		return npc1
	if(_charID == "npc2"):
		return npc2
	if(_charID == "npc3"):
		return npc3

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
		saynn("Who do you want to gangbang Artica? You need at least 2 people to gangbang her.. but the more slaves you choose, the longer the gangbang will last..")

		saynn("Anyone who doesn't have a reachable cock will wear a strapon automatically.")

		if (pickedSlaves.size() > 1):
			addButton("Start", "Do it!", "start_gangbang")
		else:
			addDisabledButton("Start", "Need to pick at least 2 people before starting")
		addButton("CANCEL", "You changed your mind", "endthescene")
		if (!pickedSlaves.has("pc")):
			addButton("+You", "Add yourself into this", "toggle_pc")
		else:
			addButton("-You", "Remove yourself from this", "toggle_pc")
		addSlaveButtons()
		if (false):
			addButton("Error", "You shouldn't see this", "toggle_slave")
	if(state == "start_gangbang"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.Solo, "struggle", {pc="artica", bodyState={naked=true}})
		var pcIncluded = (pickedSlaves.has("pc"))
		var howManySlaves = pickedSlaves.size()
		saynn("You tell Artica to wait for a bit.. as you call in some of your slaves to approach you.")

		saynn("[say=pc]Have some fun with her."+str(" I will watch." if !pcIncluded else " I will join too.")+"[/say]")

		saynn("Artica looks around.. confused.. as "+str(howManySlaves)+" people surround her, blocking off the only exit from your cell..")

		saynn("[say=artica]Um.. what is.. t-this..[/say]")

		if (isNaked):
			saynn("One of them suddenly grabs her arms.. while the second slaps her perky"+str(" lactating" if getCharacter("artica").isLactating() else "")+" tits.")

			saynn("[say=artica]Ee-ep.. e-easy.. w-wai-.. ow..[/say]")

			saynn("While the fluff is busy trying to free her arms, someone pulls up on her balls, revealing the pussy that's hiding behind them.. Someone else yanks on the tail, making Artica stick her ass out, her tight tailhole twitching..")

			if (isVerySlut):
				saynn("[say=artica]P-please.. ah.. p-pound me r-raw..[/say]")

			elif (isSlut):
				saynn("[say=artica]Am I g-gonna b-be.. g-ganbanged..[/say]")

			else:
				saynn("[say=artica]P-please.. ah.. d-don't..[/say]")

		else:
			saynn("One of them suddenly grabs her arms.. while the second forcibly takes off the shirt, exposing those perky"+str(" lactating" if getCharacter("artica").isLactating() else "")+" tits.")

			saynn("[say=artica]Ee-ep.. e-easy.. w-wai-.. ow..[/say]")

			saynn("While the fluff is busy trying to free her arms, her shorts get pulled down too, exposing her "+str("caged up cock" if isCaged else "sheath")+".. and the pussy that's hiding behind the balls.. Someone yanks on the tail, making Artica stick her ass out, her tight tailhole twitching..")

			if (isVerySlut):
				saynn("[say=artica]P-please.. ah.. p-pound me r-raw..[/say]")

			elif (isSlut):
				saynn("[say=artica]Am I g-gonna b-be.. g-ganbanged..[/say]")

			else:
				saynn("[say=artica]P-please.. ah.. d-don't..[/say]")

		saynn("Looks like the fun is just about to begin..")

		addButton("Continue", "See what happens next", "start_first_scene")
		if (false):
			addButton("IGNORE", "You shouldn't see this", "start_next_scene")
	if(state == "dp_tease"):
		playAnimation(StageScene.SexDP, "tease", {pc="artica", npc=npc1, npc2=npc2, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		var pcIncluded = (npc1 == "pc" || npc2 == "pc")
		var slavesText = ("your two slaves" if !pcIncluded else "you and your slave")
		var onlyCocks = (!getCharacter(npc1).isWearingStrapon() && !getCharacter(npc2).isWearingStrapon())
		var onlyStrapons = (getCharacter(npc1).isWearingStrapon() && getCharacter(npc2).isWearingStrapon())
		var cocksText = ("both cocks" if onlyCocks else ("both strapons" if onlyStrapons else "a cock and a strapon"))
		saynn("With a firm grip, "+str(slavesText)+" grab Artica and force her down to her knees. {npc1.You} {npc1.youVerb('slide')} under her and guides {npc1.yourHis} {npc1.strapon} down her needy slit.. while {npc2.you} {npc2.youVerb('position')} {npc2.yourself} behind and align {npc2.yourHis} {npc2.strapon} with the other tight hole, {npc2.yourHis} hands pull Artica's arms behind her back.. "+str(cocksText)+" are gonna double-penetrate the fluff's fresh holes any second..")

		saynn("[say=artica]Ah.. h-hey..[/say]")

		saynn("Artica tries to free her arms.. but they are being held too tightly. No one here is letting the girl go without a full belly.")

		if (isVerySlut):
			saynn("[say=artica]L-looks like.. I-I'm g.gonna b-be stretched..[/say]")

		elif (isSlut):
			saynn("[say=artica]A-are you gonna b-be rough w-with my hh.holes?..[/say]")

		else:
			saynn("[say=artica]D..d-do I h-have a s-say in t-tthis?..[/say]")

		# (( Double penetration starts with {npc1.name} on the bottom and {npc2.name} behind. ))
		addButton("Continue", "See what happens next", "dp_sex")
	if(state == "dp_sex"):
		playAnimation(StageScene.SexDP, "sex", {pc="artica", npc=npc1, npc2=npc2, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		var pcIncluded = (npc1 == "pc" || npc2 == "pc")
		var slavesText = ("your other two slaves" if !pcIncluded else "you and your slave")
		var onlyCocks = (!getCharacter(npc1).isWearingStrapon() && !getCharacter(npc2).isWearingStrapon())
		var onlyStrapons = (getCharacter(npc1).isWearingStrapon() && getCharacter(npc2).isWearingStrapon())
		var cocksText = ("cocks" if onlyCocks else ("strapons" if onlyStrapons else "cocks and strapons"))
		if (!didFirst):
			saynn("In one powerful combined thrust, "+str("your" if pcIncluded else "their")+" "+str(cocksText)+" get rammed into Artica's holes, one sliding up her cunt while another is going down her tight ass, making the girl feel incredibly full.")

			saynn("[say=artica]Ah!.. h-hh..[/say]")

			saynn("Artica's body is arching from the sudden double penetration, the pleasure of being fucked raw is making her own cock hard and drippy..")

		else:
			saynn("It doesn't take long for a new set of cocks to slide up both Artica's holes, "+str(slavesText)+" bring the girl to her knees.. before shoving "+str("your" if pcIncluded else "their")+" "+str(cocksText)+" inside, stretching her wide!")

			saynn("Her drippy"+str(" caged" if isCaged else " hard")+" useless cock is bobbing up and down as she is being fucked raw, a mix of precum and old cum is leaking from the tip.")

		# (( Double penetration SEX with {npc1.name} on the bottom and {npc2.name} behind. ))
		addButton("Continue", "See what happens next", "dp_sexfast")
	if(state == "dp_sexfast"):
		playAnimation(StageScene.SexDP, "fast", {pc="artica", npc=npc1, npc2=npc2, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		var pcIncluded = (npc1 == "pc" || npc2 == "pc")
		var slavesText = ("your two slaves" if !pcIncluded else "you and your slave")
		var onlyCocks = (!getCharacter(npc1).isWearingStrapon() && !getCharacter(npc2).isWearingStrapon())
		var onlyStrapons = (getCharacter(npc1).isWearingStrapon() && getCharacter(npc2).isWearingStrapon())
		var cocksText = ("the two cocks" if onlyCocks else ("the two strapons" if onlyStrapons else "the cock and the strapon"))
		saynn("With each thrust, Artica felt "+str(cocksText)+" filling her completely, stretching her to the limits, working in tandem, pretty much never leaving her holes empty.")

		saynn("Artica's moans are filling the air as she forced to endure the onslaught, her arms are wrenched behind her back while "+str(slavesText)+" are fucking her at a more rapid pace.")

		saynn("[say=artica]Mm-my.. ass-s-s.. ahh-hh..[/say]")

		if (!didFirst):
			saynn("Artica's first orgasm is approaching quickly, her cock pulsing wildly"+str(" inside of its cage" if isCaged else "")+", her ass and pussy squeezing the"+str(" rubber" if onlyStrapons else "")+" dicks tightly.")

		else:
			saynn("Artica looks like she is about to cum again, her cock pulsing wildly"+str(" inside of its cage" if isCaged else "")+", her ass and pussy squeezing the"+str(" rubber" if onlyStrapons else "")+" dicks tightly.")

		# (( Double penetration SEX FAST with {npc1.name} on the bottom and {npc2.name} behind. ))
		addButton("Continue", "See what happens next", "dp_cum")
	if(state == "dp_cum"):
		playAnimation(StageScene.SexDP, "inside", {pc="artica", npc=npc1, npc2=npc2, pcCum=true, npcCum=true, npc2Cum=true, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		#var pcIncluded = (npc1 == "pc" || npc2 == "pc")
		#var slavesText = ("your two slaves" if !pcIncluded else "you and your slave")
		#var onlyCocks = (!getCharacter(npc1).isWearingStrapon() && !getCharacter(npc2).isWearingStrapon())
		#var onlyStrapons = (getCharacter(npc1).isWearingStrapon() && getCharacter(npc2).isWearingStrapon())
		#var cocksText = ("cocks" if onlyCocks else ("strapons" if onlyStrapons else "cocks and strapons"))
		saynn("With each double-thrust, her pussy and asshole were stretched to their limits.. until the fluff just couldn't endure it any longer. Her lips let out a passionate moan.. followed by her cock erupting, shooting thick ropes of cum"+str(" through the little hole in a chastity cage" if isCaged else "")+" onto the floor.")

		if (getCharacter(npc1).isWearingStrapon()):
			saynn("Her pussy was milking the strapon that was fucking it.. until the toy finally decided to release its cumlube reserve deep into the girl's womb..")

		else:
			saynn("Her pussy was milking the cock that was fucking it.. until she felt a load being pumped directly into her womb, hot seed flooding her depths while her own orgasm was still happening..")

		if (getCharacter(npc2).isWearingStrapon()):
			saynn("At the same time, {npc2.you} drove {npc2.yourHis} {npc2.strapon} deep into her ass, the tightness of her pulsing inner walls enough to trigger that toy to release its cumlube load as well.")

		else:
			saynn("At the same time, {npc2.you} drove {npc2.yourHis} {npc2.strapon} deep into her ass, the tightness of her pulsing inner walls enough to make {npc2.youHim} cum in seconds, filling that asshole with {npc2.yourHis} hot, sticky {npc2.cum}..")

		if (!didFirst):
			saynn("A powerful first orgasm.. but certainly not the last.. Artica is still moaning after that one..")

			if (isVerySlut):
				saynn("[say=artica]Ah.. my h-holes.. ah.. s-so f-full..[/say]")

			elif (isSlut):
				saynn("[say=artica]Ah.. y-you're not d-done, are you-u?.. ah.. ahh-h..[/say]")

			else:
				saynn("[say=artica]Ah.. my ass.s-.. ah-h.. t-too m-muuch.. w-wai..[/say]")

			saynn("She notices that the people around her aren't yet fully satisfied.. It's time to switch..")

		# (( Double penetration CUM with {npc1.name} on the bottom and {npc2.name} behind. ))
		addNextGangButton()
	if(state == "spit_tease"):
		playAnimation(StageScene.SexSpitroast, "tease", {pc="artica", npc=npc1, npc2=npc2, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		var pcIncluded = (npc1 == "pc" || npc2 == "pc")
		var slavesText = ("your two slaves" if !pcIncluded else "you and your slave")
		var onlyCocks = (!getCharacter(npc1).isWearingStrapon() && !getCharacter(npc2).isWearingStrapon())
		var onlyStrapons = (getCharacter(npc1).isWearingStrapon() && getCharacter(npc2).isWearingStrapon())
		var cocksText = ("both cocks" if onlyCocks else ("both strapons" if onlyStrapons else "a cock and a strapon"))
		saynn("With a firm grip, "+str(slavesText)+" grab Artica by all the 4 paws.. before pulling her up, above floor. No time is wasted, "+str(cocksText)+" already aligned with the fluff's holes.")

		saynn("[say=artica]Ah.. h-hey..[/say]")

		saynn("{npc1.You} {npc1.youAre} holding her legs, {npc1.yourHis} {npc1.strapon} is brushing against that needy slit, about to enter it. {npc2.You} {npc2.youAre} holding her chest, {npc2.yourHis} {npc2.strapon} resting on Artica's lips, ready to pierce..")

		if (isVerySlut):
			saynn("[say=artica]L-looks like.. I-I'm g.gonna b-be stretched..[/say]")

		elif (isSlut):
			saynn("[say=artica]A-are you gonna b-be rough w-with my hh.holes?..[/say]")

		else:
			saynn("[say=artica]D..d-do I h-have a s-say in t-tthis?..[/say]")

		# (( Spitroast starts with {npc1.name} fucking pussy and {npc2.name} fucking throat. ))
		addButton("Continue", "See what happens next", "spit_sex")
	if(state == "spit_sex"):
		playAnimation(StageScene.SexSpitroast, "sex", {pc="artica", npc=npc1, npc2=npc2, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		var pcIncluded = (npc1 == "pc" || npc2 == "pc")
		var slavesText = ("your other two slaves" if !pcIncluded else "you and your slave")
		var onlyCocks = (!getCharacter(npc1).isWearingStrapon() && !getCharacter(npc2).isWearingStrapon())
		var onlyStrapons = (getCharacter(npc1).isWearingStrapon() && getCharacter(npc2).isWearingStrapon())
		var cocksText = ("cocks" if onlyCocks else ("strapons" if onlyStrapons else "cocks and strapons"))
		if (!didFirst):
			saynn("In one powerful combined thrust, "+str("your" if pcIncluded else "their")+" "+str(cocksText)+" get rammed into Artica's holes, one sliding up her cunt while another is going down her throat, stealing the fluff's ability to talk or breathe really.")

			saynn("[say=artica]Kh.. h-hh..[/say]")

			saynn("Artica's body is arching from the sudden penetrations, the pleasure of being fucked from both ends is making her own cock hard and drippy..")

		else:
			saynn("One set of cocks gets replaced by another, "+str(slavesText)+" swiftly grab Artica by all the paws before pulling her up and aligning "+str("your" if pcIncluded  else "their")+" "+str(cocksText)+" with Artica's used holes..")

			saynn("Moments later, her pussy and throat are stuffed full. The constant gangbanging isn't giving Artica much time to rest.. she is forced to endure this.. her eyes rolling up, toes twitching.")

			saynn("Her leaky"+str(" caged" if isCaged else "")+" cock is dripping with her cum onto her gray belly.. the fur color hiding most of the mess.")

		# (( Spitroast SEX with {npc1.name} fucking pussy and {npc2.name} fucking throat. ))
		addButton("Continue", "See what happens next", "spit_sexfast")
	if(state == "spit_sexfast"):
		playAnimation(StageScene.SexSpitroast, "fast", {pc="artica", npc=npc1, npc2=npc2, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		#var pcIncluded = (npc1 == "pc" || npc2 == "pc")
		#var slavesText = ("your three slaves" if !pcIncluded else "you and your two slaves")
		var onlyCocks = (!getCharacter(npc1).isWearingStrapon() && !getCharacter(npc2).isWearingStrapon())
		var onlyStrapons = (getCharacter(npc1).isWearingStrapon() && getCharacter(npc2).isWearingStrapon())
		var cocksText = ("cocks" if onlyCocks else ("strapons" if onlyStrapons else "cocks and strapons"))
		saynn("Muffled cries of pleasure spill out of her as the two"+str(" rubber" if onlyStrapons else "")+" shafts were being forced into her from both ends, the sensations overwhelming her as she was struggling to breathe, her body being rocked by the force of each thrust.")

		if (!didFirst):
			saynn("Artica's first orgasm is approaching quickly, her cock pulsing wildly"+str(" inside of its cage" if isCaged else "")+", her throat and pussy gripping the "+str(cocksText)+" urgently.")

		else:
			saynn("Artica looks like she is about to cum again, her cock pulsing wildly"+str(" inside of its cage" if isCaged else "")+", her pussy clenching around the {npc1.strapon} hard.")

		# (( Spitroast SEX FAST with {npc1.name} fucking pussy and {npc2.name} fucking throat. ))
		addButton("Continue", "See what happens next", "spit_cum")
	if(state == "spit_cum"):
		playAnimation(StageScene.SexSpitroast, "inside", {pc="artica", npc=npc1, npc2=npc2, pcCum=true, npcCum=true, npc2Cum=true, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		var pcIncluded = (npc1 == "pc" || npc2 == "pc")
		var slavesText = ("your two slaves" if !pcIncluded else "you and your slave")
		#var onlyCocks = (!getCharacter(npc1).isWearingStrapon() && !getCharacter(npc2).isWearingStrapon())
		#var onlyStrapons = (getCharacter(npc1).isWearingStrapon() && getCharacter(npc2).isWearingStrapon())
		#var cocksText = ("cocks" if onlyCocks else ("strapons" if onlyStrapons else "cocks and strapons"))
		saynn("Artica's body created a round arch as "+str(slavesText)+" pressed firmly against her from both ends. With her legs, throat and chest held firmly, she was at "+str("your" if pcIncluded else "their")+" mercy, her breath hitching.. until her"+str(" caged" if isCaged else "")+" throbbed cock suddenly began shooting her virile seed, her pussy walls clenching and spasming around the thick shaft, drawing it deep, her throat doing the same to the other cock..")

		if (getCharacter(npc2).isWearingStrapon()):
			saynn("The shaft in her mouth was just a strapon.. but it still released the cumlube that was loaded into it when Artica's walls squeezed that toy hard.")

		else:
			saynn("The cock in her mouth is pulsing and throbbing against her throat.. before releasing its hot seed inside, forcing the fluff to swallow everything.")

		if (getCharacter(npc1).isWearingStrapon()):
			saynn("The strapon that was fucking her pussy is now meeting a lot of resistance as Artica's stuffed hole is milking it for all of its cumlube.")

		else:
			saynn("Artica's womb gets stuffed full with {npc1.cum} as her orgasming"+str(" used" if didFirst else "")+" pussy is milking {npc1.your} balls dry.")

		if (!didFirst):
			saynn("A powerful first orgasm.. but certainly not the last.. Artica is coughing after that first round..")

			if (isVerySlut):
				saynn("[say=artica]Ah.. my h-holes.. kh-h.. ah.. s-so f-full..[/say]")

			elif (isSlut):
				saynn("[say=artica]Ah.. y-you're not d-done, are you-u?.. ah.. kh-h.. kh..[/say]")

			else:
				saynn("[say=artica]Ah.. my t-throat.. ah-h.. khh..kh.. w-wai..[/say]")

			saynn("She notices that the people around her aren't yet fully satisfied.. It's time to switch..")

		# (( Spitroast CUM with {npc1.name} fucking pussy and {npc2.name} fucking throat. ))
		addNextGangButton()
	if(state == "gang_tease"):
		playAnimation(StageScene.SexGangbang, "tease", {pc="artica", npc2=npc1, npc=npc2, npc3=npc3, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}, npc3BodyState={exposedCrotch=true,hard=true}})
		var pcIncluded = (npc1 == "pc" || npc2 == "pc" || npc3 == "pc")
		var slavesText = ("your three slaves" if !pcIncluded else "you and your two slaves")
		var onlyCocks = (!getCharacter(npc1).isWearingStrapon() && !getCharacter(npc2).isWearingStrapon() && !getCharacter(npc3).isWearingStrapon())
		var onlyStrapons = (getCharacter(npc1).isWearingStrapon() && getCharacter(npc2).isWearingStrapon() && getCharacter(npc3).isWearingStrapon())
		var cocksText = ("cocks" if onlyCocks else ("strapons" if onlyStrapons else "cocks and strapons"))
		saynn("With a firm grip, "+str(slavesText)+" force Artica onto all fours. No time is wasted, all the "+str(cocksText)+" already aligned with the fluff's holes.")

		saynn("[say=artica]Ah.. w-wow..[/say]")

		saynn("{npc1.You} {npc1.youAre} underneath, {npc1.yourHis} {npc1.strapon} is brushing against the girl's slit, about to enter her dripping pussy. {npc2.You} {npc2.youVerb('take')} a spot behind, {npc2.yourHis} {npc2.strapon} pressed against that tight ass while {npc3.your} {npc3.strapon} is brushing against Artica's mouth lips..")

		# (( Gangbang starts with {npc1.name} fucking pussy, {npc2.name} fucking ass and {npc3.name} fucking throat.
		if (isVerySlut):
			saynn("[say=artica]L-looks like.. I-I'm g.gonna b-be stretched..[/say]")

		elif (isSlut):
			saynn("[say=artica]A-are you gonna b-be rough w-with my hh.holes?..[/say]")

		else:
			saynn("[say=artica]D..d-do I h-have a s-say in t-tthis?..[/say]")

		addButton("Continue", "See what happens next", "gang_sex")
	if(state == "gang_sex"):
		playAnimation(StageScene.SexGangbang, "sex", {pc="artica", npc2=npc1, npc=npc2, npc3=npc3, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}, npc3BodyState={exposedCrotch=true,hard=true}})
		var pcIncluded = (npc1 == "pc" || npc2 == "pc" || npc3 == "pc")
		var slavesText = ("your other three slaves" if !pcIncluded else "you and your two slaves")
		var onlyCocks = (!getCharacter(npc1).isWearingStrapon() && !getCharacter(npc2).isWearingStrapon() && !getCharacter(npc3).isWearingStrapon())
		var onlyStrapons = (getCharacter(npc1).isWearingStrapon() && getCharacter(npc2).isWearingStrapon() && getCharacter(npc3).isWearingStrapon())
		var cocksText = ("cocks" if onlyCocks else ("strapons" if onlyStrapons else "cocks and strapons"))
		if (!didFirst):
			saynn("In one powerful combined thrust, "+str("your" if pcIncluded else "their")+" "+str(cocksText)+" get rammed into Artica's holes, one sliding up her cunt, one stretching her asshole and another going down her throat.")

			saynn("[say=artica]Nh-h!.. h-hmhh..[/say]")

			saynn("Artica's body is arching from the sudden penetration, the pleasure of being fucked from every angle is making her own cock hard and drippy..")

		else:
			saynn("One set of cocks gets replaced by another, "+str(slavesText)+" swiftly align "+str("your" if pcIncluded  else "their")+" "+str(cocksText)+" with Artica's used holes.. before ramming them inside, not giving the fluff even a single moment to come to senses.")

			saynn("Artica's body is trembling, pleasure of being fucked from every angle is making her own cock hard again, old cum is dripping off of the tip, mixed with the precum.")

		# (( Gangbang SEX with {npc1.name} fucking pussy, {npc2.name} fucking ass and {npc3.name} fucking throat.))
		addButton("Continue", "See what happens next", "gang_sexfast")
	if(state == "gang_sexfast"):
		playAnimation(StageScene.SexGangbang, "fast", {pc="artica", npc2=npc1, npc=npc2, npc3=npc3, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}, npc3BodyState={exposedCrotch=true,hard=true}})
		#var pcIncluded = (npc1 == "pc" || npc2 == "pc" || npc3 == "pc")
		#var slavesText = ("your three slaves" if !pcIncluded else "you and your two slaves")
		var onlyCocks = (!getCharacter(npc1).isWearingStrapon() && !getCharacter(npc2).isWearingStrapon() && !getCharacter(npc3).isWearingStrapon())
		var onlyStrapons = (getCharacter(npc1).isWearingStrapon() && getCharacter(npc2).isWearingStrapon() && getCharacter(npc3).isWearingStrapon())
		var cocksText = ("cocks" if onlyCocks else ("strapons" if onlyStrapons else "cocks and strapons"))
		saynn("Artica's holes were being pounded faster and harder, {npc1.your} {npc1.strapon} is getting thrust upward by {npc1.youHim}, slick cyan folds tightly wrapping around it while a different {npc2.strapon} hammering the girl's ass, inner walls squeezing that one tightly.. just like the girl's throat around {npc3.your} {npc3.strapon}.")

		if (!didFirst):
			saynn("Artica's first orgasm is approaching quickly, her cock pulsing wildly"+str(" inside of its cage" if isCaged else "")+", all her holes gripping the "+str(cocksText)+" urgently.")

		else:
			saynn("Artica's next orgasm is approaching quickly, her cock pulsing wildly"+str(" inside of its cage" if isCaged else "")+", all her holes gripping the "+str(cocksText)+" urgently.")

		# (( Gangbang FAST with {npc1.name} fucking pussy, {npc2.name} fucking ass and {npc3.name} fucking throat. ))
		addButton("Continue", "See what happens next", "gang_cum")
	if(state == "gang_cum"):
		playAnimation(StageScene.SexGangbang, "inside", {pc="artica", npc2=npc1, npc=npc2, npc3=npc3, pcCum=true, npcCum=true, npc2Cum=true, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}, npc3BodyState={exposedCrotch=true,hard=true}})
		#var pcIncluded = (npc1 == "pc" || npc2 == "pc" || npc3 == "pc")
		#var slavesText = ("your three slaves" if !pcIncluded else "you and your two slaves")
		var onlyCocks = (!getCharacter(npc1).isWearingStrapon() && !getCharacter(npc2).isWearingStrapon() && !getCharacter(npc3).isWearingStrapon())
		var onlyStrapons = (getCharacter(npc1).isWearingStrapon() && getCharacter(npc2).isWearingStrapon() && getCharacter(npc3).isWearingStrapon())
		var cocksText = ("cocks" if onlyCocks else ("strapons" if onlyStrapons else "cocks and strapons"))
		saynn("Artica's throat, pussy and ass spasmed around the three "+str(cocksText)+" buried deep within her, milking them for every drop of cum"+str("lube" if  onlyStrapons else "")+" as she was overwhelmed by waves of pleasure."+str(". for the first time.. but certainly not the last." if !didFirst else "")+"")

		saynn("Pretty much at the same time, her own {artica.penis} erupted, shooting thick streams of cum while her pussy released a shower of transparent girlcum.. Her body is twitching and quivering, legs shaking, toes curling hard.")

		# (( Gangbang CUM with {npc1.name} fucking pussy, {npc2.name} fucking ass and {npc3.name} fucking throat. ))
		if (!didFirst):
			saynn("Artica is coughing after that first round..")

			if (isVerySlut):
				saynn("[say=artica]Ah.. my h-holes.. kh-h.. ah.. s-so f-full..[/say]")

			elif (isSlut):
				saynn("[say=artica]Ah.. y-you're not d-done, are you-u?.. ah.. kh-h.. kh..[/say]")

			else:
				saynn("[say=artica]Ah.. my t-throat.. ah-h.. khh..kh.. w-wai..[/say]")

			saynn("She notices that the people around her aren't yet fully satisfied.. It's time to switch..")

		addNextGangButton()
	if(state == "after_gangbang"):
		playAnimation(StageScene.SexStart, "start", {npc="artica", npcBodyState={hard=true,naked=true}})
		var pcIncluded = (npc1 == "pc" || npc2 == "pc" || npc3 == "pc")
		var slavesText = ("your slaves" if !pcIncluded else "you and your slaves")
		var onlyCocks = onlyCocksGlobal
		var onlyStrapons = onlyStraponsGlobal
		saynn("After the last slaves have finished gangbanging Artica, she is left laying on the floor, completely spent from the intense pounding of all holes.. Her pussy and asshole are left gaping and leaking"+str(" fake" if onlyStrapons else "")+" seed, her throat sore and stretched from the rough treatment it had received. Every muscle in her body twitched with the aftermath of the pleasure she had just experienced..")

		saynn("[say=artica]Nh-h.. ahh..h-h-h.. h.h.. ny-y..h..ah..[/say]")

		if (!onlyStrapons && !onlyCocks):
			saynn("As she laid there, used and abused.. "+str(slavesText)+" decide to surround her for the last time. With mean smiles on "+str("your" if pcIncluded else "their")+" faces, "+str("you" if pcIncluded else "they")+" begin to stroke cocks and rub pussies, preparing to give the fluff one final, humiliating act of submission..")

			saynn("Soon, "+str(slavesText)+" unleash "+str("your" if pcIncluded else "their")+" loads, covering Artica's fur and face with layers of hot, sticky cum.. and salty slick girlcum.. The fluff's fur is being marked by many scents at once while she is just completely at "+str("your" if pcIncluded else "their")+" mercy..")

		elif (onlyCocks):
			saynn("As she laid there, used and abused.. "+str(slavesText)+" decide to surround her for the last time. With mean smiles on "+str("your" if pcIncluded else "their")+" faces, "+str("you" if pcIncluded else "they")+" begin to stroke cocks, preparing to give the fluff one final, humiliating act of submission..")

			saynn("Soon, "+str(slavesText)+" unleash "+str("your" if pcIncluded else "their")+" loads, covering Artica's fur and face with layers of hot, sticky cum.. The fluff's fur is being marked by many scents at once while she is just completely at "+str("your" if pcIncluded else "their")+" mercy..")

		else:
			saynn("As she laid there, used and abused.. "+str(slavesText)+" decide to surround her for the last time. With mean smiles on "+str("your" if pcIncluded else "their")+" faces, "+str("you" if pcIncluded else "they")+" take off "+str("your" if pcIncluded else "their")+" strapons and start rubbing "+str("your" if pcIncluded else "their")+" pussies, preparing to give the fluff one final, humiliating act of submission..")

			saynn("Soon, "+str(slavesText)+" unleash "+str("your" if pcIncluded else "their")+" loads, covering Artica's fur and face with layers of salty slick girlcum.. The fluff's fur is being marked by many scents at once while she is just completely at "+str("your" if pcIncluded else "their")+" mercy..")

		if (isVerySlut):
			saynn("[say=artica]I'm.. s-such a.. c-cum h-hungry.. w-whore.. ah-h.. cum d-dumpster..[/say]")

		elif (isSlut):
			saynn("[say=artica]I'm.. s-such a.. c-cum.. w-whore.. ahh..[/say]")

		else:
			saynn("[say=artica]Hhh-h.. ah-h.. s-so m-mmuuch..[/say]")

		saynn("You stay there and help the fluff to come back to her senses.. before bringing her out into the main hall.. still covered in various fluids..")

		addButton("Enough", "This was fun", "endthescene")
func addSlaveButtons():
	sayn("Who will gangbang her:")
	if(pickedSlaves.has("pc")):
		sayn("You")

	var notFit = {}
	var pcSlaves = GM.main.getPCSlavesIDs()
	for slaveID in pcSlaves:
		var character = getCharacter(slaveID)
		var npcSlave = character.getNpcSlavery()
		if(npcSlave == null):
			continue
		if(npcSlave.isMindBroken()):
			notFit[slaveID] = "A mindbroken slave can't do this"
			continue
		if(npcSlave.isDoingActivity()):
			notFit[slaveID] = "This slave is busy with something already"
			continue
		if(pickedSlaves.has(slaveID)):
			addButton("-"+character.getName(), "Level "+str(npcSlave.slaveLevel)+" "+npcSlave.getSlaveTypeName()+"\n\n"+character.getSmallDescription(), "toggle_slave", [slaveID])
			sayn(character.getName())
		else:
			addButton("+"+character.getName(), "Level "+str(npcSlave.slaveLevel)+" "+npcSlave.getSlaveTypeName()+"\n\n"+character.getSmallDescription(), "toggle_slave", [slaveID])
	for slaveID in notFit:
		var character = getCharacter(slaveID)
		addDisabledButton(character.getName(), notFit[slaveID])

func getNextNPC():
	var result = RNG.grab(pickPool)
	if(pickPool.size() <= 0):
		pickPool = pickedSlaves.duplicate()
		pickPool.erase(result)
	return result

func nextGang():
	var possible = ["dp", "spit"]
	if(pickedSlaves.size() > 2):
		possible.append("gang")
	if(possible.has(lastScene)):
		possible.erase(lastScene)
	var nextSceneType = RNG.pick(possible)
	lastScene = nextSceneType
	
	if(!didFirst):
		setState(nextSceneType+"_tease")
	else:
		setState(nextSceneType+"_sex")
	npc1 = getNextNPC()
	if(nextSceneType in ["dp", "spit", "gang"]):
		npc2 = getNextNPC()
	if(nextSceneType in ["gang"]):
		npc3 = getNextNPC()

func after_gangbang():
	for slaveID in pickedSlaves:
		GM.main.updateCharacterUntilNow(slaveID)
		getCharacter(slaveID).removeStrapon()
		
		getCharacter("artica").cummedOnBy(slaveID)
	getModule("ArticaModule").makeLusty()

func addNextGangButton():
	if(sceneAmount <= 1):
		saynn("This was the last one..")
	elif(sceneAmount == 2):
		saynn("The slaves can use Artica one more time..")
	else:
		saynn(str(sceneAmount-1)+" uses left!")

	addButton("Continue", "See what happens next", "start_next_scene")

func afterEachGang():
	getModule("ArticaModule").addCorruption(0.01)


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_gangbang"):
		pickPool = pickedSlaves.duplicate()
		sceneAmount = pickedSlaves.size()
		for slaveID in pickedSlaves:
			var character = getCharacter(slaveID)
			if(!character.hasReachablePenis()):
				onlyCocksGlobal = false
				var strapon = GlobalRegistry.createItem(RNG.pick(GlobalRegistry.getItemIDsByTag(ItemTag.Strapon)))
				var fluids = strapon.getFluids()
				fluids.addFluid("CumLube", RNG.randi_range(2, 5)*RNG.randf_range(80.0, 100.0))
				character.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
			else:
				onlyStraponsGlobal = false

	if(_action == "toggle_pc"):
		if(pickedSlaves.has("pc")):
			pickedSlaves.erase("pc")
		else:
			pickedSlaves.append("pc")
			playAnimation(StageScene.Duo, "stand", {npc="artica"})
		return

	if(_action == "toggle_slave"):
		var slaveID = _args[0]
		if(pickedSlaves.has(slaveID)):
			playAnimation(StageScene.Duo, "stand", {npc="artica"})
			pickedSlaves.erase(slaveID)
			removeCharacter(slaveID)
		else:
			playAnimation(StageScene.Duo, "stand", {npc=slaveID})
			pickedSlaves.append(slaveID)
			addCharacter(slaveID)
		return

	if(_action == "start_first_scene"):
		nextGang()
		return

	if(_action == "start_next_scene"):
		processTime(5*60)
		sceneAmount -= 1
		if(sceneAmount <= 0):
			processTime(3*60)
			setState("after_gangbang")
			after_gangbang()
			return
		didFirst = true
		nextGang()
		return

	if(_action == "dp_sex"):
		processTime(5*60)

	if(_action == "dp_sexfast"):
		processTime(5*60)

	if(_action == "dp_cum"):
		processTime(5*60)
		getCharacter("artica").cummedInVaginaBy(npc1)
		getCharacter("artica").cummedInAnusBy(npc2)
		afterEachGang()

	if(_action == "spit_sex"):
		processTime(5*60)

	if(_action == "spit_sexfast"):
		processTime(5*60)

	if(_action == "spit_cum"):
		processTime(5*60)
		getCharacter("artica").cummedInVaginaBy(npc1)
		getCharacter("artica").cummedInMouthBy(npc2)
		afterEachGang()

	if(_action == "gang_sex"):
		processTime(5*60)

	if(_action == "gang_sexfast"):
		processTime(5*60)

	if(_action == "gang_cum"):
		processTime(5*60)
		getCharacter("artica").cummedInVaginaBy(npc1)
		getCharacter("artica").cummedInAnusBy(npc2)
		getCharacter("artica").cummedInMouthBy(npc3)
		afterEachGang()

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
	data["onlyCocksGlobal"] = onlyCocksGlobal
	data["onlyStraponsGlobal"] = onlyStraponsGlobal
	data["sceneAmount"] = sceneAmount
	data["pickedSlaves"] = pickedSlaves
	data["pickPool"] = pickPool
	data["npc1"] = npc1
	data["npc2"] = npc2
	data["npc3"] = npc3
	data["didFirst"] = didFirst
	data["lastScene"] = lastScene

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
	onlyCocksGlobal = SAVE.loadVar(data, "onlyCocksGlobal", true)
	onlyStraponsGlobal = SAVE.loadVar(data, "onlyStraponsGlobal", true)
	sceneAmount = SAVE.loadVar(data, "sceneAmount", 1)
	pickedSlaves = SAVE.loadVar(data, "pickedSlaves", [])
	pickPool = SAVE.loadVar(data, "pickPool", [])
	npc1 = SAVE.loadVar(data, "npc1", "")
	npc2 = SAVE.loadVar(data, "npc2", "")
	npc3 = SAVE.loadVar(data, "npc3", "")
	didFirst = SAVE.loadVar(data, "didFirst", false)
	lastScene = SAVE.loadVar(data, "lastScene", "")
