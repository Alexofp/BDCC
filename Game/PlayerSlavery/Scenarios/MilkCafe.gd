extends PlayerSlaveryBase

var totalMilk:float = 0.0
var totalSeed:float = 0.0

var cowTrust:float = 0.0
var bullTrust:float = 0.0

var obedience:float = 0.0

var needsPunishment:bool = false

var mindset:float = 0.0

var day:int = 0

var milkedToday:int = 0
var milkedTotal:int = 0

var gotMilkedNoon:bool = false
var gotMilkedEvening:bool = false

func onNewDay():
	gotMilkedNoon = false
	gotMilkedEvening = false

var agreeMilk:bool = true
var agreeSeed:bool = false

var cowTopic:int = 0
var bullTopic:int = 0

const IDLE_IDLE = 0
const IDLE_SOCIAL = 1
const IDLE_HUNGRY = 2
const IDLE_NEEDY = 3
const IDLE_MAX = 3

var idleState:int = IDLE_IDLE

var state:String = "intro"
var texts:Array = []
var actions:Array = []

const C_PC = "pc"
const C_COW = "psmilka"
const C_BULL = "pspip"
const C_GIRL = "tavi" #TODO: Change me
const C_GUY = "captain"

const L_SLEEP = "pscafe_sleep"
const L_BASEMENT_RIGHT = "pscafe_right"
const L_COW = "pscafe_cow"
const L_BULL = "pscafe_bull"
const L_ACT = "pscafe_act"
const L_EAT = "pscafe_eat"
const L_CENTER = "pscafe_center"
const L_COUNTER = "pscafe_counter"
const L_DOCKS = "pscafe_docks"
const L_FIELD = "pscafe_field"
const L_FIELD2 = "pscafe_field2"
const L_FIELD3 = "pscafe_field3"

func saveData() -> Dictionary:

	return {
		totalMilk = totalMilk,
		totalSeed = totalSeed,
		cowTrust = cowTrust,
		bullTrust = bullTrust,
		obedience = obedience,
		needsPunishment = needsPunishment,
		mindset = mindset,
		day = day,
		state = state,
		texts = texts,
		actions = actions,
		agreeMilk = agreeMilk,
		agreeSeed = agreeSeed,
		milkedToday = milkedToday,
		milkedTotal = milkedTotal,
		idleState = idleState,
		gotMilkedNoon = gotMilkedNoon,
		gotMilkedEvening = gotMilkedEvening,
		cowTopic = cowTopic,
		bullTopic = bullTopic,
	}

func loadData(_data:Dictionary):
	totalMilk = SAVE.loadVar(_data, "totalMilk", 0.0)
	totalSeed = SAVE.loadVar(_data, "totalSeed", 0.0)
	cowTrust = SAVE.loadVar(_data, "cowTrust", 0.0)
	bullTrust = SAVE.loadVar(_data, "bullTrust", 0.0)
	obedience = SAVE.loadVar(_data, "obedience", 0.0)
	needsPunishment = SAVE.loadVar(_data, "needsPunishment", false)
	mindset = SAVE.loadVar(_data, "mindset", 0.0)
	day = SAVE.loadVar(_data, "day", 0)
	state = SAVE.loadVar(_data, "state", "")
	texts = SAVE.loadVar(_data, "texts", [])
	actions = SAVE.loadVar(_data, "actions", [])
	agreeMilk = SAVE.loadVar(_data, "agreeMilk", true)
	agreeSeed = SAVE.loadVar(_data, "agreeSeed", false)
	milkedToday = SAVE.loadVar(_data, "milkedToday", 0)
	milkedTotal = SAVE.loadVar(_data, "milkedTotal", 0)
	idleState = SAVE.loadVar(_data, "idleState", IDLE_IDLE)
	gotMilkedNoon = SAVE.loadVar(_data, "gotMilkedNoon", false)
	gotMilkedEvening = SAVE.loadVar(_data, "gotMilkedEvening", false)
	cowTopic = SAVE.loadVar(_data, "cowTopic", 0)
	bullTopic = SAVE.loadVar(_data, "bullTopic", 0)

