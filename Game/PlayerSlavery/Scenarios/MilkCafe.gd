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
var totalEarned:int = 0

var gotMilkedNoon:bool = false
var gotMilkedEvening:bool = false

func onNewDay():
	gotMilkedNoon = false
	gotMilkedEvening = false

var agreeMilk:bool = true
var agreeSeed:bool = false

var cowTopic:int = 0
var bullTopic:int = 0

var treatAmount:int = 0

var peekTried:int = 0
var peekState:int = PEEK_START
const PEEK_START = 0
const PEEK_NOTICED_PADLOCK = 1
const PEEK_NOTICED_CUSTOMER = 2

var padlockDamage:float = 0.0

var canHelpCage:bool = false
var cageRemoved:bool = false
var cageDamage:float = 0.0

var canHelpMilka:bool = false
var milkaExtraBreastSize:int = 0
var helpedMilka:bool = false

var upgradeLevel:int = -1
var extraProfit:int = 0

var charsHere:Array = []

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

const L_DOOR = "pscafe_door"
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
		peekTried = peekTried,
		peekState = peekState,
		padlockDamage = padlockDamage,
		treatAmount = treatAmount,
		totalEarned = totalEarned,
		canHelpCage = canHelpCage,
		cageRemoved = cageRemoved,
		cageDamage = cageDamage,
		charsHere = charsHere,
		canHelpMilka = canHelpMilka,
		helpedMilka = helpedMilka,
		milkaExtraBreastSize = milkaExtraBreastSize,
		upgradeLevel = upgradeLevel,
		extraProfit = extraProfit,
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
	peekTried = SAVE.loadVar(_data, "peekTried", 0)
	peekState = SAVE.loadVar(_data, "peekState", 0)
	padlockDamage = SAVE.loadVar(_data, "padlockDamage", 0.0)
	treatAmount = SAVE.loadVar(_data, "treatAmount", 0)
	totalEarned = SAVE.loadVar(_data, "totalEarned", 0)
	canHelpCage = SAVE.loadVar(_data, "canHelpCage", false)
	cageRemoved = SAVE.loadVar(_data, "cageRemoved", false)
	cageDamage = SAVE.loadVar(_data, "cageDamage", 0.0)
	charsHere = SAVE.loadVar(_data, "charsHere", [])
	canHelpMilka = SAVE.loadVar(_data, "canHelpMilka", false)
	helpedMilka = SAVE.loadVar(_data, "helpedMilka", false)
	milkaExtraBreastSize = SAVE.loadVar(_data, "milkaExtraBreastSize", 0)
	upgradeLevel = SAVE.loadVar(_data, "upgradeLevel", -1)
	extraProfit = SAVE.loadVar(_data, "extraProfit", 0)

# max earned = 250000

# ways milk: stall hand-milking, stall breast pumps, sybian (milk), milking machine (milk)
# ways seed: stall penis-pump, fuck machine (seed), pegging, prostate milking on table, milking machine (seed)
# ways both: stall breast+penis pumps, milking machine (both)

# default milking ways: fingering, stroking, stroking+groping, groping, pegging over table
const UPGRADES = [
	{
		earned = 800,
		message = "The owners bought some breast and penis pumps!",
	},
	{
		earned = 5500,
		message = "The owners have installed a milking stall!",
	},
	{
		earned = 15500,
		message = "The owners have bought some fuck-machines!",
	},
	{
		earned = 100000,
		message = "The owners have installed an advanced milking table!",
	},
]
const UPGRADE_PUMPS = 0
const UPGRADE_STALL = 1
const UPGRADE_FUCKMACHINE = 2
const UPGRADE_MILKINGTABLE = 3

const MILKA_LINES = [
	"Oh, hai. There is more of us here now, neat. Name is Milka!",
	"I'm a cow here. I like making new friends!",
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
	updateCharacters()
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

func updateCharacters():
	GlobalRegistry.getCharacter("pspip").resetEquipment()
	GlobalRegistry.getCharacter("psmilka").updateBodyparts()

func isPipCaged() -> bool:
	return !cageRemoved

func getMilkaBreastSize() -> int:
	return 2

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

func talk(_whoID:String, _text:String, addToChars:bool = true):
	saynn("[say="+_whoID+"]"+_text+"[/say]")
	if(addToChars):
		addChar(_whoID)
func addChar(_whoID:String):
	if(_whoID == "pc"):
		return
	if(!charsHere.has(_whoID)):
		charsHere.append(_whoID)
func getCharacterList() -> Array:
	return charsHere

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
	charsHere.clear()

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
func addUpTextF(_value:String, _howMuch:float):
	var theU:int = int(round(_howMuch))
	if(theU == 0 && _howMuch > 0.0):
		theU = 1
	if(theU == 0 && _howMuch < 0.0):
		theU = -1
	addUpText(_value, theU)

func addTreat(_howMuch:int = 1):
	var oldAmount:int = treatAmount
	treatAmount += _howMuch
	if(treatAmount < 0):
		treatAmount = 0
	
	if(oldAmount == treatAmount):
		return
	var theDiff:int = treatAmount - oldAmount
	if(theDiff != 0):
		addUpText("Treat" if (theDiff == 1 || theDiff == -1) else "Treats", theDiff)

func sayMilkaLine():
	if(cowTopic >= MILKA_LINES.size()):
		talk(C_COW, RNG.pick(MILKA_LINES))
	else:
		talk(C_COW, MILKA_LINES[cowTopic])
		cowTopic += 1
func sayPipLine():
	if(bullTopic >= PIP_LINES.size()):
		talk(C_BULL, RNG.pick(PIP_LINES))
	else:
		talk(C_BULL, PIP_LINES[bullTopic])
		bullTopic += 1

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
	addUpTextF("Obedience", _howMuch)
func addCowTrust(_howMuch:float):
	cowTrust += _howMuch / 100.0
	addUpTextF("Cow's trust", _howMuch)
func addBullTrust(_howMuch:float):
	bullTrust += _howMuch / 100.0
	addUpTextF("Bull's trust", _howMuch)
func addPadlockDamage(_howMuch:float):
	padlockDamage += _howMuch / 100.0
	addUpTextF("Padlock's damage", _howMuch)

func getCredits() -> int:
	return GM.pc.getCredits()

func gotMilked(howMuch:int = 1):
	milkedToday += howMuch
	milkedTotal += howMuch

func onDayEnd():
	var earned:int = extraProfit
	
	if(milkedToday > 0):
		var earnedCredsMin:int = milkedToday * 100 + milkedTotal * milkedTotal
		var earnedCredsMax:int = milkedToday * 300 + milkedTotal * milkedTotal
		earned += RNG.randi_range(earnedCredsMin, earnedCredsMax)
	
	if(earned > 0):
		totalEarned += earned
		saynn("The cafe made some profits!")
		addCredits(earned)
	else:
		saynn("The cafe wasn't able to make any profit because there was not enough milk/cream.")
	
	for theNewUpgradeLevel in range(UPGRADES.size()):
		if(upgradeLevel >= theNewUpgradeLevel):
			continue
		var theEntry:Dictionary = UPGRADES[theNewUpgradeLevel]
		var amountToEarn:int = theEntry["earned"]
		if(totalEarned >= amountToEarn):
			upgradeLevel = theNewUpgradeLevel
			sayn("The cafe earned enough credits for an upgrade!")
			saynn(theEntry["message"])
	
	milkedToday = 0
	extraProfit = 0
	onNewDay()

func addBreastPump(_charID:String):
	var theChar:BaseCharacter = GlobalRegistry.getCharacter(_charID)
	var thePump = GlobalRegistry.createItem("BreastPump")
	if(theChar.canBeMilked()):
		var theFluids = thePump.getFluids()
		theFluids.addFluid("Milk", 400.0)
	theChar.getInventory().forceEquipStoreOtherUnlessRestraint(thePump)

func removeBreastPump(_charID:String):
	GlobalRegistry.getCharacter(_charID).getInventory().clearSlot(InventorySlot.UnderwearTop)

func addPenisPump(_charID:String) -> bool:
	var theChar:BaseCharacter = GlobalRegistry.getCharacter(_charID)
	if(theChar.isWearingChastityCage()):
		return false
	theChar.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("PenisPump"))
	return true

