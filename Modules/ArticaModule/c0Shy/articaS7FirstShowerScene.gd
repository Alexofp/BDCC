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

		saynn("[say=risha]Here is your answer. Obviously it is. You whores deserve anything that happens with you.[/say]")

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

		saynn("The bathroom itself seems to empty.. so you step in further, into the dressing room.")

		saynn("You only catch the view of Artica's butt as quickly stuffs her uniform into one of the lockers.. forgets to close it in a hurry.. and then heads out into the showers room.")

		addButton("Showers", "See what she will be doing there", "artica_in_showers")
	if(state == "artica_in_showers"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.Grope, "watchstroke", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		aimCameraAndSetLocName("main_shower1")
		saynn("[say=artica]Ah.. ah..[/say]")

		saynn("Moans and running water are the first thing that you hear as you sneak through the dressing room.")

		saynn("As you peek your head out into the showers room, you see Artica.. standing under the shower head.. showering.. One of her hands is pressed into the cold concrete while the second one.. is on her hard cock, stroking it.")

		saynn("Whatever you did, it must have made her horny. The fluff keeps making cute love noises, her eyes closed, her paw sliding over her twitching cyan shaft, the knot at the base already slightly inflated.")

		saynn("[say=artica]So.. n-needy.. ah..[/say]")

		addButton("Watch more", "See what happens next", "artica_licks_fingers")
		addButton("Lockers", "Return back to the lockers", "return_to_lockers")
	if(state == "artica_licks_fingers"):
		playAnimation(StageScene.Grope, "watchrub", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})

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

	setState(_action)

func saveData():
	var data = .saveData()

	data["isAfterSex"] = isAfterSex

	return data

func loadData(data):
	.loadData(data)

	isAfterSex = SAVE.loadVar(data, "isAfterSex", false)