const MILKA_LINES = [
	"Oh, hai. There is more of us here now.",
	"Name is Milka. I'm a cow here. I like making new friends!",
	"I also make a lot of milk.. Well, I'm trying to.",
	"If you ever feel sad, talk with me! I like helping!",
	"I like being milked. Feels good! Moo!",
	"Moo-moo-moo~.",
	"People say my milk tastes like strawberries~.",
	"My breasts aren't that big. I'm sure they will grow!",
	"The bull over there is a bit grumpy. I think I know why!",
	"I have many nipples.. but most of them don't work. Aw.",
	"I don't like overthinking.. Makes my head buzz-buzz.",
	"Life is getting better actually! The funny marks don't hurt as much.",
	"These owners gave me my name.. Milka. Fits me, doesn't it? I just need bigger titties!",
	"Do you have dreams? Sometimes I dream of soft grass and sunshine. Moo~.",
	"This cafe isn't doing well financially.. reminds me of my childhood farm..",
	"I can tell them to milk my breasts twice as much. Then they will go easier on you. Just let me know!",
	"When I'm scared, I just count the lines. It helps!",
	"I would love to help that bull.. Then he would breed me maybe! Breeding is in my DNA~.",
	"What's my real name? Uh.. Um. Milka? I'm just a cow.. Silvery grass, fields, barns, that's where I grew up! I think.",
	"Hm.. Thinking is hard. I will get back to you.",
	"Oh. I remember a stage! Maybe I was a singer?",
	"I like it when you scratch behind my ears. It reminds me of.. hm..",
	"I like humming songs. Moo-moo-moo~. Man, I was totally a singer!",
	"My memory is foggy.. froggy, haha. Get it?",
	"I'm happiest I ever was!",
	"My breasts feel funny. If you're sad, feel free to touch!",
	"I don't know what tomorrow brings. But if you're here, it's okay!",
	"I taste ash.. Did the grass always tasted like that?",
	"I was a singer, I'm telling you. Ahhh-h-hh~.",
	"A talent scout once told me I have a great voice!",
	"More milking? Sign me up!",
	"Oh yeah! I traveled a lot! I saw many places. Many stages. A singing cow, I was popular~.",
	"I was trying to help my old farm. Earn credits with my voice!",
	"That talent scout found me and gave me a chance!",
	"Thank you for being here with me! Cows are social creatures.",
	"Wanna talk about something else?",
	"I think I'm out of things to talk about.. I might start repeating, I'm sorry!",
]