func removePenisPump(_charID:String):
	var theChar:BaseCharacter = GlobalRegistry.getCharacter(_charID)
	if(theChar.isWearingChastityCage()):
		return
	GlobalRegistry.getCharacter(_charID).getInventory().clearSlot(InventorySlot.Penis)

func addStrapon(_charID:String, _cumID:String = "") -> bool:
	var theChar:BaseCharacter = GlobalRegistry.getCharacter(_charID)
	if(!theChar.canWearStrapon() || theChar.isWearingStrapon()):
		return false
	var theStrapon = GlobalRegistry.createItem(RNG.pick([
		"Strapon",
		"StraponCanine",
		"StraponDragon",
		"StraponFeline",
		"StraponHorse",
	]))
	if(_cumID != ""):
		var cumChar:BaseCharacter = GlobalRegistry.getCharacter(_cumID)
		var fluids:Fluids = theStrapon.getFluids()
		fluids.addFluid(cumChar.getFluidType(FluidSource.Penis), RNG.randf_range(400.0, 700.0), cumChar.getFluidDNA(FluidSource.Penis))
	theChar.getInventory().forceEquipStoreOtherUnlessRestraint(theStrapon)
	return true
	
func removeStrapon(_charID:String):
	var theChar:BaseCharacter = GlobalRegistry.getCharacter(_charID)
	if(theChar && theChar.isWearingStrapon()):
		theChar.removeStrapon()
	
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
	removeStrapon(C_PC)
	removeStrapon(C_GIRL)
	removeBreastPump(C_COW)
	removePenisPump(C_BULL)
	removeBreastPump(C_PC)
	removePenisPump(C_PC)
	if(!GM.pc.hasEffect(StatusEffect.PSMilkCafeProduction)):
		GM.pc.addEffect(StatusEffect.PSMilkCafeProduction)
	aimCamera(L_CENTER)
	playAnimation(StageScene.Solo, "stand")
	
	saynn("MAIN LOOP.")
	
	sayn("Day: "+str(day))
	#TODO: Replace with texts
	sayn("Obedience: "+str(Util.roundF(obedience*100.0, 1))+"%")
	sayn("Cow's trust: "+str(Util.roundF(cowTrust*100.0, 1))+"%")
	sayn("Bull's trust: "+str(Util.roundF(bullTrust*100.0, 1))+"%")
	if(treatAmount > 0):
		sayn("Treats: "+str(treatAmount))
	
	sayn("")
	
	if(idleState == IDLE_IDLE):
		sayn("You don't have any particular needs.")
		if(padlockDamage > 0.0):
			sayn("Door: "+str(Util.roundF(padlockDamage*100.0, 1))+"%")
		
		addAction("Graze", "Spend time on the field, chew some grass", "idleGraze")
		addAction("Hide in cell", "Hide in your cell", "idleCell")
		# If messy
		addAction("Wash", "Ask to be washed", "idleWash")
		if(GM.pc.getStamina() > 0):
			addAction("Peek outside", "Peek through the door's little window", "idlePeek")
		else:
			addDisabledAction("Peek outside", "The window is high so you need some stamina to reach it")
		if(peekState >= PEEK_NOTICED_PADLOCK):
			if(!GM.pc.hasBoundLegs()):
				if(GM.pc.getStamina() > 0):
					addAction("Kick door", "Smash the door to damage the padlock", "idleSmash")
				else:
					addDisabledAction("Kick door", "You don't have any stamina")
			else:
				addDisabledAction("Kick door", "Your legs are cuffed!")
		if(GM.pc.getInventory().hasRemovableRestraintsNoLockedSmartlocks()):
			if(GM.pc.getStamina() > 0):
				addAction("Struggle", "Try to struggle off the restraints", "idleStruggle")
			else:
				addDisabledAction("Struggle", "You don't have any stamina!")
		if(canHelpCage && !cageRemoved):
			if(GM.pc.hasBoundArms() || GM.pc.hasBlockedHands()):
				addDisabledAction("Bull's cage", "You can't do it with blocked hands")
			else:
				if(GM.pc.getStamina() <= 0):
					addDisabledAction("Bull's cage", "You don't have any stamina to do this")
				else:
					addAction("Bull's cage", "Help Pip with his chastity cage", "idleBullCage")
		if(canHelpMilka && (getMilkaBreastSize() < BreastsSize.O)):
			if(GM.pc.hasBoundArms() || GM.pc.hasBlockedHands()):
				addDisabledAction("Milka's breasts", "You can't do it with blocked hands")
			else:
				if(GM.pc.getStamina() <= 0):
					addDisabledAction("Milka's breasts", "You don't have any stamina to do this")
				else:
					addAction("Milka's breasts", "Help Milka by applying special cream to her breasts", "idleCowBreasts")
	if(idleState == IDLE_SOCIAL):
		saynn("You feel like socializing.")
		
		addAction("Cow", "Spend time with the cow", "talkCow")
		addAction("Bull", "Spend time with the bull", "talkBull")
		addAction("Annoy owners", "Make them regret buying you!", "talkAnnoy")
	if(idleState == IDLE_HUNGRY):
		saynn("You feel hungry.")
		
		addAction("Eat grass", "Go eat grass like a good livestock", "eatGrass")
		addAction("Starve", "You refuse to eat the grass", "eatStarve")
		addAction("Demand", "Demand the owners to be fed normal food", "eatDemand")
		if(treatAmount > 0):
			addAction("Eat a treat!", "Eat one of your treats", "eatTreat")
		#addAction("Suck bull", "Feed on the bull's seed", "eatSuckBull")
	if(idleState == IDLE_NEEDY):
		saynn("You feel like you could do something lewd.")
		
		addAction("Just chill", "Get some extra stamina", "needyRest")
		addAction("Offer self", "Let the owners do whatever they want with you..", "needyOfferSelf")
		addAction("Complain", "Complain that you are extremely needy!", "needyComplain")
		# Obedience check
		if(obedience < 0.2):
			addDisabledAction("Be milked", "You're not obedient enough to ask to be milked an extra time")
		else:
			addAction("Be milked", "Ask the owners to milk you an extra time", "needyMilk")
		if(cowTrust > 0.1):
			if(GM.pc.getStamina() > 0):
				addAction("Milk Cow", "Help with milking the cow", "talkCowMilk")
			else:
				addDisabledAction("Milk Cow", "You don't have any stamina left")
		if(bullTrust > 0.1):
			if(GM.pc.getStamina() > 0):
				addAction("Milk Bull", "Help with milking the bull", "talkBullMilk")
			else:
				addDisabledAction("Milk Bull", "You don't have any stamina left")
		
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
		#setState("test")
		addContinue("startEvent", ["test"])
	else:
		addContinue("setState", ["main"])

func addNextIdleStageButton():
	addContinue("nextIdle")

