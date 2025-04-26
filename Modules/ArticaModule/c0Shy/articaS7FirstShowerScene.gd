extends SceneBase

var isAfterSex = false

func _init():
	sceneID = "articaS7FirstShowerScene"

func _initScene(_args = []):
	if(_args.size() > 0 && _args[0]):
		isAfterSex = true
		setState("alternative_start")

func _run():
	if(state == ""):
		addCharacter("artica")
		playAnimation(StageScene.PawJobUnderTable, "start", {npc="pc", pc="artica"})
		saynn("While sitting on the bench opposite of Artica's and casually chatting with her about the prison life.. you notice something interesting.")

		saynn("Her hands.. they're currently under the table.")

		saynn("[say=artica]Yeah.. um.. I agree.. the prison is quite big..[/say]")

		saynn("Sneakily, you lean back.. and try to get a peek of what she is doing there.")

		saynn("Oh wow, one of her paws seems to be.. in her shorts.. actively doing something.")

		saynn("[say=artica]So.. so.. mhm.. big..[/say]")

		saynn("Her cheeks are ever so slightly red, she gives you occasional looks.")

		saynn("[say=pc]True. Gotta be careful when wandering around.. or you can get caught doing something naughty, you know?[/say]")

		saynn("[say=artica]Yeah-h.. and get punished.. in stocks.. or something worse.. hah-hha.. ah..[/say]")

		saynn("Whatever her paws are doing in her shorts, they're doing it faster now.. Artica's toes curling, her tail swishing. You can hear her panting softly, her cheeks blushing more and more.")

		saynn("When your gazes collide, the fluff quickly lowers her gaze suddenly, her expression changes drastically to a very embarrassed one.")

		saynn("[say=pc]Everything is okay, Artica?[/say]")

		saynn("[say=artica]Y-yeah.. I.. um.. I n-n.. need t-to go..[/say]")

		saynn("You nod and watch Artica get up and quickly rush to the exit, almost tripping in the process.")

		saynn("Interesting. Might as well see where she is heading. Just in case she runs into trouble.")

		addButton("Follow", "See where she is heading", "artica_in_dressing_room")
	if(state == "alternative_start"):
		addCharacter("artica")
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="risha"})
		saynn("Artica ran off without even saying goodbye last time.. so why not pay her a visit.")

		saynn("But as you step into the canteen.. you notice that she isn't alone.. the snowy fluff is standing near that annoying tall cat.")

		saynn("[say=artica].. ..[/say]")

		saynn("Hiding in the queue of the inmates who want food, you sneak up to the pair.. But no matter how close you get, you can't hear a word of what that shy inmate is saying.")

		saynn("[say=risha]Huh? What is it? I don't have much time for floor mats.[/say]")

		saynn("[say=artica].. .. ..[/say]")

		saynn("The guard raises a brow.")

		var gotFucked = getFlag("ArticaModule.s6HadRoughSex", false)
		var gotCummedIn = getFlag("ArticaModule.s6HadRoughSexCameInside", false)
		saynn("[say=risha]Oh yeah? What did {pc.he} do exactly?[/say]")

		saynn("Artica lowers her gaze, her cheeks receive a soft blush.")

		saynn("[say=artica].. .. ..[/say]")

		saynn("You get a feeling that she is talking about you.. You might be getting into some serious trouble for what you did..")

		if (gotCummedIn):
			saynn("[say=risha]Seriously? You're asking me if it's OKAY that {pc.he} GRABBED YOUR THROAT and CHOKED you hard while POUNDING your cunt?[/say]")

		elif (gotFucked):
			saynn("[say=risha]Seriously? You're asking me if it's OKAY that {pc.he} GRABBED YOUR THROAT and CHOKED you hard while RIDING your cock?[/say]")

		else:
			saynn("[say=risha]Seriously? You're asking me if it's OKAY that {pc.he} GRABBED YOUR THROAT and CHOKED you so hard you were seeing sparks in your eyes?[/say]")

		saynn("The poor fluff's face burns red. The guard grabs a random inmate out of the crowd.")

		saynn("[say=risha]What do you think, huh? Is that an okay thing to do?[/say]")

		saynn("The inmate shrugs.. so the lynx shoves them back into the queue.")

		saynn("[say=artica]..[/say]")

		saynn("[say=risha]Here is your answer. Obviously it is. You whores deserve anything that happens to you.[/say]")

		saynn("She laughs while the white fluff is struggling to find a place for herself, fidgeting in place, her tail twitches.")

		saynn("[say=risha]I'm jealous, really. I wish I was there. Any more questions?![/say]")

		saynn("[say=artica]..[/say]")

		saynn("[say=risha]Good. Now fuck off, bitch. Either go grab a pickaxe or start whoring yourself out already. I saw your records by the way, very interesting how such a slut can be so shy.[/say]")

		saynn("[say=artica]..[/say]")

		saynn("Artica lowers her gaze and starts heading for her usual sitting spot.")

		saynn("Huh.")

		addButton("Watch", "See what Artica will do next", "alt_watch")
	if(state == "alt_watch"):
		removeCharacter("risha")
		playAnimation(StageScene.Solo, "sit", {pc="artica"})
		saynn("You decide not to intervene and just watch how Artica flops onto her usual bench.. and just stares at the floor.")

		saynn("Slowly, you begin approaching her from behind, your eyes.. notice something interesting.")

		saynn("Artica's hands are resting on her legs for a bit.. but then they pull on the shorts a bit, revealing her.. sheath.. with the pointy tip of her canine cock poking out.. and dripping.")

		saynn("Sneakily, one of her paws slips under the ribbon.. and begins rubbing that cock, helping it to get out of the sheath.")

		saynn("[say=artica]Nh..[/say]")

		saynn("You hear quiet moans as she starts stroking herself, her legs spread slightly, toes sprawling wide.")

		saynn("Such a needy fluff, she even pauses to sniff her digits after getting some pre onto them, her eyes closed as she does that. Now seems like a nice moment to announce yourself.")

		addButton("Sit near", "See her reaction as you sit nearby", "alt_sitnear")
	if(state == "alt_sitnear"):
		playAnimation(StageScene.PawJobUnderTable, "start", {npc="pc", pc="artica"})
		saynn("You let Artica enjoy the scent of her own cock for a bit.. before quietly taking a seat on the opposite bench.")

		saynn("[say=pc]Hey there, Artica.[/say]")

		saynn("[say=artica]EEP![/say]")

		saynn("Her eyes open wide, her body arches out from the huge sudden startling impulse, her hands fly under the table to pull her shorts back up.")

		saynn("[say=pc]Looks like I startled you, my bad~. What were you doing? Hope you're not mad at me after the last time.[/say]")

		saynn("[say=artica]Uh.. um.. I'm.. nn-n..nothi.. n-no.. eep.. I.. Umm-m..[/say]")

		saynn("She tries to cover her ashamed face.. with her paws that are marked with her own scent.. you look under the table and notice her bulging shorts pulsing.")

		saynn("[say=pc]I'm glad. Whatever I said, I didn't mean it.. that much.[/say]")

		saynn("[say=artica]I.. um.. oka..ay.. I gotta.. g-go.. s-sorr-ry..[/say]")

		saynn("You smile and nod as Artica struggles to get up, almost tripping while rushing towards the exit.")

		addButton("Follow", "See where she is heading", "artica_in_dressing_room")
	if(state == "artica_in_dressing_room"):
		aimCameraAndSetLocName("main_dressing1")
		playAnimation(StageScene.Solo, "walk")
		saynn("Artica walks out of the canteen and quickly heads towards the bathroom.")

		saynn("You follow, taking your time, to not spook the fluff any more than you already did.")

		saynn("The bathroom itself seems to be empty.. so you step in further, into the dressing room.")

		saynn("You only catch the view of Artica's butt as she quickly stuffs her uniform into one of the lockers.. forgets to close it in a hurry.. and then heads out into the showers room.")

		addButton("Showers", "See what she will be doing there", "artica_in_showers")
	if(state == "artica_in_showers"):
		addCharacter("artica", ["naked"])
		#playAnimation(StageScene.Grope, "watchstroke", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		playAnimation(StageScene.Showering, "stroke", {pc="artica", bodyState={naked=true, hard=true}})

		aimCameraAndSetLocName("main_shower1")
		saynn("[say=artica]Ah.. ah..[/say]")

		saynn("Moans and running water are the first thing that you hear as you sneak through the dressing room.")

		saynn("As you peek your head out into the showers room, you see Artica.. standing under the shower head.. showering.. One of her hands is pressed into the cold concrete while the second one.. is on her hard cock, stroking it.")

		saynn("Whatever you did, it must have made her horny. The fluff keeps making cute love noises, her eyes closed, her paw sliding over her twitching cyan shaft, the knot at the base already slightly inflated.")

		saynn("[say=artica]So.. n-needy.. ah..[/say]")

		addButton("Watch more", "See what happens next", "artica_licks_fingers")
		addButton("Lockers", "Return back to the lockers", "return_to_lockers")
	if(state == "artica_licks_fingers"):
		#playAnimation(StageScene.Grope, "watchrub", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		playAnimation(StageScene.Showering, "rub", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("After getting herself wet and bothered, Artica's paw collects some of her precum and brings it under her balls.. where a cute tight cyan pussy slit is hiding.")

		if (getCharacter("artica").hasEffect(StatusEffect.HasCumInsideVagina)):
			saynn("You keep yourself out of the fluff's sight as she starts teasing her female bits, her digits caressing the sensitive folds, playing with the clit. Old cum is leaking out of her used pussy.. cum that she quickly licks off of her digits..")

		else:
			saynn("You keep yourself out of the fluff's sight as she starts teasing her female bits, her digits caressing the sensitive folds, playing with the clit.")

		saynn("[say=artica]Ah.. ah.. hope no one finds me like this..[/say]")

		saynn("The needy girl holds her chin high, moaning quietly as her paw is rubbing her slit, the cold water washing over her hot body, unable to extinguish the heat.")

		saynn("After playing with herself down there, Artica brings the wet paw to her maw.. and shoves her snout into it, the scent making her legs go weak, her tail curling around her thigh.")

		saynn("[say=artica]..ah.. gods..[/say]")

		addButton("Watch more", "See what happens next", "artica_cums_in_shower")
		addButton("Lockers", "Return back to the lockers", "return_to_lockers")
	if(state == "artica_cums_in_shower"):
		#playAnimation(StageScene.Grope, "watchstroke", {pc="artica", npc="pc", pcCum=true, bodyState={naked=true, hard=true}})
		playAnimation(StageScene.Showering, "stroke", {pc="artica", pcCum=true, bodyState={naked=true, hard=true}})
		saynn("The more she sniffs her own paw, the more her {artica.penis} pulses, precum drips off of the tip.")

		saynn("[say=artica]This s-shouldn't t-turn me on so much-h.. ah..[/say]")

		saynn("Unable to resist the temptation, she returns to masturbation, one of her paws lands back on the shaft and starts stroking it.. while another stops pushing against the wall and slides under the balls, finding and spreading the pussy folds before slipping a few digits inside.")

		saynn("[say=artica]..c-can't stop.. t-thinking.. nh-h.. ah..[/say]")

		saynn("The white fluff stands high on her toes, her body swaying from the pleasure flooding her mind, her cock's knot has inflated to its full size, her drippy pussy twitching in excitement.")

		saynn("[say=artica]..n-ny-.. nyaah-hh-..[/say]")

		saynn("Finally, she throws her head back and lets out a cute moan, her canine cock is throbbing in her paw.. before shooting string after string of her thick white seed, messing up the concrete wall in front of her.. while her pussy is clenching around her digits. The orgasm is so strong, she has to lean against the metal pipes of the showers, the running water seems to be helping to hide her noises.")

		saynn("[say=artica]Nh-h.. ah..[/say]")

		saynn("Better leave before she notices you.")

		addButton("Lockers", "Return back to the lockers", "return_to_lockers")
	if(state == "return_to_lockers"):
		aimCameraAndSetLocName("main_dressing1")
		removeCharacter("artica")
		saynn("You stop spying on Artica and return back to the dressing room.")

		saynn("That locker of hers.. still unlocked.")

		addButton("Steal uniform", "She doesn't need her uniform anyway", "steal_artica_uniform")
		addButton("Just leave", "You'd rather not mess with Artica", "no_steal_uniform")
	if(state == "steal_artica_uniform"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="pc", bodyState={naked=true}})
		saynn("It's her fault that she didn't lock it.. you open the locker and grab Artica's lilac uniform.")

		saynn("But as you step away from it..")

		saynn("[say=artica]Eep.. h-hey..[/say]")

		saynn("Artica is peeking out into the dressing room, her eyes see the empty locker.")

		saynn("[say=artica]Where are.. my c-clothes..[/say]")

		saynn("[say=pc]Well, show yourself first.[/say]")

		saynn("Artica peeks her head out more.. avoiding showing the rest of her naked body.")

		saynn("[say=artica]Um..[/say]")

		saynn("[say=pc]Fully. I might know where your clothes are.[/say]")

		saynn("The fluff blinks many times.. but then decides to come out, stepping into the dressing room, her paws covering up everything that they can..")

		saynn("[say=artica]Can I.. g-get them back?.. I can't walk around n-naked..[/say]")

		addButton("Keep clothes", "Force Artica to stay naked", "steal_clothes_fully")
		addButton("Stop covering up!", "Order Artica to present everything without covering up", "order_showeverything")
		#if (GM.pc.hasReachablePenis() || GM.pc.hasReachableVagina()):
		#	addDisabledButton("Oral", "Artica is not corrupted enough to agree to this yet")
	if(state == "order_showeverything"):
		playAnimation(StageScene.Yoga, "dog", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("You show Artica her uniform. She reaches her paw out to grab it.. but you pull your hand away.")

		saynn("[say=pc]Nope. If you want it, you will have to do something first.[/say]")

		saynn("Artica's eyes go wide.")

		saynn("[say=artica]Do w-what..[/say]")

		saynn("You smile and tilt your head.")

		saynn("[say=pc]Show me everything that you have. No covering up. No being shy.[/say]")

		saynn("[say=artica]ee.. everything?..[/say]")

		saynn("Poor fluff is fidgeting actively.")

		saynn("[say=pc]Yeah.[/say]")

		saynn("[say=artica]I don't k-know.. Can.. Can I..I..[/say]")

		saynn("[say=pc]I guess I'm leaving now.[/say]")

		saynn("[say=artica]W-wai-..[/say]")

		saynn("Artica turns around and bends over, her front paws supporting her as she presents you her fluffy ass.")

		saynn("[say=artica]H-h.here..[/say]")

		saynn("Her tail goes to the side, revealing the tight tailhole, wet slick pussy and a canine cock of a decent size, all three of a bright cyan color. The fluff even spreads her legs more to let you see more of it all.")

		addButton("Give clothes", "She earned them", "do_give_clothes_back")
		addButton("Keep clothes", "She didn't earn them", "do_keep_clothes")
	if(state == "do_give_clothes_back"):
		addCharacter("artica")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("You pat her butt.")

		saynn("[say=pc]Alright, you earned it.[/say]")

		saynn("Blushing Artica gets up. You hand her the clothes and watch her dress up.")

		saynn("[say=pc]Back to the canteen?[/say]")

		saynn("[say=artica]Um.. Well.. The main hall doesn't seem that scary anymore.. haha.[/say]")

		addButton("Main hall", "Go there with Artica", "go_out_to_main_hall")
	if(state == "do_keep_clothes"):
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("[say=pc]You know what. I think you don't need the clothes. You look so cute without them.[/say]")

		saynn("[say=artica]Um.. w-what do you mean.. I can't.. like t-this..[/say]")

		saynn("You wait for her to get up and then grab her by the chin.")

		saynn("[say=pc]You can. No one cares, trust me.[/say]")

		saynn("She is whining like a sorry puppy.. so you just grab her by the collar and pull her towards the exit!")

		saynn("[say=artica]EEP! W-wai-..[/say]")

		addButton("Main hall", "Show Artica around", "no_clothes_show_around")
	if(state == "steal_clothes_fully"):
		saynn("[say=pc]Well.. I lied a bit. I actually don't know where your clothes are. They already weren't here.[/say]")

		saynn("Artica's eyes go wide.")

		saynn("[say=artica]Um.. b-but.. how am I.. Everyone is g-gonna..[/say]")

		saynn("[say=pc]No one cares, trust me.[/say]")

		saynn("She stands on her toes, her nervous wiggles return, her tail is between her legs.")

		saynn("[say=artica]A-are you s-sure you d-don't have t-them?..[/say]")

		saynn("You nod confidently. You get a feeling that Artica doesn't fully trust you on this one.. but what can she do anyway?")

		saynn("[say=artica]Um.. eep..[/say]")

		saynn("She is whining like a sorry puppy.. so you just grab her by the collar and pull her towards the exit!")

		saynn("[say=artica]EEP! W-wai-..[/say]")

		addButton("Main hall", "Show Artica around", "no_clothes_show_around")
	if(state == "no_clothes_show_around"):
		aimCameraAndSetLocName("main_bench3")
		addCharacter("artica")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		GM.pc.setLocation("main_bench3")
		saynn("You bring the fluff out into the main hall and climb the stairs that lead to the big platform in the middle.")

		saynn("Artica is desperately trying to find how to hide all her private bits from all angles with only her two hands and a tail.")

		saynn("[say=artica]H-he-ey..[/say]")

		saynn("[say=pc]See? No one cares.[/say]")

		saynn("Naked Artica certainly does receive some extra hungry gazes directed towards her from the inmates around.. but she is too busy watching the floor to see that.")

		saynn("[say=artica]Um-m.. ee-ep..[/say]")

		saynn("Looks like you will be able to find her here now.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "no_steal_uniform"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="pc", flipNPC=true, bodyState={naked=true,hard=true}})
		saynn("You stare at that unlocked locker for a bit.. but then just press its door a little tighter and start heading towards the exit.")

		saynn("[say=artica]Eep..[/say]")

		saynn("Your first instinct is to turn your head towards the noise.. but Artica stops you.")

		saynn("[say=artica]d-don't look..[/say]")

		saynn("You nod and just stand still while she rushes to her locker and grabs her uniform.")

		saynn("[say=pc]I was just washing my hands. Was looking for a towel.[/say]")

		saynn("[say=artica]Ok-kay..[/say]")

		saynn("She grabs one and quickly rubs her fur dry before putting on her clothes.")

		saynn("[say=artica]Let's go?..[/say]")

		saynn("Artica stands by your side.")

		saynn("[say=pc]Back to the canteen?[/say]")

		saynn("[say=artica]Um.. Well.. The main hall doesn't seem that scary anymore.. haha.[/say]")

		addButton("Main hall", "Go there with Artica", "go_out_to_main_hall")
	if(state == "go_out_to_main_hall"):
		aimCameraAndSetLocName("main_bench3")
		addCharacter("artica")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		GM.pc.setLocation("main_bench3")
		saynn("You step out into the main hall. Artica walks up the stairs leading to the big platform in the middle.. before positioning herself in the least crowded corner of it.")

		saynn("[say=artica]This spot seems alright..[/say]")

		saynn("Looks like you will be able to find her here now.")

		saynn("[say=artica]Um.. thanks for helping me to get used to how things work around here..[/say]")

		if (isAfterSex):
			saynn("She lowers her gaze and blushes softly.")

			saynn("[say=artica]Even if you.. um.. yeah..[/say]")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "artica_in_dressing_room"):
		processTime(10*60)

	if(_action == "alt_watch"):
		processTime(3*60)

	if(_action == "alt_sitnear"):
		processTime(5*60)

	if(_action == "artica_in_showers"):
		processTime(3*60)
		getCharacter("artica").afterTakingAShower()

	if(_action == "artica_licks_fingers"):
		processTime(3*60)

	if(_action == "artica_cums_in_shower"):
		processTime(3*60)

	if(_action == "steal_clothes_fully"):
		setFlag("ArticaModule.NoClothes", true)
		getModule("ArticaModule").addCorruption(0.01)
		getCharacter("artica").resetEquipment()

	if(_action == "order_showeverything"):
		getModule("ArticaModule").addCorruption(0.02)

	if(_action == "do_give_clothes_back"):
		processTime(3*60)

	if(_action == "do_keep_clothes"):
		setFlag("ArticaModule.NoClothes", true)
		getCharacter("artica").resetEquipment()

	if(_action == "go_out_to_main_hall"):
		processTime(3*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isAfterSex"] = isAfterSex

	return data

func loadData(data):
	.loadData(data)

	isAfterSex = SAVE.loadVar(data, "isAfterSex", false)