const PIP_LINES = [
	"They got you too, huh? Welcome, I guess. I'm Pip.",
	"I was the cheapest bull they were able to buy. Can you see why?",
	"The previous owner has melted the key when I tried to run. Yeah, that key.",
	"They still milk me. They need their stupid cream.",
	"The owner girl is a real fucking bitch. The guy is better but I don't trust him.",
	"That cow over there? Milka or whatever her name is.. She is delusional. I'm sorry but she totally is.",
	"The customers don't even know that the owners use our milk and cum in their food.",
	"I'm so fucking horny..",
	"They turned the freezer room into our cells. They don't have enough credits to pay for it anyway.",
	"My tailhole has really puffed up lately. Fuck..",
	"I was caged because the owner wanted to turn me into a femboy. I'm a stud, god dammit!",
	"No point in yelling.. The walls are too thick.",
	"I'm not into pegging! I'm not, I'm not, I'm not. I allow it because otherwise the pressure becomes too much.",
	"That Milka cow is dumb.. But I would breed her anyway.. Hell, I'd breed you..",
	"If you could help me.. Please. I will do anything.",
	"It's boring here. Could have been worse I guess.",
	"Milka is eating that grass.. like a fucking cow. I'd rather starve. Or eat ass even.",
	"I'm glad you're here. Well.. Not in the bad way.",
	"I lied a bit. No, I just didn't tell you everything. I was caged and enslaved because I banged some club owner's slutty wife. If you ask me, that was worth it.",
	"Yeah.. That pussy was clenching around my long, thick horsecock.. Shit, I'm dripping.",
	"I heard one of the customers compliment the cupcakes. I knew my seed was good!",
	"My nipples are getting sensitive too. Don't tell the owners or they will start milking them as well.",
	"I play with my nips, okay? I fucking do. I finger my ass sometimes. I'm a stud, I need a ball-draining amount of pleasure.",
	"When I get out, I'm heading straight back to that club.",
	"Breeding.. This place is messing with me. I have weird dreams. Wet dreams.",
	"If you wanna help me cum, I'd appreciate it, okay? Doesn't mean I'm a bottom.",
	"They were talking about starting a cheese shop too.. I will give them some cheese alright.",
	"That club owner that I fucked over? I don't regret it.",
	"Days are just flying by, aren't they?",
	"If you wanna milk me, let me know. I can bend over.",
	"I can probably fist myself by this point.. I have such a fucking donut of a hole. Shit.",
	"You know what I regret? I should have protected Milka more from these fuckers. I don't know, she is not that bad.",
	"I fucked many caged sluts. Didn't know I would become one.",
	"I don't know what else to say. I will start repeating I guess.",
]

func _init():
	id = "MilkCafe"

func onSlaveryStart():
	intro_state()

func onSlaveryEnd():
	GM.pc.removeEffect(StatusEffect.PSMilkCafeProduction)

# Gets called after onSlaveryStart()
func getStartScene() -> String:
	return "PSMilkCafeGameplayScene"

func getPCViewDistance() -> float:
	return 150.0

func setState(_state:String):
	state = _state

func saynn(_text:String):
	texts.append(_text+"\n\n")
func sayn(_text:String):
	texts.append(_text+"\n")
func say(_text:String):
	texts.append(_text)
func addTextToBack(_text:String):
	if(texts.empty()):
		texts.append(_text+"\n\n")
	else:
		var lastText:String = texts.pop_back()
		if(lastText.ends_with("\n\n")):
			lastText = lastText.trim_suffix("\n\n")+" "+_text+"\n\n"
		elif(lastText.ends_with("\n")):
			lastText = lastText.trim_suffix("\n")+" "+_text+"\n"
		else:
			lastText = lastText+" "+_text+"\n"
		texts.append(lastText)

func talk(_whoID:String, _text:String):
	saynn("[say="+_whoID+"]"+_text+"[/say]")

func aimCamera(_loc:String):
	GM.main.aimCameraAndSetLocName(_loc)

func playAnimation(theSceneID, theActionID, args = {}):
	if(GM.main != null):
		GM.main.playAnimation(theSceneID, theActionID, args)

func addAction(_name:String, _desc:String, _id:String, _args:Array = []):
	actions.append([true, -1, _name, _desc, _id, _args])

func addContinue(_id:String, _args:Array = []):
	addAction("Continue", "See what happens next", _id, _args)

func addDisabledAction(_name:String, _desc:String):
	actions.append([false, -1, _name, _desc])

func getFinalText() -> String:
	return Util.join(texts)

func getFinalActions() -> Array:
	var result:Array = []
	
	#result.append([
	#	-1, "continue", "Continue", "See what happens next",
	#])
	
	for actionEntry in actions:
		result.append([actionEntry[1], "action" if actionEntry[0] else "", actionEntry[2], actionEntry[3], actionEntry])
	
	return result

func processFightEnd(_didPCWin:bool):
	startNewState()
	call(state + "_fightResult", _didPCWin)

func processSexEnd(_sexResult:SexReaction):
	startNewState()
	call(state + "_sexResult", _sexResult)