func main_do(_id:String, _args:Array):
	if(_id.begins_with("idle") || _id.begins_with("talk") || _id.begins_with("eat") || _id.begins_with("needy")):
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
		GM.pc.clearBodyFluids()
		GM.pc.clearBodywritings()
		GM.pc.clearTallymarks()
		#GM.pc.afterTakingAShower()
		saynn("YOU ASK TO BE WASHED.")
		
		if(RNG.chance(50)):
			saynn("THE GIRL SHOVES YOU AGAINST THE GARDEN'S WALL AND WASHES YOUR BUTT WITH A STRONG STREAM OF WATER FROM A HOSE.")
			talk(C_GIRL, "TURN AROUND.")
			saynn("YOU DO SO AND LET HER WASH YOUR FRONT TOO.")
		else:
			saynn("THE GUY BRINGS YOU OUT INTO THE FIELD AND CAREFULLY WASHES YOUR BODY, HOSE IN ONE HAND, SPONGE IN ANOTHER.")
			talk(C_GUY, "THERE WE GO. MUCH BETTER, EH?")
		triggerEventMaybe()
	if(_id == "idlePeek"):
		aimCamera(L_COUNTER)
		if(peekState == PEEK_START):
			saynn("You stand high on your toes and peek into the small slit of a window on the top of the reinforced door.")
			addStamina(-10)
			saynn("It's dirty and cloudy.. and thick enough to not let out any sound.")
			saynn("Hard to see much.. the counter blocks most of the view. But you do see some nice tables with pink cloths laid out on them.. wide sofa-like chairs.. and a few customers.")
			saynn("You wave to try to get some attention.. but no one can see you. Someone is gotta help you, they just have to notice you..")
			saynn("Soon, you give up.")
			saynn("While looking through the small crack between the door and the frame.. you notice that there is a [b]padlock[/b] on the other side. You can't reach it.. but you can try to break it from this side.")
			saynn("The bull sees you.")
			talk(C_BULL, "That is a very dumb idea.")
			saynn("You shrug.")
			talk(C_BULL, "Don't let me stop you though. This world was built on dumb ideas.")
			saynn("Sofie is approaching the door so you dash away while you still can.")
			peekState = PEEK_NOTICED_PADLOCK
			peekTried = 0
		else: #PEEK_NOTICED_CUSTOMER
		#elif(peekState == PEEK_NOTICED_PADLOCK):
			peekTried += 1
			saynn("You stand high on your toes and peek into the small window.")
			addStamina(-10)
			
			saynn(RNG.pick([
				"Sofie's back blocks the view completely, she is standing behind the counter. You can't see anything past her.",
				"There are a few customers around.. But all of them are sitting behind the tables, casually chatting with each other or staring into their datapads. If only any of them would look your way..",
				"You see Leo working as a waiter, serving tables. Sofie is preparing a meal for someone. Could be a fly-through, you don't see anyone sitting behind the tables.",
				"All of the tables seem to be empty, no customers around.",
				"You notice pure void of space behind the cafe's reinforced glass panels.. Even if you escape, where are you gonna go..",
				"There are some customers so you do your best to get their attention, waving and tapping.",
			]))
			
			if(peekState == PEEK_NOTICED_PADLOCK && RNG.chance(-5+peekTried*4)):
				peekTried = 0
				peekState = PEEK_NOTICED_CUSTOMER
				saynn("YOU NOTICE SOMEONE STANDING IN FRONT OF THE COUNTER.")
				saynn("HE IS WEARING EXPENSIVE CLOTHES.")
				saynn("IT FEELS LIKE HE HAS [b]NOTICED YOU[/b].. MAYBE..")
			else:
				var special:String = RNG.pickWeightedDict({
					"": 100.0, "guy": 10.0, "girl": 10.0,
				})
				if(special == "guy"):
					playAnimation(StageScene.Duo, "stand", {npc=C_GUY})
					saynn("Leo suddenly steps through the door.")
					talk(C_GUY, "Excuse me, coming through.")
					saynn("He almost just walks past you.. but then he stops.")
					talk(C_GUY, "Wait. Step away from the door please.")
					addObedience(-1)
				if(special == "girl"):
					playAnimation(StageScene.Duo, "defeat", {npc=C_GIRL})
					saynn("The door hits your nose as Sofie suddenly opens it!")
					addPain(20)
					talk(C_GIRL, "Why are you so dumb? Don't make me punish you.")
					addObedience(-1)
				
		triggerEventMaybe()
	if(_id == "idleSmash"):
		aimCamera(L_DOOR)
		
		saynn("You wait for a good moment and hit the door!")
		addStamina(-30)
		
		addPadlockDamage(RNG.randf_range(1.0, 3.0))

		var special:String = RNG.pickWeightedDict({
			"": 100.0, "guy": 10.0, "cuffs": 10.0,
		})
		if(special == "guy"):
			playAnimation(StageScene.Duo, "stand", {npc=C_GUY})
			saynn("A few seconds later, Leo steps out.")
			talk(C_GUY, "Hey. Uh. Can you stop?")
			saynn("At least you got out easy.")
			addObedience(-1)
		if(special == "girl"):
			playAnimation(StageScene.Duo, "defeat", {npc=C_GIRL})
			saynn("A few moments later, Sofie open the door and pins you to the floor.")
			addPain(5)
			talk(C_GIRL, "Stop doing that, you stupid whore.")
			saynn("She pulls out some cuffs and locks them around your ankles!")
			GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))
			addObedience(-2)
		
		triggerEventMaybe()
	if(_id == "idleCowBreasts"):
		aimCamera(L_COW)
		playAnimation(StageScene.BreastGroping, "grope", {pc="pc", npc="psmilka"})
		
		milkaExtraBreastSize += 1
		updateCharacters()
		
		saynn(RNG.pick([
			"You grab the cream tube from Milka's hands and begin to carefully apply it all around her breasts and nipples.",
		]))
		addStamina(-20)
		talk(C_COW, RNG.pick([
			"Ohh, feels funny!",
			"Feels nice..",
			"I can feel something already..",
			"Thank you for helping!",
		]))
		saynn("The process takes a while so you have a little chat in the process.")
		addCowTrust(1)
		sayMilkaLine()
		saynn(RNG.pick([
			"Eventually, you notice Milka's breasts getting fuller and rounder! They clearly got bigger.",
		]))
		if(milkaExtraBreastSize > 5 && !helpedMilka):
			helpedMilka = true
			talk(C_COW, RNG.pick([
				"Thank you, thank you, thank you! My titties look so much better now! I can make so much milk~.",
			]))
			saynn("Milka seems to be satisfied with this size.. but the tube isn't empty yet.")
			talk(C_COW, "You can apply it more if you want.. But I just feel bad for taking up so much of your time.. Can I give back?")
			addCowTrust(5)
			addAction("It's okay", "You are happy that you helped Milka and that's all that you needed", "setState", ["main"])
			addAction("Breastfeed", "Feed on Milka's breasts!", "milkaRewardBreastfeed")
			addAction("Breed her", "Fuck Milka with your cock or a strapon!", "milkaRewardBreed")
		
		elif(GM.pc.getBreastsSize() < BreastsSize.O):
			talk(C_COW, RNG.pick([
				"Ah.. Thank you! I can use it on you too if you want!",
			]))
			saynn("You read the small text on the tube. It says that the change is instant and permanent.")
		
			triggerEventMaybe()
			addAction("Your breasts", "Allow Milka to use the cream on your breasts, making them bigger!", "milkaUseCreamOnPC")
		else:
			talk(C_COW, RNG.pick([
				"Ah.. I'm a better cow now.",
			]))
			triggerEventMaybe()
	if(_id == "milkaUseCreamOnPC"):
		playAnimation(StageScene.BreastGroping, "grope", {pc="psmilka", npc="pc", npcBodyState={hard=true}})
		saynn("You agree, letting Milka use the special cream on your {pc.breasts}.")
		saynn("It still takes a while so you chat some more.")
		var theBreasts:BodypartBreasts = GM.pc.getBodypart(BodypartSlot.Breasts)
		if(theBreasts):
			theBreasts.size += 1
			theBreasts.processTime(0)
		sayMilkaLine()
		saynn("Eventually, you begin to feel your chest twitching! A little gasp escapes your lips as you feel your breasts getting bigger!")
		talk(C_COW, "There we go!")
		triggerEventMaybe()
	if(_id == "milkaRewardBreed"):
		playAnimation(StageScene.SexMatingPress, "fast", {pc="pc", npc="psmilka", pcCum=true, bodyState={hard=true,naked=true}})
		var _withStrapon:bool = addStrapon(C_PC, C_BULL)
		
		if(!_withStrapon):
			saynn("Yeah, seeing Milka's flushed face and soft, needy body.. it gives you a wild idea. You carefully push her down to the floor.")
			talk(C_PC, "Let's see how you take it, Milka.")
			saynn("She gasps, ears flicking and tail twitching as you grab her thighs and spread them wide.")
			talk(C_COW, "moo~?..")
			saynn("You raise her legs high, pinning them up to her shoulders. Her slick pussy shines as you line your hard shaft up with her needy entrance.")
			saynn("With a rough thrust, you push deep into her slit, making Milka cry out a desperate moan.")
			talk(C_COW, "Ahhh~! Mooo~..")
			saynn("Your hips slam into hers, your {pc.penis} pounding her pussy with steady, rough thrusts. Her big milky breasts bounce with every thrust, her nipples already leaking drops of strawberry-scented milk.")
			talk(C_PC, "That's it.. take it, cowgirl.")
			saynn("You grip her legs tighter and go faster, hammering her pussy, the tip of your cock pushing on her most sensitive spots until she’s squirming under you.")
			talk(C_COW, "Ahhh.. ahhh.. moo~.. it’s too much!")
			saynn("Milka’s body arches, her breasts shaking and spraying milk as her pussy clenches around you, her orgasm hitting hard. You feel her walls milking your cock, forcing your own climax.")
			talk(C_PC, "Nghhh..")
			saynn("With one final, deep thrust, you bury yourself to the hilt and start pumping her womb with your hot seed. Thick ropes of {pc.cum} flood her, mixing with her pussy juices.")
			saynn("Milka cries out in pleasure, her nipples squirting more sweet milk while her body trembles beneath you, her tail curling tight.")
			talk(C_COW, "Mmmhh~.. s-so warm.. moo..")
			saynn("You stay inside her for a few moments, panting heavily before finally pulling out. A mix of cum and milk drips from her as she lies there, satisfied and glowing.")
			talk(C_PC, "Good girl.")
			talk(C_COW, "Thank you.. for filling me.. ahh..")
			saynn("You sit beside her, resting for a bit while stroking her hair.")
		else:
			saynn("Yeah, seeing Milka's flushed face and soft, needy body.. it gives you a wild idea. You carefully push her down to the floor and go grab one of the strapon harnesses from the milking equipment shelf.")
			talk(C_PC, "Let's see how you take it, Milka.")
			saynn("She gasps, ears flicking and tail twitching as you grab her thighs and spread them wide.")
			talk(C_COW, "moo~?..")
			saynn("Before climbing on top of her, you secure that harness around your waist.")
			saynn("You then raise Milka's legs high, pinning them to her shoulders as the slick tip of your prelubed toy presses against her needy entrance.")
			talk(C_PC, "Ready to be bred, cowgirl?")
			saynn("With a smooth, forceful thrust, you push deep into her slit, making Milka cry out a desperate moan.")
			talk(C_COW, "Ahhh~! Mooo~..")
			saynn("Your hips slam into hers, your strapon pounding her pussy with steady, rough thrusts. Her big milky breasts bounce with every movement, her nipples leaking sweet strawberry-scented milk.")
			talk(C_PC, "That's it.. take it, cowgirl.")
			saynn("You grip her legs tighter and go faster, hammering her pussy, the toy’s tip grazing her most sensitive spots until she’s squirming beneath you.")
			talk(C_COW, "Ahhh.. ahhh.. moo~.. it’s too much!")
			saynn("Milka’s body arches, her breasts shaking and spraying milk as her pussy clenches around the toy's shaft, her orgasm hitting hard. The sudden tightness triggers the hidden mechanism in the strapon.")
			saynn("With a faint hum, the toy starts pumping warm seed deep into her womb, releasing thick ropes of cum-like fluid that mix with her juices.")
			saynn("Milka moans loudly, her nipples squirting more sweet milk while her body trembles beneath you, her tail curling tight as she’s filled.")
			talk(C_COW, "Mmmhh~.. s-so warm.. moo..")
			saynn("You keep the strapon buried inside her for a few moments, watching her chest rise and fall before slowly pulling out. A mix of cum and milk drips from her pussy as she lies there, glowing and satisfied.")
			talk(C_PC, "Good girl.")
			talk(C_COW, "Thank you.. for filling me.. ahh..")
			saynn("You sit beside her, resting for a bit while stroking her hair.")
		
		if(_withStrapon):
			GlobalRegistry.getCharacter(C_COW).cummedInVaginaBy(C_PC, FluidSource.Strapon)
		else:
			GlobalRegistry.getCharacter(C_COW).cummedInVaginaBy(C_PC)
		GM.pc.orgasmFrom(C_COW)
		
		addContinue("setState", ["main"])
		
	if(_id == "milkaRewardBreastfeed"):
		playAnimation(StageScene.BreastFeeding, "feed", {pc="psmilka", npc="pc"})
		
		saynn("Yeah, seeing Milka's new tits.. it gives you an idea. You kneel before her and reach towards her new lovely big mounds.")
		talk(C_PC, "Mind if I taste them?")
		saynn("Milka blushes, her ears perking. She parts her legs and tilts her torso back, offering her heavy chest for you to play with.")
		talk(C_COW, "Moo~. Anything for you, sweet friend.")
		saynn("Leaning in, you wrap your lips around one swollen nipple, gently squeezing it between your teeth.")
		saynn("A warm, sweet milk spurts into your mouth, tasting of fresh strawberries. Your hand cups the other breast, groping and kneading its heavy form.")
		talk(C_COW, "Ah..")
		saynn("Milka shudders, her tail swishing as she moans softly. You switch breasts, latching onto the other nipple and suckling deeply, coaxing another stream of milky sweetness.")
		saynn("Your fingers knead and pinch, playing with her hardened nipples as they release more and more of that tasty strawberry-flavored milk into your mouth.")
		talk(C_COW, "Ah.. more.. yes.. moo..")
		saynn("Each swallow brings a shiver through her body. She throws her head back and lets out more encouraigng moans as her pussy gets wetter after each second.")
		talk(C_COW, "Mmhh.. ahh-hh~..")
		saynn("A series of quick convulses rocks through her body, her needy pussy slit pulsing as her nips squirt with more of that tasty goodness.")
		saynn("After you’ve drained both breasts, you lean back, licking stray droplets from your lips. Milka sighs, satisfied, her eyes half-closed from pleasure.")
		talk(C_PC, "Your milk tastes nice.")
		talk(C_COW, "Thank you.. for making me feel so.. good.")
		saynn("You sit together in the warm glow, her chest rising and falling as she tries to get her breathing back.")
		
		GlobalRegistry.getCharacter(C_COW).milk()
		
		addPain(-100)
		addStamina(100)
		addContinue("setState", ["main"])
	
	if(_id == "idleBullCage"):
		aimCamera(L_BULL)
		playAnimation(StageScene.ChairOral, "rub", {pc="pspip", npc="pc"})
		
		saynn(RNG.pick([
			"You inspect Pip's chastity cage and try to wiggle it off.",
			"You grip the base of Pip's cage and give it a firm twist, trying to loosen its hold on his sheath.",
			"You slide your nail into the lock of Pip's chastity cage and try to turn it.",
			"You find a little rock in the garden and start to carefully hit the lock of Pip's chastity cage.",
			"You sharpen a twig that you have found in the garden and try to use it as a lockpick inside Pip's chastity cage.",
			"You get a good grip on the metal pieces of Pip's chastity cage and use your full strength to try to bend them.",
		]))
		cageDamage += RNG.randf_range(0.1, 0.2)
		addStamina(-20)
		addBullTrust(1)
		
		sayPipLine()
		
		if(cageDamage >= 1.0):
			saynn("Miraculously, you [b]manage to break the lock[/b]! It's pieces fall onto the ground.")
			talk(C_BULL, "Ah..")
			saynn("Carefully, you start tugging on the cage itself, trying to pull it off.. but something is still preventing that. Pip's throbbing cock is desperately trying to get hard.")
			talk(C_BULL, "Fuck.. Really? How the fuck is it still stuck. I'm just destined to stay a femboy fucktoy, aren't I?")
			saynn("You were just about ready to give up.. but you notice how Pip's trapped horsecock slowly bends the metal more and more, trying to become erect.")
			saynn("If you can't pull off his cage.. Maybe you can make his cock do it by getting him even more horny.")
			
			addAction("Tease", "Keep teasing him about the chastity cage", "cageTeaseUnlock")
			addAction("Anal", "Fuck his ass (or peg him with a strapon) to try to help him!", "cageAnalFuck")
			#addAction("Sit on face", "Sit on his face to try to get him hard enough!", "cageSitOnFace")
			return
		#	cageRemoved = true
		#	updateCharacters()
		else:
			if(cageDamage < 0.35):
				saynn("Not much has changed. You have to keep trying.")
			elif(cageDamage < 0.7):
				saynn("The cage is giving way, you can feel it. There is more and more wiggle room after each try.")
			else:
				saynn("It feels like the cage will snap soon. You're almost there.")
		triggerEventMaybe()
	if(_id == "cageAnalFuck"):
		cageRemoved = true
		updateCharacters()
		var _wornStrapon:bool = addStrapon(C_PC)
		playAnimation(StageScene.SexLowDoggy, "fast", {pc="pc", npc="pspip", pcCum=true, npcCum=true, bodyState={hard=true}, npcBodyState={hard=true}})

		if(!_wornStrapon):
			saynn("You decide to help him. With a firm hand, you shove Pip onto the floor, his belly down and ass up.")
			talk(C_PC, "Let's try this, stud.")
			saynn("Pip's eyes widen as you press your hard cock against his slick, trembling asshole.")
			talk(C_BULL, "W-wait.. what are you..")
			saynn("You grip his hips, lifting them just enough to line yourself up perfectly. His tail whips as you tease the tip against his rim.")
			talk(C_PC, "Relax.. you love this, don't you?")
			saynn("With a smooth thrust, you drive deep into Pip’s tight asshole. He gasps, back arching, his locked cage rattling against the floor.")
			saynn("Your cock sinks in and out, massaging his prostate. Each your thrust pulls cute moans out from him.")
			talk(C_BULL, "Ahh.. f-fuck.. so rough..")
			saynn("You don't give him any time to process it, increasing the pace. Your hand grabs his hair and yanks back on it.")
			saynn("Precum drips from the tip of the cage as his ass clenches around you, the tension building until it’s almost unbearable.")
			talk(C_PC, "That’s it.. be a good girl and cum for me.")
			saynn("Pip’s cock twitches violently, the cage bending under the strain. With one final, hard thrust, his [b]member breaks free[/b], bars of his cage snapping apart from the sheer power of his erection!")
			saynn("When freed, his flared horsecock springs to full hardness in seconds before bursting with a thick, virile blast of seed!")
			saynn("Thick ropes of cum land all across the floor as Pip moans in bliss, his body shaking hard as you pump his full of your spunk.")
			talk(C_BULL, "F-fuck! Ah! Ahhh-h!..")
			talk(C_PC, "Holy shit, it worked.")
			saynn("Even the owners come to check on all the noise.")
			talk(C_GIRL, "What the hell is going on out here?")
			talk(C_GUY, "Looks like they found a way to take off the cage.")
			talk(C_GIRL, "Could have put a bucket under him at least, fuck.")
			saynn("They could have been more happy about it.. but oh well. At least Pip seems to be enjoying it.")
			talk(C_BULL, "T-thank you.. hh-hh..")
			saynn("You smile, watching Pip’s spent form, your chest rising and falling with satisfaction.")
		else:
			saynn("You decide to help him. First, you go and grab a strapon harness from the milking equipment storage before securing it around your hips and applying a thick layer of lube onto its rubber shaft.")
			saynn("Then with a firm hand, you shove Pip onto the floor, his belly down and ass up.")
			talk(C_PC, "Let's try this, stud.")
			saynn("Pip's eyes widen as you press your new rubber cock against his slick, trembling asshole.")
			talk(C_BULL, "W-wait.. what are you..")
			saynn("You grip his hips, lifting them just enough to line yourself up perfectly. His tail whips as you tease the tip against his rim.")
			talk(C_PC, "Relax.. you love this, don't you?")
			saynn("With a smooth thrust, you drive the strapon deep into Pip’s tight asshole. He gasps, back arching.")
			saynn("Your rubber cock sinks in and out, massaging his prostate. Each of your thrusts pulls cute moans out from him.")
			talk(C_BULL, "Ahh.. f-fuck.. so rough..")
			saynn("You don't give him any time to process it, increasing the pace. One hand grabs his hair and yanks back on it as you hammer into him.")
			saynn("Precum drips from the tip of his locked cage as his ass clenches around your toy, the tension building until it’s almost unbearable.")
			talk(C_PC, "That’s it.. be a good girl and cum for me.")
			saynn("Pip’s cock twitches violently inside its cage, the metal bending under the strain. With one final, hard thrust of your hips, his [b]cage snaps apart[/b] from the sheer power of his erection!")
			saynn("When freed, his flared horsecock springs to full hardness in seconds before bursting with a thick, virile blast of seed!")
			saynn("Thick ropes of cum land all across the floor as Pip moans in bliss, his body shaking hard.")
			talk(C_BULL, "F-fuck! Ah! Ahhh-h!..")
			talk(C_PC, "Holy shit, it worked.")
			saynn("Even the owners come to check on all the noise.")
			talk(C_GIRL, "What the hell is going on out here?")
			talk(C_GUY, "Looks like they found a way to take off the cage.")
			talk(C_GIRL, "Could have put a bucket under him at least, fuck.")
			saynn("They could have been more happy about it.. but oh well. At least Pip seems to be enjoying it.")
			talk(C_BULL, "T-thank you.. hh-hh..")
			saynn("You smile, watching Pip’s spent form, your chest rising and falling with satisfaction.")
		
		GlobalRegistry.getCharacter(C_BULL).cummedInAnusBy(C_PC)
		GM.pc.orgasmFrom(C_BULL)
		addBullTrust(5)
		addContinue("setState", ["main"])
		
	if(_id == "cageTeaseUnlock"):
		cageRemoved = true
		updateCharacters()
		playAnimation(StageScene.ChairOral, "tease", {pc="pspip", npc="pc", pcCum=true, bodyState={hard=true}})
		
		saynn("Time to help him. You stop messing with his cage and just look up at him.")
		talk(C_PC, "I guess you are right.")
		saynn("He tilts his head.")
		talk(C_BULL, "Huh?")
		talk(C_PC, "I guess you are destined to be someone's slut.")
		saynn("Pip sighs.. you notice his locked member twitching slightly.")
		talk(C_PC, "It's not that bad. I'm sure you will grow to like it.")
		talk(C_BULL, "What do you mean?")
		talk(C_PC, "You love cumming from your prostate getting smashed already, don't you?")
		saynn("He frowns.. but his cock twitches more, putting extra pressure onto his cage.")
		talk(C_BULL, "I'm a stud!")
		talk(C_PC, "Just face it. Your cock is locked away forever. It's no better than a clit. You're a girl, not a stud.")
		saynn("Precum is flowing down from the tip of his cage. Pip is squirming hard, his throbbing attempt at an erection is bending the metal more and more!")
		talk(C_BULL, "H-hey, d-don't say that.")
		talk(C_PC, "Your clitty is dripping, slut. You love it, admit it. You love getting fucked like a girl.")
		saynn("Suddenly, with a loud ping, the top part of his chastity cage flies off, instantly revealing his rock-hard flared shaft of a meaty horsecock. Wow.")
		talk(C_BULL, "Ahh-h-h!..")
		saynn("Pip sees it and gasps, grabbing onto the chair while his cock is still throbbing.. before suddenly shooting out a thick virile load of his seed! Strings after strings of cum fly through the air in beatiful arcs as he moans like a slut, his body unable to calm itself down, his head thrown back.")
		talk(C_PC, "Holy shit, it worked.")
		talk(C_BULL, "Mhh-h.. ah.. ghh-h.. ah-hh..")
		saynn("Even the owners come to check on all the noise.")
		talk(C_GIRL, "Really? You've hit pure oil and your lazy ass couldn't put a bucket under that stream?")
		talk(C_GUY, "But at least his cage is off, Sofie. Milking him is gonna be easier.")
		saynn("Sofie grumbles and walks away.")
		talk(C_BULL, "Shit.. so much. T-thank you..")
		saynn("You smile and nod.")
		addBullTrust(5)
		addContinue("setState", ["main"])
	
	if(_id == "idleStruggle"):
		var struggleData:Dictionary = GM.pc.doStruggleOutOfRestraints(false, false, null, 5.0)
		if(struggleData.empty()):
			return
		var text:String = struggleData["text"] if struggleData.has("text") else "[color=red]ERROR? No struggle text provided[/color]"
		saynn(text)
		
		if(struggleData.has("animation")):
			playAnimation(StageScene.Solo, struggleData["animation"])
		if(struggleData.has("lust") && struggleData["lust"] > 0):
			GM.pc.addLust(struggleData["lust"])
		if(struggleData.has("pain") && struggleData["pain"] > 0):
			addPain(struggleData["pain"])
		addStamina(-30)
		#if(struggleData.has("stamina") && struggleData["stamina"] != 0):
		#	sub.addStamina(-struggleData["stamina"])
		
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
		saynn("You spend some time hanging out with the cow.")
		addCowTrust(1)
		sayMilkaLine()
		
		if(cowTrust >= 0.05 && !canHelpMilka):
			canHelpMilka = true
			saynn("Before you go..")
			talk(C_COW, "OH!")
			saynn("You stop and watch her pull some kind of.. cream tube.")
			talk(C_COW, "The owner bought it for me. But he is too busy running the cafe to apply it.")
			saynn("You read the effects.. estrogen, prolactin.. apparently this cream is supposed to help with the lactation. Needs to be applied directly to the breasts.")
			talk(C_COW, "I'm too afraid to use it myself, I'm just a cow!")
		
		triggerEventMaybe()
	if(_id == "talkBull"):
		playAnimation(StageScene.Duo, "stand", {npc=C_BULL})
		aimCamera(L_BULL)
		saynn("You spend some time hanging out with the bull.")
		addBullTrust(1)
		sayPipLine()
		
		if(bullTrust >= 0.05 && !canHelpCage):
			canHelpCage = true
			saynn("Before you go, he shows you his chastity cage. His locked away cock is pulsing hard inside its tight little prison.")
			talk(C_BULL, "It's been there for at least a few months. I'm fucking desperate. Maybe you can try to do something? If you have the time.")
			saynn("A caged bull just isn't right. On the other hand, maybe that's just his fate now.")
		
		triggerEventMaybe()
	if(_id == "talkAnnoy"):
		saynn(RNG.pick([
			"You bang on the door to annoy your owners.",
			"You annoy the owners while they get something from their little garden.",
			"You annoy the owners while they check on the bull and the cow.",
			"You annoy the owners while they are busy washing the other livestock.",
		]))
		addObedience(-1)
		var special:String = RNG.pickWeightedDict({
			"treat": 5.0,
		})
		if(special == "treat"):
			playAnimation(StageScene.Duo, "stand", {npc=C_GUY})
			saynn("Leo walks up to you.")
			talk(C_GUY, "Sofie really doesn't like that you're making so much noise.")
			saynn("His hand produces a slice of an apple.")
			talk(C_GUY, "If I give you a treat, will you behave?")
			saynn("You nod, obviously. The guy hands you the treat.")
			addTreat(1)
		
		triggerEventMaybe()
	if(_id == "talkCowMilk"):
		saynn("You make Milka an offer to milk her. She agrees.")
		milkScene(C_PC, C_COW)
		addStamina(-40)
		addCowTrust(3)
		triggerEventMaybe()
	if(_id == "talkBullMilk"):
		saynn("You make Pip an offer to milk him. He agrees.")
		milkScene(C_PC, C_BULL)
		addStamina(-40)
		addBullTrust(3)
		triggerEventMaybe()
	if(_id == "eatGrass"):
		aimCamera(L_EAT)
		saynn("You eat some grass.")
		addStamina(30)
		addObedience(1)
		if(RNG.chance(20)):
			saynn("Milka does the same nearby, chewing on some grass blades.")
			talk(C_COW, "Tasty, isn't it?")
			saynn("You.. nod.")
			addCowTrust(1)
		triggerEventMaybe()
	if(_id == "eatStarve"):
		saynn("Anything is better than eating grass. You decide to just starve.")
		addStamina(-30)
		if(GM.pc.getStamina() <= 0):
			saynn("Ow.. Your belly hurts..")
			addPain(20)
		if(treatAmount <= 0 && RNG.chance(20)):
			playAnimation(StageScene.Duo, "stand", {npc=C_GUY})
			saynn("Leo approaches you and hands you a carrot..")
			talk(C_GUY, "I know the grass isn't what you normally eat. But don't starve yourself, okay? Don't tell Sofie.")
			saynn("Free treat, hey.")
			addTreat(1)
		triggerEventMaybe()
	if(_id == "eatDemand"):
		saynn("You demand to be fed normal food!")
		addObedience(-1)
		saynn("The owners don't seem to care. Looks like you're starving..")
		addStamina(-30)
		triggerEventMaybe()
	if(_id == "eatTreat"):
		saynn("You eat a treat! It was very tasty.")
		addStamina(100)
		addPain(-100)
		saynn("But, soon, it ended.")
		addTreat(-1)
		
		if(RNG.chance(30)):
			saynn("Milka drools while watching you.")
			if(treatAmount > 0):
				saynn("You just can't watch Milka's puppy eyes.. You have a spare treat so you decide to give it to her.")
				talk(C_COW, "For me? Thank you-u-u~!")
				addCowTrust(2)
				addTreat(-1)
				
		if(RNG.chance(20)):
			saynn("Pip sighs.")
			talk(C_BULL, "Did they bought you with just treats?")
			saynn("You can hear some jealousy in his voice.")
			addBullTrust(-1)
		
		triggerEventMaybe()
	if(_id == "needyMilk"):
		saynn("You ask to be milked an extra time..")
		addObedience(1)
		milkScene(RNG.pick([C_GUY, C_GIRL]), C_PC)
		triggerEventMaybe()
	if(_id == "needyRest"):
		saynn("You decide to just chill..")
		addStamina(20)
		
		#GM.pc.orgasmFrom("pc")
		triggerEventMaybe()
	if(_id == "needyOfferSelf"):
		saynn("You decide to offer your body to the owners..")
		
		saynn("Who do you want to fuck you?")
		
		setState("needySex")
		addAction("Leo", "Let the guy fuck you", "startSex", [C_GUY, C_PC])
		addAction("Sofie", "Let the girl fuck you", "startSex", [C_GIRL, C_PC])
	if(_id == "needyComplain"):
		saynn("You complain about your neediness!")
		addObedience(-1)
		triggerEventMaybe()
	
	if(_id == "startEvent"):
		setState(_args[0])

