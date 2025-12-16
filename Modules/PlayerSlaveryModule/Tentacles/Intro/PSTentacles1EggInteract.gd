extends SceneBase

var statAnger:int = 0
var statAgility:int = 0
var statMind:int = 0
var statLust:int = 0

func _init():
	sceneID = "PSTentacles1EggInteract"

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
		playAnimation(StageScene.Sleeping, "sleep", {pc="pc"})
		saynn("It's not easy to do so while the weird egg is in the same room as you.. but you try to get some rest. It helps that the bed is actually quite comfy.")

		saynn("Some time passes.. You almost doze off.. but then the intercom kicks in..")

		addButton("Continue", "See what happens next", "scientists_order")
	if(state == "scientists_order"):
		addCharacter(GM.main.PS.getScientist1CharID())
		addCharacter(GM.main.PS.getScientist2CharID())
		playAnimation(StageScene.GivingBirth, "idle", {pc="pc"})
		saynn("[say=sci1]Alright, we're back. You're still alive? That's better than what I expected.[/say]")

		saynn("You look around. The voice comes from one of the cameras that is now staring at you.")

		saynn("[say=sci2]Yes, it seems the egg didn't hatch yet. But I think we're ready to do the first tests.[/say]")

		saynn("[say=pc]Tests?[/say]")

		saynn("You sit on the edge of your bed.. awaiting your faith.")

		saynn("[say=sci1]You're a test subject, you do tests, don't be stupid. Now get up and approach the specimen. I really don't like my time being wasted.[/say]")

		saynn("[say=pc]What if I don't wanna do that?[/say]")

		saynn("[say=sci1]We're just gonna space you and get another test subject in here.[/say]")

		saynn("Looks like there is not much of a choice..")

		saynn("[say=sci1]Start the countdown.[/say]")

		saynn("[say=sci2]Three.. Two..[/say]")

		saynn("[say=pc]Alright, alright..[/say]")

		addButton("Egg", "Go approach the egg", "goApproach")
	if(state == "goApproach"):
		# (( Anim with egg
		aimCameraAndSetLocName("pstent_middle")
		GM.pc.setLocation("pstent_middle")
		saynn("Slowly, you get off the bed and start stepping towards the mysterious egg.. Who knows what is inside it.. so you move your legs as quietly as the cold concrete floor allows..")

		saynn("Eventually, you reach it.. Saying anything out loud near it might trigger it somehow.. so you just quietly stare at the camera.")

		saynn("[say=sci2]Describe what you see.[/say]")

		saynn("You squint and furrow your brows.")

		saynn("[say=sci1]Either do what we say or start learning how to breathe void.[/say]")

		saynn("You sigh.")

		saynn("[say=pc]It's an egg. A huge one.[/say]")

		saynn("[say=sci2]We see that. Any small details?[/say]")

		saynn("You start describing what you see.. the egg's surface is quite shiny and slimy.. but also bumpy in some spots. There might be some kind of closed opening at the top.. but you're not brave or stupid enough to stare into it.")

		saynn("The egg is resting in some kind of.. nest. A nest that you could only describe as organic.")

		saynn("The whole thing kinda reminds you of a huge fruit.. like a mango or something.. but way more grotesque..")

		saynn("[say=sci2]Mhm.. mhm.. any movement?[/say]")

		saynn("You stare at it for some time. It feels like you saw some twitching.. but you're not sure.")

		saynn("[say=pc]I don't know.[/say]")

		saynn("[say=sci2]Alright, your next task is to do something with it. Touch it, feel it, anything that can help us.[/say]")

		saynn("That's one hell of a task.")

		saynn("[say=pc]What if there is some.. alive.. thing in there?[/say]")

		saynn("[say=sci1]We're counting on that.[/say]")

		saynn("Yeah.. no shit.")

		saynn("[say=pc]It might kill me.[/say]")

		saynn("[say=sci1]So?[/say]")

		saynn("You sigh.")

		saynn("[say=pc]And then it might kill you. All of you.[/say]")

		saynn("[say=sci2]Actually, the chance of it getting to us is statistically insignificant. We're isolated in a safe environment, behind multiple layers of reinforced materials. Even the air to your cell is circulated through a completely disconnected vent system.[/say]")

		saynn("It's easy to do evil things if you have an evil fortress.")

		saynn("[say=sci1]Go poke it already. We did some calculations, the egg is safe.[/say]")

		saynn("Right.. Sure.")

		addButton("Continue", "See what happens next", "first_choice")
	if(state == "first_choice"):
		saynn("What do you wanna do with the egg?")

		addButton("Touch it", "Just touch the egg.. see how it feels", "1_touch")
		addButton("Listen to it", "Put your ear against it.. try to listen to it", "1_listen")
		addButton("Kick it", "Show that egg who is boss by kicking it", "1_kick")
		addButton("Rub it", "Caress the egg's contours", "1_rub")
	if(state == "1_touch"):
		# (( Touch egg anim?
		saynn("You gather all your strength and poke the egg with your finger!")

		saynn("Something inside it reacts to the stimuli.. the whole egg slightly twitches and throbs from your touch. There is certainly something alive in there.. creepy..")

		saynn("[say=sci2]Describe the texture.[/say]")

		saynn("[say=pc]Cold.. slimy.. It reacted, did you see that?[/say]")

		saynn("[say=sci2]Cold? We will have to fix that next.[/say]")

		saynn("You touch it again.. and see a similar reaction. The egg is pulsing ever so slightly. But otherwise.. It seems peaceful enough.")

		saynn("[say=pc]Why didn't you just scan it?[/say]")

		saynn("[say=sci1]Some species are known to react to magnetic fields.[/say]")

		saynn("[say=pc]Some? So you know what's inside? What is it?[/say]")

		saynn("[say=sci1]Don't you like surprises? You will find out soon yourself.[/say]")

		saynn("It seems so.")

		addButton("Continue", "See what happens next", "needWarm")
	if(state == "1_listen"):
		# (( Listen to egg anim?
		saynn("You gather all your strength.. and bring your ear close to the egg's surface.. listening to it.")

		saynn("You hear.. a very subtle hum.. an extremely quiet murmur. It feels quite peaceful..")

		saynn("[say=pc]..you hear me?..[/say]")

		saynn("The egg reacts.. the hum becomes more pronounced.. the tension inside raises.. and then dies down again.")

		saynn("[say=pc]..do you understand me?..[/say]")

		saynn("A similar reaction follows.. Whatever it is, it certainly is capable of hearing.. but that's about it.")

		saynn("[say=sci1]So?[/say]")

		saynn("[say=pc]It can hear me I think.[/say]")

		saynn("[say=sci2]Actually, it might just be reacting to the vibrations that get transported by the air molecules.[/say]")

		saynn("[say=pc]Isn't that what I said?[/say]")

		saynn("[say=sci2]Your statement is quite shallow in comparison.. and thus.. incorrect.[/say]")

		addButton("Continue", "See what happens next", "needWarm")
	if(state == "1_kick"):
		# ((Egg kick anim?
		saynn("If you destroy the egg, the thing that's inside won't get a chance to hatch and kill you!")

		saynn("So.. feeling brave and angry.. you kick the egg!")

		saynn("But as soon as your leg connects with it.. your {pc.foot} just bounces off. You try again but your impact delivers no damage still.. the rubbery surface of the egg absorbs it.")

		saynn("[say=pc]What the fuck.[/say]")

		saynn("The egg is certainly not happy about it either. You can see it throbbing and pulsing slightly after what you did to it.")

		saynn("[say=sci1]If you destroy the specimen, we will destroy you, test subject.[/say]")

		saynn("You growl and clench your fists..")

		saynn("[say=sci2]As long as we can extract value, the specimen must remain intact, yes. Please refrain from trying to damage it.[/say]")

		saynn("Whatever.")

		addButton("Continue", "See what happens next", "needWarm")
	if(state == "1_rub"):
		# (( Rub egg anim?
		saynn("You suddenly feel.. kind..")

		saynn("And so you get closer to the egg and put your hand on it. The surface is very cold.. the poor thing must be shivering in there.")

		saynn("Slowly and carefully, you begin caressing the egg, sliding your hand over the bumpy, round exterior walls.")

		saynn("As you share a bit of your kindness.. the egg becomes a tiny bit more alive. It's pulsing ever so slightly under your touch..")

		saynn("[say=sci1]What are you doing?[/say]")

		saynn("[say=pc]It just needs some warmth..[/say]")

		saynn("[say=sci1]That's not how you do it. You don't just rub the alien egg.[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("You don't hear any response for a few seconds.. so you just continue caressing the egg, smiling while doing so.")

		saynn("[say=sci2]Erm.. The effectiveness of such a strategy is unproven.[/say]")

		saynn("[say=pc]Sure. But it was fun.[/say]")

		addButton("Continue", "See what happens next", "needWarm")
	if(state == "needWarm"):
		# (( egg anim?
		saynn("[say=sci2]Alright. We have received some data. According to our calculations, the specimen requires a higher internal temperature.[/say]")

		saynn("[say=pc]For what?[/say]")

		saynn("[say=sci1]Don't ask questions, test subject. Find a way to warm the egg up.[/say]")

		saynn("You look around.. there is a big lamp in the corner of the cell.. that could work.")

		saynn("The shower also has access to warm water.. but for that you'd need to move the egg.. you'd have to touch it.")

		addButton("Fridge", "Shove the egg into the fridge to teach it a lesson!", "2_fridge")
		addButton("Lamp", "Use a lamp to warm the egg up", "2_lamp")
		addButton("Shower", "Use warm water to warm the egg up", "2_shower")
		addButton("Use your body", "Bring the egg into the bed and cuddle it with your whole body!", "2_cuddle")
	if(state == "2_fridge"):
		playAnimation(StageScene.Solo, "shove")
		saynn("Warmth? You will show it warmth!")

		saynn("You grab the egg and quickly shove it into the fridge before closing it shut!")

		saynn("[say=sci1]What are you doing?[/say]")

		saynn("[say=pc]Are you blind?[/say]")

		saynn("The fridge begins shaking! The egg is certainly not happy about this.")

		saynn("[say=sci2]A prolonged exposure to low temperatures might lead to a variety of outcomes..[/say]")

		saynn("[say=pc]Is death one of them?[/say]")

		saynn("[say=sci2]Hm.. That is certainly one of the possibilities.[/say]")

		saynn("[say=sci1]You heard it. Get the egg out.[/say]")

		saynn("You shake your head and just watch the egg thrashing inside the fridge.")

		saynn("[say=sci2]I guess it might be interesting to see what happens in this case.[/say]")

		saynn("[say=sci1]Worst case, you're gonna be sleeping in the same fridge.[/say]")

		saynn("You show a middle finger to the camera.")

		saynn("[say=sci2]Alright, the specimen needs time now. The test is over. You may rest, test subject.[/say]")

		saynn("Hopefully, you will wake up to a nice omelette breakfast.")

		addButton("Sleep", "Go sleep!", "2fridgeSleep")
	if(state == "2fridgeSleep"):
		saynn("You wake up and open the fridge..")

		saynn("The egg seems alive.. very alive actually. In fact, it has visibly grown. Shit.")

		saynn("[say=sci2]Oh, you up, test subject. Perfect. It is time for the next test.[/say]")

		saynn("[say=pc]What is it now?[/say]")

		saynn("[say=sci2]According to all the data that we have, the specimen is nearing its emergence point.[/say]")

		saynn("[say=pc]Emergence?[/say]")

		saynn("You hear a quiet sigh.")

		saynn("[say=sci2]It's about to hatch.[/say]")

		saynn("[say=pc]Space that stupid thing, I don't want it to hatch.[/say]")

		saynn("[say=sci1]But you will do it. Or else I will make a few guards ask you nicely again.[/say]")

		saynn("You pull the egg out of the fridge.. It's extremely cold to the touch.. and yet.. somehow it is still twitching from your touches. Fuck.")

		addButton("Continue", "See what happens next", "gottaProvoke")
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	
	if(_action in ["1_kick", "2_fridge", "3_holdshut"]):
		statAnger += 1
	if(_action in ["1_touch", "2_shower", "3_watch"]):
		statAgility += 1
	if(_action in ["1_listen", "2_aimlamp", "3_peel"]):
		statMind += 1
	if(_action in ["1_rub", "2_cuddle", "3_embrace"]):
		statLust += 1
	
	if(_action == "2fridgeSleep"):
		GM.main.StartNewDay()
	
	if(_action == "revealTentacles"):
		var whichStat:int = getBiggestStat()
		
		if(whichStat < 0):
			addMessage("NO BIGGEST STAT")
		elif(whichStat == PlayerSlaveryTentacles.STAT_ANGER):
			addMessage("ANGER INCREASE")
		elif(whichStat == PlayerSlaveryTentacles.STAT_AGILITY):
			addMessage("AGILITY INCREASE")
		elif(whichStat == PlayerSlaveryTentacles.STAT_MIND):
			addMessage("MIND INCREASE")
		elif(whichStat == PlayerSlaveryTentacles.STAT_LUST):
			addMessage("LUST INCREASE")
			
		if(whichStat > 0):
			_tentacles.incStat(whichStat)
		_tentacles.setStage(_tentacles.STAGE_TINY)
	#if(_action == "guards_leave_egg"):
	#	_tentacles.setStage(_tentacles.STAGE_EGG)
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func supportsShowingPawns() -> bool:
	return true

func getBiggestStat() -> int:
	var biggestStat:int = PlayerSlaveryTentacles.STAT_ANGER
	var biggestStatNumber:int = 0
	if(statAnger > biggestStatNumber):
		biggestStatNumber = statAnger
		biggestStat = PlayerSlaveryTentacles.STAT_ANGER
	if(statAgility > biggestStatNumber):
		biggestStatNumber = statAgility
		biggestStat = PlayerSlaveryTentacles.STAT_AGILITY
	if(statMind > biggestStatNumber):
		biggestStatNumber = statMind
		biggestStat = PlayerSlaveryTentacles.STAT_MIND
	if(statLust > biggestStatNumber):
		biggestStatNumber = statLust
		biggestStat = PlayerSlaveryTentacles.STAT_LUST
		
	var amountSame:int = 0
	if(statAnger == biggestStatNumber):
		amountSame += 1
	if(statAgility == biggestStatNumber):
		amountSame += 1
	if(statMind == biggestStatNumber):
		amountSame += 1
	if(statLust == biggestStatNumber):
		amountSame += 1
	
	if(amountSame >= 2): # No biggest stat
		return -1
	
	return biggestStat
	
func saveData():
	var data = .saveData()
	
	data["statAnger"] = statAnger
	data["statAgility"] = statAgility
	data["statMind"] = statMind
	data["statLust"] = statLust
	
	return data
	
func loadData(data):
	.loadData(data)
	
	statAnger = SAVE.loadVar(data, "statAnger", 0)
	statAgility = SAVE.loadVar(data, "statAgility", 0)
	statMind = SAVE.loadVar(data, "statMind", 0)
	statLust = SAVE.loadVar(data, "statLust", 0)
