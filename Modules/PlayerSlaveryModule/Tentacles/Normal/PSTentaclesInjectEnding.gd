extends SceneBase

var biggestStat = -1
var flagInjectForced = false

func _init():
	sceneID = "PSTentaclesInjectEnding"

func _reactInit():
	addCharacter(GM.main.PS.getTentaclesCharID())

func resolveCustomCharacterName(_charID):
	if(_charID == "ten"):
		return GM.main.PS.getTentaclesCharID()
	if(_charID == "sci1"):
		return GM.main.PS.getScientist1CharID()
	if(_charID == "sci2"):
		return GM.main.PS.getScientist2CharID()

func _run():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(state == ""):
		aimCameraAndSetLocName(_tentacles.getMonsterLoc())
		biggestStat = _tentacles.getBiggestStat()
		flagInjectForced = _tentacles.flagInjectForced
		if (!flagInjectForced):
			saynn("Might as well be done with it now. Becoming a mindless plant is what that thing deserves anyway.")

		else:
			saynn("With no better choice.. you have to do this. Becoming a mindless plant might not be the best fate.. but what can you do.")

		saynn("You grip the injector tightly.. and start to slowly approach the tentacles.")

		if (biggestStat == _tentacles.STAT_ANGER):
			_tentacles.doAnim("glare")
			saynn("A low hum begins to vibrate through the cell. As the monster notices you, all of its tendrils go rigid in an instant. It can probably tell that something strange is happening.")

			saynn("[say=pc]Easy. Just let me do this.[/say]")

			saynn("You keep the injector behind your back.. until it becomes the time to reveal it!")

			saynn("As soon as you do, a thick tentacle lashes out! It was aiming for your hand.. but you jerk back at the last second, just about avoiding it.")

			saynn("[say=pc]No you don't![/say]")

			saynn("You dive to the side as another tendril slams down where you were standing, sending a wave of broken floor tiles in all directions. Looks like they're not gonna make it easy for you.")

			saynn("You quickly get up to your feet and kick the table into a make-shift barrier. A tentacle whips around it, catching one of the legs and hurling it against one of the reinforced windows. Shards of glass start raining down everywhere.")

			saynn("You use the distraction to lunge, aiming the injector towards the main mass of the tentacles.")

			saynn("But you don't make it. One of the tendrils wraps around your ankles and yanks you down. You hit the ground hard, the air getting pushed out of your lungs fast, the injector flying out of your hand and rolling who knows where.")

			saynn("[say=pc]Fuck. Ugh..[/say]")

			saynn("More and more tentacles start to wrap around your ankles and wrists, trying to find the missing item. Failing to do so, they just squeeze. Your bones creak. You do your best to kick and punch the tentacles away while looking for the injector.")

			addButton("Continue", "See what happens next", "choke")
		elif (biggestStat == _tentacles.STAT_AGILITY):
			_tentacles.doAnim("glare")
			saynn("As the monster notices you, it clearly starts to get a little.. suspicious. A fight with that thing is the last thing that you want.")

			saynn("[say=pc]Easy. Just let me do this.[/say]")

			saynn("You take slow, deliberate steps forward. The tentacles shift, a wave of unease flowing through them. Their tips point toward you, questioning your stance.")

			saynn("[say=pc]It will be better..[/say]")

			saynn("You move closer, within reach. one of the tendrils.. the main one.. reaches out. It brushes against your arm.")

			saynn("You press the injector against its strong surface.. and press it in. There is a sharp hiss and a mechanical clunk as the needle plunges in, delivering the drug directly inside.")

			addButton("Continue", "See what happens next", "breakeverything")
		elif (biggestStat == _tentacles.STAT_MIND):
			playAnimation(StageScene.TentaclesStroke, "tease", {plant=true})
			saynn("As {psTentacles} notices you, it.. doesn't react much really.")

			saynn("They just raise and offer you one of their thick tentacles. You cup it with one hand.. while your second one is gripping the injector.")

			addButton("Inject", "Inject the tentacles with the drug", "mindinject")
		else:
			playAnimation(StageScene.TentaclesGrope, "grope", {plant=true})
			saynn("As the tentacles notice you, they react by pulling you closer, the many tendrils hugging you and proceeding to gently grope your body.")

			saynn("[say=pc]I'm sorry, {psTentacles}.. I kinda have to do this..[/say]")

			addButton("Inject", "Inject the tentacles with the drug", "lustinject")
	if(state == "choke"):
		aimCameraAndSetLocName(_tentacles.LOC_DOOR)
		
		playAnimation(StageScene.TentaclesChoke, "chokefast", {plant=true})
		saynn("Eventually, the tentacles get a good grip on you and pull you into the air. They slam you against one of the walls, making some of your ribs crack. A wave of pain rushing through your whole body.")

		saynn("[say=pc]Agh![/say]")

		saynn("After pinning you, one of the tendrils precisely loops around your throat.. and begins to choke you. You try to dig your claws into it, leaving some wet tears.")

		saynn("The world starts to get all gray at the edges.")

		saynn("It feels like.. this is it. This is how it ends.")

		saynn("Miraculously, in the corner of your fading vision, you notice a faint yellow glow.. the injector! It's on the floor.. and you're not.. Your legs are dangling, trying to reach and push it closer to the edge.")

		saynn("The strength is leaving you fast. Your cone of vision is nothing but a small circle. As your body starts to go limp, the tentacles let you sink lower.")

		saynn("The next moments feel like a blur..")

		saynn("Your {pc.foot} finds something.. pushes it into the wall.. and flings it up.")

		saynn("Your hand catches the item.. and jabs it.")

		addButton("Continue", "See what happens next", "choke_after")
	if(state == "choke_after"):
		_tentacles.doAnim("sleep", {npcAction="defeat"})
		removeCharacter(_tentacles.getTentaclesCharID())
		saynn("You drop to the floor.. gasping and holding onto your bruised throat.")

		saynn("The tentacles writhe, doing a series of chaotic, pained spasms. And then.. they just slump to the floor.")

		saynn("They twitch once.. twice.. and then lie perfectly still.")

		saynn("The cell is silent now.")

		saynn("It's pretty much destroyed too. Broken furniture.. huge cracks in the walls and the floor.. shards of glass everywhere.")

		saynn("[say=sci1]Really? For fuck's sake.[/say]")

		addButton("Continue", "See what happens next", "choke_talk")
	if(state == "choke_talk"):
		aimCameraAndSetLocName(_tentacles.LOC_IMPORTANT)
		addCharacter(GM.main.PS.getScientist1CharID())
		addCharacter(GM.main.PS.getScientist2CharID())
		playAnimation(StageScene.Duo, "kneel", {pc="pc", npc=GM.main.PS.getScientist1CharID()})
		if (!flagInjectForced):
			saynn("You look through the window.. and see the scientists. They have cut their extra coffee break short.. probably because of all the noise.")

		else:
			saynn("You look through the window.. and see the scientists. They're peeking their heads out from the side of the corridor window.")

		saynn("[say=sci1]Do you know how much this is gonna cost to repair? The materials, they don't grow on trees. Couldn't you apply some finesse, you filthy animal?[/say]")

		saynn("[say=pc]Fuck you.[/say]")

		saynn("The guy just shakes his head a little and then nods to his colleague.")

		saynn("The female scientist chooses something on her datapad.. which causes the air vents of your cell to open.. and some kind of gas to start pouring in. Your heart starts beating faster.")

		saynn("[say=sci2]This is a sleep toxin. Please don't resist.[/say]")

		saynn("The gas is heavier than air.. so it creates a rising layer of colorful fog on the floor. The best you could do is probably climb the fridge.. but that would only delay the inevitable.")

		saynn("[say=sci1]I'd like to say that it was a pleasure to be working with you.. except.. it wasn't.[/say]")

		saynn("[say=pc]Yeah, next time you will be in my place.[/say]")

		saynn("[say=sci1]Me? I'm not so primitive. Enjoy your home jail or whatever zoo you came from.[/say]")

		saynn("You become lightheaded.. it's hard to focus on the guy.. It's hard to focus on anything really. Is the female scientist really waving goodbye to you?")

		saynn("The cracked floor increases its gravity ten-folds.. and offers its cold embrace.")

		saynn("Boom.")

		addButton("Continue", "See what happens next", "near_detective")
	if(state == "breakeverything"):
		_tentacles.doAnim("whip", {npcAction="dodge"})
		saynn("For a second.. nothing.")

		saynn("Then, a violent shudder runs through the entire mass. The tendril against your arm jerks away as if burned.")

		saynn("The tentacles don't lash out at you.. They instead whip sideways, smashing into the fridge with a deafening crash of metal. The thing topples, its contents spilling. Another tendril darts out to smash the floor, sending broken chunks of tiles everywhere.. before breaking a metal table in the other corner of the cell.")

		saynn("You recoil and duck as a shower of debris rains down. The bed gets crushed to pieces next, its frame snapped in half and thrown against the reinforced window, adding bits of broken glass everywhere.")

		saynn("The tentacles keep blindly destroying everything around them.. They smash the shower, ripping it out of the wall, creating a fountain of water that sprays everywhere.")

		saynn("They're not losing strength.. but they're certainly losing something. Completely desperate, they are just smashing walls and windows by this point.. leaving huge dents everywhere.. adding extra cracks to the glass.")

		addButton("Continue", "See what happens next", "afterbreak")
	if(state == "afterbreak"):
		_tentacles.doAnim("sleep")
		removeCharacter(_tentacles.getTentaclesCharID())
		saynn("Eventually, their thrashing slows. The tentacles stop being furious, their movements becoming sluggish.. then random.. then.. still.")

		saynn("The water continues to pour from the broken wall. The cell.. is a warzone of shattered furniture and dented materials.")

		saynn("The injector drops from your numb fingers, clattering on the wet floor. It is done.")

		saynn("[say=sci1]Really? For fuck's sake.[/say]")

		addButton("Continue", "See what happens next", "choke_talk")
	if(state == "lustinject"):
		_tentacles.doAnim("sleep")
		removeCharacter(_tentacles.getTentaclesCharID())
		saynn("You bring the injector close to one of the tentacles and watch it wrap around your wrist. They all trust you.. they all like you.")

		saynn("It pains you to do this.. but you stick one of the tentacles with the injector.")

		saynn("For a second, nothing happens.")

		saynn("But then.. the tentacle that you have injected goes limp. It's still.. alive.. in a way. But without any kind of consciousness attached to it.. it's nothing more than just dead weight really. You uncurl it from your wrist and lower it gently to the floor.")

		saynn("One by one, other tendrils lose their tension. As the drug reaches their systems.. they begin to slump, giving your body one last caress.. before draping across the floor and over each other.")

		saynn("They're gone now. Nothing more than a plant. A large, exotic.. but still a plant. They lie still, no longer watching you.. no longer touching you.")

		saynn("You drop the empty injector. It clatters on the floor, making the only sound.")

		saynn("[say=sci1]Oh, I see that you did it. Good job.[/say]")

		addButton("Continue", "See what happens next", "mindtalk")
	if(state == "mindinject"):
		_tentacles.doAnim("sleep")
		removeCharacter(_tentacles.getTentaclesCharID())
		saynn("You bring the injector close to the surface of the tentacle. It doesn't flinch. It doesn't pull away. It rests in your hand, trusting your decision.")

		saynn("A few seconds later.. you inject it.")

		saynn("For a moment, nothing happens.")

		saynn("Then.. a soft sigh echoes in your mind. The subtle ever-present connection that you had.. quickly begins to fade.")

		saynn("The tentacle in your hand goes limp first. It's still.. alive.. in a way. But without any kind of consciousness attached to it.. it's nothing more than just dead weight really. You lower it gently to the floor.")

		saynn("One by one, other tendrils lose their tension. They straighten from their intelligent, watchful poses.. and begin to slump, draping across the floor and over each other.")

		saynn("The psychic bond that you had stretches thin.. becoming a whisper of farewell.. and then a ghost of that feeling.")

		saynn("Then.. it's gone.")

		saynn("The connection severs. The silence in your head is deafening.")

		saynn("The tentacles are now just.. a plant. A large, exotic.. but still a plant. They lie still, no longer watching the stars, no longer watching you.")

		saynn("You drop the empty injector. It clatters on the floor, making the only sound.")

		saynn("[say=sci1]Oh, I see that you did it. Good job.[/say]")

		addButton("Continue", "See what happens next", "mindtalk")
	if(state == "mindtalk"):
		aimCameraAndSetLocName(_tentacles.LOC_IMPORTANT)
		addCharacter(GM.main.PS.getScientist1CharID())
		addCharacter(GM.main.PS.getScientist2CharID())
		playAnimation(StageScene.Duo, "kneel", {pc="pc", npc=GM.main.PS.getScientist1CharID()})
		if (!flagInjectForced):
			saynn("You look through the window.. and see the scientists. They have cut their extra coffee break short.. probably because they saw everything through the security camera.")

		else:
			saynn("You look through the window.. and see the scientists. They've been watching all of this.")

		saynn("[say=sci1]I can appreciate the efficiency of a cold mind.[/say]")

		saynn("[say=pc]Screw you.[/say]")

		saynn("The guy just shakes his head a little and then nods to his colleague.")

		saynn("The female scientist chooses something on her datapad.. which causes the air vents of your cell to open.. and some kind of gas to start pouring in. Your heart starts beating faster.")

		saynn("[say=sci2]This is a sleep toxin. Please don't resist.[/say]")

		saynn("The gas is heavier than air.. so it creates a rising layer of colorful fog on the floor. The best you could do is probably climb the fridge.. but that would only delay the inevitable.")

		saynn("[say=sci1]You know that this alien thing would never be able to have a normal life. We've accepted that some things only exist to serve us.[/say]")

		saynn("[say=pc]Yeah, maybe next time you will be in my place.[/say]")

		saynn("[say=sci1]Me? I'm not so primitive. Enjoy your home jail or whatever zoo you came from.[/say]")

		saynn("You become lightheaded.. it's hard to focus on the guy.. It's hard to focus on anything really. Is the female scientist really waving goodbye to you?")

		saynn("The floor increases its gravity ten-folds.. and offers its cold embrace.")

		saynn("Boom.")

		addButton("Continue", "See what happens next", "near_detective")
	if(state == "near_detective"):
		removeCharacter(GM.main.PS.getScientist1CharID())
		removeCharacter(GM.main.PS.getScientist2CharID())
		removeCharacter(_tentacles.getTentaclesCharID())
		addCharacter("intro_detective")
		playAnimation(StageScene.Solo, "sit")
		aimCameraAndSetLocName("intro_interogation")
		saynn("You wake up.. what feels like seconds later.. cuffed to a chair.")

		saynn("It's not the first time you've been in this place.")

		saynn("[say=intro_detective]Name is Jake, IIPF, threat assessment division.[/say]")

		saynn("[say=pc]Yeah, I remember you.[/say]")

		saynn("He raises a brow at you.")

		saynn("[say=pc]I've been naughty, I know.[/say]")

		saynn("He puts his glasses on and reads something off of an old-school wooden tablet.")

		saynn("[say=intro_detective]Let's see. You have a single case of felony escape. Hm. But it's a big one. Help me understand, how and why did it happen? You can start with the how.[/say]")

		saynn("Jake looks over his glasses at you, awaiting.")

		saynn("[say=pc]Do you wanna hear my story? How I got used as a test subject in a.. most likely.. illegal bio-lab? I've had to raise a tentacle monster for them. I don't know the exact location.. but you wired the bounty somewhere, right? You probably know where?[/say]")

		saynn("[say=intro_detective]My job is not to listen to fan fiction. It's to assess the level of risk. How likely is it that you're gonna try to pull this stunt again. So help me help you, will you?[/say]")

		saynn("You're not really sure what to say anymore. You can try to explain that you were held in a cell.. but he will probably not care. Might as well try to play his game then.")

		saynn("[say=pc]This won't happen again, I can assure you.[/say]")

		saynn("Jake tilts his head ever slightly.. while you put your most innocent eyes.")

		saynn("[say=intro_detective]I see.[/say]")

		addButton("Continue", "See what happens next", "fastforward")
	if(state == "fastforward"):
		removeCharacter("intro_detective")
		GM.pc.setLocation(GM.pc.getCellLocation())
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("Next moment you know it.. you're being flown back to your concrete home.. first class, as usual.")

		saynn("The BDCC guards meet you and walk you to your cell.. where Risha is already waiting for you.")

		saynn("[say=risha]Here is your stupid crap.[/say]")

		saynn("[say=pc]What a warm welcome.[/say]")

		saynn("[say=risha]You know what's warm? My cock. Wanna welcome it?[/say]")

		saynn("Looks like you weren't gone long enough for her to start missing you.")

		saynn("[say=pc]I'm good.[/say]")

		saynn("[say=risha]No. You're a slut. C'mon, I ain't got all day.[/say]")

		saynn("You fetch your stupid crap off of her hands.. and watch her leave.")

		saynn("It's so.. comfy.. here. Much better than that sterile cell.")

		addButton("Continue", "You had your fun", "doEndSlavery")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "near_detective"):
		processTime(6*60*60+13*60)

	if(_action == "fastforward"):
		processTime(60*42)

	if(_action == "doEndSlavery"):
		endScene()
		GM.main.endCurrentScene()
		GM.main.stopPlayerSlavery()
		GM.pc.setLocation(GM.pc.getCellLocation())
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["biggestStat"] = biggestStat
	data["flagInjectForced"] = flagInjectForced

	return data

func loadData(data):
	.loadData(data)

	biggestStat = SAVE.loadVar(data, "biggestStat", -1)
	flagInjectForced = SAVE.loadVar(data, "flagInjectForced", false)
