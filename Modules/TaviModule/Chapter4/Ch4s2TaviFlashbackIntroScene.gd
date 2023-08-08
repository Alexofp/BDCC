extends SceneBase

var tookShower = false
var lookOutOfWindow = false
var readDatapad = false

func _init():
	sceneID = "Ch4s2TaviFlashbackIntroScene"

func _run():
	if(state == ""):
		addCharacter("tavi", ["naked"])
		saynn("[say=tavi]It happened.. A few years ago.[/say]")

		saynn("As Tavi begins to open up, you can't help but to get immersed in her story.")

		addButton("Continue", "See what happens next", "start_flashback")
	if(state == "start_flashback"):
		removeCharacter("tavi")
		addCharacter("directortau")
		addCharacter("jaxontau")
		aimCameraAndSetLocName("taviroom_bed")
		GM.pc.setLocation("taviroom_bed")
		playAnimation(StageScene.Duo, "stand", {pc="directortau", npc="jaxontau"})
		saynn("[say=directortau]What about this one?[/say]")

		saynn("[say=jaxontau]This is one of our most ambitious projects. Codename is.. Toxic Virus.[/say]")

		saynn("[say=directortau]So, ToVi?[/say]")

		saynn("[say=jaxontau]She prefers the name Tavi, Sir.[/say]")

		saynn("Standing behind the window and talking, there are 2 humans that are staring at you and your sterile cell made mostly out of glass. Person on the left wears a guard uniform and has a pulse rifle on him. He holds a tablet with some notes. The guy on the right wears official clothes and seems quite old. They talk while you rest on your personal bed and read some documentation on your datapad.")

		saynn("[say=directortau]Tavi, huh. Tell me about her.[/say]")

		saynn("[say=jaxontau]She is a girl, turned 18 this year. She is into computers so we gave her this datapad, heavily restricted one of course.[/say]")

		saynn("You try not to stare at them. But it feels like they scan every inch of your body.")

		saynn("[say=directortau]A hacker. Could be a useful skill out there. But. Too situational. Why does she look like that?[/say]")

		saynn("[say=jaxontau]DNA experiments, Sir. She is the result of us trying to find genes that would provide an advantage to someone during a battle. Any weirdness in her looks are the side effects.[/say]")

		saynn("[say=directortau]So, what's the end result? How strong is she? High endurance?[/say]")

		saynn("[say=jaxontau]Average on pretty much every front, sadly. Endurance is on the weaker side I would say. She is tall though. She is one of the first prototypes, used for gene space exploration and splicing.[/say]")

		saynn("The guy on the right frowns and turns to the other one. You begin to feel uncomfortable, scrolling through articles faster on your datapad. But you're still just lying on your bed, not moving too much.")

		saynn("[say=directortau]We need soldiers. Soldiers and spies. That's what the corporation desperately needs right now. And she doesn't fit either category.[/say]")

		saynn("[say=jaxontau]What do you mean, Sir? She knows some fighting techniques already. And she is pretty smart. I think she would make for a great soldier for AlphaCorp.[/say]")

		saynn("[say=directortau]She is too weak to be a soldier. And too.. visible.. to be a spy. Was there at least something useful?[/say]")

		saynn("[say=jaxontau]Yeah, we found genes that control some of her feelings. She.. let me see. Her love, empathy and compassion are mostly blocked. These feelings won't cause dopamine secretion in her brain. We're giving her a special drug that amplifies these effects, that's Quinn's research.[/say]")

		saynn("The main guy holds his chin.")

		saynn("[say=directortau]At least she is merciless. The last thing we need is soldiers feeling bad for the enemy. How are her sex skills? Fertility?[/say]")

		saynn("The guard gets lost for a few seconds.")

		saynn("[say=jaxontau]Uh. We haven't taught her anything of that sort yet, Sir.[/say]")

		saynn("[say=directortau]Well, you should have. Weakest link of any system is people, not machines. If she wants to be useful, she needs to learn how to satisfy anyone with her holes, including the enemy. I will ask again, is she fertile?[/say]")

		saynn("The guy is pretty assertive in how he talks, you feel intimidated just listening to him. The guard goes through his notes.")

		saynn("[say=jaxontau]Chances of successful impregnation are pretty much zero, the reproductive cells suffered too much dna-related damage.[/say]")

		saynn("[say=directortau]Useless as a breeder too.[/say]")

		saynn("The mean guy looks at you. Your gazes collide. You instantly look away. The guy tilts his head ever so slightly.")

		saynn("[say=directortau]Can she hear us?[/say]")

		saynn("[say=jaxontau]No. That's the intercom there. The light on it isn't on, see. Her cell is completely sound-proof.[/say]")

		saynn("A second of silence. Two pairs of eyes drill you.")

		saynn("[say=directortau]Hm. Right. Show me the next one.[/say]")

		saynn("The guard shows the other guy the view. They quickly leave your view, leaving you alone with your thoughts.")

		addButton("Continue", "See what happens next", "elena_shows")
	if(state == "elena_shows"):
		removeCharacter("jaxontau")
		removeCharacter("directortau")
		addCharacter("elena")
		playAnimation(StageScene.Duo, "stand", {npc="elena"})
		saynn("You close the program that spoofs the space station's intercom network on your datapad and leave it near your pillow. You sit on your bed.")

		saynn("Your cell is the same as it always was, about 4 by 4 meters. The floors and the ceilings are made out of white tiles. Three of the four walls are giant glass panels with one of them having an air-tight door that leads to the main corridor.")

		saynn("Apart from your bed, your room really doesn't have much. There are a few buttons on the wall, a camera and an intercom near the door. You'd call the design quite minimalistic but functional.")

		saynn("You get up and stretch, letting out a cute noise in the process. Your clothes consist only of a white leotard. Suddenly a hologram appears in your cell, startling you.")

		saynn("[say=elena]Tavi.. Have you been eavesdropping again?[/say]")

		saynn("[say=pc]Uh. Maybe?[/say]")

		saynn("The hologram frowns and crosses her arms.")

		saynn("[say=elena]You know that you're not allowed to do that. If this happens again, I will be forced to make a note in the system. Promise me you won't.[/say]")

		saynn("[say=pc]Fi-i-ine, I will stop.[/say]")

		saynn("[say=elena]You know I worry about you, Tavi..[/say]")

		saynn("[say=pc]I know you do, Elena. You're literally programmed to do that.[/say]")

		saynn("The hologram holds her hands together, interlocking fingers.")

		saynn("[say=elena]Today is gonna be interesting.[/say]")

		saynn("[say=pc]Let me wake up first.[/say]")

		addButton("Continue", "See what happens next", "show_options")
		# ((Player gets to walk around 2x2 room)
		# ((Button to take a shower)
		# ((Button to look out of the room)
		# ((Button to talk to Elena)
		# ((Button to read some articles on the datapad)
		# ((After all of that is done, A button to take pills)
	if(state == "show_options"):
		playAnimation(StageScene.Duo, "stand", {npc="elena"})
		if (tookShower || lookOutOfWindow || readDatapad):
			saynn("You rub your eyes, unsure what to do next.")

		else:
			saynn("You rub your eyes, unsure what to do first.")

		if (!tookShower):
			addButton("Shower", "Take a shower", "take_shower")
		if (!lookOutOfWindow):
			addButton("Window", "Look out of the window", "look_window")
		if (!readDatapad):
			addButton("News", "Check the news on your datapad", "read_datapad")
		if (tookShower && lookOutOfWindow):
			addButton("Elena", "Talk with the hologram", "talk_elena")
	if(state == "take_shower"):
		aimCameraAndSetLocName("taviroom_shower")
		playAnimation(StageScene.SexStanding, "tease", {pc="elena", npc="pc",npcBodyState={naked=true}})
		saynn("You press a button that causes one of the metal plates to shift, exposing a little shower cabin. Feeling confident that no one is watching, except for the hologram, you undress and leave your leotard on the bed before jumping under the shower head and closing the door behind you.")

		saynn("The water is nice, not too warm but also not too cold. You grab the never-ending liquid soap bottle and pour it over your hair before sinking your digits between your strands and doing some back and forth motions, washing.")

		saynn("Humming to some tune that doesn't exist, you move on to washing your body and legs.")

		saynn("[say=elena]Sometimes I feel sad for not needing showers.[/say]")

		saynn("You sigh and peek out of the shower to grab the hologram by the hand before pulling her in, under the running water.")

		saynn("[say=elena]Eek. What are you doing, Tavi.[/say]")

		saynn("The water hits the glowing surface that is the hologram's skin and seemingly just bounces away from it. You giggle and give the hologram a sponge.")

		saynn("[say=pc]Rub my back, can't reach there.[/say]")

		saynn("You turn around for her and just continue washing yourself. Elena does as you tell her, brushing the sponge over your back. It feels good even if her touch is too.. firm. But that's just the limitation of her technology.")

		saynn("[say=elena]You know I don't like water. For obvious reasons.[/say]")

		saynn("[say=pc]You like helping more than you don't like water~.[/say]")

		saynn("The hologram smiles while helping you shower. You make sure you are clean before turning around and giving the hologram a small hug.")

		saynn("[say=elena]Your statement is not wrong.[/say]")

		saynn("You let the water wash off all the soap before you turn off the water. You grab a blanket and start drying yourself. It takes a while.")

		saynn("[say=elena]Let me help.[/say]")

		saynn("The hologram hugs you back and then starts to glow yellow. Her temperature rises, she is making the air around you warm. All the little droplets of water hidden inside your fur begin to evaporate.")

		saynn("By the end of it, you look very fluffy. You can't help but to purr.")

		saynn("[say=pc]Thanks.[/say]")

		saynn("You and Elena step out of the shower. You grab the leotard and put it on while Elena presses the button to close it.")

		addButton("Continue", "See what happens next", "show_options")
	if(state == "look_window"):
		aimCameraAndSetLocName("taviroom_window")
		saynn("You approach the other corner of your room and look out the window. From what you can tell, the guard and the other guy are standing near someone else's room now.")

		saynn("[say=pc]Who is that?[/say]")

		saynn("[say=elena]That is the director. He has arrived to check on you all.[/say]")

		saynn("[say=pc]Director? How come I've never seen him?[/say]")

		saynn("Apart from that, outside your room is just a corridor made out of dark walls. Quite more messy than your neat room. But less boring.")

		saynn("[say=elena]Because you turned 18 this year, Tavi. He will distribute you into the fitting camps where you will continue your training. Some of you might join the space fleet army very soon already and start heading out on missions.[/say]")

		saynn("You look at Elena.")

		saynn("[say=pc]What if I don't fit anywhere? I'm not really a good soldier. And I don't wanna seduce people. To get information out of them.[/say]")

		saynn("Elena offers you a kind robotic smile.")

		saynn("[say=elena]I'm sure we will find a fitting role for you, Tavi. The one where you will be happy and very useful to our corporation.[/say]")

		saynn("Right. You nod softly.")

		addButton("Continue", "See what happens next", "show_options")
	if(state == "read_datapad"):
		aimCameraAndSetLocName("taviroom_bed")
		saynn("You grab your datapad and connect to the intranet. It's quite limited in terms of available sources but better than nothing.")

		saynn("One of the articles claims that AlphaCorp has freed another solar system. Almost 20 Syndicate ships destroyed, 0 casualties. The commander says that this victory is only possible because of the sheer heroism of AlphaCorp soldiers. Below it is a form where you can sign up into the space fleet army.")

		saynn("Another article describes a completely new invention that AlphaTech Industries have presented at one of the expos. It's called Bluespace, a separate dimension that will allow us to transmit data across the whole galaxy in an instant. The main scientist says that this is a breakthrough that will change the world as we know it. And that it couldn't be done without resources that AlphaCorp has. Apparently the prototype transmitters are already being installed on some of the ships and space stations.")

		saynn("The last article is clearly an ad for some pharmacy company. It showcases some of the drugs that they are selling. The one named TiTs promises to give your body some huge udders, breasts that any girl will be jealous of. And the drug named CoC will leave you with a huge ass cock and balls each bigger than your head. Below are some of the pictures of before and after. And wow, the results seem to be great.")

		saynn("You turn off the datapad before Elena catches you looking at tits and cocks.")

		addButton("Continue", "See what happens next", "show_options")
	if(state == "talk_elena"):
		aimCameraAndSetLocName("taviroom_exit")
		removeCharacter("elena")
		addCharacter("directortau")
		addCharacter("jaxontau")
		playAnimation(StageScene.Duo, "stand", {npc="jaxontau"})
		saynn("[say=pc]Anything planned for today?[/say]")

		saynn("[say=elena]You should start by taking your pills.[/say]")

		saynn("The hologram produces a pill bottle and offers it to you. You grab it and fidget under Elena's strict watch.")

		saynn("[say=pc]Right, pills..[/say]")

		saynn("You grab one and hold it near your mouth, hesitating.")

		saynn("[say=elena]It's important for you to take them every day, remember? To keep your health in check.[/say]")

		saynn("You can't do anything else but to nod and put the capsule onto your tongue. Suddenly the hologram turns away from you towards the door.")

		saynn("[say=elena]The director is coming back. Look official.[/say]")

		saynn("You spit the pill out while Elena isn't looking. Then you straighten your posture and stand in the middle of the room. Your paws quickly fix your hair to one side. Elena vanishes as soon as the airlock opens, revealing the guard and the director just behind him.")

		saynn("[say=jaxontau]Hey, Tavi. The director here wants to look at your fighting skills.[/say]")

		saynn("[say=pc]Uh, sure.[/say]")

		saynn("[say=jaxontau]I wanna arrange a little sparring match between you and Risha.[/say]")

		saynn("You offer him a kind smile.")

		saynn("[say=pc]Well, lead the way then, Jaxon.[/say]")

		saynn("You walk out of your room. While stepping past the director you can't help but to notice him eyeing you out. Makes you clench inside.")

		addButton("Continue", "See what happens next", "follow_jaxon")
	if(state == "follow_jaxon"):
		addCharacter("latexParasite")
		aimCameraAndSetLocName("taviflashback_nearalien")
		saynn("You don't get to leave your room very often so any opportunity like this is nice. Real world training beats VR any day of the week.")

		saynn("You follow Jaxon but your focus is mostly on the director. You're not staring at him but just give him careful glances. The guy is old, his beard is about to start turning gray any year now you feel. His clothing lacks anything that can help you identify him. But your trained eye quickly spots a gun on him, under his belt.")

		saynn("As you walk past someone else's room you get startled by a sudden attack! A liquid-like black goo pounces at the glass of its chamber, creating a loud noise. Luckily, the glass is thick enough to withstand such attacks, the alien creature is kept securely behind the reinforced window. You put a paw on your chest and start to pant.")

		saynn("[say=pc]What the heck is that?[/say]")

		saynn("[say=jaxontau]Oh, right. That's one of the latest experiments. It's a lab-created parasite. Seems to be almost completely self sufficient by itself, doesn't even require air. It might be useful on the battlefield, the scientists are looking into its unique properties.[/say]")

		saynn("The alien parasite continues to bash the window.")

		saynn("[say=pc]It doesn't seem to like that.[/say]")

		saynn("Seems strange that such a parasite is kept in the same-looking room as yours. Even has a bed and a shower. Surely it doesn't need them. The director observes the eye-less alien creature and follows Jaxon. Same as you.")

		saynn("[say=jaxontau]Who cares, it's just a blob. I doubt it has a mind at all, the thing can't even make noises.[/say]")

		addButton("Continue", "See what happens next", "enter_risharoom")
	if(state == "enter_risharoom"):
		removeCharacter("latexParasite")
		addCharacter("rishatau")
		playAnimation(StageScene.Duo, "stand", {npc="rishatau"})
		aimCameraAndSetLocName("tau_risharoom")
		saynn("This room could have fooled you. Because it looks exactly like yours. Apart from the bed being left undone. Near it is Risha doing crunches, being all sweaty and stuff. She hears the door to her room opening and quickly gets up.")

		saynn("[say=rishatau]Oh. Hi Tavi, hi Jaxon. Hello, old guy.[/say]")

		saynn("You offer her a friendly wave. The director frowns slightly but quickly lets go of his feelings, just leaning against the cold glass window and watching you all.")

		saynn("[say=jaxontau]That's the director, Risha. He wants to see how you two fight.[/say]")

		saynn("Risha chuckles as she flexes her arms. She is wearing the same skin-tight leotard as you, it emphasizes her well-defined muscle structure. Her crotch also spots an obvious bulge but that's beside the point.")

		saynn("[say=rishatau]My bad, director. You're not that old. Sure, I like a good brawl, keeps the blood flowin'.[/say]")

		saynn("[say=jaxontau]Not so fast, Risha.[/say]")

		saynn("Jaxon produces 2 weapons, they look like energy pistols. He tosses one of them to you and one to Risha.")

		saynn("[say=jaxontau]These have their power dialed down a lot but they still gonna hurt.[/say]")

		saynn("[say=rishatau]Guns, huh. I prefer a more hands-on approach. Makes it more intimate.[/say]")

		saynn("[say=pc]We're not in a bedroom, Risha.[/say]")

		saynn("The lynx giggles as she takes her spot near one of the walls. You take the spot opposite of hers.")

		saynn("[say=rishatau]Any room can be a bedroom if you're brave enough.[/say]")

		saynn("You roll your eyes while Risha winks at you.")

		saynn("[say=jaxontau]Alright, we fight until one of you surrenders. Give us a good show.[/say]")

		addButton("Fight", "See what happens next", "start_risha_fight")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_flashback"):
		GM.main.overridePC()
		GM.pc.setName("Tavi")
		GM.pc.setGender(Gender.Female)
		GM.pc.setSpecies([Species.Feline])
		GM.pc.resetBodypartsToDefault()
		GM.pc.giveBodypart(GlobalRegistry.createBodypart("tavihair"))
		var breasts = GlobalRegistry.createBodypart("humanbreasts")
		breasts.size = 3
		GM.pc.giveBodypart(breasts)
		GM.pc.pickedThickness = 50
		GM.pc.pickedFemininity = 90
		GM.pc.getInventory().equipItem(GlobalRegistry.createItem("Leotard"))
		GM.pc.updateNonBattleEffects()
		getCharacter("tavi").copySkinTo(GM.pc)
		#playAnimationForceReset(StageScene.Solo, "stand")

	if(_action == "take_shower"):
		tookShower = true

	if(_action == "look_window"):
		lookOutOfWindow = true

	if(_action == "read_datapad"):
		readDatapad = true

	if(_action == "start_risha_fight"):
		runScene("Ch4s3RishaFightScene")
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["tookShower"] = tookShower
	data["lookOutOfWindow"] = lookOutOfWindow
	data["readDatapad"] = readDatapad

	return data

func loadData(data):
	.loadData(data)

	tookShower = SAVE.loadVar(data, "tookShower", false)
	lookOutOfWindow = SAVE.loadVar(data, "lookOutOfWindow", false)
	readDatapad = SAVE.loadVar(data, "readDatapad", false)

func getDevCommentary():
	return "Tavi's flashback.. Yeahhhh its a very long scene x3. I had an idea for her backstory for a long time, it's been brewing in my head. But a lot of it came to me only while writing it, strangely enough.\n\nYes, games do have flashbacks in them sometimes. But have you seen a flashback in a porn game? You probably did, shit.. Okay, have you seen a flashback in a text-based porn game before? x3 You probably didn't! So I hope people are surprised a little to see that they suddenly play as someone else. It really gives a lot of freedom about how your character talks and reacts. Usually I have to write it very generic-ly because the player could be a mean-ass dom or a subby sub, I don't know..\n\nAnything interesting about it? I dunno.. I tried to foreshadow literally everything. Sometimes very obviously, sometimes extremely subtly. I just hope you enjoyed reading that. It's like a little movie script, with explosions, betrayals, villains, heroes, unbelievable escapes.\n\nThe latex thingie idea? I wanted to do that for a long time x3"

func hasDevCommentary():
	return true