func startNewState():
	actions.clear()
	texts.clear()

func doFinalAction(_finalActionEntry:Array) -> Dictionary:
	if(_finalActionEntry[1] == "action"):
		var _actionEntry:Array = _finalActionEntry[4]
		startNewState()
		
		var theID:String = _actionEntry[4]
		var theArgs:Array = _actionEntry[5]
		
		if(theID == "setState"):
			state = theArgs[0]
			call(state + "_state")
			return {}
		if(theID == "startFight"):
			return {fight=theArgs[0]}
		if(theID == "startSex"):
			return {sex=theArgs}
			
		
		call(state + "_do", theID, theArgs)
		if(texts.empty() && actions.empty()):
			call(state + "_state")
		elif(actions.empty()):
			addAction("Continue", "See what happens next", "setState", [state])
	return {}
	
func processTurn():
	GM.main.processTime(60*60)
	idleState += 1
	if(idleState > IDLE_MAX):
		idleState = 0

func addUpTextNum(_value:String, _howMuch:int, reverse:bool = false):
	var howMuchStr:String = ("+" if _howMuch >= 0 else "")+str(_howMuch)
	if(_howMuch*(1 if !reverse else -1) >= 0):
		addTextToBack("[color=#00CC00]("+_value+" "+howMuchStr+")[/color]")
	else:
		addTextToBack("[color=red]("+_value+" "+howMuchStr+")[/color]")
func addUpText(_value:String, _howMuch:int):
	if(_howMuch == 0):
		_howMuch = 1
	var howMuchStr:String = ("+".repeat(_howMuch) if _howMuch >= 0 else "-".repeat(-_howMuch))
	if(_howMuch >= 0):
		addTextToBack("[color=#00CC00]("+_value+" "+howMuchStr+")[/color]")
	else:
		addTextToBack("[color=red]("+_value+" "+howMuchStr+")[/color]")

func addCredits(_howMuch:int):
	GM.pc.addCredits(_howMuch)
	addUpTextNum("Credits", _howMuch)
func addStamina(_howMuch:int):
	var theMaxStamina:float = float(GM.pc.getMaxStamina())
	var theFactor:float = theMaxStamina/100.0
	var howMuchActually:int = int(round(_howMuch*theFactor))
	GM.pc.addStamina(howMuchActually)
	addUpTextNum("Stamina", howMuchActually)
func addPain(_howMuch:int):
	GM.pc.addPain(_howMuch)
	addUpTextNum("Pain", _howMuch, true)
	
func addObedience(_howMuch:float):
	obedience += _howMuch / 100.0
	
	var theU:int = int(round(_howMuch))
	if(theU == 0 && _howMuch > 0.0):
		theU = 1
	if(theU == 0 && _howMuch < 0.0):
		theU = -1
	addUpText("Obedience", theU)

func getCredits() -> int:
	return GM.pc.getCredits()

func gotMilked(howMuch:int = 1):
	milkedToday += howMuch
	milkedTotal += howMuch

func onDayEnd():
	if(milkedToday > 0):
		saynn("The cafe made some profit!")
		addCredits(milkedToday * 3)
	else:
		saynn("The cafe wasn't able to make any profit because there was not enough milk/cream.")
	
	milkedToday = 0
	onNewDay()

func intro_state():
	playAnimation(StageScene.Solo, "kneel", {pc=C_PC})
	
	saynn("INTRO.")
	
	saynn("YOU ARRIVE TO THE CAFE.")
	
	addContinue("arrive")