func needySex_sexResult(_sex:SexEngineResult):
	saynn("The sex has ended!")
	addObedience(1)
	
	if(RNG.chance(30)):
		saynn("The owner gave you a treat!")
		addTreat(1)
	
	addContinue("setState", ["main"])

func sleep_state():
	aimCamera(L_SLEEP)
	saynn("TIME TO SLEEP")
	
	onDayEnd()
	
	addAction("Sleep", "Time to sleep", "sleep")

func sleep_do(_id:String, _args:Array):
	if(_id == "sleep"):
		GM.main.startNewDay()
		saynn("NEW DAY.")
		addStamina(20)
		addPain(-50)
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
	addChar(_actorID)
	addChar(_targetID)
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
	var _canMilkProstate:bool = (_target.hasReachablePenis() || _target.isWearingChastityCage())
	if(_isPCTarget && !agreeSeed):
		_canMilkPenis = false
		_canMilkProstate = false
	var _canUsePumps:bool = (upgradeLevel >= UPGRADE_PUMPS)
	
	var possible:Array = []
	
	if(_canMilkBreasts && _canMilkPenis):
		possible.append(["gropeAndStroke", 1.0])
	elif(_canMilkBreasts):
		possible.append(["grope", 1.0])
	if(_canMilkBreasts):
		if(upgradeLevel >= UPGRADE_PUMPS):
			possible.append(["breastpumps", 3.0])
		if(upgradeLevel >= UPGRADE_STALL):
			possible.append(["milkstall", 5.0])
			possible.append(["milkstallpumps", 5.0])
		if(upgradeLevel >= UPGRADE_FUCKMACHINE):
			possible.append(["milksybian", 8.0])
		if(upgradeLevel >= UPGRADE_MILKINGTABLE):
			possible.append(["milkmachine", 12.0])
	if(_canMilkPenis):
		possible.append(["stroke", 1.0])
		if(upgradeLevel >= UPGRADE_PUMPS):
			possible.append(["penispump", 3.0])
		if(upgradeLevel >= UPGRADE_STALL):
			possible.append(["stallpenispump", 5.0])
	if(_canMilkProstate):
		possible.append(["fingering", 0.5])
		possible.append(["pegging", 0.5])
		if(upgradeLevel >= UPGRADE_FUCKMACHINE):
			possible.append(["fuckmachineseed", 8.0])
		if(upgradeLevel >= UPGRADE_MILKINGTABLE):
			possible.append(["fingeringsmarttable", 4.0])
			possible.append(["peggingsmarttable", 4.0])
			possible.append(["seedmilkmachine", 4.0])
	
	if(possible.empty()):
		sayParsed("Game couldn't figure out how to milk {target.you}!")
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
		playAnimation(StageScene.BreastGroping, "stroke", {pc=_actorID, npc=_targetID, milkTank=true, npcCum=true, npcBodyState={naked=true,hard=true}})
		sayParsed("{actor.You} {actor.youVerb('bring')} {target.you} down to the floor and {actor.youVerb('milk')} {target.yourHis} {target.breasts} with one hand while stroking {target.yourHis} {target.penis} with another!")
	if(milkWay == "grope"):
		shouldMilkBreasts = true
		playAnimation(StageScene.BreastGroping, "grope", {pc=_actorID, npc=_targetID, milkTank=true, npcCum=true, npcBodyState={naked=true,hard=true}})
		sayParsed("{actor.You} {actor.youVerb('guide')} {target.you} down onto the floor and {actor.youVerb('milk')} {target.yourHis} {target.breasts} with both hands, letting every drop flow into the tank!")
		if(_canUsePumps && _canMilkPenis && addPenisPump(_targetID)):
			shouldMilkPenis = true
			sayParsed("At the same time, a penis pump drains {target.yourHis} balls!")
	if(milkWay == "stroke"):
		shouldMilkPenis = true
		#playAnimation(StageScene.ChairOral, "stroke", {pc=_targetID, npc=_actorID, pcCum=true, bodyState={naked=true,hard=true}})
		playAnimation(StageScene.Grope, "strokefast", {pc=_targetID, npc=_actorID, milkTank=true, pcCum=true, pcBodyState={naked=true,hard=true}})
		sayParsed("{actor.You} {actor.youVerb('lock')} eyes with {target.you} as {actor.youVerb('proceed')} to stroke {target.yourHis} {target.penis} in slow, firm strokes until {target.yourHis} seed splatters into the collection container!")
		if(_canUsePumps && _canMilkBreasts && addBreastPump(_targetID)):
			shouldMilkBreasts = true
			sayParsed("At the same time, two breast-pumps hum away at {target.yourHis} {target.breasts}, pulling out {target.milk}!")
	if(milkWay == "fingering"):
		shouldMilkPenis = true
		playAnimation(StageScene.SexFisting, "fast", {pc=_actorID, npc=_targetID, npcCum=true, npcBodyState={naked=true,hard=true}})
		sayParsed("{actor.You} {actor.youVerb('position')} {target.you} on all fours, then {actor.youVerb('slide')} {actor.yourHis} fingers deep to tease {target.yourHis} prostate, pumping until {target.yourHis} {target.penis} spurts hot seed into the waiting container!")
		if(_canUsePumps && _canMilkBreasts && addBreastPump(_targetID)):
			shouldMilkBreasts = true
			sayParsed("At the same time, two breast-pumps hum away at {target.yourHis} {target.breasts}, pulling out {target.milk}!")
	if(milkWay == "pegging"):
		shouldMilkPenis = true
		if(addStrapon(_actorID)):
			playAnimation(StageScene.SexFreeStanding, "fast", {pc=_actorID, npc=_targetID, pcCum=true, npcCum=true, bodyState={naked=true,hard=true}, npcBodyState={naked=true,hard=true}})
			sayParsed("{actor.You} {actor.youVerb('wear')} a strapon and {actor.youVerb('start')} pegging {target.your} ass with it, the rubber toy pressing deep to tease and stimulate {target.yourHis} prostate! More and more seed trickles down from {target.yourHis} {target.penis} into the seed tank.")
		else:
			playAnimation(StageScene.SexFreeStanding, "fast", {pc=_actorID, npc=_targetID, pcCum=true, npcCum=true, bodyState={showPenis=true,hard=true}, npcBodyState={naked=true,hard=true}})
			sayParsed("{actor.You} {actor.youVerb('grab')} {target.you} and {actor.youVerb('line')} {actor.yourHis} cock against {target.yourHis} slick asshole, then {actor.youVerb('ram')} in, every thrust aiming straight for {target.yourHis} prostate! More and more seed trickles down from {target.yourHis} {target.penis} into the seed tank.")
		if(_canUsePumps && _canMilkBreasts && addBreastPump(_targetID)):
			shouldMilkBreasts = true
			sayParsed("At the same time, two breast-pumps hum away at {target.yourHis} {target.breasts}, pulling out {target.milk}!")
	if(milkWay == "breastpumps"):
		shouldMilkBreasts = true
		addBreastPump(_targetID)
		playAnimation(StageScene.Cuddling, "squirm", {pc=_actorID, npc=_targetID, npcCum=true, npcBodyState={naked=true, hard=true}})
		sayParsed("{actor.You} {actor.youVerb('hold')} {target.you} close while two breast-pumps are working away on {target.yourHis} {target.breasts}, humming as they draw every drop of {target.milk} into their internal reservoirs!")
		if(_canUsePumps && _canMilkPenis && addPenisPump(_targetID)):
			shouldMilkPenis = true
			sayParsed("At the same time, a penis pump drains {target.yourHis} balls!")
	if(milkWay == "penispump"):
		shouldMilkPenis = true
		addPenisPump(_targetID)
		playAnimation(StageScene.SybianOral, "hold", {pc=_targetID, npc=_actorID, nosybian=true, chained=true, bodyState={naked=true, hard=true}})
		sayParsed("{actor.You} {actor.youVerb('secure')} a penis pump around {target.your} {target.penis} and {actor.youVerb('let')} it stroke away at {target.yourHis} member until {target.youHe} can no longer hold back, {target.yourHis} {target.cum} filling the internal reservoir!")
		if(_canUsePumps && _canMilkBreasts && addBreastPump(_targetID)):
			shouldMilkBreasts = true
			sayParsed("At the same time, two breast-pumps hum away at {target.yourHis} {target.breasts}, pulling out {target.milk}!")
	if(milkWay == "stallpenispump"):
		shouldMilkPenis = true
		addPenisPump(_targetID)
		var theChains := [["hoseshort", "penisPump", "scene", "milktank"], ["short", "neck", "scene", "bottompipe"]]
		sayParsed("{actor.You} {actor.youVerb('lock')} {target.you} into the milking stall and {actor.youVerb('fit')} a pump over {target.yourHis} {target.penis}. {actor.YouHe} then just {actor.youVerb('watch', 'watches')} as the pleasure ring strokes and caresses the length, stimulating {target.yourHis} cock until it starts stuffing the pump’s reservoir full!")
		if(_canUsePumps && _canMilkBreasts && addBreastPump(_targetID)):
			shouldMilkBreasts = true
			sayParsed("At the same time, two breast-pumps hum away at {target.yourHis} {target.breasts}, pulling out {target.milk}!")
			theChains.append(["hoseshort", "breastpump", "scene", "milktank"])
		playAnimation(StageScene.MilkingStallSolo, "cum", {pc=_targetID, npc=_actorID, npcCum=true, bodyState={naked=true, hard=true, chains=theChains}})
	if(milkWay == "milkstall"):
		shouldMilkBreasts = true
		playAnimation(StageScene.MilkingStallDuo, "cum", {pc=_targetID, npc=_actorID, npcCum=true, bodyState={naked=true, hard=true}})
		sayParsed("{actor.You} {actor.youVerb('cuff')} {target.you} to the milking stall, bending {target.youHim} forward and then hand-milking {target.yourHis} {target.breasts}, like they're udders! Any milk drips down into the milk tank.")
		if(_canUsePumps && _canMilkPenis && addPenisPump(_targetID)):
			shouldMilkPenis = true
			sayParsed("At the same time, a penis pump drains {target.yourHis} balls!")
	if(milkWay == "milkstallpumps"):
		shouldMilkBreasts = true
		addBreastPump(_targetID)
		var theChains := [["hoseshort", "breastpump", "scene", "milktank"], ["short", "neck", "scene", "bottompipe"]]
		sayParsed("{actor.You} {actor.youVerb('cuff')} {target.you} to the milking stall and {actor.youVerb('let')} two breast pumps work away at {target.yourHis} {target.breasts}. {actor.YouHe} {actor.youVerb('watch', 'watches')} them hum and steadily fill the milk tank.")
		if(_canUsePumps && _canMilkPenis && addPenisPump(_targetID)):
			shouldMilkPenis = true
			sayParsed("At the same time, a penis pump drains {target.yourHis} balls!")
			theChains.append(["hoseshort", "penisPump", "scene", "milktank"])
		playAnimation(StageScene.MilkingStallSolo, "cum", {pc=_targetID, npc=_actorID, npcCum=true, bodyState={naked=true, hard=true, chains=theChains}})
	if(milkWay == "milksybian"):
		shouldMilkBreasts = true
		addBreastPump(_targetID)
		playAnimation(StageScene.SybianOral, "hold", {pc=_targetID, npc=_actorID, pcCum=true, chained=true, bodyState={naked=true, hard=true}})
		sayParsed("{actor.You} {actor.youVerb('set')} {target.you} on top of the buzzing sybian and {actor.youVerb('let')} two breast pumps hum away at {target.yourHis} {target.breasts}, collecting milk as the machine fucks {target.yourHis} "+("cunt" if _target.hasReachableVagina() else "ass")+"!")
		if(_canUsePumps && _canMilkPenis && addPenisPump(_targetID)):
			shouldMilkPenis = true
			sayParsed("At the same time, a penis pump drains {target.yourHis} balls!")
	if(milkWay == "fuckmachineseed"):
		shouldMilkPenis = true
		playAnimation(StageScene.HangingSexFuckmachine, "fast", {pc=_targetID, pcCum=true, bodyState={naked=true, hard=true}})
		sayParsed("{actor.You} {actor.youVerb('cuff')} {target.you} by the wrists high above {target.yourHis} head. {actor.YouHe} then {actor.youVerb('bring')} a fuck-machine behind and {actor.youVerb('turn')} it on! Its thick dildo slides into {target.your} ass and starts hammering {target.yourHis} prostate until {target.yourHis} seed begins to trickle down into the collection tank!")
		if(_canUsePumps && _canMilkBreasts && addBreastPump(_targetID)):
			shouldMilkBreasts = true
			sayParsed("At the same time, two breast-pumps hum away at {target.yourHis} {target.breasts}, pulling out {target.milk}!")
	if(milkWay == "milkmachine"):
		shouldMilkBreasts = true
		addBreastPump(_targetID)
		var theChains := [["hose", "breastpump", "scene", "milkIntake"]]
		sayParsed("{actor.You} {actor.youVerb('oversee')} the process as an advanced milking machine uses its dildos to fuck {target.yourHis} holes, manipulators pinning {target.yourHis} limbs, two pumps draining {target.yourHis} {target.breasts} into the tanks!")
		if(_canUsePumps && _canMilkPenis && addPenisPump(_targetID)):
			shouldMilkPenis = true
			sayParsed("At the same time, a penis pump drains {target.yourHis} balls!")
			theChains.append(["hose", "penisPump", "scene", "milkIntake"])
		playAnimation(StageScene.BDSMMachineFuck, "fastdouble", {pc=_targetID, pcCum=true, bodyState={naked=true, hard=true,chains=theChains}})
	if(milkWay == "fingeringsmarttable"):
		shouldMilkPenis = true
		playAnimation(StageScene.MilkingProstate, "fast", {pc=_targetID, npc=_actorID, pcCum=true, bodyState={naked=true, hard=true}})
		sayParsed("{actor.You} {actor.youVerb('bend')} {target.you} forward over the advanced milking table, manipulators holding {target.yourHis} limbs in place. Two fingers slip into {target.yourHis} asshole, stroking {target.yourHis} prostate just right until {target.yourHis} cock starts throbbing and dripping high-quality seed into the fluid intake!")
		if(_canUsePumps && _canMilkBreasts && addBreastPump(_targetID)):
			shouldMilkBreasts = true
			sayParsed("At the same time, two breast-pumps hum away at {target.yourHis} {target.breasts}, pulling out {target.milk}!")
	if(milkWay == "peggingsmarttable"):
		shouldMilkPenis = true
		if(addStrapon(_actorID)):
			playAnimation(StageScene.MilkingProstateFuck, "fast", {pc=_targetID, npc=_actorID, pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
			sayParsed("{actor.You} {actor.youVerb('secure')} {target.you} over the advanced table, manipulators holding {target.yourHis} limbs in place. A pre-lubed strapon presses against {target.yourHis} tight ring, spreading it wide before sliding inside. {actor.You} {actor.youVerb('begin')} pounding {target.yourHis} ass nice and hard, using the info that the table provides to maximize the stimulation of the prostate. Soon, seed begins to dribble down into the fluid intake.");
		else:
			playAnimation(StageScene.MilkingProstateFuck, "fast", {pc=_targetID, npc=_actorID, pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={showPenis=true, hard=true}})
			sayParsed("{actor.You} {actor.youVerb('secure')} {target.you} over the advanced table, manipulators holding {target.yourHis} limbs in place. A {actor.penis} presses against {target.yourHis} tight ring, spreading it wide before sliding inside. {actor.You} {actor.youVerb('begin')} pounding {target.yourHis} ass nice and hard, using the info that the table provides to maximize the stimulation of the prostate. Soon, seed begins to dribble down into the fluid intake.");
		if(_canUsePumps && _canMilkBreasts && addBreastPump(_targetID)):
			shouldMilkBreasts = true
			sayParsed("At the same time, two breast-pumps hum away at {target.yourHis} {target.breasts}, pulling out {target.milk}!")
	if(milkWay == "seedmilkmachine"):
		shouldMilkPenis = true
		playAnimation(StageScene.BDSMMachineAltFuck, "fast" if !_target.hasReachableVagina() else "fastdouble", {pc=_targetID, bodyState={naked=true, hard=true}})
		sayParsed("{actor.You} {actor.youVerb('activate')} the "+("dual-" if _target.hasReachableVagina() else "")+"dildo milking mode on the advanced table. "+("Two rigid dildos thrust in unison into {target.yourHis} holes" if _target.hasReachableVagina() else "A rigid dildo thrusts into {target.yourHis} fuckhole")+", stretching and pounding {target.yourHis} prostate until {target.yourHis} cock erupts, filling the seed tank with thick ropes!")
		if(_canUsePumps && _canMilkBreasts && addBreastPump(_targetID)):
			shouldMilkBreasts = true
			sayParsed("At the same time, two breast-pumps hum away at {target.yourHis} {target.breasts}, pulling out {target.milk}!")
	
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
		talk(_actorID, "THAT'S ENOUGH!")
		milkedToday += 1
	else:
		talk(_actorID, "THAT'S NOT ENOUGH!")
