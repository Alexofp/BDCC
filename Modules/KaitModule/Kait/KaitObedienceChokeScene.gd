extends SceneBase

var usedStrapon = false
var defStrapon = false
var straponHasCum = false

func _init():
	sceneID = "KaitObedienceChokeScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("You get closer to Kait, your hand lands on her collar, catching the thick metal ring that is used for leashing.")

		saynn("[say=pc]Do you like that collar, Kait?[/say]")

		saynn("[say=kait]Huh? I'm a rebellious free-thinker fighter, I hate it with a passion. Would throw it into the abyss if I could. Without me in it.. of course.[/say]")

		saynn("Makes sense. You tug on the collar a bit, left and right, making Kait's head follow.")

		saynn("[say=pc]It's bulky. And very tight on your neck, isn't it?[/say]")

		saynn("[say=kait]Yeah? It is.[/say]")

		saynn("You manage to slide two digits under it, getting between Kait's neck and the barely padded inner ring. Her breath hitches for a second.")

		saynn("[say=pc]Now it's even more tight.[/say]")

		saynn("[say=kait]Oh.. oh shit..[/say]")

		saynn("Kait raises her chin and swallows audibly.. you can feel her throat flexing as she does it.")

		saynn("[say=pc]Do you like that?[/say]")

		saynn("[say=kait]Well.. hah.. is this all you can do?..[/say]")

		saynn("Sounds like a challenge.")

		addButton("Better grip", "Get a better grip on her neck", "grab_neck")
	if(state == "grab_neck"):
		playAnimation(StageScene.Choking, "idle", {pc="pc", npc="kait"})
		saynn("Your free hand reaches for Kait's neck, digits wrapping around her throat, applying a gentle amount of pressure. Enough to free your digits from under the collar.")

		saynn("[say=kait]That's.. getting better~.[/say]")

		saynn("Her breathing becomes slow and deep, her lips parted slightly to help catch more stray air.")

		saynn("[say=pc]What would you do if a guard would do this to you?[/say]")

		saynn("[say=kait]I would resist. Duh..[/say]")

		saynn("[say=pc]Show me.[/say]")

		saynn("Her paws dart towards your arm. She is trying to pry it off, pulling on it. You don't let go though, gradually putting more pressure.")

		saynn("[say=pc]Well. Is this all you can do?[/say]")

		saynn("Kait's ears perk up, her eyes light up instantly when she hears you say that.")

		saynn("[say=kait]You're on![/say]")

		saynn("Her claws suddenly dig into your forearm, not enough to break through the skin.. but enough to leave marks. A low growl starts rumbling in her chest. She yanks hard on your arm.. but your grip just about holds.")

		saynn("[say=pc]My turn.[/say]")

		saynn("You squeeze her throat tighter, cutting off Kait's breathing for a few seconds. She starts thrashing during it, her tail lashing behind her, her free paw swiping at your shoulder. You feel the sting of her claws.. but you endure it.")

		saynn("What makes you relax the grip.. is her suddenly kicking your leg.")

		saynn("[say=kait]Nngh.. I won't give up.. so easily..[/say]")

		saynn("And so you pull up more, making her stand high on her toes now, her body trying to twist and turn.")

		saynn("Your free hand moves down to her shirt. Your fingers find the buttons, undoing them one by one. Kait's struggling gets more frantic in the meantime, her paws clawing at your wrists, your arm.. anything she can reach.")

		saynn("[say=pc]You're not really trying, are you?[/say]")

		saynn("[say=kait]Ah.. hah.. rude. Grr..[/say]")

		saynn("She bares her fangs. You pull her shirt open, revealing her modest tits. You palm one, kneading the soft flesh, thumb rubbing the stiff nipple. Kait's breath hitches, her legs trembling. More growling escapes from her.")

		saynn("[say=pc]Gonna touch you everywhere. Nothing you can do.[/say]")

		saynn("[say=kait]T-try me![/say]")

		saynn("You pinch her nipple, making her yelp. Her claws dig deeper into your arm, leaving more scratches.")

		saynn("Then you reach down and pull down her shorts, yanking them down her thighs, exposing her cute pink pussy, her folds looking slick even in the dim light. You run a finger along her slit, making her shiver.")

		saynn("[say=pc]You.. are gonna be my sextoy.[/say]")

		saynn("[say=kait]Mhh.. ..make me~..[/say]")

		if (!GM.pc.hasReachablePenis()):
			addButton("Pin her down", "Wear a strapon and pin Kait down to the floor!", "pin_pick_menu")
		else:
			addButton("Pin her down", "Pin Kait to the floor", "pin_her_down")
	if(state == "pin_pick_menu"):
		saynn("Pick which strapon you want to use against Kait!")

		addButton("Default", "Use whatever strapon the hideout has lying around", "choose_strapon_def")
		addStraponButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "choose_strapon_pick")
	if(state == "pin_her_down"):
		addCharacter("kait", ["naked"])
		playAnimation(StageScene.SexChoke, "tease", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (usedStrapon):
			saynn("You quickly secure a strapon harness around your waist.. and then..")

		saynn("You push Kait down to the cold floor, still choking her while your other hand pushes her leg up high, spreading her wide for you.")

		saynn("Your "+str("{pc.penis}" if !usedStrapon else "rubber toy")+" is pressed against her wet entrance already, kissing her slick folds. Kait stares up at you, her eyes wide, her chest moving up and down.")

		saynn("[say=kait]Is this.. all you got?..[/say]")

		saynn("She is asking for it.")

		addButton("Continue", "See what happens next", "start_sex")
	if(state == "start_sex"):
		playAnimation(StageScene.SexChoke, "sex", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You don't answer.. you just slam your"+str(" rubber" if usedStrapon else "")+" cock inside her in one hard thrust, burying yourself to the base in her tight, wet pussy. Kait's eyes go wide, a strangled gasp escaping her lips as her back arches off the cold floor.")

		saynn("[say=kait]F-fuck..![/say]")

		saynn("Her pussy clenches around you instantly, her slick walls gripping "+str("strapon's" if usedStrapon else "your")+" shaft.. already trying to milk it.")

		saynn("You pull back slowly.. then ram in again. Harder this time. The wet sound of your "+str("cock" if !usedStrapon else "toy")+" stretching her open echoes through the room.")

		saynn("[say=kait]Nngh.. ah..[/say]")

		saynn("Her claws dig into your forearm again, still trying to pry your hand from her throat, her body squirming under you, trying to get some control.. but you don't give her any. You set the pace, thrusting deep inside her, again and again.")

		saynn("You tighten your grip on her neck again.. and feel her pussy clamping down around you in response. A choked moan escapes her lips.")

		saynn("[say=pc]Sextoy.[/say]")

		saynn("[say=kait]I'm.. a fierce.. ah.. rebellious fighter..[/say]")

		saynn("Kait's whole body shivers as the tip of your"+str(" cock" if !usedStrapon else " strapon")+" slams into her womb entrance with each thrust. What a fighter.")

		addButton("Faster", "Fuck her faster", "sex_faster")
	if(state == "sex_faster"):
		playAnimation(StageScene.SexChoke, "fast", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You increase the pace and tighten your grip further still, cutting off her air completely. Her eyes begin to roll back slightly, her pussy squeezing you so tight"+str(" you almost see stars" if !usedStrapon else ", you have to put extra strength to push through")+".")

		saynn("[say=kait]Mhh..-h..[/say]")

		saynn("Her clawed paws leave more scratches, her free leg kicks weakly, the fight is draining her energy fast.")

		saynn("Your hips slap against her thighs, making loud sounds. Her pussy is so drippy, her juices are running down her fluffy ass onto the floor.")

		saynn("Kait's mouth is open wide.. but no sound comes out. Her paws are just holding onto your wrist that's choking her.")

		if (!usedStrapon):
			saynn("She cums.. silently. It feels so good.. her pussy is suddenly clenching, squeezing, milking your cock with every thrust. Her body is trembling, her big shaky eyes are half-shut.")

		else:
			saynn("She cums.. silently. It feels nice.. her pussy is suddenly clenching, squeezing your rubber shaft. Her body is trembling, her big shaky eyes are half-shut.")

		addButton("Let her breathe", "Let her breathe while you fuck her.. but just a bit", "let_breathe")
		addButton("Choke hard", "(Unconscious sex) Keep choking her hard", "keep_choking")
	if(state == "keep_choking"):
		playAnimation(StageScene.SexChoke, "fast", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, uncon=true})
		saynn("You don't let her breathe even now, pounding into her harder, deeper, choking her through her orgasm. Animalistic desire flashes in your eyes.. you let it take over completely.")

		saynn("[say=kait]..[/say]")

		saynn("After a few seconds.. her eyes close, her body goes still, her paws slide off of your wrist and land onto the floor, beside her chest. She is out.")

		saynn("[say=pc]Fuck.[/say]")

		saynn("And yet, you keep going, ramming her cock deep inside her unconscious body, forcing her pussy to continue spasming around you.")

		if (!usedStrapon):
			addButton("Cum inside", "Breed that cat", "keep_cum_inside")
		else:
			addButton("Ram it in", "Ram the whole toy in", "keep_cum_inside")
	if(state == "keep_cum_inside"):
		playAnimation(StageScene.SexChoke, "inside", {pc="pc", npc="kait", pcCum=!usedStrapon, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, uncon=true})
		if (!usedStrapon):
			saynn("You drive in deep one final time and just let the orgasm take over. Your {pc.penis} starts pulsing inside Kait, pumping hot {pc.cum} deep into her twitching pussy. Rope after rope floods her womb, filling her up, breeding her.")

			saynn("[say=pc]Ngh..[/say]")

			saynn("You grunt.. and stay buried inside her.. feeling her inner walls twitch around your throbbing cock.")

		else:
			saynn("You drive in deep one final time and just let the rubber shaft stay inside her, extending her orgasm further. "+str("Kait's pussy is pulsing visibly around your toy." if !straponHasCum else "Your strapon suddenly starts throbbing inside Kait, pumping hot seed deep into her pulsing pussy. Rope after rope floods her womb, filling her up, breeding her.")+"")

			saynn("[say=pc]Nice..[/say]")

			saynn("But now it was time to let her breathe again.")

		addButton("Pull out", "Pull out and try to bring Kait back to her senses", "keep_back_senses")
	if(state == "keep_back_senses"):
		playAnimation(StageScene.SexChoke, "tease", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (!usedStrapon || straponHasCum):
			saynn("Then you pull out. "+str("Your" if !straponHasCum else "The")+" seed starts leaking from her well-fucked pussy, pooling on the floor beneath her. You release her neck and immediately reach for her face, gently tapping her cheek.")

		else:
			saynn("Then you pull out. Her well-used pussy stays open for a bit.. before finally closing up. You release her neck and immediately reach for her face, gently tapping her cheek.")

		saynn("[say=pc]Kait. Hey. Kait.[/say]")

		saynn("A few moments later.. she starts coughing.. and gasping for air.")

		saynn("A few seconds later, her eyes begin to slowly open. She is clearly disoriented, blinking up at you.")

		saynn("[say=kait]Hh.. h-huh.. wha..[/say]")

		saynn("[say=pc]You're okay. Breathe.[/say]")

		addButton("Aftercare", "Pull her into some cuddles", "keep_aftecare")
	if(state == "keep_aftecare"):
		playAnimation(StageScene.Cuddling, "cuddle", {npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You pull Kait into a warm embrace, helping her to recover.")

		saynn("She is still coughing. Her paw reaches up for her throat, where your fingers were. Now there are visible bruises there under the fur.")

		saynn("[say=kait]That was.. kha.. intense.. I think I blinked.. and missed most of it..[/say]")

		saynn("[say=pc]Well..[/say]")

		saynn("[say=kait]Wait.. Did I actually black out?[/say]")

		saynn("[say=pc]You did. For a bit.[/say]")

		saynn("[say=kait]Shit.. That's.. kinda hot.[/say]")

		if (!usedStrapon):
			saynn("She reaches her paw down to her pussy.. and quickly finds it stuffed full with your seed..")

		elif (straponHasCum):
			saynn("She reaches her paw down to her pussy.. and quickly finds it stuffed full with seed..")

		else:
			saynn("She reaches her paw down to her pussy.. and quickly finds it soaked with her juices..")

		saynn("[say=kait]Very hot..[/say]")

		saynn("She leans into you, panting softly still.")

		saynn("[say=pc]You good?[/say]")

		saynn("[say=kait]Yeah.. yeah.. I'm good.. Just.. give me a minute.[/say]")

		saynn("You hold her, her body slowly relaxing against yours.")

		saynn("[say=kait]Hey.. at least I didn't give up![/say]")

		saynn("You chuckle and give her a pat.")

		saynn("[say=pc]You're impossible, Kait.[/say]")

		saynn("After some cuddling, it was time to stop..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "let_breathe"):
		saynn("After so much choking, you decide to loosen your grip on her throat, just enough to let a thin stream of air through. Kait gasps, her chest heaving as she sucks in the precious oxygen. Her eyes open wide again, focusing on you.")

		saynn("[say=kait]Hah.. hah.. fuck.. you..[/say]")

		saynn("[say=pc]I want you awake for this.[/say]")

		if (!usedStrapon):
			saynn("Her pussy is still clenching around you in rhythmic waves while you keep thrusting, letting her feel every inch of your cock as it drags against her overstimulated walls.")

		else:
			saynn("Her pussy is still clenching around the rubber toy in rhythmic waves while you keep thrusting, letting her feel every inch of it as you push it against her overstimulated walls.")

		saynn("[say=kait]Nngh.. mhh..[/say]")

		saynn("She doesn't seem to be fighting back anymore, just holding onto you.")

		saynn("[say=pc]Giving up?[/say]")

		saynn("[say=kait]..never.. ah..[/say]")

		if (!usedStrapon):
			saynn("You choke her hard again as your orgasm takes over..")

			addButton("Cum inside", "Breed the cat!", "cum_in")
		else:
			saynn("You choke her hard again.. might as well force the whole toy in.")

			addButton("Ram it in", "See what happens", "cum_in")
	if(state == "cum_in"):
		playAnimation(StageScene.SexChoke, "inside", {pc="pc", pcCum=!usedStrapon, npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (!usedStrapon):
			saynn("You drive in deep one final time and just let the orgasm take over. Your {pc.penis} starts pulsing inside Kait, pumping hot {pc.cum} deep into her pulsing pussy. Rope after rope floods her womb, filling her up, breeding her.")

			saynn("[say=kait]Mmm.. f-fuck..[/say]")

			saynn("She shivers as she feels the hot wave invading her. You grunt.. and stay buried inside her.. feeling her inner walls twitch around your throbbing cock.")

			saynn("The orgasm begins to fade..")

		else:
			saynn("You drive in deep one final time and just let the rubber shaft stay buried in! It extends Kait's orgasm, making her squirm harder under you.."+str("" if !straponHasCum else " And then.. your strapon suddenly starts throbbing inside her, pumping hot seed deep into her pulsing pussy. Rope after rope floods her womb, filling her up, breeding her.")+"")

			saynn("[say=kait]Mmm.. f-fuck..[/say]")

			saynn("Even when her orgasm begins to fade, she is still shivering a bit, her inner walls twitch around your strapon.")

		addButton("Pull out", "It's time to pull out", "cum_pullout")
	if(state == "cum_pullout"):
		playAnimation(StageScene.SexChoke, "tease", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (!usedStrapon):
			saynn("You slowly pull out, your cock sliding free with a wet sound. A mixture of your seed and her juices begin leaking from her well-used pussy, pooling on the floor.")

		elif (straponHasCum):
			saynn("You slowly pull out, your toy sliding free with a wet sound. A mixture of seed and juices begin leaking from her well-used pussy, pooling on the floor.")

		else:
			saynn("You slowly pull out, your toy sliding free with a wet sound. The transparent juices are dripping from her well-used pussy, pooling on the floor.")

		saynn("Kait just lies there for a moment, her chest heaving, staring up at the ceiling. Then she lets out a shaky laugh.. that turns into a cough.")

		saynn("[say=kait]Holy shit.. kgh.. khh..[/say]")

		saynn("[say=pc]You okay?[/say]")

		saynn("Probably just saliva stuck in her throat.")

		saynn("[say=kait]I'm.. yeah.. I'm great.. That was.. fuck.[/say]")

		addButton("Aftercare", "Pull her into some cuddles", "breathe_aftecare")
	if(state == "breathe_aftecare"):
		playAnimation(StageScene.Cuddling, "cuddle", {npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You pull Kait into a warm embrace, helping her to recover.")

		saynn("[say=kait]Hah.. you went soft on me.[/say]")

		saynn("[say=pc]Did I? Check your neck.[/say]")

		saynn("Her paw reaches up for her throat, where your fingers were. Now there are visible bruises there under the fur.")

		saynn("[say=kait]These are nothing! I would have been fine-e.[/say]")

		saynn("[say=pc]I wanted you to remember it.[/say]")

		if (!usedStrapon):
			saynn("Next, she reaches her paw down to her pussy.. and quickly finds it stuffed full with your seed..")

			saynn("[say=kait]You really didn't hold back.. so much.. This is what I'm gonna remember~.[/say]")

		elif (straponHasCum):
			saynn("Next, she reaches her paw down to her pussy.. and quickly finds it stuffed full with seed..")

			saynn("[say=kait]That strapon had something in it apparently.. This is what I'm gonna remember~.[/say]")

		else:
			saynn("Next, she reaches her paw down to her pussy.. and quickly finds it soaked with her juices..")

			saynn("[say=kait]You railed me hard.. This is what I'm gonna remember~.[/say]")

		saynn("She leans into you, panting softly still.")

		saynn("You hold her, her body slowly relaxing against yours.")

		saynn("[say=kait]One more~?[/say]")

		saynn("You chuckle and give her a pat.")

		saynn("[say=pc]You're impossible, Kait.[/say]")

		saynn("After some cuddling, it was time to stop..")

		addButton("Continue", "See what happens next", "endthescene")
func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "choose_strapon_pick", [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "choose_strapon_def"):
		usedStrapon = true
		defStrapon = true
		putOn("pc", "StraponCanine")
		setState("pin_her_down")
		return

	if(_action == "choose_strapon_pick"):
		usedStrapon = true
		defStrapon = false
		var strapon = _args[0]
		GM.pc.getInventory().removeItem(strapon)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		var theFluids = strapon.getFluids()
		if(theFluids != null):
			if(theFluids.hasFluidType("Cum")):
				straponHasCum = true
				setFlag("KaitModule.gotKaitPregMaybe", true)
		setState("pin_her_down")
		return

	if(_action == "sex_faster"):
		processTime(5*60)

	if(_action == "keep_cum_inside"):
		getCharacter("kait").cummedInVaginaBy("pc", FluidSource.Penis if !usedStrapon else FluidSource.Strapon)
		GM.pc.orgasmFrom("kait")

	if(_action == "keep_aftecare"):
		if(defStrapon):
			GM.pc.removeStrapon()
		elif(usedStrapon):
			GM.pc.unequipStrapon()

	if(_action == "cum_in"):
		getCharacter("kait").cummedInVaginaBy("pc", FluidSource.Penis if !usedStrapon else FluidSource.Strapon)
		GM.pc.orgasmFrom("kait")

	if(_action == "breathe_aftecare"):
		if(defStrapon):
			GM.pc.removeStrapon()
		elif(usedStrapon):
			GM.pc.unequipStrapon()

	setState(_action)

func saveData():
	var data = .saveData()

	data["usedStrapon"] = usedStrapon
	data["defStrapon"] = defStrapon
	data["straponHasCum"] = straponHasCum

	return data

func loadData(data):
	.loadData(data)

	usedStrapon = SAVE.loadVar(data, "usedStrapon", false)
	defStrapon = SAVE.loadVar(data, "defStrapon", false)
	straponHasCum = SAVE.loadVar(data, "straponHasCum", false)