func intro_do(_id:String, _args:Array):
	if(_id == "arrive"):
		saynn("HOW WILL YOU MAKE US CREDITS.")
		
		addCredits(-250000)
		
		addAction("Milk", "Your breasts will be milked. Their size will be increased over time", "agreeMilk")
		addAction("Seed", "Your cock will be milked", "agreeSeed")
		addAction("Both", "Both, your breasts and your cock will be milked", "agreeBoth")
	if(_id == "agreeMilk"):
		agreeMilk = true
		agreeSeed = false
		setState("main")
	if(_id == "agreeSeed"):
		agreeMilk = false
		agreeSeed = true
		setState("main")
	if(_id == "agreeBoth"):
		agreeMilk = true
		agreeSeed = true
		setState("main")

func main_state():
	if(!GM.pc.hasEffect(StatusEffect.PSMilkCafeProduction)):
		GM.pc.addEffect(StatusEffect.PSMilkCafeProduction)
	aimCamera(L_CENTER)
	playAnimation(StageScene.Solo, "stand")
	
	saynn("MAIN LOOP.")
	
	sayn("Day: "+str(day))
	saynn("Obedience: "+str(Util.roundF(obedience, 2)))
	
	if(idleState == IDLE_IDLE):
		saynn("You don't have any particular needs.")
		
		addAction("Graze", "Spend time on the field, chew some grass", "idleGraze")
		addAction("Hide in cell", "Hide in your cell", "idleCell")
		# If messy
		addAction("Wash", "Ask to be washed", "idleWash")
		addAction("Peek outside", "Peek through the door's little window", "idlePeek")
		#addAction("Kick padlock", "Smash the door's padlock with your leg", "idleSmash")
		#addAction("Struggle", "Try to struggle off the restraints", "idleStruggle")
	if(idleState == IDLE_SOCIAL):
		saynn("You feel like socializing.")
		
		addAction("Cow", "Spend time with the cow", "talkCow")
		addAction("Bull", "Spend time with the bull", "talkBull")
		addAction("Annoy owners", "Make them regret buying you!", "talkAnnoy")
		#addAction("Milk Cow", "Help with milking the cow", "talkCowMilk")
		#addAction("Milk Bull", "Help with milking the bull", "talkBullMilk")
	if(idleState == IDLE_HUNGRY):
		saynn("You feel hungry.")
		
		addAction("Eat grass", "Go eat grass like a good livestock", "eatGrass")
		addAction("Starve", "You refuse to eat the grass", "eatStarve")
		addAction("Demand", "Demand the owners to be fed normal food", "eatDemand")
		#addAction("Suck bull", "Feed on the bull's seed", "eatSuckBull")
	if(idleState == IDLE_NEEDY):
		saynn("You feel needy.")
		
		addAction("Be milked", "Ask the owners to milk you", "needyMilk")
		addAction("Masturbate", "Satisfy yourself with your fingers", "needyMasturbate")
		addAction("Offer self", "Let the owners do whatever they want with you..", "needyOfferSelf")
		addAction("Complain", "Complain that you are extremely needy!", "needyComplain")
		
	#talk(C_GIRL, "Hello.")
	
	#addAction("Eat", "Go eat out of a trough", "goEat")
	#addAction("Cow", "Spend time with the cow", "talkCow")
	#addAction("Bull", "Spend time with the bull", "talkBull")

func lateCheck() -> bool:
	if(GM.main.isVeryLate()):
		setState("sleep")
		return true
	return false

func triggerEventMaybe():
	if(lateCheck()):
		return
	
	if(!gotMilkedNoon && GM.main.getTime() >= 11*60*60):
		gotMilkedNoon = true
		setState(RNG.pick(["about_to_be_milked_by_guy", "about_to_be_milked_by_girl"]))
		return
	if(!gotMilkedEvening && GM.main.getTime() >= 20*60*60):
		gotMilkedEvening = true
		setState(RNG.pick(["about_to_be_milked_by_guy", "about_to_be_milked_by_girl"]))
		return
	
	if(RNG.chance(50)):
		setState("test")
		#addContinue("startEvent", ["test"])
	#else:
	#	addContinue("setState", ["main"])

func addNextIdleStageButton():
	addContinue("nextIdle")

func main_do(_id:String, _args:Array):
	processTurn()
	if(_id == "idleGraze"):
		aimCamera(RNG.pick([L_FIELD, L_FIELD2, L_FIELD3]))
		saynn("YOU SPEND SOME TIME GRAZING, CHEWING ON GRASS.")
		addStamina(10)
		addPain(-10)
		
		var special:String = RNG.pickWeightedDict({
			"": 100.0, "guy": 20.0, "girl": 20.0,
		})
		if(special == "guy"):
			saynn("THE GUY NOTICES YOU WHILE CARRYING SOME BOXES AROUND.")
			talk(C_GUY, "SUCH A GOOD COW.")
			addObedience(1)
		if(special == "girl"):
			saynn("THE GIRL COMES IN TO CHECK ON YOU.")
			talk(C_GIRL, "YEAH, LOOK DUMB AND KEEP CHEWING, I NEED YOUR MILK.")
			addObedience(1)
		
		triggerEventMaybe()
	if(_id == "idleCell"):
		aimCamera(L_SLEEP)
		saynn("YOU HIDE IN THE CELL, AWAY FROM EVERYBODY.")
		addStamina(15)
		
		var special:String = RNG.pickWeightedDict({
			"": 100.0, "guy": 20.0, "girl": 40.0,
		})
		if(special == "guy"):
			saynn("THE GUY FINDS YOU.")
			talk(C_GUY, "AW, C'MON. DON'T BE SHY.")
		if(special == "girl"):
			saynn("THE GIRL FINDS YOU AND DRAGS YOU OUT BY YOUR COLLAR.")
			addPain(10)
			talk(C_GIRL, "STUPID BITCH, YOU'RE A COW, ACT LIKE IT.")
			addObedience(-2)
		triggerEventMaybe()
	if(_id == "idleWash"):
		aimCamera(L_FIELD)
		GM.pc.afterTakingAShower()
		saynn("YOU ASK TO BE WASHED.")
		
		if(RNG.chance(50)):
			saynn("THE GIRL SHOVES YOU AGAINST THE GARDEN'S WALL AND WASHES YOUR BUTT WITH A STRONG STREAM OF WATER FROM A HOSE.")
			talk(C_GIRL, "TURN AROUND.")
			saynn("YOU DO SO AND LET HER WASH YOUR FRONT TOO.")
		else:
			saynn("THE GUY BRINGS YOU OUT INTO THE FIELD AND CAREFULLY WASHES YOUR BODY, HOSE IN ONE HAND, SPONGE IN ANOTHER.")
			talk(C_GUY, "THERE WE GO. MUCH BETTER, EH?")
		triggerEventMaybe()



	if(_id == "goEat"):
		aimCamera(L_EAT)
		addStamina(20)
		addUpText("Obedience", 1)
		
		saynn("YOU EAT SOME HAY OUT OF A TROUGH.")
		triggerEventMaybe()
	if(_id == "talkCow"):
		playAnimation(StageScene.Duo, "stand", {npc=C_COW})
		aimCamera(L_COW)
		saynn("YOU SPEND SOME TIME WITH THE COW.")
		addUpText("Cow", 1)
		if(cowTopic >= MILKA_LINES.size()):
			talk(C_COW, RNG.pick(MILKA_LINES))
		else:
			talk(C_COW, MILKA_LINES[cowTopic])
			cowTopic += 1
		triggerEventMaybe()
	if(_id == "talkBull"):
		playAnimation(StageScene.Duo, "stand", {npc=C_BULL})
		aimCamera(L_BULL)
		saynn("YOU SPEND SOME TIME WITH THE BULL.")
		addUpText("Bull", 1)
		if(bullTopic >= PIP_LINES.size()):
			talk(C_BULL, RNG.pick(PIP_LINES))
		else:
			talk(C_BULL, PIP_LINES[bullTopic])
			bullTopic += 1
		triggerEventMaybe()
	if(_id == "startEvent"):
		setState(_args[0])

func sleep_state():
	aimCamera(L_SLEEP)
	saynn("TIME TO SLEEP")
	
	onDayEnd()
	
	addAction("Sleep", "Time to sleep", "sleep")

func sleep_do(_id:String, _args:Array):
	if(_id == "sleep"):
		GM.main.startNewDay()
		GM.pc.addStamina(GM.pc.getMaxStamina())
		saynn("NEW DAY.")
		setState("main")

func test_state():
	addCredits(5)
	saynn("TEST STATE!")
	
	addAction("Back", "Go back", "setState", ["main"])

func test_do(_id:String, _args:Array):
	pass

func about_to_be_milked_by_guy_state():
	aimCamera(L_ACT)
	playAnimation(StageScene.Duo, "stand", {npc=C_GUY})
	saynn("ABOUT TO BE MILKED BY GUY.")
	
	addAction("Agree", "Let him milk you!", "agree")
	addAction("Decline", "You'd rather not.", "decline")

func about_to_be_milked_by_guy_do(_id:String, _args:Array):
	if(_id == "agree"):
		saynn("You decide to let him milk you.")
		addObedience(1)
		
		milkScene(C_GUY, C_PC)
		setState("main")
	if(_id == "decline"):
		saynn("You decline his offer.")
		addObedience(-1)
		setState("main")

func about_to_be_milked_by_girl_state():
	aimCamera(L_ACT)
	playAnimation(StageScene.Duo, "stand", {npc=C_GIRL})
	saynn("ABOUT TO BE MILKED BY GIRL.")
	
	addAction("Allow", "Let her milk you", "agree")
	addAction("Fight!", "Resist her attempts", "decline")

func about_to_be_milked_by_girl_do(_id:String, _args:Array):
	if(_id == "agree"):
		saynn("You decide to let her milk you.")
		addObedience(1)
		
		milkScene(C_GIRL, C_PC)
		setState("main")
	if(_id == "decline"):
		#TODO: Add a fight here!
		saynn("You decline her offer. YOU'RE GONNA HAVE TO FIGHT.")
		addObedience(-1)
		addAction("Fight!", "Start the fight", "startFight", [C_GIRL])

func about_to_be_milked_by_girl_fightResult(_didPCWin:bool):
	saynn("DID WIN: "+str(_didPCWin))
	
	if(_didPCWin):
		addObedience(-5)
	
	addContinue("setState", ["main"])

func parse(_text:String, _chars:Dictionary):
	return GM.ui.processString(_text, _chars)

var charOverrides:Dictionary = {}# no sync

func sayParsed(_text:String):
	saynn(parse(_text, charOverrides))

func milkScene(_actorID:String, _targetID:String):
	charOverrides = {actor=_actorID, target=_targetID}
	var _isPCActor:bool = (_actorID == C_PC)
	var _isPCTarget:bool = (_targetID == C_PC)
	var _actor:BaseCharacter = GlobalRegistry.getCharacter(_actorID)
	var _target:BaseCharacter = GlobalRegistry.getCharacter(_targetID)
	var _actorName:String = _actor.getName()
	var _targetName:String = _target.getName()
	if(_isPCTarget):
		_targetName = "you"
	var _targetCaged:bool = _target.isWearingChastityCage()
	var _canMilkBreasts:bool = true
	if(_isPCTarget && !agreeMilk):
		_canMilkBreasts = false
	if(_targetID == C_BULL):
		_canMilkBreasts = false
	var _canMilkPenis:bool = _target.hasReachablePenis()
	var _canMilkProstate:bool = _targetCaged
	if(_isPCTarget && !agreeSeed):
		_canMilkPenis = false
		_canMilkProstate = false
	
	var possible:Array = []
	
	if(_canMilkBreasts && _canMilkPenis):
		possible.append(["gropeAndStroke", 3.0])
	elif(_canMilkBreasts):
		possible.append(["grope", 1.0])
	if(_canMilkPenis):
		possible.append(["stroke", 1.0])
	if(_canMilkProstate):
		possible.append(["fisting", 1.0])
	
	if(possible.empty()):
		saynn("Game couldn't figure out how to milk you!")
		return
	var milkWay:String = RNG.pickWeightedPairs(possible)
	
	var shouldMilkPenis:bool = false
	var shouldMilkBreasts:bool = false
	var collectedEnough:bool = false
	var collectedMilk:float = 0.0
	var collectedSeed:float = 0.0
	
	if(milkWay == "gropeAndStroke"):
		shouldMilkPenis = true
		shouldMilkBreasts = true
		playAnimation(StageScene.BreastGroping, "stroke", {pc=_actorID, npc=_targetID, npcCum=true, npcBodyState={naked=true,hard=true}})
		sayParsed("{actor.You} {actor.youVerb('bring')} {target.you} down to the floor and {actor.youVerb('milk')} {target.yourHis} {target.breasts} with one hand while stroking {target.yourHis} {target.penis} with another!")
	if(milkWay == "grope"):
		shouldMilkBreasts = true
		playAnimation(StageScene.BreastGroping, "grope", {pc=_actorID, npc=_targetID, npcCum=true, npcBodyState={naked=true,hard=true}})
		sayParsed("{actor.You} {actor.youVerb('bring')} {target.you} down to the floor and {actor.youVerb('milk')} {target.yourHis} {target.breasts} with {actor.yourHis} hands!")
	if(milkWay == "stroke"):
		shouldMilkPenis = true
		playAnimation(StageScene.ChairOral, "stroke", {pc=_targetID, npc=_actorID, pcCum=true, bodyState={naked=true,hard=true}})
		sayParsed("{actor.You} {actor.youVerb('put')} {target.you} onto a chair and {actor.youVerb('proceed')} to stroke {target.yourHis} {target.penis} until the orgasm!")
	if(milkWay == "fisting"):
		shouldMilkPenis = true
		playAnimation(StageScene.SexFisting, "sex", {pc=_actorID, npc=_targetID, npcCum=true, npcBodyState={naked=true,hard=true}})
		sayParsed("{actor.You} {actor.youVerb('put')} {target.you} onto a chair and {actor.youVerb('proceed')} to stroke {target.yourHis} {target.penis} until the orgasm!")
	
	if(shouldMilkPenis):
		collectedSeed += _target.milkSeed()
	if(shouldMilkBreasts):
		collectedMilk += _target.milk()
	
	_target.orgasmFrom(_actorID)
	if(_isPCTarget):
		addStamina(-40)
	
	#var collectedTotal:float = collectedMilk + collectedSeed
	var collectedTotalWeighted:float = collectedMilk + collectedSeed*3.0
	if(collectedTotalWeighted < 10.0):
		collectedEnough = false
	else:
		collectedEnough = true
	
	if(shouldMilkBreasts && shouldMilkPenis):
		sayParsed("{actor.You} managed to collect "+str(Util.roundF(collectedMilk, 1))+"ml of {target.milk} and "+str(Util.roundF(collectedSeed, 1))+"ml of {target.cum}.")
	elif(shouldMilkBreasts):
		sayParsed("{actor.You} managed to collect "+str(Util.roundF(collectedMilk, 1))+"ml of {target.milk}.")
	elif(shouldMilkPenis):
		sayParsed("{actor.You} managed to collect "+str(Util.roundF(collectedSeed, 1))+"ml of {target.cum}.")
	
	if(collectedEnough):
		sayParsed("[say=actor]THAT'S ENOUGH![/say]")
		milkedToday += 1
	else:
		sayParsed("[say=actor]THAT'S NOT ENOUGH![/say]")
