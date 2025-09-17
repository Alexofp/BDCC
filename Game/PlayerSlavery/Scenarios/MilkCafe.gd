extends PlayerSlaveryBase

var cowTrust:float = 0.0
var bullTrust:float = 0.0

var obedience:float = 0.0

var needsPunishment:bool = false
var canMilkOthers:bool = false

var day:int = 0

var pcGaveMilkOrSeed:int = 0 # How many times pc was milked or milked others
var milkedToday:int = 0
var milkedTotal:int = 0
var totalEarned:int = 0

var gotMilkedNoon:bool = false
var gotMilkedEvening:bool = false

func onNewDay():
	gotMilkedNoon = false
	gotMilkedEvening = false
	day += 1

var agreeMilk:bool = true
var agreeSeed:bool = false

var cowTopic:int = 0
var bullTopic:int = 0
var guyTopic:int = 0

var peekTried:int = 0
var peekState:int = PEEK_START
const PEEK_START = 0
const PEEK_NOTICED_PADLOCK = 1
const PEEK_NOTICED_CUSTOMER = 2
const PEEK_NOTICED_BY_CUSTOMER = 3
const PEEK_BULLIED_BY_GIRL = 4
const PEEK_FIRST_EVENT_HAPPENED = 5
const PEEK_SECOND_EVENT_HAPPENED = 6
const PEEK_THIRD_EVENT_HAPPENED = 7
var gonnaHavePeekEvent:bool = false

var padlockDamage:float = 0.0

var canHelpCage:bool = false
var cageRemoved:bool = false
var cageDamage:float = 0.0

var canHelpMilka:bool = false
var milkaExtraBreastSize:int = 0
var helpedMilka:bool = false

var upgradeLevel:int = -1
var extraProfit:int = 0

var lactationTry:int = 0
var isGuyTurn:bool = false

var lastEvent:String = ""

var charsHere:Array = []

const IDLE_HUNGRY = 0
const IDLE_SOCIAL = 1
const IDLE_IDLE = 2
const IDLE_NEEDY = 3
const IDLE_MAX = 3

var idleState:int = IDLE_IDLE

var state:String = "intro" #"ePeekSecondEvent"
var texts:Array = []
var actions:Array = []

const C_PC = "pc"
const C_COW = "psmilka"
const C_BULL = "pspip"
const C_GIRL = "psmilkgirl"
const C_GUY = "psmilkguy"
const C_OFFICER = "psmilkofficer"

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
const L_TABLE = "pscafe_table"

func saveData() -> Dictionary:

	return {
		cowTrust = cowTrust,
		bullTrust = bullTrust,
		obedience = obedience,
		canMilkOthers = canMilkOthers,
		needsPunishment = needsPunishment,
		day = day,
		state = state,
		texts = texts,
		actions = actions,
		agreeMilk = agreeMilk,
		agreeSeed = agreeSeed,
		pcGaveMilkOrSeed = pcGaveMilkOrSeed,
		milkedToday = milkedToday,
		milkedTotal = milkedTotal,
		idleState = idleState,
		gotMilkedNoon = gotMilkedNoon,
		gotMilkedEvening = gotMilkedEvening,
		cowTopic = cowTopic,
		bullTopic = bullTopic,
		guyTopic = guyTopic,
		peekTried = peekTried,
		peekState = peekState,
		padlockDamage = padlockDamage,
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
		lactationTry = lactationTry,
		isGuyTurn = isGuyTurn,
		lastEvent = lastEvent,
		gonnaHavePeekEvent = gonnaHavePeekEvent,
	}

func loadData(_data:Dictionary):
	cowTrust = SAVE.loadVar(_data, "cowTrust", 0.0)
	bullTrust = SAVE.loadVar(_data, "bullTrust", 0.0)
	obedience = SAVE.loadVar(_data, "obedience", 0.0)
	canMilkOthers = SAVE.loadVar(_data, "canMilkOthers", false)
	needsPunishment = SAVE.loadVar(_data, "needsPunishment", false)
	day = SAVE.loadVar(_data, "day", 0)
	state = SAVE.loadVar(_data, "state", "")
	texts = SAVE.loadVar(_data, "texts", [])
	actions = SAVE.loadVar(_data, "actions", [])
	agreeMilk = SAVE.loadVar(_data, "agreeMilk", true)
	agreeSeed = SAVE.loadVar(_data, "agreeSeed", false)
	pcGaveMilkOrSeed = SAVE.loadVar(_data, "pcGaveMilkOrSeed", 0)
	milkedToday = SAVE.loadVar(_data, "milkedToday", 0)
	milkedTotal = SAVE.loadVar(_data, "milkedTotal", 0)
	idleState = SAVE.loadVar(_data, "idleState", IDLE_IDLE)
	gotMilkedNoon = SAVE.loadVar(_data, "gotMilkedNoon", false)
	gotMilkedEvening = SAVE.loadVar(_data, "gotMilkedEvening", false)
	cowTopic = SAVE.loadVar(_data, "cowTopic", 0)
	bullTopic = SAVE.loadVar(_data, "bullTopic", 0)
	guyTopic = SAVE.loadVar(_data, "guyTopic", 0)
	peekTried = SAVE.loadVar(_data, "peekTried", 0)
	peekState = SAVE.loadVar(_data, "peekState", 0)
	padlockDamage = SAVE.loadVar(_data, "padlockDamage", 0.0)
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
	lactationTry = SAVE.loadVar(_data, "lactationTry", 0)
	isGuyTurn = SAVE.loadVar(_data, "isGuyTurn", false)
	lastEvent = SAVE.loadVar(_data, "lastEvent", "")
	gonnaHavePeekEvent = SAVE.loadVar(_data, "gonnaHavePeekEvent", false)

const UPGRADES = [
	{
		earned = 500,
		message = "The owners bought some breast and penis pumps!",
		creditsMult = 5.0,
	},
	{
		earned = 3000,
		message = "The owners have replaced the grass in the garden with tastier one!",
		creditsMult = 10.0,
	},
	{
		earned = 10000,
		message = "The owners have installed a milking stall!",
		creditsMult = 20.0,
	},
	{
		earned = 25000,
		message = "The owners have bought some fuck-machines!",
		creditsMult = 30.0,
	},
	{
		earned = 50000,
		message = "The owners have made the cafe prettier and also gave you better cells!",
		creditsMult = 100.0,
	},
	{
		earned = 100000,
		message = "The owners have installed an advanced milking table!",
		creditsMult = 200.0,
	},
]
const UPGRADE_PUMPS = 0
const UPGRADE_GRASS = 1
const UPGRADE_STALL = 2
const UPGRADE_FUCKMACHINE = 3
const UPGRADE_CELLS = 4
const UPGRADE_MILKINGTABLE = 5

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
	"The cafe doesn't seem to be doing well.. reminds me of my home..",
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

const LEO_LINES = [
	"Sorry.. but it had to be like this. Good milk is hard to get.. Customers hate cheap milk..",
	"We and Sofie, my love, we're in huge need of credits.. This cafe wasn't cheap to buy.",
	"Sofie has a big, kind heart. It's just.. tough times for us.",
	"We're both at fault, I think.. we made some mistakes..",
	"You know.. this little space cafe was always our dream.. We're so close.. to being free.",
	"I put everything on this dream.. Sofie put everything on red.. I don't blame her, it's my fault for not stopping her..",
	"I love her.. maybe I'm dumb.. but it feels good to be near her, you know? No matter what happens..",
]

func _init():
	id = "MilkCafe"

func onSlaveryStart():
	updateCharacters()
	call(state+"_state")
	var theCow = GlobalRegistry.getCharacter(C_COW)
	if(theCow):
		theCow.induceLactation()
		theCow.cancelPregnancy()

func onSlaveryEnd():
	GM.pc.removeEffect(StatusEffect.PSMilkCafeProduction)
	var theCow = GlobalRegistry.getCharacter(C_COW)
	if(theCow):
		theCow.induceLactation()
		theCow.cancelPregnancy()

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
	return 2 + milkaExtraBreastSize

func getCreditsEarnMult() -> float:
	if(upgradeLevel >= 0 && upgradeLevel < UPGRADES.size()):
		return UPGRADES[upgradeLevel]["creditsMult"]
	return 1.0

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
	
	for actionEntry in actions:
		result.append([actionEntry[1], "action" if actionEntry[0] else "", actionEntry[2], actionEntry[3], actionEntry])
	
	return result
	
func startNewState():
	actions.clear()
	texts.clear()
	charsHere.clear()
	
func processFightEnd(_didPCWin:bool):
	startNewState()
	call(state + "_fightResult", _didPCWin)

func processSexEnd(_sexResult:SexEngineResult):
	startNewState()
	call(state + "_sexResult", _sexResult)

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
		if(theID == "triggerEventMaybe"):
			triggerEventMaybe()
			call(state + "_state")
			return {}
		if(theID == "ENDING"):
			return {end=theArgs[0]}
		if(theID == "SLEEP"):
			setState("main")
			sleepScene()
			return {}
			
		
		call(state + "_do", theID, theArgs)
		if(texts.empty() && actions.empty()):
			call(state + "_state")
		elif(actions.empty()):
			addAction("Continue", "See what happens next..", "setState", [state])
	return {}
	
func processTurn():
	GM.main.processTime(60*RNG.randi_range(60, 180))
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
	var oldAmount:int = getTreatAmount()
	if(_howMuch > 0):
		for _i in range(_howMuch):
			GM.pc.getInventory().addItem(GlobalRegistry.createItem("appleitem"))
	if(_howMuch < 0):
		GM.pc.getInventory().removeXOfOrDestroy("appleitem", -_howMuch)
	var newTreatAmount:int = getTreatAmount()
	
	if(oldAmount == newTreatAmount):
		return
	var theDiff:int = newTreatAmount - oldAmount
	if(theDiff != 0):
		addUpText("Treat" if (theDiff == 1 || theDiff == -1) else "Treats", theDiff)

func getTreatAmount() -> int:
	return GM.pc.getInventory().getAmountOf("appleitem")

func addShiv():
	GM.pc.getInventory().addItem(GlobalRegistry.createItem("Shiv"))
	addUpText("Shiv", 1)

func useShiv() -> bool:
	if(GM.pc.getInventory().removeFirstOf("Shiv")):
		addUpText("Shiv", -1)
		return true
	return false

func getShivAmount() -> int:
	return GM.pc.getInventory().getAmountOf("Shiv")

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
func sayLeoLine():
	if(guyTopic >= LEO_LINES.size()):
		talk(C_GUY, RNG.pick(LEO_LINES))
	else:
		talk(C_GUY, LEO_LINES[guyTopic])
		guyTopic += 1

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
	obedience += (_howMuch*2.0 if _howMuch<0.0 else _howMuch) / 100.0
	addUpTextF("Obedience", _howMuch)
func addCowTrust(_howMuch:float):
	cowTrust += _howMuch / 100.0
	addUpTextF("Cow's trust", _howMuch)
func addBullTrust(_howMuch:float):
	bullTrust += _howMuch / 100.0
	addUpTextF("Bull's trust", _howMuch)
func addPadlockDamage(_howMuch:float):
	padlockDamage += _howMuch / 20.0
	addUpTextF("Padlock's damage", _howMuch)

func getCredits() -> int:
	return GM.pc.getCredits()

func gotMilked(howMuch:int = 1):
	milkedToday += howMuch
	milkedTotal += howMuch

func onDayEnd():
	var earned:int = extraProfit
	
	if(milkedToday > 0):
		var earnMult:float = getCreditsEarnMult()
		var earnedCredsMin:int = milkedToday * 100 + milkedTotal * milkedTotal
		var earnedCredsMax:int = milkedToday * 300 + milkedTotal * milkedTotal
		earned += RNG.randi_range(int(earnedCredsMin*earnMult), int(earnedCredsMax*earnMult))
	
	if(pcGaveMilkOrSeed <= 0):
		needsPunishment = true
	
	if(earned > 0):
		totalEarned += earned
		saynn("The cafe made some profit!")
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
			sayn("[b]The cafe earned enough credits for an upgrade![/b]")
			saynn(theEntry["message"])
	
	milkedToday = 0
	extraProfit = 0
	pcGaveMilkOrSeed = 0
	onNewDay()

func addBreastPump(_charID:String) -> bool:
	var theChar:BaseCharacter = GlobalRegistry.getCharacter(_charID)
	var thePump = GlobalRegistry.createItem("BreastPump")
	if(theChar.canBeMilked()):
		var theFluids = thePump.getFluids()
		theFluids.addFluid("Milk", 400.0)
	theChar.getInventory().forceEquipStoreOtherUnlessRestraint(thePump)
	return true

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

func cowBullBoth(cowText:String, bullText:String, bothText:String) -> String:
	if(agreeMilk && agreeSeed && GM.pc.hasPenis()):
		return bothText
	if(agreeSeed && GM.pc.hasPenis()):
		return bullText
	return cowText

func cowBull() -> String:
	return cowBullBoth("cow", "bull", "cow")

func getObedienceText() -> String:
	var theObedience:float = obedience if obedience < 0.0 else obedience*2.0
	if(theObedience <= -0.9):
		return "The owners despise you. You’re nothing but trouble in their eyes."
	if(theObedience <= -0.7):
		return "The owners really hate you."
	if(theObedience <= -0.5):
		return "The owners dislike your behaviour."
	if(theObedience <= -0.3):
		return "The owners think you're very disobedient."
	if(theObedience <= -0.1):
		return "The owners think you're disobedient."
	if(theObedience <= 0.1):
		return "The owners keep a close eye on you."
	if(theObedience <= 0.3):
		return "The owners see you as somewhat cooperative."
	if(theObedience <= 0.5):
		return "The owners are pleased with your behaviour."
	if(theObedience <= 0.7):
		return "The owners think you're very obedient."
	if(theObedience <= 0.9):
		return "The owners think you're very loyal."
	return "The owners think you're the perfect slave."

func getCowTrustText() -> String:
	var theTrust:float = cowTrust * 2.0
	if(theTrust < 0.0):
		return "The cow dislikes you."
	if(theTrust <= 0.0):
		return "The cow doesn't know you."
	if(theTrust <= 0.2):
		return "The cow knows you a little bit."
	if(theTrust <= 0.4):
		return "The cow likes you."
	if(theTrust <= 0.6):
		return "The cow thinks you're very nice."
	if(theTrust <= 0.8):
		return "The cow adores you."
	return "You are cow's best friend."

func getBullTrustText() -> String:
	var theTrust:float = bullTrust * 2.0
	if(theTrust < 0.0):
		return "The bull dislikes you."
	if(theTrust <= 0.0):
		return "The bull doesn't know you."
	if(theTrust <= 0.2):
		return "The bull knows you a little bit."
	if(theTrust <= 0.4):
		return "The bull thinks you're alright."
	if(theTrust <= 0.6):
		return "The bull respects you."
	if(theTrust <= 0.8):
		return "The bull admires you."
	return "You and the bull are buddies."

func getDoorDamageText() -> String:
	if(padlockDamage <= 0.1):
		return "The padlock is completely fine."
	if(padlockDamage <= 0.3):
		return "The padlock is slightly damaged."
	if(padlockDamage <= 0.5):
		return "The padlock has some bents and scratches."
	if(padlockDamage <= 0.7):
		return "The padlock has a lot of damage."
	if(padlockDamage < 1.0):
		return "The padlock is barely holding."
	return "The padlock is broken."
		

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
	
	saynn("You are a "+cowBullBoth("cow", "bull", "cow")+" slave that belongs to two cafe owners. They will come to milk you for your "+cowBullBoth("milk", "seed", "milk and seed")+" twice every day.")
	
	if(day <= 0):
		saynn("Right now, you are standing in a dimly-lit basement that is used as the cafe's storage space. Most of the light comes from the open garden. In the corners of the space, there is milking equipment installed. The only door out of here is locked. On the other side from that door, there is a powered-off freezer room that is divided into sections. One of these sections is your cell. Apart from you, there are two other slaves down here.")
	else:
		saynn("You are standing in a dimly-lit basement that is used as the cafe's storage space.")
	
	sayn("Day: "+str(day))
	sayn("Obedience: "+getObedienceText())#+" "+str(Util.roundF(obedience*100.0, 1))+"%")
	sayn("Cow's trust: "+getCowTrustText())#+" "+str(Util.roundF(cowTrust*100.0, 1))+"%")
	sayn("Bull's trust: "+getBullTrustText())#+" "+str(Util.roundF(bullTrust*100.0, 1))+"%")
	if(getTreatAmount() > 0):
		sayn("Treats: "+str(getTreatAmount()))
	if(getShivAmount() > 0):
		sayn("Shivs: "+str(getShivAmount()))
	
	sayn("")
	
	if(idleState == IDLE_IDLE):
		sayn("You don't have any particular needs.")
		if(padlockDamage > 0.0):
			sayn("Door: "+getDoorDamageText())
		
		addAction("Graze", "Spend time on the field, chew some grass", "idleGraze")
		addAction("Hide in cell", "Hide in your cell", "idleCell")
		# If messy
		addAction("Wash", "Ask to be washed", "idleWash")
		if(GM.pc.getStamina() > 0):
			if(GM.pc.isBlindfolded()):
				addDisabledAction("Peek outside", "You can't see..")
			else:
				addAction("Peek outside", "Peek through the door's little window", "idlePeek")
		else:
			addDisabledAction("Peek outside", "The window is high so you need some stamina to reach it")
		if(peekState >= PEEK_NOTICED_PADLOCK):
			if(padlockDamage >= 1.0):
				if(cageRemoved && helpedMilka):
					addAction("Freedom!", "The door is pretty much open. You can leave!", "ENDING", ["end_breaklock"])
				else:
					addAction("Freedom!", "The door is pretty much open. You can leave", "endingLockCheck")
			elif(!GM.pc.hasBoundLegs()):
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
		if(getTreatAmount() > 0):
			addAction("Eat a treat!", "Eat one of your treats", "eatTreat")
		#addAction("Suck bull", "Feed on the bull's seed", "eatSuckBull")
	if(idleState == IDLE_NEEDY):
		saynn("You feel like you could do something lewd.")
		
		addAction("Just chill", "Get some extra stamina", "needyRest")
		addAction("Complain", "Complain that you are extremely needy!", "needyComplain")
		addAction("Offer self", "Let the owners do whatever they want with you..", "needyOfferSelf")
		# Obedience check
		if(obedience < 0.4):
			addDisabledAction("Be milked", "You're not obedient enough to ask to be milked an extra time")
		else:
			if(GM.pc.getStamina() <= 0):
				addDisabledAction("Be milked", "You don't have enough stamina to be milked!")
			else:
				addAction("Be milked", "Ask the owners to milk you an extra time", "needyMilk")
		if(canHelpMilka && (getMilkaBreastSize() < BreastsSize.O)):
			if(GM.pc.hasBoundArms() || GM.pc.hasBlockedHands()):
				addDisabledAction("Milka's breasts", "You can't do it with blocked hands")
			else:
				if(GM.pc.getStamina() <= 0):
					addDisabledAction("Milka's breasts", "You don't have any stamina to do this")
				else:
					addAction("Milka's breasts", "Help Milka by applying special cream to her breasts", "idleCowBreasts")
		if(helpedMilka || canMilkOthers):
			if(GM.pc.getStamina() > 0):
				addAction("Milk Cow", "Help with milking the cow", "talkCowMilk")
			else:
				addDisabledAction("Milk Cow", "You don't have any stamina left")
		if(bullTrust > 0.5 || cageRemoved || canMilkOthers):
			if(GM.pc.getStamina() > 0):
				addAction("Milk Bull", "Help with milking the bull", "talkBullMilk")
			else:
				addDisabledAction("Milk Bull", "You don't have any stamina left")

func addContinueEventTrigger():
	addContinue("triggerEventMaybe")

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
		if(isGuyTurn):
			setState("about_to_be_milked_by_guy")
		else:
			setState("about_to_be_milked_by_girl")
		isGuyTurn = !isGuyTurn
		return
	if(!gotMilkedEvening && GM.main.getTime() >= 20*60*60):
		gotMilkedEvening = true
		if(isGuyTurn):
			setState("about_to_be_milked_by_guy")
		else:
			setState("about_to_be_milked_by_girl")
		isGuyTurn = !isGuyTurn
		return
	
	var possible:Array = []
	
	if(RNG.chance(70) && day >= 1):
		possible.append(["eOwnerMilkSlave", 10.0])
		possible.append(["eGirlBulliesSlave", 3.0])
		possible.append(["eGirlCattleProdCow", 2.0])
		possible.append(["eGirlCattleProdBull", 2.0])
		possible.append(["eEatAss", 1.0 if !GM.pc.isOralBlocked() else 3.0])
		possible.append(["eWannaCuddle", 2.0])
		possible.append(["eRandomStuff", 5.0])
		if(getTreatAmount() > 0):
			possible.append(["eCowSeesTreat", 4.0])
			possible.append(["eBullSeesTreat", 4.0])
		if(canHelpCage && !cageRemoved):
			possible.append(["eHelpCage", 4.0])
	
	if(!possible.empty()):
		var theEvent:String = RNG.pickWeightedPairs(possible)
		if(theEvent == lastEvent):
			theEvent = RNG.pickWeightedPairs(possible)
		if(theEvent == lastEvent):
			theEvent = RNG.pickWeightedPairs(possible)
		setState(theEvent)
		lastEvent = theEvent
	else:
		setState("main")

func addNextIdleStageButton():
	addContinue("nextIdle")

func main_do(_id:String, _args:Array):
	if(_id.begins_with("idle") || _id.begins_with("talk") || _id.begins_with("eat") || _id.begins_with("needy")):
		processTurn()
	if(_id == "idleGraze"):
		aimCamera(RNG.pick([L_FIELD, L_FIELD2, L_FIELD3]))
		saynn("You spend some time out in the garden, just wandering around.")
		saynn("There isn't much to do.. so you just chew some grass while you're at it.")
		if(upgradeLevel >= UPGRADE_GRASS):
			addStamina(20)
			addPain(-20)
		else:
			addStamina(10)
			addPain(-10)
		
		if(obedience < 0.0 && RNG.chance(10.0 - 4.0*getShivAmount())):
			saynn("While exploring, you find a sharp piece of wood.")
			addShiv()
		
		var special:String = RNG.pickWeightedDict({
			"": 100.0, "guy": 20.0, "girl": 20.0, "cow": 10.0,
		})
		if(special == "guy"):
			saynn(RNG.pick([
				"Leo notices you while he is carrying some boxes around.",
				"Leo notices you while he is watering the garden.",
				"Leo notices you while he is harvesting some fruits from the garden.",
			]))
			if(obedience < -0.1):
				talk(C_GUY, RNG.pick([
					"You're a pretty naughty "+cowBull()+".",
					"Sofie isn't too happy with you.",
					"Don't do anything silly.",
					"You must be hungry. Maybe you should obey more.",
				]))
			else:
				talk(C_GUY, RNG.pick([
					"Such a good "+cowBull()+".",
					"Can I pat you?",
					"Don't mind me, keep grazing.",
					"You must be hungry.",
				]))
			addObedience(1)
		if(special == "girl"):
			saynn("Sofie comes in to check on you.")
			if(obedience < -0.1):
				talk(C_GIRL, RNG.pick([
					"I don't trust your bratty ass.",
					"The fuck are you doing here? Eating grass? Alright.",
					"Don't look at me like that, you dumb bitch.",
				]))
			else:
				talk(C_GIRL, RNG.pick([
					"Keep chewing, animal.",
					"Keep looking silly, animal.",
					"Keep chewing the grass, I need your "+cowBullBoth("milk", "seed", "milk")+".",
				]))
			addObedience(1)
		if(special == "cow" && cowTrust > 0.0):
			saynn("You stumble upon Milka who is doing the same.")
			talk(C_COW, RNG.pick([
				"Moo..",
				"Moo!",
				"Moo?",
				"Moo? Moo!",
			]))
			addCowTrust(1.0)
		if(special == "bull" && bullTrust > 0.0):
			saynn("You stumble upon Pip who is doing the same.")
			talk(C_BULL, RNG.pick([
				"The ceiling is too high.. can't reach.",
				"I tried digging.. there is just steel under the ground.",
				"If we find flint.. we might get a fire going.. but what's then?",
				"If we can find a stone big enough..",
			]))
			addBullTrust(1.0)
			
		addContinueEventTrigger()
	if(_id == "idleCell"):
		aimCamera(L_SLEEP)
		saynn("You hide in your cell, away from everybody.")
		if(upgradeLevel >= UPGRADE_CELLS):
			addStamina(50)
		else:
			addStamina(15)
		
		var special:String = RNG.pickWeightedDict({
			"": 60.0, "guy": 40.0, "girl": 20.0,
		})
		if(special == "guy"):
			saynn("Leo finds you.")
			talk(C_GUY, RNG.pick([
				"Aw, c'mon. Don't be shy.",
				"I don't bite, you don't have to hide.",
				"Sofie is gonna be angry if she sees you here.",
				"You don't like this place? Sorry.",
				"I don't wanna tell Sofie..",
			]))
		if(special == "girl"):
			saynn("Sofie finds you in your cell and drags you out by your collar.")
			addPain(10)
			if(obedience < -0.1):
				talk(C_GIRL, RNG.pick([
					"Eat grass, you dumb animal.",
					"No hiding, you dumb animal.",
					"Don't make me mad, you slut.",
					"You have a field if you want to rest, you dumb animal.",
				]))
			else:
				talk(C_GIRL, RNG.pick([
					"Eat the grass, what are you doing here?",
					"No hiding, you're an animal.",
					"Don't make me mad.",
					"You have a field if you want to rest.",
				]))
			addObedience(-2)
		addContinueEventTrigger()
	if(_id == "idleWash"):
		aimCamera(L_FIELD)
		GM.pc.clearBodyFluids()
		GM.pc.clearBodywritings()
		GM.pc.clearTallymarks()
		#GM.pc.afterTakingAShower()
		saynn("You ask to be washed.")
		
		if(RNG.chance(50)):
			saynn("Sofie grabs you roughly by the arm and shoves you against the garden wall. Without a word, she sprays a sharp jet of cold water straight at your back and butt, making you flinch.")
			talk(C_GIRL, "Turn around.")
			saynn("You obey, and she sweeps the stream across your front in the same manner.. just enough to get you clean.")
		else:
			saynn("Leo leads you out into the open field. With a hose in one hand and a sponge in the other, he works the water gently over your body, making sure to rinse away every trace of dirt.. and other mess.")
			talk(C_GUY, "There we go. Much better, eh?")
		addContinueEventTrigger()
	if(_id == "idlePeek"):
		aimCamera(L_COUNTER)
		if(peekState == PEEK_START):
			saynn("You stand high on your toes and peek into the small slit of a window near the top of the reinforced door.")
			addStamina(-10)
			saynn("It's dirty and foggy.. and also thick enough to not let out any sound.")
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
			return
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
	
		if(peekState == PEEK_NOTICED_PADLOCK && RNG.chance(-50+peekTried*40)):
			peekTried = 0
			peekState = PEEK_NOTICED_CUSTOMER
			playAnimation(StageScene.Solo, "stand", {pc=C_OFFICER})
			saynn("You were about to give up.. but then you [b]notice someone[/b]..")
			saynn("He is wearing fancy clothes.. and also spots one hell of a smile. What a wolf.")
			saynn("You bounce and wave.. but he turns away too fast. And soon, he head off.")
			return
		elif(peekState == PEEK_NOTICED_CUSTOMER && RNG.chance(-30+peekTried*50)):
			peekTried = 0
			peekState = PEEK_NOTICED_BY_CUSTOMER
			playAnimation(StageScene.Solo, "stand", {pc=C_OFFICER})
			saynn("You were about to give up.. but then you [b]notice him[/b] again!")
			saynn("It's the fancy wolf that you saw the other day. He is busy ordering something.")
			saynn("It's your chance! You wave and jump, trying to get his attention..")
			saynn("The wolf finishing making his order.. and then gives your door a quick glance.")
			talk(C_PC, "C'mon, notice me! I'm here!")
			saynn("His brow shifts ever so subtly.. But you really can't tell.")
			saynn("Sofie hands him his order.. and so he leaves. Fuck, almost..")
			return
		elif(peekState == PEEK_NOTICED_BY_CUSTOMER && RNG.chance(-20+peekTried*50)):
			peekTried = 0
			peekState = PEEK_BULLIED_BY_GIRL
			playAnimation(StageScene.Solo, "stand", {pc=C_OFFICER})
			saynn("You see [b]him[/b]! He is back, making his order.")
			saynn("This time you don't even need to wave.. he is looking over Sofie's shoulder at your door.")
			saynn("You can see him saying something to the girl.. something that startles her. Oh shit.")
			addContinue("setState", ["pEventBullyByGirl"])
			return
		elif(peekState == PEEK_BULLIED_BY_GIRL && RNG.chance(-10+peekTried*60) && !gonnaHavePeekEvent):
			peekTried = 0
			gonnaHavePeekEvent = true
			peekState = PEEK_FIRST_EVENT_HAPPENED
			playAnimation(StageScene.Solo, "stand", {pc=C_OFFICER})
			saynn("You see [b]him[/b]!")
			saynn("Who cares what that bitch said.. you wave your arms and get his attention. It seems to work!")
			saynn("The wolf puts on a subtle smile.. but that's about it. Huh..")
			saynn("He finishes making his order.. grabs it.. and just leaves.")
			saynn("Maybe.. maybe this is pointless. Maybe there is nothing you can do..")
			return
		elif(peekState == PEEK_FIRST_EVENT_HAPPENED && RNG.chance(-30+peekTried*100) && !gonnaHavePeekEvent):
			peekTried = 0
			gonnaHavePeekEvent = true
			peekState = PEEK_SECOND_EVENT_HAPPENED
			playAnimation(StageScene.Solo, "stand", {pc=C_OFFICER})
			saynn("You see [b]him[/b]! It's the officer.")
			saynn("He looks at you.. and puts on a familliar smile.")
			saynn("This means that he is probably gonna be on a night shift today.. and so are you.")
			return
		elif(peekState == PEEK_SECOND_EVENT_HAPPENED && RNG.chance(min(-40+peekTried*60, 50.0)) && !gonnaHavePeekEvent):
			peekTried = 0
			gonnaHavePeekEvent = true
			peekState = PEEK_THIRD_EVENT_HAPPENED
			playAnimation(StageScene.Solo, "stand", {pc=C_OFFICER})
			saynn("You see [b]him[/b]! It's the officer.")
			saynn("He looks at you.. and puts on a familliar smile.")
			saynn("This means that he is probably gonna be on a night shift today.. and so are you.")
			return
		
		var special:String = RNG.pickWeightedDict({
			"": 100.0, "guy": 10.0, "girl": 10.0,
		})
		if(special == "guy"):
			playAnimation(StageScene.Duo, "stand", {npc=C_GUY})
			saynn("Leo suddenly steps through the door.")
			talk(C_GUY, "Excuse me, coming through.")
			saynn("He almost just walks past you.. but then he stops.")
			talk(C_GUY, RNG.pick([
				"Wait. Step away from the door please.",
				"Hm. Don't touch this door please.",
				"You shouldn't mess with this door or Sofie is gonna be angry.",
				"Wait. What are you doing here?"
			]))
			addObedience(-1)
		if(special == "girl"):
			playAnimation(StageScene.Duo, "defeat", {npc=C_GIRL})
			saynn("The door hits your nose as Sofie suddenly opens it!")
			addPain(20)
			talk(C_GIRL, RNG.pick([
				"Why are you so dumb? Don't make me punish you.",
				"Really? Get away from the door or I will hurt you.",
				"Get away from the door, dumb animal.",
				"Back off, you stupid "+cowBull()+".",
			]))
			addObedience(-1)
		
		saynn("If you keep trying, [b]someone will certainly notice you.[/b]")
		
		addContinueEventTrigger()
	if(_id == "endingLockCheck"):
		setState("failedlockescape")
		padlockDamage = 0.8
		
	if(_id == "idleSmash"):
		aimCamera(L_DOOR)
		
		saynn("You wait for a good moment and hit the door!")
		addStamina(-30)
		
		addPadlockDamage(RNG.randf_range(1.0, 3.0))
		
		if(cageRemoved):
			saynn("Pip joins and kicks the door with his powerful hooves as well!")
			addPadlockDamage(RNG.randf_range(1.0, 3.0))
		
		if(padlockDamage >= 1.0):
			saynn("[b]The padlock got broken![/b] But there is not enough time to do anything about it now.")
		
		if(RNG.chance(30.0 - 10.0*getShivAmount())):
			saynn("A small piece of the door splinters off.. quite a sharp piece.")
			addShiv()
		
		var special:String = RNG.pickWeightedDict({
			"": 100.0, "guy": 10.0, "cuffs": 10.0,
		})
		if(special == "guy"):
			playAnimation(StageScene.Duo, "stand", {npc=C_GUY})
			saynn("A few seconds later, Leo steps out.")
			talk(C_GUY, RNG.pick([
				"Hey. Uh. Can you stop?",
				"Don't touch this door.",
				"Keep away from this door please.",
			]))
			saynn("At least you got out easy.")
			addObedience(-1)
		if(special == "girl"):
			if(RNG.chance(10.0 - obedience*20.0)):
				saynn("A few moments later, Sofie open the door and grabs you.")
				talk(C_GIRL, RNG.pick([
					"That was dumb.",
					"Alright, you're getting it!",
					"Fine, you're getting it.",
					"Fine, you want a punishment?",
					"Asking for a punishment, whore.",
				]))
				bullyScene(C_PC)
				addObedience(-2)
			else:
				playAnimation(StageScene.Duo, "defeat", {npc=C_GIRL})
				saynn("A few moments later, Sofie flings the door open and shoves you down to the floor.")
				addPain(5)
				talk(C_GIRL, RNG.pick([
					"Stop doing that, you stupid whore.",
					"Don't touch this door, you dumb bitch.",
					"Don't touch this door or you will regret it.",
					"I will make sure it hurts more next time.",
				]))
				addObedience(-2)
			if(RNG.chance(100.0 - obedience*70.0)):
				saynn("She pulls out some cuffs and locks them around your ankles!")
				GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))
		
		addContinueEventTrigger()
	if(_id == "idleCowBreasts"):
		aimCamera(L_COW)
		playAnimation(StageScene.BreastGroping, "grope", {pc="pc", npc="psmilka"})
		
		milkaExtraBreastSize += 2
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
		
			addContinueEventTrigger()
			addAction("Your breasts", "Allow Milka to use the cream on your breasts, making them bigger!", "milkaUseCreamOnPC")
		else:
			talk(C_COW, RNG.pick([
				"Ah.. I'm a better cow now.",
			]))
			addContinueEventTrigger()
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
		addContinueEventTrigger()
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
		cageDamage += RNG.randf_range(0.2, 0.3)
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
		addContinueEventTrigger()
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
			saynn("Thick ropes of cum land all across the floor as Pip moans in bliss, his body shaking hard as you pump his ass full of your spunk.")
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
		
		addContinueEventTrigger()

	if(_id == "talkCow"):
		playAnimation(StageScene.Duo, "stand", {npc=C_COW})
		aimCamera(L_COW)
		saynn("You spend some time hanging out with the cow.")
		addCowTrust(1)
		sayMilkaLine()
		
		if(cowTrust >= 0.1 && !canHelpMilka):
			canHelpMilka = true
			saynn("Before you go..")
			talk(C_COW, "OH!")
			saynn("You stop and watch her pull some kind of.. cream tube.")
			talk(C_COW, "The owner bought it for me. But he is too busy running the cafe to apply it.")
			saynn("You read the effects.. estrogen, prolactin.. apparently this cream is supposed to help with the lactation. Needs to be applied directly to the breasts.")
			talk(C_COW, "I'm too afraid to use it myself, I'm just a cow!")
		elif(helpedMilka):
			saynn("You chat a little more.")
			sayMilkaLine()
		
		addContinueEventTrigger()
	if(_id == "talkBull"):
		playAnimation(StageScene.Duo, "stand", {npc=C_BULL})
		aimCamera(L_BULL)
		saynn("You spend some time hanging out with the bull.")
		addBullTrust(1)
		sayPipLine()
		
		if(bullTrust >= 0.1 && !canHelpCage):
			canHelpCage = true
			saynn("Before you go, he shows you his chastity cage. His locked away cock is pulsing hard inside its tight little prison.")
			talk(C_BULL, "It's been there for at least a few months. I'm fucking desperate. Maybe you can try to do something? If you have the time.")
			saynn("A caged bull just isn't right. On the other hand, maybe that's just his fate now.")
		elif(cageRemoved):
			saynn("You chat a little more.")
			sayPipLine()
		
		addContinueEventTrigger()
	if(_id == "talkAnnoy"):
		saynn(RNG.pick([
			"You bang on the door to annoy your owners.",
			"You annoy the owners while they get something from their little garden.",
			"You annoy the owners while they check on the bull and the cow.",
			"You annoy the owners while they are busy washing the other livestock.",
		]))
		addObedience(-3)
		var special:String = RNG.pickWeightedDict({
			"nothing": 5.0,
			"treat": 5.0 if getTreatAmount() <= 1 else 1.0,
			"bully": 2.0 - obedience*3.0,
			"shiv": 2.0 - getShivAmount()*0.5,
		})
		if(special == "treat"):
			playAnimation(StageScene.Duo, "stand", {npc=C_GUY})
			saynn("Leo walks up to you.")
			talk(C_GUY, "Sofie really doesn't like that you're making so much noise.")
			saynn("His hand produces a slice of an apple.")
			talk(C_GUY, "If I give you a treat, will you behave?")
			saynn("You nod, obviously. The guy hands you the treat.")
			addTreat(1)
		if(special == "bully"):
			saynn("Sofie gets extremely annoyed with you.")
			talk(C_GIRL, RNG.pick([
				"SHUT UP, BITCH.",
				"YOU ARE SUCH A WHINY BITCH.",
				"YOU WANT MY ATTENTION? YOU GOT IT, WHORE.",
			]))
			bullyScene(C_PC)
		if(special == "shiv"):
			if(bullTopic <= 0):
				saynn("After that stunt, one of the other slaves approaches you.")
				talk(C_BULL, "Hey.. you don't know me.. but I think this might be more useful to you than me.")
				saynn("He hands you a sharpened rock.. could be used as a weapon.")
				
			else:
				saynn("After that stunt, Pip approaches you.")
				talk(C_BULL, "Hey.. I think this might be more useful to you than me.")
				saynn("He hands you a sharpened rock.. could be used as a weapon.")
			addShiv()
		
		addContinueEventTrigger()
	if(_id == "talkCowMilk"):
		if(cowTopic > 0):
			saynn("You make Milka an offer to milk her. She agrees.")
		else:
			saynn("You tell the cow that it's time for you to milk her.")
		milkScene(C_PC, C_COW)
		addStamina(-40)
		addCowTrust(3)
		addContinueEventTrigger()
		if(helpedMilka):
			addAction("Breed her", "Fuck Milka with your cock or a strapon!", "milkaRewardBreed")
		else:
			addDisabledAction("Breed her", "She doesn't trust you enough..")
	if(_id == "talkBullMilk"):
		if(bullTopic > 0):
			saynn("You make Pip an offer to milk him. He agrees.")
		else:
			saynn("You tell the bull that it's time for you to milk him.")
		milkScene(C_PC, C_BULL)
		addStamina(-40)
		addBullTrust(3)
		addContinueEventTrigger()
	if(_id == "eatGrass"):
		aimCamera(L_EAT)
		if(upgradeLevel >= UPGRADE_GRASS):
			saynn("You go out onto the field and eat some of that tasty grass.")
			addStamina(50)
			GM.pc.fillBalls(0.2)
			GM.pc.fillBreasts(0.2)
		else:
			saynn("You go out onto the field and eat some grass.")
			addStamina(30)
		addObedience(1)
		var special:String = RNG.pickWeightedDict({
			"nothing": 5.0,
			"cow": 1.0,
			"bull": 1.0,
		})
		if(special == "cow" && cowTrust > 0.0):
			playAnimation(StageScene.Duo, "stand", {npc=C_COW})
			GlobalRegistry.getCharacter(C_COW).fillBreasts(0.5)
			saynn("Milka does the same nearby, chewing on some grass blades.")
			talk(C_COW, RNG.pick([
				"Tasty, isn't it?",
				"Moo~. Free grass.. Constant milking.. What else would a cow want?",
				"Happy times!",
				"Enough grass for us both!",
			]))
			saynn("You.. nod.")
			addCowTrust(2)
		if(special == "bull" && bullTrust > 0.0):
			playAnimation(StageScene.Duo, "stand", {npc=C_BULL})
			GlobalRegistry.getCharacter(C_BULL).fillBalls(0.5)
			saynn("Pip hides in the corner of the field, chewing on a single grass blade.")
			talk(C_BULL, RNG.pick([
				"They have a whole ass garden.. but we're only allowed to eat grass.",
				"I'm not a grass-eater, okay? I just.. need something to chew on at least.",
				"I wanna step on their berries so much.. but they will do the same with mine.",
				"This place isn't so bad, is it? Eh, who am I kidding..",
			]))
			saynn("You nod.")
			addBullTrust(2)
		addContinueEventTrigger()
	if(_id == "eatStarve"):
		saynn("Anything is better than eating grass. You decide to just starve.")
		addStamina(-30)
		if(GM.pc.getStamina() <= 0):
			saynn("Ow.. Your belly hurts..")
			addPain(20)
		if(getTreatAmount() <= 0 && RNG.chance(20+GM.pc.getPainLevel()*80.0+clamp(obedience, 0.0, 1.0)*50.0)):
			playAnimation(StageScene.Duo, "stand", {npc=C_GUY})
			saynn("Leo approaches you and hands you a carrot..")
			talk(C_GUY, "I know the grass isn't what you normally eat. But don't starve yourself, okay? Don't tell Sofie.")
			saynn("Free treat, hey.")
			addTreat(1)
		addContinueEventTrigger()
	if(_id == "eatDemand"):
		saynn("You demand to be fed normal food!")
		addObedience(-2)
		if(RNG.chance(max(20.0+obedience*50.0, 10.0))):
			saynn("The owners.. actually feed you. They give you some leftovers to munch on.")
			addStamina(40)
		else:
			saynn("The owners don't seem to care. Looks like you're starving..")
			addStamina(-30)
		addContinueEventTrigger()
	if(_id == "eatTreat"):
		saynn("You eat a treat! It was very tasty.")
		addStamina(100)
		addPain(-100)
		saynn("But, soon, it ended.")
		addTreat(-1)
		
		if(RNG.chance(30) && cowTrust > 0.0):
			saynn("Milka drools while watching you.")
			if(getTreatAmount() > 0):
				saynn("You just can't watch Milka's puppy eyes.. You have a spare treat so you decide to give it to her.")
				talk(C_COW, "For me? Thank you-u-u~!")
				addCowTrust(3)
				addTreat(-1)
				
		if(RNG.chance(20) && bullTrust > 0.0):
			saynn("Pip sighs.")
			talk(C_BULL, RNG.pick([
				"That was enough, huh?",
				"I see how it is.",
				"Eating treats that they gave you, huh?",
			]))
			saynn("You can hear some jealousy in his voice.")
			addBullTrust(-1)
		
		addContinueEventTrigger()
	if(_id == "needyMilk"):
		saynn("You ask to be milked an extra time..")
		addObedience(1)
		milkScene(RNG.pick([C_GUY, C_GIRL]), C_PC)
		addContinueEventTrigger()
	if(_id == "needyRest"):
		saynn("You decide to just chill..")
		addStamina(20)
		
		var possible:Array = []
		if(cowTrust > 0.0 && RNG.chance(20+cowTrust*100.0)):
			possible.append("cow")
		if(bullTrust > 0.0 && RNG.chance(20+bullTrust*100.0)):
			possible.append("bull")
		if(obedience > 0.5 && RNG.chance(10.0)):
			possible.append("guy")
		
		if(!possible.empty()):
			var randP:String = RNG.pick(possible)
			if(randP == "cow"):
				playAnimation(StageScene.Duo, "stand", {npc=C_COW})
				saynn("Milka joins and chats with you.")
				sayMilkaLine()
				addCowTrust(2)
			if(randP == "bull"):
				playAnimation(StageScene.Duo, "stand", {npc=C_BULL})
				saynn("Pip joins and chats with you.")
				sayPipLine()
				addBullTrust(2)
			if(randP == "guy"):
				playAnimation(StageScene.Duo, "stand", {npc=C_GUY})
				saynn("Leo joins and chats with you.")
				sayLeoLine()
		
		#GM.pc.orgasmFrom("pc")
		addContinueEventTrigger()
	if(_id == "needyOfferSelf"):
		saynn("You decide to offer your body to the owners..")
		
		saynn("Who do you want to fuck you?")
		
		setState("needySex")
		addAction("Leo", "Let the guy fuck you", "startSex", [C_GUY, C_PC, SexType.DefaultSex, {SexMod.BondageDisabled: true, SexMod.DisableDynamicJoiners: true}])
		addAction("Sofie", "Let the girl fuck you", "startSex", [C_GIRL, C_PC, SexType.DefaultSex, {SexMod.BondageDisabled: true, SexMod.DisableDynamicJoiners: true}])
		addAction("Both", "Let them both have fun with you", "startSex", [[C_GIRL, C_GUY], C_PC, SexType.DefaultSex, {SexMod.BondageDisabled: true, SexMod.DisableDynamicJoiners: true}])
	if(_id == "needyComplain"):
		saynn("You complain about your neediness!")
		addObedience(-2)
		
		if(RNG.chance(30)):
			saynn("Suddenly, you get approached.")
			bullyScene(C_PC)
		
		addContinueEventTrigger()
	
	if(_id == "startEvent"):
		setState(_args[0])

func needySex_sexResult(_sex:SexEngineResult):
	saynn("The sex has ended!")
	if(_sex.didSubsWin()):
		saynn("They got beaten.")
		addObedience(-4)
	else:
		if(_sex.getAverageDomSatisfaction() < 0.7):
			saynn("They didn't like it.")
			addObedience(-2)
		else:
			addObedience(3)
			
			if(RNG.chance(30.0+obedience*70.0)):
				saynn("They gave you a treat!")
				addTreat(1)

	addContinue("setState", ["main"])

func sleep_state():
	aimCamera(L_SLEEP)
	saynn("It's getting late. The cafe is closed and the owners bring you back into your cells before locking the doors.")
	
	saynn("Time to try to sleep.")
	
	onDayEnd()
	
	if(gonnaHavePeekEvent):
		if(peekState == PEEK_FIRST_EVENT_HAPPENED):
			addAction("Sleep?", "It's time to sleep but you feel like something is about to happen..", "setState", ["ePeekFirstEvent"])
		if(peekState == PEEK_SECOND_EVENT_HAPPENED):
			addAction("Sleep?", "It's time to sleep but you feel like something is about to happen..", "setState", ["ePeekSecondEvent"])
		if(peekState == PEEK_THIRD_EVENT_HAPPENED):
			addAction("Sleep?", "It's time to sleep but you feel like something is about to happen..", "setState", ["ePeekThirdEvent"])
		return
	addAction("Sleep", "Time to sleep", "SLEEP")

func sleepScene():
	aimCamera(L_SLEEP)
	playAnimation(StageScene.Sleeping, "sleep")
	GM.main.startNewDay()
	GM.pc.afterSleeping(false)
	saynn("It's a new day. Time to wake up.")
	if(upgradeLevel >= UPGRADE_CELLS):
		saynn("Sleeping on an actual bed is so much nicer.")
		addStamina(50)
		addPain(-100)
	else:
		saynn("The old crates don't make for the best bed so you barely feel refreshed.")
		addStamina(20)
		addPain(-50)
	
	if(obedience <= -1.0):
		addContinue("ENDING", ["end_annoying"])
	else:
		if(needsPunishment):
			addContinue("setState", ["morningpunish"])
		else:
			addContinue("setState", ["main"])
		if(GM.pc.getCredits() >= 0):
			saynn("[b]The owners have paid off their debt! You can be released![/b]")
			addAction("Freedom!", "You did your part. Time for the owners to do the same", "ENDING", ["end_credits"])

#func sleep_do(_id:String, _args:Array):
#	if(_id == "sleep"):
#
#			#setState("main")


func about_to_be_milked_by_guy_state():
	aimCamera(L_ACT)
	playAnimation(StageScene.Duo, "stand", {npc=C_GUY})
	saynn("Leo approaches you.")
	if(agreeMilk && !GM.pc.canBeMilked() && !GM.pc.hasEffect(StatusEffect.HasCumInsideAnus) && !GM.pc.hasEffect(StatusEffect.HasCumInsideVagina)):
		talk(C_GUY, RNG.pick([
			"Time for milking. Are you lactating? If not, I will have to try to knock you up first.",
		]))
		saynn("Looks like he will try to breed you if you agree..")
	else:
		talk(C_GUY, RNG.pick([
			"I have to milk you now.",
			"Are you ready to be milked?",
			"Our cafe needs "+cowBullBoth("milk", "cream", "milk")+" to continue operating. I'm here to milk you.",
		]))
	
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
		if(day > 0 && RNG.chance(max(5.0 - obedience*50.0, 5.0))):
			playAnimation(StageScene.Duo, "stand", {npc=C_GIRL})
			setState("about_to_be_milked_by_girl")
			
			saynn("Suddenly, Sofie steps out and glares at you. Leo sees her and takes a few steps back.")
			talk(C_GIRL, RNG.pick([
				"Think you're so smart? Guess I'm gonna have to milk you myself.",
				"Leo might be soft but I'm not so lenient. Get ready to be punished.",
			]))
			saynn("Looks like she wants to fight you..")
			
			addAction("Fight!", "Start the fight", "startFight", [C_GIRL])
			if(getShivAmount() > 0):
				addAction("Shiv her!", "Use your shiv to make her fuck off", "useShiv")
		else:
			if(obedience < -0.1):
				talk(C_GUY, RNG.pick([
					"That's not good, I will have to tell Sofie.",
					"Don't be bratty, we will have to punish you then.",
					"I don't want to force you. But I would like to see more obedience."
				]))
			else:
				if(milkedToday <= 0):
					talk(C_GUY, RNG.pick([
						"Why not? You belong to us, remember? Ugh, fine.",
						"How are we gonna run the cafe? Please consider allowing me to milk you. I don't wanna force you.",
						"You better hope the other slaves will give us at least some milk and seed.",
						"The cafe might have to close if we can't even source the ingredients.."
					]))
				else:
					talk(C_GUY, RNG.pick([
						"We have some milk and cream already.. but if we have extra, the cafe can earn more profit.",
						"No? Okay. I guess we will have to make due with what we have.",
						"I don't wanna force you. But we need all of the "+cowBullBoth("milk", "cream", "milk and cream")+" we can get our hands on.",
					]))
			setState("main")

func about_to_be_milked_by_girl_state():
	aimCamera(L_ACT)
	playAnimation(StageScene.Duo, "stand", {npc=C_GIRL})
	saynn("Sofie approaches you.")
	if(agreeMilk && !GM.pc.canBeMilked() && !GM.pc.hasEffect(StatusEffect.HasCumInsideAnus) && !GM.pc.hasEffect(StatusEffect.HasCumInsideVagina)):
		talk(C_GIRL, RNG.pick([
			"I've came to milk you. I don't care if you're not lactating, I will just have to breed you first then.",
		]))
		saynn("Looks like she will try to knock you up if you agree..")
	else:
		if(obedience < -0.1):
			talk(C_GIRL, RNG.pick([
				"I've come to milk you. Gonna be a bitch again?",
				"It's milking time. Don't make it harder for yourself, just obey, slut.",
				"I've come to milk you. Do what I say or I will make you.",
			]))
		else:
			talk(C_GIRL, RNG.pick([
				"It's milking time.",
				"Got some "+cowBullBoth("milk", "cream", "milk and cream")+"? I need it all.",
				"I've come to milk you so you better behave.",
			]))
	saynn("It doesn't look like she is gonna take a no for an answer..")
	
	addAction("Allow", "Let her milk you", "agree")
	addAction("Fight!", "Resist her attempts", "decline")

func about_to_be_milked_by_girl_do(_id:String, _args:Array):
	if(_id == "agree"):
		saynn("You decide to let her milk you.")
		addObedience(1)
		
		milkScene(C_GIRL, C_PC)
		setState("main")
	if(_id == "decline"):
		saynn("You decline her offer.")
		addObedience(-1)
		if(obedience < -0.1):
			talk(C_GIRL, RNG.pick([
				"Such a stubborn bitch. You will regret it.",
				"I'm getting sick of you. Fine, let's do this the hard way.",
				"Alright, try to stop me then, you stupid whore.",
			]))
		else:
			talk(C_GIRL, RNG.pick([
				"Really? I guess I'm gonna have to force you then.",
				"Such a silly animal. I will make you behave.",
				"You're nothing but an animal. Behave or I will make you.",
			]))
		saynn("Looks like you are gonna have to fight her.")
		addAction("Fight!", "Start the fight", "startFight", [C_GIRL])
		if(getShivAmount() > 0):
			addAction("Shiv her!", "Use your shiv to make her fuck off", "useShiv")
	if(_id == "useShiv"):
		playAnimation(StageScene.Duo, "shiv", {npc=C_GIRL, npcAction="defeat"})
		saynn("Before Sofie can react, you pull out a shiv and attack her with it!")
		
		talk(C_GIRL, RNG.pick([
			"OW, FUCKER!",
			"WHERE DID YOU GET THAT, YOU BITCH?",
			"UGH, I WILL BREAK YOU.. fuck..",
		]))
		addObedience(-3)
		
		if(RNG.chance(10 - (getShivAmount()-1)*3)):
			saynn("Sofie grunts as she leaves. Miraculously, [b]you managed to keep the shiv[/b].")
		else:
			saynn("Sofie grunts as she leaves. Sadly, her skin is thick enough to break the shiv.")
			useShiv()
		setState("main")
	
func about_to_be_milked_by_girl_fightResult(_didPCWin:bool):
	if(_didPCWin):
		saynn("You managed to fight Sofie off!")
		talk(C_GIRL, RNG.pick([
			"I'm not done with you, slut..",
			"Argh.. Screw you then, you stupid bitch.",
			"Alright, fuck you, I will go milk someone else.",
			"I will just make cupcakes out of you if you're gonna keep doing this.",
		]))
		
		addObedience(-5)
	else:
		saynn("You lost the fight..")
		talk(C_GIRL, RNG.pick([
			"Pathetic.",
			"That was dumb. Very dumb.",
			"Stop being such a fucking brat.",
			"I got enough lazy fucks around me.",
		]))
		saynn("Sofie grabs you and prepares for the milking procedure.")
		
		milkScene(C_GIRL, C_PC)
	
	addContinue("setState", ["main"])

func parse(_text:String, _chars:Dictionary):
	return GM.ui.processString(_text, _chars)

var charOverrides:Dictionary = {}# no sync

func sayParsed(_text:String):
	saynn(parse(_text, charOverrides))

func stimulateLactation(_target:BaseCharacter, forceLactation:bool = false) -> bool:
	if(forceLactation):
		_target.induceLactation()
	if(_target.stimulateLactation() || _target.stimulateLactation()):
		return true
	return false

func getBreastsCapacity(_target:BaseCharacter) -> float:
	if(!_target.hasBodypart(BodypartSlot.Breasts)):
		return 0.0
	var theBreasts = _target.getBodypart(BodypartSlot.Breasts)
	var theProduction = theBreasts.getFluidProduction()
	if(!theProduction):
		return 0.0
	return theProduction.getCapacity()

func getBallsCapacity(_target:BaseCharacter) -> float:
	if(!_target.hasBodypart(BodypartSlot.Penis)):
		return 0.0
	var thePenis = _target.getBodypart(BodypartSlot.Penis)
	var theProduction = thePenis.getFluidProduction()
	if(!theProduction):
		return 0.0
	return theProduction.getCapacity()

func induceLactationScene(_actorID:String, _targetID:String):
	addChar(_actorID)
	addChar(_targetID)
	charOverrides = {actor=_actorID, target=_targetID}
	var _isPCActor:bool = (_actorID == C_PC)
	var _isPCTarget:bool = (_targetID == C_PC)
	var _actor:BaseCharacter = GlobalRegistry.getCharacter(_actorID)
	var _target:BaseCharacter = GlobalRegistry.getCharacter(_targetID)
	
	var _hasVag:bool = _target.hasReachableVagina()
	var _canGetPreg:bool = _target.hasWombIn(BodypartSlot.Vagina if _hasVag else BodypartSlot.Anus) && _target.getFertility() > 0.3
	
	var _hasCumAlready:bool = false
	if(_hasVag && _target.hasEffect(StatusEffect.HasCumInsideVagina)):
		_hasCumAlready = true
	if(!_hasVag && _target.hasEffect(StatusEffect.HasCumInsideAnus)):
		_hasCumAlready = true
	
	sayParsed("{actor.You} {actor.youVerb('check')} {target.your} {target.breasts}, squeezing them.. and finding no milk.")
	if(_actorID == C_GIRL):
		talk(_actorID, RNG.pick([
			"No milk in your tits. We need to fix that.",
			"Your stupid tits aren't lactating. I'm gonna fix that."
		]))
	elif(_actorID == C_GUY):
		talk(_actorID, RNG.pick([
			"You're not lactating, I don't think. I will have to do something about that first.",
			"You're not lactating. We need to fix that."
		]))
	else:
		talk(_actorID, "You're not lactating. We need to fix that.")
	
	# Just stimulate breasts
	if(_hasCumAlready):
		playAnimation(StageScene.BreastGroping, "grope", {pc=_actorID, npc=_targetID, npcBodyState={naked=true,hard=true}})
		sayParsed("{actor.You} {actor.youVerb('see')} that {target.yourHis} "+("cunt" if _hasVag else "tailhole")+" is already creamed enough so {actor.youHe} just {actor.youVerb('pull')} {target.youHim} into a tight embrace and {actor.youVerb('begin')} tightly-squeezing {target.yourHis} {target.breasts}, stimulating them!")
		talk(_targetID, "Ah..")
		if(stimulateLactation(_target, lactationTry >= (6 if _canGetPreg else 3))):
			lactationTry = 0
			sayParsed("And soon enough, {target.yourHis} nipples start squirting {target.milk}! {target.YouHe} [b]began lactating[/b]!")
			talk(_actorID, "There we go.")
		else:
			sayParsed("{target.YourHis} nipples get hard and sensitive from the stimulation.. But there is no milk still.")
			talk(_actorID, "We will keep trying.")
	# BREED
	else:
		var _isStrap:bool = false
		if(addStrapon(_actorID, C_GUY)):
			_isStrap = true
			sayParsed("{actor.You} {actor.youVerb('secure')} a strapon around {actor.yourHis} waist and {actor.youVerb('load')} it with something that looks a lot like cum..")
			if(!_canGetPreg):
				talk(_targetID, "Wait, I can't get pregnant.")
				if(_actorID == C_GIRL):
					talk(_actorID, "I will keep trying until you do, slut.")
				else:
					talk(_actorID, "We will see if that's true.")
			else:
				talk(_targetID, "Are you really planning to breed me!?")
				if(_actorID == C_GIRL):
					talk(_actorID, "Bitch, I own you, of course I will knock you up.")
				else:
					talk(_actorID, "Cows make a lot more milk if they're pregnant.")
			sayParsed("{target.You} {target.youVerb('get')} pinned to the floor!")
		else:
			sayParsed("{actor.You} {actor.youVerb('pull')} {actor.yourHis} {actor.penis} out..")
			if(!_canGetPreg):
				talk(_targetID, "Wait, I can't get pregnant.")
				if(_actorID == C_GIRL):
					talk(_actorID, "I will keep trying until you do, slut.")
				else:
					talk(_actorID, "We will see if that's true.")
			else:
				talk(_targetID, "Are you really planning to breed me!?")
				if(_actorID == C_GIRL):
					talk(_actorID, "Bitch, I own you, of course I will knock you up.")
				else:
					talk(_actorID, "Cows make a lot more milk if they're pregnant.")
			sayParsed("{target.You} {target.youVerb('get')} pinned to the floor!")
		
		if(_isStrap):
			playAnimation(StageScene.SexLowDoggy, "fast", {pc=_actorID, npc=_targetID, pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
			sayParsed("{actor.You} {actor.youVerb('slam')} {actor.yourHis} shiny strapon down {target.yourHis} "+str("tailhole" if !_hasVag else "pussy")+" and {actor.youVerb('pound')} it hard until the tightness makes the toy release its load deep inside {target.youHim}!")
		else:
			playAnimation(StageScene.SexLowDoggy, "fast", {pc=_actorID, npc=_targetID, pcCum=true, npcCum=true, bodyState={showPenis=true, hard=true}, npcBodyState={naked=true, hard=true}})
			sayParsed("{actor.You} {actor.youVerb('slam')} {actor.yourHis} {actor.penis} down {target.yourHis} "+str("tailhole" if !_hasVag else "pussy")+" and {actor.youVerb('pound')} it hard until the orgasm makes {actor.youHim} stuff it full of {actor.yourHis} seed!")
		
		if(_hasVag):
			_target.gotVaginaFuckedBy(_actorID)
			_target.cummedInVaginaBy(_actorID, FluidSource.Strapon if _isStrap else FluidSource.Penis)
		else:
			_target.gotAnusFuckedBy(_actorID)
			_target.cummedInAnusBy(_actorID, FluidSource.Strapon if _isStrap else FluidSource.Penis)
		_target.orgasmFrom(_actorID)
		_actor.orgasmFrom(_targetID)
		if(!_canGetPreg):
			if(stimulateLactation(_target, lactationTry >= (6 if _canGetPreg else 3))):
				lactationTry = 0
				sayParsed("{target.Your} {target.breasts} suddenly start leaking {target.milk}! {target.YouHe} [b]began lactating[/b]!")
				if(_actorID == C_GIRL):
					talk(_actorID, "Much better. All you needed is some good old breeding.")
				else:
					talk(_actorID, "There we go. And you doubted me.")
	if(_targetID == C_PC):
		addStamina(-20)

func bullyScene(_targetID:String):
	addChar(C_GIRL)
	addChar(_targetID)
	charOverrides = {actor=C_GIRL, target=_targetID}
	#var _isPCActor:bool = (_actorID == C_PC)
	var _isPCTarget:bool = (_targetID == C_PC)
	var _actor:BaseCharacter = GlobalRegistry.getCharacter(C_GIRL)
	var _target:BaseCharacter = GlobalRegistry.getCharacter(_targetID)
	
	var possible:Array = []
	possible.append(["choke", 1.0])
	possible.append(["puppypin", 1.0])
	possible.append(["chokeride", 1.0])
	possible.append(["sitface", 1.0])
	possible.append(["feetcrotch", 1.0])
	possible.append(["feetface", 1.0])
	possible.append(["lickcrotch", 1.0])
	possible.append(["spank", 1.0])
	
	var bullyWay:String = RNG.pickWeightedPairs(possible)
	if(bullyWay == "choke"):
		playAnimation(StageScene.Choking, "idle", {pc=C_GIRL, npc=_targetID})
		sayParsed("Sofie grabs {target.your} throat and puts enough pressure on it to make {target.youHim} see darkness in {target.yourHis} eyes.")
		talk(C_GIRL, RNG.pick([
			"Not so tough now, are you?",
			"What's gonna break first, your neck or your spirit?",
			"Seeing stars already? These are the only stars you will ever see.",
			"You are nothing but a slave. My slave!",
			"You are a fucking slave, hear me?",
		]))
	elif(bullyWay == "puppypin"):
		playAnimation(StageScene.PuppyPinned, "pinned", {pc=C_GIRL, npc=_targetID, npcBodyState={naked=true,hard=true,leashedBy=C_GIRL}})
		sayParsed("Sofie shoves some puppy restraints onto {target.your} arms and legs before pinning {target.youHim} to the floor with her leg, her toes brushing against the back of {target.yourHis} head.")
		talk(C_GIRL, RNG.pick([
			"Bark, you dumb mut.",
			"Say something and I will keep these on you.",
			"Nothing but a breeding bitch.",
			"Wiggle your ass for me, bitch. Show me what I paid for.",
		]))
	elif(bullyWay == "chokeride"):
		playAnimation(StageScene.SexCowgirlChoke, "tease", {pc=_targetID, npc=C_GIRL, bodyState={naked=true, hard=true, leashedBy=C_GIRL}})
		sayParsed("Sofie pulls {target.you} down to the floor and then straddles {target.youHim}, leaning down to wrap both hands around {target.yourHis} throat, making it extremely hard to breathe.")
		talk(C_GIRL, RNG.pick([
			"Not so tough now, are you?",
			"What's gonna break first, your neck or your spirit?",
			"Seeing stars already? These are the only stars you will ever see.",
			"You are nothing but a slave. My slave!",
			"You are a fucking slave, hear me?",
		]))
	elif(bullyWay == "sitface"):
		playAnimation(StageScene.SexFaceSitting, "grind", {pc=C_GIRL, npc=_targetID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, leashedBy=C_GIRL}})
		sayParsed("Sofie pushes {target.you} down to the floor and sits on top of {target.yourHis} face, grinding her soaking pussy against {target.yourHis} face, rocking her hips and glancing down at {target.youHim}.")
		talk(C_GIRL, RNG.pick([
			"You're nothing but my pussy licker, slut.",
			"You're enjoying this, aren't you? Stupid bitch.",
			"Drown in my cunt for all I care.",
			"I paid a lot for your ass. I get to use this face any way I want.",
			"Lick me. Do it or I will make you drown.",
		]))
	elif(bullyWay == "feetcrotch"):
		playAnimation(StageScene.SexFeetPlay, "crotch", {pc=C_GIRL, npc=_targetID, npcBodyState={naked=true, hard=true, leashedBy=C_GIRL}})
		if(_target.hasPenis()):
			sayParsed("Sofie flexes her toes and puts them over {target.your} {target.penis}, rubbing and applying just enough pressure to make {target.youHim} squirm and whine.")
			if(_target.isWearingChastityCage()):
				talk(C_GIRL, RNG.pick([
					"Your cock is useless anyway, should I crush it?",
					"Don't you dare drip onto my toes. I will crush your balls for that.",
					"You love it, huh? Pathetic.",
				]))
			else:
				talk(C_GIRL, RNG.pick([
					"You're lucky I can milk this cock. Otherwise I'd just crush it.",
					"Don't you dare drip onto my toes. I will crush your balls for that.",
					"You love it, huh? Pathetic.",
				]))
		else:
			sayParsed("Sofie flexes her toes and puts them over {target.your} crotch, rubbing and applying just enough pressure to make {target.youHim} squirm and whine.")
			talk(C_GIRL, RNG.pick([
				"You love it, huh? Pathetic.",
				"Stupid bitch.",
				"Why are you so dumb?",
			]))
	elif(bullyWay == "feetface"):
		playAnimation(StageScene.SexFeetPlay, "head", {pc=C_GIRL, npc=_targetID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, leashedBy=C_GIRL}})
		sayParsed("Sofie lifts her foot and slowly brushes her toes across {target.your} cheek and lips, pressing her heel into {target.yourHis} jaw.")
		talk(C_GIRL, RNG.pick([
			"Suck on these. Do it, whore.",
			"Why are you blushing? You're enjoying it, huh?",
			"You look more pathetic than my husband.",
		]))
	elif(bullyWay == "lickcrotch"):
		playAnimation(StageScene.SexOralForced, "lick", {pc=C_GIRL, npc=_targetID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, leashedBy=C_GIRL}})
		sayParsed("Sofie yanks {target.you} down to {target.yourHis} knees and shoves her wet cunt into {target.yourHis} face.")
		talk(C_GIRL, RNG.pick([
			"You're nothing but my pussy licker, slut.",
			"You're enjoying this, aren't you? Stupid bitch.",
			"Drown in my cunt for all I care.",
			"I paid a lot for your ass. I get to use this face any way I want.",
			"Lick me. Do it or I will make you drown.",
		]))
	elif(bullyWay == "spank"):
		playAnimation(StageScene.Spanking, "fast", {pc=C_GIRL, npc=_targetID, npcBodyState={naked=true, hard=true}})
		sayParsed("Sofie brings {target.you} onto all fours and delivers a sharp smack to {target.yourHis} ass with her palm, again and again, making redness appear on {target.yourHis} skin.")
		talk(C_GIRL, RNG.pick([
			"Produce more for me or your ass will be glowing every day.",
			"Take it, slut.",
			"Gonna whine, huh?",
		]))
	sayParsed("After Sofie is satisfied with bullying {target.you}, she finally lets {target.youHim} be.")

func milkScene(_actorID:String, _targetID:String):
	addChar(_actorID)
	addChar(_targetID)
	if(_targetID == C_COW):
		GlobalRegistry.getCharacter(C_COW).induceLactation()
	charOverrides = {actor=_actorID, target=_targetID}
	var _isPCActor:bool = (_actorID == C_PC)
	var _isPCTarget:bool = (_targetID == C_PC)
	var _actor:BaseCharacter = GlobalRegistry.getCharacter(_actorID)
	var _target:BaseCharacter = GlobalRegistry.getCharacter(_targetID)
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
	
	if(_targetID == C_PC):
		if(_canMilkBreasts && !_target.canBeMilked()):
			induceLactationScene(_actorID, _targetID)
			lactationTry += 1
			return
		else:
			lactationTry = 0
	
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
		playAnimation(StageScene.Grope, "strokefast", {pc=_targetID, npc=_actorID, milkTank=true, pcCum=true, bodyState={naked=true,hard=true}})
		sayParsed("{actor.You} {actor.youVerb('lock')} eyes with {target.you} and {actor.youVerb('proceed')} to stroke {target.yourHis} {target.penis} in slow, firm strokes until {target.yourHis} seed splatters into the collection container!")
		if(_canUsePumps && _canMilkBreasts && addBreastPump(_targetID)):
			shouldMilkBreasts = true
			sayParsed("At the same time, two breast-pumps hum away at {target.yourHis} {target.breasts}, pulling out {target.milk}!")
	if(milkWay == "fingering"):
		shouldMilkPenis = true
		playAnimation(StageScene.SexFisting, "sex", {pc=_actorID, npc=_targetID, npcCum=true, npcBodyState={naked=true,hard=true}})
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
			sayParsed("{actor.You} {actor.youVerb('secure')} {target.you} over the advanced table, manipulators holding {target.yourHis} limbs in place. A pre-lubed strapon presses against {target.yourHis} tight ring, spreading it wide before sliding inside. {actor.You} {actor.youVerb('begin')} pounding {target.yourHis} ass nice and hard, using the info that the table provides to maximize the stimulation of the prostate. Soon, seed begins to dribble down into the fluid intake.")
		else:
			playAnimation(StageScene.MilkingProstateFuck, "fast", {pc=_targetID, npc=_actorID, pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={showPenis=true, hard=true}})
			sayParsed("{actor.You} {actor.youVerb('secure')} {target.you} over the advanced table, manipulators holding {target.yourHis} limbs in place. A {actor.penis} presses against {target.yourHis} tight ring, spreading it wide before sliding inside. {actor.You} {actor.youVerb('begin')} pounding {target.yourHis} ass nice and hard, using the info that the table provides to maximize the stimulation of the prostate. Soon, seed begins to dribble down into the fluid intake.")
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
	
	collectedEnough = false
	if(shouldMilkBreasts):
		var theCapacity:float = getBreastsCapacity(_target)
		if(theCapacity > 0.0):
			var fluidRatio:float = collectedMilk / theCapacity
			if(fluidRatio >= 0.2 || collectedMilk >= 400.0):
				collectedEnough = true
	if(shouldMilkPenis):
		var theCapacity:float = getBallsCapacity(_target)
		if(theCapacity > 0.0):
			var fluidRatio:float = collectedSeed / theCapacity
			if(fluidRatio >= 0.4 || collectedSeed >= 250.0):
				collectedEnough = true
	
	#var collectedTotal:float = collectedMilk + collectedSeed
#	var collectedTotalWeighted:float = collectedMilk + collectedSeed*3.0
#	if(collectedTotalWeighted < 10.0):
#		collectedEnough = false
#	else:
#		collectedEnough = true
	
	if(shouldMilkBreasts && shouldMilkPenis):
		sayParsed("{actor.You} managed to collect "+str(Util.roundF(collectedMilk, 1))+"ml of {target.milk} and "+str(Util.roundF(collectedSeed, 1))+"ml of {target.cum}.")
	elif(shouldMilkBreasts):
		sayParsed("{actor.You} managed to collect "+str(Util.roundF(collectedMilk, 1))+"ml of {target.milk}.")
	elif(shouldMilkPenis):
		sayParsed("{actor.You} managed to collect "+str(Util.roundF(collectedSeed, 1))+"ml of {target.cum}.")
	
	if(collectedEnough):
		if(_targetID == C_PC || _actorID == C_PC):
			pcGaveMilkOrSeed += 1
		if(_actorID == C_GIRL):
			talk(_actorID, RNG.pick([
				"Good enough.",
				"That's enough for now. I will be back soon.",
				"Good. Now go away.",
				"Sure, that will do.",
			]))
		elif(_actorID == C_GUY):
			talk(_actorID, RNG.pick([
				"Such a good "+("cow" if shouldMilkBreasts else "bull")+". Thank you.",
				"Well done, this will allow us to run the cafe for some time.",
				"This is great, thank you. Good "+("cow" if shouldMilkBreasts else "bull")+".",
				"The customers will enjoy it. Thank you.",
			]))
		else:
			talk(_actorID, RNG.pick([
				"Such a good "+("cow" if shouldMilkBreasts else "bull")+".",
				"Good "+("cow" if shouldMilkBreasts else "bull")+". Very good.",
				"Good "+("cow" if shouldMilkBreasts else "bull")+". Now go get some rest.",
				"Love to see it. You may rest now.",
			]))
		milkedToday += 1
	else:
		if(_actorID == C_GIRL):
			talk(_actorID, RNG.pick([
				"That's barely anything. Pathetic.",
				"Really? That's almost nothing. Useless bitch.",
				"Pretty much nothing. I wasted my time with you. Ugh.",
				"Pathetic yield, why am I even keeping you then.",
			]))
		elif(_actorID == C_GUY):
			talk(_actorID, RNG.pick([
				"That's.. not enough. Can you try better next time?",
				"That's not enough sadly. Some customers will have to stay hungry.",
				"Not enough.. "+("How am I gonna make cupcakes without cream.." if shouldMilkPenis else "How am I gonna make cappuccino without milk.."),
				"Not enough.. unfortunately.",
			]))
		else:
			talk(_actorID, RNG.pick([
				"That's not enough, sadly.",
				"Not enough, unfortunately.",
			]))


func failedlockescape_state():
	playAnimation(StageScene.Solo, "kick")
	aimCamera(L_COUNTER)
	
	saynn("You put your whole strength into the next attack.. and kick the reinforced door down! The padlock snaps in half, unable to keep you locked away any longer.")
	addStamina(-80)
	
	saynn("Feeling brave.. and inspired.. you rush out of that damn dungeon, your eyes squinting from the brightness of the cafe lights.")
	
	saynn("After making so much noise, the customers turns their heads towards you.. Their eyes become huge.")
	
	saynn("Without even realizing it, you vault over the counter and dash towards the exit!")
	
	addContinue("setState", ["fldown"])

func fldown_state():
	addChar(C_GUY)
	#addChar(C_GIRL)
	playAnimation(StageScene.Duo, "defeat", {npc=C_GUY, npcAction="stunbaton"})
	aimCamera(L_DOCKS)
	
	saynn("You don't think.. you just act. Fight or flight. But it looks like you are not flying today..")
	
	saynn("Leaving the cafe was the easy part.. but now you're in some kind of docks. Nothing but spaceships and complete void behind the windows.")
	
	saynn("You try to board one of the ships.. but the door's panel beeps at you.")
	
	saynn("And that's when the consequences catch up.. You feel immense pain as a cattle-prod gets shoved into your ribs, sending a shock that is strong enough to bring down an elephant, let alone you.")
	
	addPain(70)
	
	talk(C_GUY, "Sorry, I can't let you go.")
	
	saynn("You'd like to respond.. but you can't. Your body is spazzing out on the floor from the aftershocks..")
	
	saynn("Leo grabs your by the collar and pulls you back into the cafe.")
	
	talk(C_GUY, "Uh.. ignore us, please. Enjoy your meals, pretend we're not here.")
	
	saynn("Seeing a naked you.. and a guy with a cattle-prod.. most of the customers just pack up their things and leave in a hurry.")
	
	addContinue("setState", ["flback"])

func flback_state():
	addChar(C_GUY)
	addChar(C_GIRL)
	playAnimation(StageScene.Duo, "stand", {pc=C_GIRL, npc=C_GUY})
	aimCamera(L_CENTER)
	
	saynn("You get dragged off back into the dimly-lit staff-only room..")
	
	talk(C_GIRL, "REALLY? You let {pc.him} escape? What the fuck is wrong with you?!")
	
	talk(C_GUY, "I didn't. {pc.He} broke out somehow.")
	
	if(!cageRemoved && !helpedMilka):
		saynn("Still dizzy, you look around and see the other slaves. The bull sighs.. and the cow is just shaking in the corner, her terrified eyes are only focussed on the cattle prod.")
	elif(cageRemoved):
		saynn("Still dizzy, you look around and see the other slaves. The bull looks like he is ready to help you.. but there are also obvious signs of doubts in his stare. And the cow is just shaking in the corner, her terrified eyes are only focussed on the cattle prod.")
	else:
		saynn("Still dizzy, you look around and see the other slaves. The cow clearly wants to help any way she can.. but the sight of that cattle-prod is making her shiver and wince. The bull.. he just sighs at you and shakes his head.")
	
	saynn("You get a feeling that, without their combined help, you're screwed.")
	
	saynn("The owners step out and shut the door behind. You can hear them still arguing about it.")
	
	saynn("Looks like your escape attempt has failed.. And now everything hurts.")
	
	addContinue("setState", ["flcheck"])

func flcheck_state():
	processTurn()
	playAnimation(StageScene.Solo, "stand")
	
	saynn("After some time, you manage to get up.")
	
	saynn("The door is locked yet again.. but it looks like they just used the same half-broken padlock. These cheapskates didn't even bother to get a new one.")
	
	addContinue("setState", ["main"])



func morningpunish_state():
	addChar(C_GIRL)
	playAnimation(StageScene.SexCowgirlChoke, "tease", {pc="pc", npc=C_GIRL})
	
	saynn("Before you can get up, Sofie walks into your cell and pins you to the floor, her hands quickly find your throat!")
	talk(C_GIRL, RNG.pick([
		"WHY ARE YOU SO FUCKING LAZY? WHERE IS MY "+("MILK" if agreeMilk else "SEED")+"? HOW AM I SUPPOSED TO RUN MY CAFE?",
		"YOU THOUGHT THIS IS A HOLIDAY RESORT? YOU BETTER START GIVING ME YOUR "+("MILK" if agreeMilk else "SEED")+" OR I WILL HAVE TO SELL YOU. MAYBE EVEN IN BITS.",
		"BITCH, I BOUGHT YOU BECAUSE I NEED TO MAKE CUPCAKES OUT OF SOMETHING. GIVE ME "+("MILK" if agreeMilk else "SEED")+" OR IT WILL BE YOUR FLESH.",
		"YOU THINK YOU'RE SMART? I WILL TORTURE YOU UNTIL YOU START GIVING ME MY "+("MILK" if agreeMilk else "SEED")+". ALL OF IT.",
	]))
	
	saynn("She is clearly mad because you didn't make any seed or milk for the cafe..")
	
	saynn("You try to throw her off.. but it seems that she is not done punishing you yet..")
	
	addContinue("startSex", [C_GIRL, C_PC, SexType.DefaultSex, {SexMod.SubMustGoUnconscious:true, SexMod.DisableDynamicJoiners:true}])
	if(getShivAmount() > 0):
		addAction("Shiv her!", "Make her fuck off by shiving her", "useshiv")
	else:
		addDisabledAction("Shiv her!", "You don't have any shivs")

func morningpunish_do(_id:String, _args:Array):
	if(_id == "useshiv"):
		playAnimation(StageScene.Duo, "shiv", {npc=C_GIRL, npcAction="defeat"})
		
		saynn("You break free by forcing a shiv into her arm!")
		talk(C_GIRL, RNG.pick([
			"ARGH! YOU FUCKER!",
			"YOU BITCH.. FUCK!",
			"THAT FUCKING HURT, FUCKER.",
		]))
		if(RNG.chance(10 - (getShivAmount()-1)*3)):
			saynn("Sofie grunts as she leaves. Miraculously, [b]you managed to keep the shiv[/b].")
		else:
			saynn("Sofie grunts as she leaves. Sadly, her skin is thick enough to break the shiv.")
			useShiv()
		
		needsPunishment = false
		addContinue("setState", ["main"])

func morningpunish_sexResult(_sex:SexEngineResult):
	saynn("The punishment has ended!")
	if(_sex.didSubsWin()):
		playAnimation(StageScene.Duo, "shove", {npc=C_GIRL, npcAction="hurt"})
		saynn("You managed to fight back against Sofie.")
		talk(C_GIRL, RNG.pick([
			"..fucking slut.",
			"..stupid bitch.",
			"..I'm not done with you, whore.",
			"Ugh. Fuck you.",	
		]))
		saynn("She grunts.. and leaves you be.. for now.")
		addObedience(-5)
	else:
		if(_sex.isSubUnconscious(C_PC)):
			playAnimation(StageScene.SexStart, "defeated", {pc=C_GIRL})
			saynn("Sofie pulls her hands away from your throat and slaps your cheek a few times.")
			talk(C_GIRL, RNG.pick([
				"Get up, your dumb bitch. I know you're not dead.",
				"Get up. If you don't want more, you better start producing.",
			]))
			saynn("She quickly leaves and comes back with a bucket of water that she spills over your face. Refreshing.")
			addStamina(40)
			addPain(-50)
		elif(_sex.getAverageDomSatisfaction() < 0.7):
			playAnimation(StageScene.SexStart, "start", {pc=C_GIRL})
			saynn("Sofie is done with you.. but she doesn't exactly look satisfied.")
			talk(C_GIRL, RNG.pick([
				"You can't even struggle right.",
				"Why are you so fucking weak? Ughh, everyone around me is a mistake.",
				"Next time, try harder, you slut.",
			]))
			addObedience(-2)
		else:
			playAnimation(StageScene.SexStart, "start", {pc=C_GIRL})
			saynn("Sofie is done with you.. she doesn't seem so.. pent up.. anymore.")
			talk(C_GIRL, RNG.pick([
				"Start producing or you will see me again.",
				"If anything, at least I got myself a punching bag. Second one.",
				"Next time, try harder, you slut",
			]))
	
	if(!canMilkOthers):
		canMilkOthers = true
		saynn("Before she leaves, she adds one more thing..")
		talk(C_GIRL, "If you can't give me enough "+cowBullBoth("milk", "cream", "milk")+", start milking others. Be useful, bitch.")
	
	needsPunishment = false
	addContinue("setState", ["main"])



func eOwnerMilkSlave_state():
	var theOwner:String = RNG.pick([C_GUY, C_GIRL])
	var theSlave:String = RNG.pick([C_BULL, C_COW])
	charOverrides = {actor=theOwner, target=theSlave}
	addChar(theOwner)
	addChar(theSlave)
	playAnimation(StageScene.Duo, "stand", {pc=theOwner, npc=theSlave})
	if(theSlave == C_BULL):
		aimCamera(L_BULL)
	else:
		aimCamera(L_COW)
	
	sayParsed("{actor.You} {actor.youVerb('want')} to milk {target.you}!")
	
	if(theOwner == C_GIRL):
		talk(C_GIRL, RNG.pick([
			"It's milking time, slut.",
			"I've come to milk you so you better behave, you animal.",
		]))
	if(theOwner == C_GUY):
		talk(C_GUY, RNG.pick([
			"I have to milk you now.",
			"Are you ready to be milked?",
			"Our cafe needs milk and cream to continue operating. I'm here to milk you.",
		]))
	
	addAction("Watch", "See what happens", "doWatch", [theOwner, theSlave])
	if(obedience > 0.2):
		if(GM.pc.getStamina() > 0):
			if(GM.pc.hasBlockedHands() || GM.pc.hasBoundArms()):
				addDisabledAction("Help owner", "Your arms are bound..")
			else:
				addAction("Help owner", "Ask to be the one who is doing the milking.", "doHelp", [theOwner, theSlave])
		else:
			addDisabledAction("Help owner", "You don't have enough stamina")
	else:
		addDisabledAction("Help owner", "The owners don't trust you enough.")

func eOwnerMilkSlave_do(_id:String, _args:Array):
	var theOwner:String = _args[0]
	var theSlave:String = _args[1]
	charOverrides = {actor=theOwner, target=theSlave}
	if(_id == "doWatch"):
		milkScene(theOwner, theSlave)
		addContinue("setState", ["main"])
	if(_id == "doHelp"):
		sayParsed("You ask {actor.name} if you can help with the milking. {actor.He} decides to let you do it.")
		if(theOwner == C_GIRL):
			talk(theOwner, RNG.pick([
				"Sure, saves me time.",
				"Fine, be useful.",
				"Fuck it, go ahead. Squeeze every last drop out though.",
				"Whatever, go do it, I need to return to the counter.",
				"You? Okay. Don't you dare slacking off though.",
			]), false)
		else:
			talk(theOwner, RNG.pick([
				"Sure, saves me time.",
				"Fine, be useful.",
				"Fuck it, go ahead. Squeeze every last drop out though.",
				"Whatever, go do it, I need to return to the counter.",
				"You? Okay. Don't you dare slacking off though.",
			]), false)
		addObedience(2)
		milkScene(C_PC, theSlave)
		addStamina(-30)
		addContinue("setState", ["main"])


func eGirlBulliesSlave_state():
	var theOwner:String = C_GIRL
	var theSlave:String = RNG.pick([C_BULL, C_COW])
	charOverrides = {actor=theOwner, target=theSlave}
	addChar(theOwner)
	addChar(theSlave)
	playAnimation(StageScene.Duo, "stand", {pc=theOwner, npc=theSlave})
	if(theSlave == C_BULL):
		aimCamera(L_BULL)
	else:
		aimCamera(L_COW)
	
	sayParsed("{actor.You} {actor.youVerb('approach', 'aproaches')} {target.you}!")
	
	talk(theOwner, RNG.pick([
		"Why are you looking at me, you dumb animal? You wanna get punished?",
		"I'm feeling mean. Come here, slut.",
		"I'm not in a good mood. This means, it's humiliation time!",
		"Bitch, when was the last time I degraded you? I gotta show you your place again.",
		"Come here. I need a new reason to laugh at you.",
		"Look at you, standing there like you think you matter. You don't. Don't believe me?",
		"Did you forget your place already, you stupid animal? I can remind you.",
	]))
	
	sayParsed("{actor.You} clearly {actor.youVerb('want')} to bully {target.youHim}!")
	
	addAction("Let it happen", "See what happens", "doWatch", [theOwner, theSlave])
	addAction("Protect", "Protect the slave!", "doProtect", [theOwner, theSlave])
	addAction("Get bullied", "Make Sofie bully you instead", "takeBlame", [theOwner, theSlave])

func eGirlBulliesSlave_do(_id:String, _args:Array):
	var theOwner:String = _args[0]
	var theSlave:String = _args[1]
	charOverrides = {actor=theOwner, target=theSlave}
	if(_id == "doWatch"):
		bullyScene(theSlave)
		if(theSlave == C_BULL):
			addBullTrust(-3)
		else:
			addCowTrust(-3)
		addContinue("setState", ["main"])
	
	if(_id == "doProtect"):
		playAnimation(StageScene.Duo, "stand", {npc=C_GIRL})
		sayParsed("You attempt to protect {target.you} from Sofie!")
		if(theSlave == C_BULL):
			addBullTrust(5)
		else:
			addCowTrust(5)
		talk(C_GIRL, RNG.pick([
			"Really? You are even more dumb than I thought.",
			"I guess I will have you punish both of you.",
			"That was a big mistake.",
		]))
		sayParsed("Looks like you will have to fight.")
		addObedience(-1)
		addAction("Fight", "Start the fight", "startFight", [C_GIRL])
		if(getShivAmount() > 0):
			addAction("Shiv her!", "Use your shiv to make her fuck off", "useShiv")
	if(_id == "useShiv"):
		playAnimation(StageScene.Duo, "shiv", {npc=C_GIRL, npcAction="defeat"})
		saynn("Before Sofie can react, you pull out a shiv and attack her with it!")
		
		talk(C_GIRL, RNG.pick([
			"OW, FUCKER!",
			"WHERE DID YOU GET THAT, YOU BITCH?",
			"UGH, I WILL BREAK YOU.. fuck..",
		]))
		addObedience(-3)
		
		if(RNG.chance(10 - (getShivAmount()-1)*3)):
			saynn("Sofie grunts as she leaves. Miraculously, [b]you managed to keep the shiv[/b].")
		else:
			saynn("Sofie grunts as she leaves. Sadly, her skin is thick enough to break the shiv.")
			useShiv()
		addContinue("setState", ["main"])
		
	if(_id == "takeBlame"):
		playAnimation(StageScene.Duo, "stand", {npc=C_GIRL})
		sayParsed("You tell Sofie to let her anger on you instead!")
		talk(C_GIRL, RNG.pick([
			"Alright, you asked for it.",
			"Really? Are you that big of a slut?",
			"Sure, I will humiliate you as well.",
		]))
		bullyScene(C_PC)
		if(theSlave == C_BULL):
			addBullTrust(4)
		else:
			addCowTrust(4)
		addContinue("setState", ["main"])

func eGirlBulliesSlave_fightResult(_didPCWin:bool):
	if(_didPCWin):
		saynn("You managed to fight Sofie off!")
		talk(C_GIRL, RNG.pick([
			"I'm not done with you, slut..",
			"Argh.. Screw you then, you stupid bitch.",
			"Alright, fuck you then.",
			"I will just make cupcakes out of you if you're gonna keep doing this.",
		]))
		addObedience(-5)
	else:
		saynn("You lost the fight..")
		talk(C_GIRL, RNG.pick([
			"Pathetic.",
			"That was dumb. Very dumb.",
			"From hero to zero.",
			"I got enough lazy fucks around me.",
		]))
		bullyScene(C_PC)
	
	addContinue("setState", ["main"])




func eGirlCattleProdCow_state():
	var theOwner:String = C_GIRL
	var theSlave:String = C_COW
	charOverrides = {actor=theOwner, target=theSlave}
	addChar(theOwner)
	addChar(theSlave)
	playAnimation(StageScene.Duo, "stand", {pc=theOwner, npc=theSlave})
	if(theSlave == C_BULL):
		aimCamera(L_BULL)
	else:
		aimCamera(L_COW)
	
	sayParsed("Sofie approaches Milka with a cattle-prod in her hand!")
	talk(C_GIRL, RNG.pick([
		"Some shock is ought to help you make more milk.",
		"The cafe needs more milk, Milka. Show me your tits.",
		"Present your tits, cow.",
		"This will help your tits. Present them.",
	]))
	sayParsed("Milka shivers, her lips trembling.")
	talk(C_COW, RNG.pick([
		"It hurts when you do that..",
		"If you say so..",
		"I thought I make enough..",
	]))
	
	addAction("Let it happen", "See what happens", "doWatch", [theOwner, theSlave])
	addAction("Protect", "Protect the slave!", "doProtect", [theOwner, theSlave])

func eGirlCattleProdCow_do(_id:String, _args:Array):
	var theOwner:String = _args[0]
	var theSlave:String = _args[1]
	charOverrides = {actor=theOwner, target=theSlave}
	if(_id == "doWatch"):
		addChar(theOwner)
		addChar(theSlave)
		GlobalRegistry.getCharacter(C_COW).fillBreasts(1.0)
		playAnimation(StageScene.Duo, "stunbaton", {pc=theOwner, npc=theSlave, npcAction="hurt"})
		saynn("Sofie presses the cattle prod against Milka's breasts and squeezes the handle, sending a painful shock through her chest.")
		talk(C_COW, "Ow!")
		saynn("Milka's body convulses, her muscles all tensing up.. and her nipples squirt out pure milk! ")
		talk(C_GIRL, "Much better.")
	
	if(_id == "doProtect"):
		if(RNG.chance(50)):
			playAnimation(StageScene.Duo, "stunbaton", {pc=theOwner, npc="pc", npcAction="hurt"})
			
			saynn("You push Milka out of the cattle prod's way.. and get hit by it instead. Ow! Your whole body convulses from the sudden painful shock that is rocking through it.")
			addPain(40)
			addStamina(-25)
			
			talk(C_GIRL, "Really? Fine, your tits will do too.")
			addObedience(-1)
			
			if(GM.pc.isLactating()):
				GM.pc.fillBreasts(1.0)
				saynn("Your breasts [b]feel full, leaking {pc.milk}![/b]")
			else:
				if(GM.pc.stimulateLactation()):
					saynn("Your breasts [b]suddenly began lactating![/b]")
				else:
					saynn("Your breasts feel stimulated..")
			saynn("When Sofie leaves, Milka gives you a quick hug.")
			addCowTrust(4)
		else:
			playAnimation(StageScene.Duo, "stunbaton", {pc=theOwner, npc="pc", npcAction="dodge"})
			
			saynn("You push Milka out of the cattle prod's way.. and manage to dodge it as well!")
			addStamina(-25)
			saynn("Sofie rolls her eyes.")
			talk(C_GIRL, "I have no time for this. Screw you.")
			addObedience(-4)
			saynn("When Sofie leaves, Milka gives you a quick hug.")
			addCowTrust(4)
	
	addContinue("setState", ["main"])



func eGirlCattleProdBull_state():
	var theOwner:String = C_GIRL
	var theSlave:String = C_BULL
	charOverrides = {actor=theOwner, target=theSlave}
	addChar(theOwner)
	addChar(theSlave)
	playAnimation(StageScene.Duo, "stand", {pc=theOwner, npc=theSlave})
	if(theSlave == C_BULL):
		aimCamera(L_BULL)
	else:
		aimCamera(L_COW)
	
	sayParsed("Sofie approaches Pip with a cattle-prod in her hand!")
	talk(C_GIRL, RNG.pick([
		"Some shock is ought to help you make more seed.",
		"The cafe needs more cream, Pip. Show me your cock.",
		"Present your balls, bull.",
		"This will help your cum-production. Present yourself.",
	]))
	sayParsed("Pip steps back, away from her.")
	talk(C_BULL, RNG.pick([
		"Really? Use it on that weird cow, not me.",
		"You are NOT putting it anywhere near my balls.",
		"No-no-no, go away.",
		"I will get you your cream, you don't have to do this.",
	]))
	
	addAction("Let it happen", "See what happens", "doWatch", [theOwner, theSlave])
	addAction("Protect", "Protect the slave!", "doProtect", [theOwner, theSlave])

func eGirlCattleProdBull_do(_id:String, _args:Array):
	var theOwner:String = _args[0]
	var theSlave:String = _args[1]
	charOverrides = {actor=theOwner, target=theSlave}
	if(_id == "doWatch"):
		addChar(theOwner)
		addChar(theSlave)
		GlobalRegistry.getCharacter(C_BULL).fillBalls(1.0)
		playAnimation(StageScene.Duo, "stunbaton", {pc=theOwner, npc=theSlave, npcBodyState={hard=true}, npcAction="hurt"})
		saynn("Sofie presses the cattle prod against Pip's "+("chastity cage" if !cageRemoved else "balls")+" and squeezes the handle, sending a painful shock through him.")
		talk(C_BULL, "ARGH! FUCK!")
		saynn("Pip's body convulses, a guttural scream leaves his mouth.. "+("His locked cock throbs inside its tight prison, leaking with seed." if !cageRemoved else "His cock goes hard instantly, throbbing, flared tip dripping with seed."))
		talk(C_GIRL, "Much better.")
	
	if(_id == "doProtect"):
		if(RNG.chance(50)):
			playAnimation(StageScene.Duo, "stunbaton", {pc=theOwner, npc="pc", npcAction="hurt", npcBodyState={hard=true}})
			
			saynn("You push Pip out of the cattle prod's way.. and get hit by it instead. Ow! Your whole body convulses from the sudden painful shock that is rocking through it.")
			addPain(40)
			addStamina(-25)
			
			talk(C_GIRL, "You really wanna protect that pathetic joke of a stud? Pff.")
			addObedience(-1)
			
			if(GM.pc.hasPenis()):
				GM.pc.fillBalls(1.0)
				saynn("Your balls [b]feel full![/b]")
			elif(GM.pc.isLactating()):
				GM.pc.fillBreasts(1.0)
				saynn("Your breasts [b]feel full, leaking {pc.milk}![/b]")
			else:
				if(GM.pc.stimulateLactation()):
					saynn("Your breasts [b]suddenly began lactating![/b]")
				else:
					saynn("Your breasts feel stimulated..")
			saynn("When Sofie leaves, Pip approaches you.")
			talk(C_BULL, "This sucks. Sorry.")
			addBullTrust(4)
		else:
			playAnimation(StageScene.Duo, "stunbaton", {pc=theOwner, npc="pc", npcAction="dodge"})
			
			saynn("You push Pip out of the cattle prod's way.. and manage to dodge it as well!")
			addStamina(-25)
			saynn("Sofie rolls her eyes.")
			talk(C_GIRL, "I have no time for this. Screw you.")
			addObedience(-4)
			saynn("When Sofie leaves, Pip approaches you.")
			talk(C_BULL, "Fuck that bitch, right?")
			addBullTrust(4)
	
		if(RNG.chance(100.0 - getShivAmount()*40.0)):
			saynn("He hands you a sharpened stone.")
			addShiv()
			talk(C_BULL, "I hope this will be helpful to you.")
	
	addContinue("setState", ["main"])



func eEatAss_state():
	addChar(C_GIRL)
	playAnimation(StageScene.Duo, "stand", {pc=C_PC, npc=C_GIRL})

	saynn("Sofie approaches you, a tasty-looking treat in her hand.")
	talk(C_GIRL, "Want this? I know you do.")
	saynn("Her free hand grabs you by the collar.")
	talk(C_GIRL, "My ass needs a good eating.")
	if(GM.pc.isOralBlocked()):
		saynn("She jiggles some keys in front of your face.")
		talk(C_GIRL, "I will even free your face if you do.")
	
	addAction("Deny", "A treat isn't worth it", "deny")
	addAction("Eat ass", "Ohh, a treat!", "eatAss")

func eEatAss_do(_id:String, _args:Array):
	if(_id == "deny"):
		saynn("You deny her offer.")
		talk(C_GIRL, "Alright, screw you then.")
		addObedience(-1)
	
	if(_id == "eatAss"):
		GM.pc.freeEyesDeleteAll()
		GM.pc.freeMouthDeleteAll()
		playAnimation(StageScene.SexRimming, "fast", {pc=C_GIRL, npc=C_PC, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You obey by getting on your knees and watching Sofie turn around and shove her ass into your face.")	
		saynn("With gentle licks of your tongue, you begin serving her, getting her pucker nice and wet with your saliva.")
		talk(C_GIRL, RNG.pick([
			"C'mon, get your tongue in there, you slut.",
			"Do it properly or no treat!",
			"Mhh.. maybe I should use you as my ass-licker instead.",
		]))
		saynn("Quiet moans escape from the girl while you go at it, eating her ass, letting your tongue explore her star.")
		saynn("After the job is done, she reluctantly hands you the reward.")
		addTreat(1)
		addObedience(3)
	
	addContinue("setState", ["main"])

func eWannaCuddle_state():
	addChar(C_GUY)
	playAnimation(StageScene.Duo, "stand", {pc=C_PC, npc=C_GUY})

	saynn("Leo approaches you.")
	talk(C_GUY, "I'm not here to bully you, don't worry. Wanna chill together maybe?")
	
	addAction("Chill", "Agree to chill with your owner", "chill")
	addAction("No", "You'd rather not", "noChill")

func eWannaCuddle_do(_id:String, _args:Array):
	if(_id == "noChill"):
		saynn("You deny his offer.")
		talk(C_GUY, "Sure, okay, no problem.")
	
	if(_id == "chill"):
		playAnimation(StageScene.Cuddling, "idle", {pc=C_GUY, npc=C_PC})
		saynn("You decide to spend some time with the guy.")
		saynn("It's nice to not be abused or bullied for once. Leo is chatting with you while you just stay quiet mostly.")
		sayLeoLine()
		saynn("Eventually, he gets up and leaves.")
		addStamina(30)
		addObedience(1)
	
	addContinue("setState", ["main"])


func eCowSeesTreat_state():
	addChar(C_COW)
	playAnimation(StageScene.Beg, "beg", {pc=C_COW, npc=C_PC})

	saynn("Milka hops around.. before stopping near you and sniffing the air.")
	talk(C_COW, RNG.pick([
		"You have a treat? Can I have?? Pretty please-e-e-e-e!",
		"Treat? Please?.. I love treats..",
		"I sniff a treat on you! Since you haven't eaten it yet.. maybe I can..",
		"Treat?..",
	]))
	saynn("She gets on her knees before you.. her puppy eyes looking up at you.")
	
	addAction("Give treat", "Give Milka a treat", "give")
	addAction("No", "You'd rather save it", "noGive")

func eCowSeesTreat_do(_id:String, _args:Array):
	if(_id == "noGive"):
		saynn("You deny Milka.")
		talk(C_COW, "Aww..")
		saynn("She tries to hide it.. but she is certainly sad.")
		addCowTrust(-3)
	
	if(_id == "give"):
		playAnimation(StageScene.Beg, "pat", {pc=C_COW, npc=C_PC})
		saynn("How can you say no? You feed Milka the treat and give her a pat.")
		addTreat(-1)
		saynn("Milka happily noms the treat and eagerly nuzzles your hand!")
		talk(C_COW, RNG.pick([
			"Thank you, thank you, thank-youuuuu!",
			"It tasted SO GOOD!",
			"Thankiesssss!",
			"You are so kind!",
		]))
		addCowTrust(4)
	
	addContinue("setState", ["main"])


func eBullSeesTreat_state():
	addChar(C_BULL)
	playAnimation(StageScene.Duo, "stand", {pc=C_PC, npc=C_BULL})

	saynn("Pip slowly approaches you, his head lowered.")
	talk(C_BULL, RNG.pick([
		"I'm gonna be honest.. I'm hungry as fuck.. I don't wanna eat that stupid grass.. Do you maybe have something?",
		"I'm sorry for asking.. but do you maybe have something to eat? I hate the grass, man.. I hate it so much..",
	]))
	saynn("He looks desperate.")
	
	addAction("Give treat", "Give Pip a treat", "give")
	addAction("No", "You'd rather save it", "noGive")
	addAction("Eat ass!", "Tease him. Your ass is a great treat", "eatAss")

func eBullSeesTreat_do(_id:String, _args:Array):
	if(_id == "noGive"):
		saynn("You deny Pip.")
		talk(C_BULL, RNG.pick([
			"Shit.. fine..",
			"I saw that you had a treat.. but it's okay.. shit..",
			]))
		saynn("He heads towards the grass field.")
		addBullTrust(-2)
	if(_id == "give"):
		playAnimation(StageScene.Duo, "stand", {pc=C_PC, npc=C_BULL})
		saynn("You have a spare treat so you decide to give him one.")
		addTreat(-1)
		saynn("Pip grabs it and savours it, making sure to lick it from all sides.. before digging his teeth in.")
		talk(C_BULL, RNG.pick([
			"Shit, that tastes too good.. Thank you, friend.",
			"Fuck me that tastes good.. Thank you.",
			"What are they putting into these.. I want more.. Thank you.",
		]))
		addBullTrust(3)
	if(_id == "eatAss"):
		playAnimation(StageScene.SexRimming, "fast", {pc=C_PC, npc=C_BULL, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		talk(C_PC, "My ass is a good treat, you know.")
		saynn("He shrugs.")
		talk(C_BULL, "Sure.")
		saynn("You give him a confused look.. but he just commits to it, kneeling behind you and digging his face into your ass, dragging his long muscly tongue along the flesh of your {pc.analStretch} star..")
		saynn("Oh shit.. he slips his tongue inside, eating you out.. your whole body shivering..")
		if(GM.pc.isWearingChastityCage()):
			saynn("Your locked cock is pulsing in its cage.. your prostate is tingling from being stimulated..")
		elif(GM.pc.hasReachablePenis()):
			saynn("Your cock is pulsing, dripping pre.. your prostate is tingling from being stimulated..")
		elif(GM.pc.hasReachableVagina()):
			saynn("Your pussy is pulsing subtly, dripping juices..")
		saynn("Soft moans escape your lips while the guy is servicing you so thoroughly..")
		saynn("When he is done.. you're left trembling. Pip gets up and prepares to leave.")
		talk(C_PC, "Wait, want the treat?")
		talk(C_BULL, "Uh.. I guess I'm good now. Thanks.")
		addBullTrust(1)
	addContinue("setState", ["main"])

func eRandomStuff_state():
	var possible:Array = [
		"milkapip1",
		"milkapip2",
		"milkapip3",
		"milkapip4",
		"milkapip5",
		"milkapip6",
		"milkapip7",
	]
	
	var theEvent:String = RNG.pick(possible)
	if(theEvent == "milkapip1"):
		addChar(C_COW)
		addChar(C_BULL)
		playAnimation(StageScene.Duo, "stand", {pc=C_COW, npc=C_BULL})
		
		talk(C_BULL, "Can I ask something? Do you even understand that you're a slave?")
		talk(C_COW, "Moo? I'm a cow.. Cows can't be slaves..")
		talk(C_BULL, "You have a collar around your neck.")
		saynn("Milka tries to look down at her neck.")
		talk(C_COW, "Do I? Maybe I'm also a puppy then? A cowpup! Awoof-moo!")
		saynn("The guy sighs and just leaves her be.")
	if(theEvent == "milkapip2"):
		addChar(C_COW)
		addChar(C_BULL)
		playAnimation(StageScene.Duo, "stand", {pc=C_COW, npc=C_BULL})
		
		talk(C_COW, "Hope you're doing well, Pip!")
		talk(C_BULL, "I guess. Why are you asking? What do you want?")
		saynn("Milka blinks.")
		talk(C_COW, "Um.. I don't know.. uh.. I'm sorry..")
		saynn("Pip sighs.")
		talk(C_BULL, "It's okay, Milka.. It's okay. Thank you, hope you're well too.")
		saynn("Milka brightens up and gives the stud a quick nuzzle before running away.")
	if(theEvent == "milkapip3"):
		addChar(C_COW)
		addChar(C_BULL)
		playAnimation(StageScene.Duo, "stand", {pc=C_COW, npc=C_BULL})
		
		talk(C_COW, "Pip, do bulls like carrots?")
		talk(C_BULL, "That's.. rabbits. I'm also a horse, not a bull.")
		saynn("Milka tilts her head in confusion, her ears flopping a little.")
		talk(C_COW, "Oh. What about sugar cubes then?")
		talk(C_BULL, "I'd eat one, sure.")
		saynn("She gasps.")
		talk(C_COW, "Horses eat sugar cubes?! I want to be a horse too! Neigh-moo!")
		saynn("Pip just closes his eyes and sighs, trying not to smile.")
	if(theEvent == "milkapip4"):
		addChar(C_COW)
		addChar(C_BULL)
		playAnimation(StageScene.Duo, "stand", {pc=C_COW, npc=C_BULL})
		
		talk(C_COW, "You look sad, Pip. Want me to share my milk with you?")
		talk(C_BULL, "That’s.. not really something I drink.")
		saynn("Milka tilts her head, then shrugs.")
		talk(C_COW, "More for me then!")
		saynn("She cups her own breasts and giggles while Pip mutters something under his breath and looks away.")
	if(theEvent == "milkapip5"):
		addChar(C_COW)
		addChar(C_BULL)
		playAnimation(StageScene.Duo, "stand", {pc=C_COW, npc=C_BULL})
		
		saynn("Milka walks up to Pip holding a tiny flower between her fingers.")
		talk(C_COW, "For you!")
		talk(C_BULL, "Where did you even get this?")
		talk(C_COW, "Found it growing near the wall! It was lonely, so now it’s yours.")
		saynn("Pip hesitates before taking it, clearly unsure how to react.")
		talk(C_BULL, "..Thanks, Milka.")
		saynn("Milka helps tie it to Pip's ear.")
		talk(C_COW, "Yay! Now you’re a fancy bull!")
	if(theEvent == "milkapip6"):
		addChar(C_COW)
		addChar(C_BULL)
		playAnimation(StageScene.Duo, "stand", {pc=C_COW, npc=C_BULL})
		
		if(!cageRemoved):
			saynn("Milka is crouched in front of Pip, staring at his chastity cage.")
			talk(C_BULL, "What are you doing?")
			talk(C_COW, "What is that?")
			saynn("Pip sighs.")
			talk(C_BULL, "Chastity cage. I can't breed anyone with it on.")
			saynn("Milka gasps.")
			talk(C_COW, "But what kind of bull are you if you can't breed?! How are you gonna breed me?!")
			talk(C_BULL, "I'm not a bull, okay? I'm a stud! These stupid owners bought me and are using me as a bull.")
			saynn("Milka squints.")
			talk(C_COW, "Things just don't add up, you're right. You're not a bull.")
			saynn("Pip shrugs.")
			talk(C_COW, "And you're not a stud also.. Maybe you're a cow, like me! Can you moo? Moo~.")
			saynn("Pip sighs again.")
		else:
			saynn("Milka is crouched in front of Pip, staring at his horsecock.")
			talk(C_BULL, "What are you doing?")
			talk(C_COW, "Where is your thingie?")
			talk(C_BULL, "T.. Thingie?")
			saynn("Milka tilts her head.")
			talk(C_COW, "You know.. a metal thingie.")
			talk(C_BULL, "Chastity cage. Our friend here helped me break it.")
			saynn("He nods towards you.")
			talk(C_COW, "OHH! Means you can breed now?!")
			talk(C_BULL, "I guess.")
			saynn("Milka smiles.")
	if(theEvent == "milkapip7"):
		addChar(C_COW)
		addChar(C_BULL)
		playAnimation(StageScene.Duo, "stand", {pc=C_COW, npc=C_BULL})
		
		talk(C_COW, "Pip, can bulls purr?")
		talk(C_BULL, "No.")
		talk(C_COW, "Are you sure?")
		talk(C_BULL, "Very.")
		saynn("Milka leans in close to his chest and closes her eyes.")
		talk(C_COW, "Hmm.. nope. No purring. You’re a broken bull.")
		talk(C_BULL, "..I feel broken, yeah.")
		talk(C_COW, "I still like you..")
		saynn("Milka pats him gently, then skips away.")

	addContinue("setState", ["main"])



func eHelpCage_state():
	playAnimation(StageScene.TFLook, "crotch", {pc=C_BULL})
	aimCamera(L_BULL)
	
	saynn("Pip is tugging on his chastity cage, trying to slide it off.. but only pinching his balls in the process.")
	talk(C_BULL, "Ah, fuck.. God dammit.")
	
	addAction("Ignore", "Let him stay caged", "setState", ["main"])
	if(GM.pc.getStamina() > 0):
		addAction("Help", "Help Pip with his cage. Will use some stamina..", "doHelp")
	addAction("Bully", "Bully him and his locked cock!", "doBully")

func eHelpCage_do(_id:String, _args:Array):
	if(_id == "doHelp"):
		saynn("You decide to help him.")
		talk(C_BULL, "Oh.. sure, you can try.")
		playAnimation(StageScene.ChairOral, "rub", {pc="pspip", npc="pc"})
		
		saynn(RNG.pick([
			"You inspect Pip's chastity cage and try to wiggle it off.",
			"You grip the base of Pip's cage and give it a firm twist, trying to loosen its hold on his sheath.",
			"You slide your nail into the lock of Pip's chastity cage and try to turn it.",
			"You find a little rock in the garden and start to carefully hit the lock of Pip's chastity cage.",
			"You sharpen a twig that you have found in the garden and try to use it as a lockpick inside Pip's chastity cage.",
			"You get a good grip on the metal pieces of Pip's chastity cage and use your full strength to try to bend them.",
		]))
		cageDamage += RNG.randf_range(0.1, 0.25)
		addStamina(-20)
		addBullTrust(1)
		
		sayPipLine()

		if(cageDamage < 0.35):
			saynn("Not much has changed. You have to keep trying.")
		elif(cageDamage < 0.7):
			saynn("The cage is giving way, you can feel it. There is more and more wiggle room after each try.")
		else:
			saynn("It feels like the cage will snap soon. You're almost there.")
	if(_id == "doBully"):
		playAnimation(StageScene.SexFaceSitting, "sit", {pc=C_PC, npc=C_BULL, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Instead of helping him, you decide to tease him for his chastity.")
		if(GM.pc.hasPenis()):
			saynn("You pin him down to the floor and sit on his face, your balls rest on his forehead"+(", your pussy coats his snout and cheeks with your juices" if GM.pc.hasReachableVagina() else "")+"!")
		elif(GM.pc.hasReachableVagina()):
			saynn("You pin him down to the floor and sit on his face, your pussy coats his snout and cheeks with your juices!")
		else:
			saynn("You pin him down to the floor and sit on his face, your crotch rubbing against his snout!")
		talk(C_PC, RNG.pick([
			"Do you really need your cock? You're doing fine as is. Grade S buttslut.",
			"Bet you forgot what your own cock feels like. Doesn’t matter though, does it? Your ass does all the work.",
			"Such a pretty little femboy, all caged up. I almost feel bad.. almost.",
			"Silly stud, I thought you'd get used to being a fucktoy by now.",
		]))
		saynn("His face is blushing softly.. but he is trying to push you off.")
		talk(C_BULL, RNG.pick([
			"I'm a stud..",
			"I'm not a slut..",
			"I'm strong.. and virile..",
		]))
		addBullTrust(1)
		
	addContinue("setState", ["main"])


func pEventBullyByGirl_state():
	addChar(C_GIRL)
	addChar(C_GUY)
	aimCamera(L_CENTER)
	playAnimation(StageScene.Duo, "hurt", {npc=C_GIRL, npcAction="shove"})
	
	saynn("Sofie hands the fancy wolf his order.. and then rushes to you.")
	saynn("You can't even make a few steps back before she is already near you, grabbing you by the collar and shoving you back.")
	talk(C_GIRL, "WHY ARE YOU SO STUPID? ARGH!")
	saynn("Wow.. what an angry bitch.")
	talk(C_GIRL, "I WILL CUT YOUR LEGS OFF IF I HAVE TO. HEAR ME?")
	saynn("The other owner joins her.")
	talk(C_GUY, "What's wrong, sweetheart?")
	saynn("She grabs him and shoves him back too.")
	talk(C_GIRL, "WHAT'S WRONG? We're almost got caught with FUCKING SLAVES in our basement, that's what! It's all your fault!")
	saynn("The guy lowers his head slightly.. and carefully approaches his partner, gently embracing.")
	talk(C_GUY, "But we didn't get caught, did we?")
	saynn("Sofie slaps his hands away..")
	talk(C_GIRL, "If you don't look after this bitch, it's only a matter of time. I don't wanna rot in a fucking prison.")
	saynn("Leo embraces her again, gently nuzzling her cheek.")
	talk(C_GUY, "My bad, love. Try to relax, take some rest. If we're gonna be careful, we will be able to pull through. Together.")
	saynn("Sofie gives you a piercing glare.. but then just sighs.")
	talk(C_GIRL, "Fine.. I need a massage.")
	saynn("Leo lightens up. He grabs Sofie's hand and invites her to follow.")
	saynn("Interesting.")
	addContinue("setState", ["main"])


func ePeekFirstEvent_state():
	aimCamera(L_SLEEP)
	addChar(C_GIRL)
	addChar(C_GUY)
	playAnimation(StageScene.Choking, "idle", {pc=C_GIRL, npc=C_PC})
	
	saynn("Before you fall asleep, Sofie storms your cell and pins you against a wall.")
	talk(C_GIRL, "YOU FUCKED US, YOU KNOW THAT? I HOPE YOU'RE FUCKING HAPPY.")
	saynn("She growls and chokes you slightly.. but then she suddenly pulls her hands away from your neck.")
	talk(C_GIRL, "And I can't even hurt you. Aghh, I hate you so much.")
	saynn("Leo walks in, the second owner.")
	talk(C_GUY, "Sofie? We're closed for the day but someone is still sitting behind the table.")
	talk(C_GIRL, "Yep. He knows about THIS BITCH.")
	saynn("The guy's eyes go wide.")
	talk(C_GUY, "Oh shit.. I saw a holster on his belt. Are we screwed?")
	talk(C_GIRL, "I don't fucking know. But he said he wants to see {pc.him}.")
	addContinue("setState", ["ePeekFirstEvent2"])
	
func ePeekFirstEvent2_state():
	aimCamera(L_SLEEP)
	addChar(C_GIRL)
	addChar(C_GUY)
	playAnimation(StageScene.Duo, "stand", {pc=C_PC, npc=C_GIRL, bodyState={leashedBy=C_GIRL}})
	saynn("Sofie pulls out a leash and clips it to your collar. She then looks you in the eyes.")
	talk(C_GIRL, "No. Funny. Business. You hear me? I really don't wanna turn my cafe into a steakhouse.")
	saynn("You nod..")
	talk(C_GUY, "..it's our cafe, right, sweetheart?")
	saynn("She growls.")
	talk(C_GIRL, "If we fuck this up, it will be nobody's cafe. C'mon, try to look nice.")
	saynn("Sofie begins pulling you towards the door..")
	addContinue("setState", ["ePeekFirstEvent3"])

func ePeekFirstEvent3_state():
	aimCamera(L_TABLE)
	addChar(C_OFFICER)
	addChar(C_GIRL)
	addChar(C_GUY)
	playAnimation(StageScene.Duo, "stand", {pc=C_PC, npc=C_OFFICER, npcAction="sit", bodyState={hard=true}})
	saynn("You get brought out.. your eyes squint as they struggle to adjust to the bright enviroment.")
	saynn("The cafe is empty.. It's past its closing hour. All the tables are empty.. except for one.")
	saynn("A mature wolf is waiting behind it, his eyes are busy reading the menu.")
	talk(C_GIRL, "There you go, sir. Here is the person that you saw. {pc.He} {pc.isAre} just our..")
	saynn("Sofie's voice is so much more.. polite.")
	talk(C_OFFICER, "Thank you.")
	saynn("Sofie and Leo look at each other, their faces puzzled. You're standing still near the table, arms behind your back.. the atmosphere is quite.. charged.")
	talk(C_OFFICER, "I have a long night shift ahead of me. So.. a cup of coffee would be nice. Maybe a cupcake.")
	saynn("The two owners exchange confused glances again.. until Sofie shoves her elbow into Leo's side.")
	talk(C_GUY, "Oh.. of course. I will get right to it, sir.")
	saynn("Leo rushes towards the counter.. while the officer puts away the menu and switches his attention towards you.. towards your {pc.masc} body.. towards your {pc.breasts}.."+(" towards your {pc.penis}.." if GM.pc.hasPenis() else ""))
	talk(C_OFFICER, "I knew there was some secret to this place.. It's a crime.")
	talk(C_GIRL, "Uh.. it's nothing illegal.. we can explain..")
	saynn("The officer cuts her off.")
	talk(C_OFFICER, "Your food and coffee have no right to be SO good. Let me tell you, best in the whole galaxy. And I've been in a lot of these space cafes, believe me.")
	saynn("Sofie doesn't know how to react to such words.. so she just nods.. her hand still holding a leash to your collar.")
	talk(C_OFFICER, "I know that you have your secret.. ingredients. And I don't wanna reveal them to others. That would be extremely rude, wouldn't it?")
	talk(C_GIRL, "Uh.. y-yeah, it would be.")
	saynn("The officer nods.")
	talk(C_OFFICER, "All I'm asking for is.. some personal dinners. I will pay, of course. I will make it worth it for you.")
	saynn("Sofie rubs her face with her free hand.. you can see the slight shiver in her limbs.")
	talk(C_GIRL, "Of course, sir. That can be arranged.")
	talk(C_OFFICER, "I don't wanna be push-y. I'm okay with getting the same treatment that everyone else does. I want to ask {pc.his} opinion.")
	saynn("He grabs the middle of the leash.. and tugs on it slightly, inviting you to come closer to him.")
	talk(C_OFFICER, "Do you want to service me?")
	saynn("Leo finally returns, bringing the officer's order. A cup of coffee and a few cupcakes..")
	
	addAction("Agree", "Agree to service the offer", "doAgree")
	addAction("No", "This is too much", "noAgree")

func ePeekFirstEvent3_do(_id:String, _args:Array):
	if(_id == "noAgree"):
		GM.main.PSH.unlockEnding("MilkCafe", "officer") # In case people don't wanna sub to him
		gonnaHavePeekEvent = false
		peekState = PEEK_BULLIED_BY_GIRL
		aimCamera(L_SLEEP)
		playAnimation(StageScene.Duo, "stand", {npc=C_GIRL})
		saynn("You decide to deny his offer. Sofie's glare is piercing you..")
		talk(C_OFFICER, "That's okay. I understand. I will just stay as a normal client.")
		talk(C_GIRL, "Okay. Now, if you excuse us..")
		saynn("The officer nods. Sofie yanks you back into the basement.. into your cell.")
		talk(C_GIRL, "You are SO fucking lucky. I was gonna murder you on the spot. Now sleep.")
		saynn("She leaves and locks the cell.")
		addAction("Sleep", "Now it's time to sleep.. for real", "SLEEP")
	if(_id == "doAgree"):
		addChar(C_OFFICER)
		gonnaHavePeekEvent = false
		playAnimation(StageScene.Duo, "kneel", {npc=C_OFFICER, npcAction="sit", bodyState={hard=true, leashedBy=C_OFFICER}})
		saynn("Instead of saying anything, you just show your obedience by kneeling near him.")
		saynn("The officer smiles.. and reaches his hand out to scritch you under the chin.")
		talk(C_GIRL, "Do you still.. uh.. need us?")
		talk(C_OFFICER, "I think I will need one of you.")
		saynn("Sofie shoves her elbow into his partner side again to make him disappear.")
		if(agreeMilk || !GM.pc.hasPenis()):
			saynn("The officer grabs a cup of freshly brewed coffee and takes a sip.")
			talk(C_OFFICER, "I think it could use a bit more milk. Fresh milk.")
			saynn("He places the cup near the edge of the table.. near your chest.")
			talk(C_GIRL, "Of course, I will fix it right away.")
			addAction("Fresh milk..", "See what Sofie will do with your breasts", "setState", ["ePeekFirstEventMilk"])
		else:
			saynn("The officer grabs a cupcake.. and brings it closer, inspecting.")
			talk(C_OFFICER, "Looks a bit.. dry to me. Could use some more cream. Fresh cream. What do you think?")
			saynn("He places the cupcake near the edge of the table.. near you.")
			talk(C_GIRL, "Of course, I will fix it right away.")
			saynn("Sofie runs away to grab something.. a strapon harness.")
			addAction("Fresh cream..", "See what Sofie will do with you", "setState", ["ePeekFirstEventSeed"])

func ePeekFirstEventMilk_state():
	addChar(C_OFFICER)
	addChar(C_GIRL)
	playAnimation(StageScene.BreastGroping, "grope", {pc=C_GIRL, npc=C_PC, npcCum=true, npcBodyState={naked=true,hard=true}})
	GM.pc.milk()
	saynn("Sofie nods at the officer and gently takes your hand, guiding you closer to the table.")
	saynn("She positions you near the edge, your {pc.breasts} just beneath the officer’s steaming cup.")
	saynn("Slowly, Sofie cups your breasts and begins fondling and caressing them.")
	saynn("Her thumbs press on your nipples, rolling them left and right until you shiver and your buds get all hard and sensitive.")
	saynn("A drop of creamy {pc.milk} forms at each nipple before trickling down into the officer’s cup.")
	saynn("Seeing that, Sofie begins milking you, squeezing your breasts in gentle yet firm strokes.. causing the {pc.milk} to squirt straight into the coffee.")
	saynn("You moan softly, squirming under her touch as waves of pleasure and embarrassment wash over you. The officer can't pull his gaze away from you.")
	saynn("After some time, the cup receives a nice extra layer of your warm {pc.milk}. The officer nods in approval, lifts the cup, and takes a sip.") 
	talk(C_OFFICER, "Mmm.. that is perfect.")
	saynn("Sofie's eyes light up when she hears that.")
	if(agreeSeed && GM.pc.hasPenis()):
		saynn("Next, the officer grabs a cupcake.. and brings it closer, inspecting.")
		talk(C_OFFICER, "Looks a bit.. dry to me. Could use some more cream. What do you think?")
		saynn("He places the cupcake back.")
		talk(C_GIRL, "Of course, sir. I will fix it right away.")
		saynn("Sofie runs away to grab something.. a strapon harness.")
		addAction("Fresh cream..", "See what Sofie will do with you", "setState", ["ePeekFirstEventSeed"])
	else:
		addContinue("setState", ["ePeekFirstEvent4"])

func ePeekFirstEventSeed_state():
	addChar(C_OFFICER)
	addChar(C_GIRL)
	addStrapon(C_GIRL)
	playAnimation(StageScene.SexFreeStanding, "fast", {pc=C_GIRL, npc=C_PC, pcCum=true, npcCum=true, bodyState={naked=true,hard=true}, npcBodyState={naked=true,hard=true}})
	GM.pc.milkSeed()
	GM.pc.orgasmFrom(C_GIRL)
	saynn("Sofie secures a strapon harness around her hips, the rubber cock bobbing eagerly at her waist.")
	saynn("She grabs your wrists and guides them behind your back while pushing on your back, bending you forward, your cock hovering above the cupcake..")
	saynn("Firmly, she lines her new rubber shaft up with your needy asshole.")
	saynn("With a strong thrust, Sofie drives the strapon deep into you. You gasp as the tip presses against your pleasure spot.. "+("making your cock go hard instantly." if !GM.pc.isWearingChastityCage() else "making your caged cock attempt to go hard in its prison."))
	saynn("She begins a slow, deliberate rhythm, each stroke massaging your prostate further and making you squirm.")
	talk(C_PC, "M-mmh.. mmm..")
	saynn("Pre is dribbling from your member as her toy plunges in and out. The officer is watching you get fucked with great interest.")
	saynn("Sofie picks up the pace, pounding you nice and hard. Your moans grow louder, echoing in the cafe.")
	saynn("It doesn't take long until your prostate inflates and becomes stiff. And soon, with a cry of pleasure, you start cumming.. Thick ropes of cream are pulsing out of your dick, landing directly onto the placed cupcake.")
	saynn("Sofie holds steady, letting your cock add that extra layer on top of the existing frosting.")
	saynn("When you're done.. the officer leans forward and grabs that cupcake from the table.. before taking a good bite.")
	talk(C_OFFICER, "Mmm.. that’s rich. Incredible.")
	saynn("Hearing that makes Sofie smile.. while you're busy panting.. your balls drained.")
	addContinue("setState", ["ePeekFirstEvent4"])

func ePeekFirstEvent4_state():
	removeStrapon(C_GIRL)
	playAnimation(StageScene.Duo, "stand", {pc=C_GUY, npc=C_OFFICER, npcAction="sit"})
	saynn("The officer enjoys the rest of his.. dinner.. sipping the coffee and finishing the cupcake.")
	saynn("You stand near.. but Sofie and Leo are a few steps away, as to not disturb the meal.")
	talk(C_OFFICER, "Alright, I think I can pay now.")
	extraProfit += 10000
	saynn("Leo swiftly approaches the table.. the bill in his hands.")
	talk(C_OFFICER, "Would this be enough, perhaps?")
	saynn("The officer produces a credits chip.. and hands it to the guy. Leo's eyes go wide.")
	talk(C_GUY, "Sir.. this is way too much.")
	saynn("The officer smiles.")
	talk(C_OFFICER, "The rest is a tip. I really enjoyed the service. I hope we can do this again sometime. Eh?")
	saynn("Sofie runs up to Leo and whispers into his ear.")
	talk(C_GIRL, "..take the fucking chip already and go, don't be stupid.. take the slave too..")
	saynn("Leo nods to the officer.. and takes your leash.")
	talk(C_GUY, "Thank you, sir. We would love to have you here again.")
	saynn("The officer nods back.. and watches Leo walk you back into the kitchen.")
	
	addContinue("setState", ["ePeekFirstEvent5"])

func ePeekFirstEvent5_state():
	aimCamera(L_SLEEP)
	addChar(C_GUY)
	playAnimation(StageScene.Duo, "stand", {npc=C_GUY, bodyState={leashedBy=C_GUY}})
	
	saynn("Leo brings you back into your cell. You feel.. quite tired.")
	talk(C_GUY, "You did very well. Thank you..")
	saynn("He removes the leash from your collar.")
	talk(C_GUY, "Sleep well.")
	
	addAction("Sleep", "Time to sleep!", "SLEEP")


func ePeekSecondEvent_state():
	playAnimation(StageScene.Duo, "stand", {npc=C_GIRL, bodyState={leashedBy=C_GIRL}})
	saynn("You weren't planning to sleep.. and it looks like you were right.")

	saynn("Sofie enters your cell and instantly clips a leash to your collar.")

	talk(C_GIRL, "You're in luck, the guy wants to see you again.")
	saynn("She pulls you up off of the floor and swipes any dust from your butt. Her free hand catches your chin.")

	talk(C_GIRL, "If you don't want to be in trouble, you are gonna do everything that he wants you to do. Like a good slut.")
	saynn("Feels like you won't have much of a choice this time..")
	addAction("Follow", "See where she brings you", "setState", ["ePeekSecondEvent2"])

func ePeekSecondEvent2_state():
	aimCamera(L_TABLE)
	addChar(C_OFFICER)
	addChar(C_GIRL)
	playAnimation(StageScene.ChairOral, "tease", {pc=C_OFFICER, npc=C_PC, bodyState={showPenis=true,hard=true}, npcBodyState={naked=true, hard=true}})
	GM.pc.freeMouthDeleteAll()
	GM.pc.freeHandsDeleteAll()
	GM.pc.freeArmsDeleteAll()
	saynn("Sofie brings you out into the seating area of the cafe. The cafe is closed so there is no one around.. except for him that is. The guy is sitting behind his usual table, already eating a cupcake and enjoying his coffee.")

	saynn("You kneel near his table.. it feels right for some reason.")

	talk(C_GIRL, "Your dessert has arrived, sir.")
	talk(C_OFFICER, "Wonderful.")
	saynn("Dessert? You don't think anyone ever called you like that..")

	saynn("The officer reaches his hand out to cup your chin, the soft touch of his big, manly palm makes something inside you tingle. Let's hope this dessert doesn't start melting down.")

	talk(C_OFFICER, "Are they treating you well here?")
	saynn("He is asking you.. The sudden question makes you lower your eyes. You can just feel Sofie's drilling gaze behind you..")

	saynn("It takes a while to force a gesture.. but you nod.. slowly.. subtly. Sofie lets out a sigh of relief behind you.")

	talk(C_OFFICER, "I see. It's just.. would be a shame to see such a treat go to waste.")
	talk(C_GIRL, "We take good care of {pc.him}.")
	saynn("The officer nods.. takes a sip of his coffee.. and then carefully unzips his pants, revealing his half-hard member.")

	saynn("Seeing it so close.. makes your mouth watery. Each vein, all the crevices, the pointy tip, the scent.. makes you want to serve.")
	addContinue("setState", ["ePeekSecondEvent3"])

func ePeekSecondEvent3_state():
	addChar(C_OFFICER)
	addChar(C_GIRL)
	playAnimation(StageScene.ChairOral, "stroke", {pc=C_OFFICER, npc=C_PC, bodyState={showPenis=true,hard=true}, npcBodyState={naked=true, hard=true}})
	saynn("You get under the table.. and position yourself behind his legs.")

	saynn("His cock is a magnet.. seeing it makes you grasp it with one hand, your digits wrapping around his shaft.")

	saynn("The officer doesn't seem to mind your bravery. You get a glimpse of his smile as he just casually continues to have his dinner.")

	saynn("Seeing no pushback, you push further yourself, your hand moving along the shiny texture, getting that cock nice and hard, watching from up close how it fills with more and more blood, veins inflating, the pointy tip releasing a first drop of precum.")

	talk(C_GIRL, "If you need something, I'm here. Just so you know.")
	talk(C_OFFICER, "I think all my current needs are satisfied, thank you.")
	saynn("You keep stroking him off, your hand gliding along his length up and down, his balls tensing up ever so slightly.")

	saynn("While eating his cupcake, some of the crumbs land onto his pants.. but one of the lucky ones ends up directly on his dick, floating in the small pool of his pre.. Makes you want to steal it..")
	addContinue("setState", ["ePeekSecondEvent4"])
	
func ePeekSecondEvent4_state():
	addChar(C_OFFICER)
	addChar(C_GIRL)
	playAnimation(StageScene.ChairOral, "suck", {pc=C_OFFICER, npc=C_PC, bodyState={showPenis=true,hard=true}, npcBodyState={naked=true, hard=true}})
	saynn("You bring your head closer to the tip of that member.. and then.. with a flick of your tongue.. you catch the crumb that is soaked with his slightly-salty precum.")

	saynn("He notices it.. and purposefully sprinkles a few more of them all around his cock.")

	saynn("And so.. rather than going one by one after them.. you just part your lips and let the whole head of his member inside your mouth, your tongue instantly starts the search, gliding along the pulsing surface, coating it with your saliva.")

	saynn("You get more and more of that dick in, the tip already meets with the back of your mouth and gets guided down your tight throat. Before you trigger your gag reflex, you decide to pull away slightly.. before swallowing some of his cock again.")

	saynn("Your ears pick up on his quiet growl. Each time your tongue flicks against his sensitive tip, his balls tense up again, his shaft feeding you more of his pre.")

	talk(C_OFFICER, "Actually.. Do you have.. chains.. perhaps?")
	talk(C_GIRL, "Yes, plenty. Mmh, may I ask why do you need them?")
	saynn("The officer chuckles softly and finishes his coffee in a few gulps.")

	talk(C_OFFICER, "I'd like to enjoy my dessert on the table, not under it.")
	talk(C_GIRL, "Of course, sir.")
	addContinue("setState", ["ePeekSecondEvent5"])
	
func ePeekSecondEvent5_state():
	playAnimation(StageScene.SexOralTable, "tease", {pc=C_OFFICER, npc=C_PC, bodyState={showPenis=true, hard=true}, npcBodyState={naked=true, hard=true}})
	saynn("Sofie returns with the chains.. and helps to tie you up to the table, your head hanging from the edge.")

	talk(C_OFFICER, "Thank you.")
	saynn("The officer gets up and approaches you.. his hard cock looming over your face, the tip dripping onto your chin.")

	talk(C_OFFICER, "I will try to be careful.")
	saynn("Slowly, he begins to bury his cock down between your lips, the tip slides past your teeth and brushes against your cushion of a tongue before finding the back of your mouth and curving down your throat.")

	saynn("You can feel it stretching you out.. your fist clench as you try to pull your focus away from your gag reflex. Still, eventually it begins to catch up with you, your throat suddenly clenching around his cock, producing wet gagging noises.")

	talk(C_OFFICER, "Mhh.. that felt good. May I?")
	saynn("Your fists are still clenched.. but your thumbs perk up..")
	addContinue("setState", ["ePeekSecondEvent6"])

func ePeekSecondEvent6_state():
	playAnimation(StageScene.SexOralTable, "suck", {pc=C_OFFICER, npc=C_PC, bodyState={showPenis=true, hard=true}, npcBodyState={naked=true, hard=true}})
	saynn("The officer proceeds to move his hips, sliding most of his cock out.. before thrusting forward again, stretching your throat further.")

	saynn("His hands land on your neck, getting a feel for that bump that his member is creating while passing by.")

	saynn("You get short glimpses of Sofie. Her mean eyes are silently tracking the main action, making sure you're not completely broken yet.")

	saynn("You gag and choke on that cock more and more.. and yet.. you can't get enough. Lonely tears stream down your cheeks as your throat is being used for his pleasure. Your whole body wants to squirm.. but the chains keep you still for him.")

	talk(C_OFFICER, "Yeah.. such a nice treat. Could use some cream stuffing, huh?")
	saynn("Yes..")
	addContinue("setState", ["ePeekSecondEvent7"])

func ePeekSecondEvent7_state():
	playAnimation(StageScene.SexOralTable, "suckfast", {pc=C_OFFICER, npc=C_PC, bodyState={showPenis=true, hard=true}, npcBodyState={naked=true, hard=true}})
	saynn("He increases his pace, fucking your throat even faster, really testing your limits. When most of the time, your wind pipe is blocked by a giant cock, the air becomes a very limited supply.. your inner walls clench harder around that shaft, making the guy grunt from pleasure.")

	saynn("You can see his knot inflating.. getting fatter as blood rushes down to his crotch. He makes a few attempts to fit it inside.. but decides against dislocating your jaw.")

	talk(C_OFFICER, "Hope you are ready..")
	addContinue("setState", ["ePeekSecondEvent8"])
	
func ePeekSecondEvent8_state():
	GM.pc.gotThroatFuckedBy(C_OFFICER)
	GM.pc.cummedInMouthBy(C_OFFICER)
	playAnimation(StageScene.SexOralTable, "suckinside", {pc=C_OFFICER, npc=C_PC, bodyState={showPenis=true, hard=true}, npcBodyState={naked=true, hard=true}})
	saynn("With one last thrust, he shoves most of his length inside, his knot pressing against your lips as his shaft starts to pulse inside your throat.")

	saynn("He throws his head back and growls.. as his cock starts shooting waves of creamy seed down your inner walls, straight into your belly.")

	talk(C_OFFICER, "Ngh-h..")
	saynn("While he is busy pumping you full of his spunk, you begin to see darkness creeping in around the corners of your vision, everything is getting blurrier. And yet, you continue to serve, eagerly swallowing everything his cock gives you.")
	addContinue("setState", ["ePeekSecondEvent9"])

func ePeekSecondEvent9_state():
	playAnimation(StageScene.SexOralTable, "tease", {pc=C_OFFICER, npc=C_PC, bodyState={showPenis=true, hard=true}, npcBodyState={naked=true, hard=true}})
	saynn("When the officer is done, he finally pulls out, letting you suddenly breathe again. You cough.. you cough a lot.. hungrily grabbing any piece of air you can get.")

	talk(C_OFFICER, "What a treat. Could be the best treat in the whole galaxy.")
	saynn("Sofie approaches you two.")

	talk(C_GIRL, "I'm glad you have enjoyed our offerings.")
	saynn("He nods.. and hands her a credits chip.")

	talk(C_OFFICER, "Will this be enough?")
	saynn("She quickly checks it. There is clearly a big number on it.. and yet.. her lips go narrow.")

	talk(C_GIRL, "Well..")
	saynn("Without a word extra, the officer just hands a second chip.")

	talk(C_OFFICER, "Best treat, like I said.")
	saynn("Sofie takes the chip and nods.")

	talk(C_GIRL, "Thank you. I will wrap everything up.")
	saynn("The officer nods again.. zips his pants.. and starts heading towards the exit, shooting you a quick glance and a smile when he is at the door.")
	addContinue("setState", ["ePeekSecondEvent10"])

func ePeekSecondEvent10_state():
	aimCamera(L_SLEEP)
	playAnimation(StageScene.Duo, "stand", {npc=C_GIRL})
	saynn("After this dinner, Sofie brings you back into your cell.")

	talk(C_GIRL, "Next time, put a little more passion into it. We got bills to pay.")
	saynn("You don't respond.. just waiting for her to leave.")
	
	gonnaHavePeekEvent = false
	addAction("Sleep", "Time to sleep", "SLEEP")




func ePeekThirdEvent_state():
	playAnimation(StageScene.Duo, "stand", {npc=C_GIRL, bodyState={leashedBy=C_GIRL}})
	saynn("You knew that Sofie would come for you after the cafe closes for the night. You were waiting for it.")

	talk(C_GIRL, "C'mon, you know the drill.")
	saynn("She clips a leash to your collar and tugs on it, inviting you to follow.")

	talk(C_GIRL, "I'm expecting a lot of credits. Got it, slut?")
	saynn("You nod.. what else are you supposed to do.")
	
	addContinue("setState", ["ePeekThirdEvent2"])

func ePeekThirdEvent2_state():
	aimCamera(L_TABLE)
	addChar(C_OFFICER)
	addChar(C_GIRL)
	playAnimation(StageScene.ChairOral, "tease", {pc=C_OFFICER, npc=C_PC, bodyState={showPenis=true,hard=true}, npcBodyState={naked=true, hard=true}})
	saynn("You follow the greedy girl out into the seating area and approach the usual table. The wolf is already waiting for you.")

	saynn("Gotta earn those credits.. Without any input, you get down to your knees and get under the table, your hands find the zipper and get the officer's balls and sheath out. After some gentle stroking, the tip of his cock starts to peek out.. and then the rest of his shaft follows from you nuzzling it.")

	talk(C_OFFICER, "I thought I'm the hungry one here. Hah.")
	saynn("Sofie puts on a polite smile, her free hand is now holding a menu.")

	talk(C_GIRL, "Would you like to order something, sir?")
	talk(C_OFFICER, "You know.. I'm pretty hungry tonight. I could go for a whole cake. Or a pie.")
	saynn("Sofie raises a brow and clears her throat.")

	talk(C_GIRL, "Hm.. we would have to check if we still have some left.")
	saynn("While you're busy getting his cock hard with your tongue, he reaches under the table to pat you.")

	talk(C_OFFICER, "No worries. I already have everything I need.")
	saynn("His smile.. he is about to do something.")

	addContinue("setState", ["ePeekThirdEvent3"])

func ePeekThirdEvent3_state():
	addChar(C_OFFICER)
	playAnimation(StageScene.SexOverTable, "tease", {pc=C_OFFICER, npc=C_PC, bodyState={showPenis=true, hard=true}, npcBodyState={naked=true, hard=true}})
	saynn("The officer grabs the leash and invites you to get from under the table.. before placing you on top of it, your body bent forward, your {pc.thick} ass sticking out.")

	saynn("He rests his hard cock on top of your buns and gently slides back and forth.")

	talk(C_OFFICER, "What a treat, no reason to keep you on the dirty floor. Right?")
	saynn("You look back over your shoulder.. and see his smile.. as well as Sofie's strict eyes. You nod..")

	saynn("The officer brushes the tip of his member over your "+str("holes.. your pussy and tailhole" if GM.pc.hasReachableVagina() else "{pc.anusStretch} tailhole")+".. his pre dripping onto your sensitive flesh. "+str("He ends up guiding his cock down to your needy slit, the tip pressing against the folds.. before spreading them wide." if GM.pc.hasReachableVagina() else "He takes some time teasing you before guiding his cock down to your needy star, the tip pressing against it.. before spreading it slightly.")+"")

	addContinue("setState", ["ePeekThirdEvent4"])

func ePeekThirdEvent4_state():
	addChar(C_OFFICER)
	playAnimation(StageScene.SexOverTable, "sex", {pc=C_OFFICER, npc=C_PC, bodyState={showPenis=true, hard=true}, npcBodyState={naked=true, hard=true}})
	saynn("With a firm thrust, he slides into your "+str("velvet" if GM.pc.hasReachableVagina() else "inviting")+" warmth. Inch by inch, his member is exploring your wet inner walls, getting deeper each time.")

	talk(C_OFFICER, "That's it.. Take it all.")
	saynn("He sets a slow.. but extremely pleasurable rhythm, each pump sending you further into a mindset of a submissive sex toy.. Little moans escape your mouth while you're getting fucked over the table, your hands holding onto the edges.")

	addContinue("setState", ["ePeekThirdEvent5"])

func ePeekThirdEvent5_state():
	addChar(C_OFFICER)
	playAnimation(StageScene.SexOverTable, "fast", {pc=C_OFFICER, npc=C_PC, bodyState={showPenis=true, hard=true}, npcBodyState={naked=true, hard=true}})
	saynn("It feels good.. for both, you and him. Feeling that your "+str("{pc.pussyStretch} pussy" if GM.pc.hasReachableVagina() else "{pc.analStretch} ass")+" is handling his cock nicely, the guy speeds his pace up, thrusting deeper and harder.")

	talk(C_PC, "Ah.. ah..")
	talk(C_OFFICER, "Such a nice pussy." if GM.pc.hasReachableVagina() else "Such a nice ass.")
	saynn("Hearing that.. makes your inner muscles clench, your slick walls hugging his shaft tightly as he keeps fucking you, pushing through the friction.")

	saynn("You won't be able to endure that for very long.. you're about to cum.")

	addContinue("setState", ["ePeekThirdEvent6"])

func ePeekThirdEvent6_state():
	addChar(C_OFFICER)
	playAnimation(StageScene.SexOverTable, "inside", {pc=C_OFFICER, npc=C_PC, pcCum=true, npcCum=true, bodyState={showPenis=true, hard=true}, npcBodyState={naked=true, hard=true}})
	if(GM.pc.hasReachableVagina()):
		GM.pc.gotVaginaFuckedBy(C_OFFICER)
		GM.pc.cummedInVaginaBy(C_OFFICER)
	else:
		GM.pc.gotAnusFuckedBy(C_OFFICER)
		GM.pc.cummedInAnusBy(C_OFFICER)
	GM.pc.orgasmFrom(C_OFFICER)
	saynn("You feel the base of his cock swell as the knot engorges with blood. Without warning, he pins you harder against the table.. and then shoves his entire length in one powerful thrust.. knot and all.. filling you completely.")

	talk(C_OFFICER, "Grrhh..")
	talk(C_PC, "Ahhh-h!..")
	saynn("Warm seed floods your "+str("womb" if GM.pc.hasReachableVagina() else "butt")+" in thick waves, the table shaking from your body squirming, unable to contain this amount of cock.. You cum soon after, your "+str("pussy" if GM.pc.hasReachableVagina() else "tailhole")+" pulsing and clenching around his throbbing knot, milking every drop of his hot cum.")

	saynn("There is too much stimulation.. your eyes keep rolling up as your loud moans echo around the empty cafe.. "+str("Your pussy squirts from your g-spot getting smashed by his fat orb" if GM.pc.hasReachableVagina() else "")+""+str("Your {pc.penis} squirts with {pc.cum} from your prostate getting smashed by his fat orb" if (!GM.pc.hasReachableVagina() && GM.pc.hasPenis()) else "")+""+str("Your tailhole keeps pusling" if (!GM.pc.hasReachableVagina() && !GM.pc.hasPenis()) else "")+", your legs are shaking wildly while the wolf behind you keeps breeding you, his balls emptying up inside you.")

	saynn("When that's done, the two of you tremble on top of the table.. both completely spent.")

	talk(C_OFFICER, "That.. I really needed that.")
	saynn("While you're still squirming from having his full length inside you, Sofie approaches you two.")

	talk(C_GIRL, "I hope you have been satisfied with our selection.")
	saynn("He chuckles.")

	talk(C_OFFICER, "I'm still very much hungry, miss.")
	
	addContinue("setState", ["ePeekThirdEvent7"])
	
func ePeekThirdEvent7_state():
	addChar(C_OFFICER)
	playAnimation(StageScene.SexOverTable, "lick", {pc=C_OFFICER, npc=C_PC, bodyState={showPenis=true, hard=true}, npcBodyState={naked=true, hard=true}})
	saynn("He yanks his knot out of your "+str("pussy" if GM.pc.hasReachableVagina() else "ass")+".. before getting down to his knees and shoving his face into your "+str("crotch" if GM.pc.hasReachableVagina() else "butt")+".")

	saynn("The wolf.. he starts eating you out.. you can feel his powerful tongue slide over your "+str("folds" if GM.pc.hasReachableVagina() else "tailhole")+".. before penetrating the creamed hole and proceeding to lap away at the inner wall.")

	talk(C_GIRL, "Of course, sir. Enjoy your.. cake.")
	saynn("And so he does, licking you out from the inside, thrusting his tongue in and out, swallowing your juices.. as well as his own seed. Looks like the guy is not the picky kind..")

	saynn("Getting treated like this.. feels nice.. your soft moans keep him hungry for more. He leaves the cream that's inside you mostly in-tact.. and just finishes by glazing your "+str("folds" if GM.pc.hasReachableVagina() else "star")+" a bit more, dragging his tongue along the contours.")

	saynn("When he is done, he gets up and gently gropes your rear.")

	talk(C_OFFICER, "So tasty.")
	
	addContinue("setState", ["ePeekThirdEvent8"])
	
func ePeekThirdEvent8_state():
	addChar(C_OFFICER)
	addChar(C_GIRL)
	playAnimation(StageScene.Duo, "stand", {pc=C_OFFICER, npc=C_GIRL})
	saynn("The wolf turns towards the girl and starts reaching into his pockets, producing some credit chips.")

	saynn("But before he hands them to the lady.. he stops. A slight twitch of Sofie's brows is followed by her puffing her lips.")

	talk(C_OFFICER, "I'm aware of your cafe's.. situation.")
	saynn("Sofie tilts her head a bit, slightly worried now.")

	talk(C_GIRL, "What do you mean exactly?")
	talk(C_OFFICER, "The numerous debts. You did what you did.. to survive. You resorted to using illegal slaves.")
	saynn("He gives you a quick glance. You're still on the table, panting heavily..")

	saynn("Sofie blinks many times.. you can just tell that her heart is now beating faster than yours. Leo approaches the table as well, listening carefully.")

	talk(C_GIRL, "Uh.. there was.. no other choice really.")
	talk(C_OFFICER, "I ain't planning to blackmail you, don't worry. And you ain't going to jail, not because of me. What I want to do.. is make an offer.")
	saynn("Leo and Sofie look at each other.")

	talk(C_GUY, "An offer?")
	talk(C_OFFICER, "I give you enough credits to pay off your debts. A clean slate, a new life. And in exchange..")
	saynn("His manly hand lands on your back.. and gently strokes it.")

	talk(C_OFFICER, "I get to keep this cutie pie.")
	saynn("Leo and Sofie look at each other again, their eyes huge. They just can't believe it.")

	talk(C_GUY, "Oh..")
	saynn("There is a short silence.. as the gears in the girl's head turn.")

	talk(C_GIRL, "How about.. ten percent on top maybe?.. We will really-really miss this cutie pie.")
	talk(C_GUY, "Sofie..")
	talk(C_GIRL, "Tshhh.. shut up..")
	saynn("Really? Even the wolf is stunned by the haggling attempts.")

	talk(C_OFFICER, "I can give five.")
	talk(C_GIRL, "Deal.")
	saynn("The officer pulls out a few more colorful credit chips.. makes sure the sum is correct.. and then hands them to Sofie. In exchange, she hands the leash to your collar.")

	saynn("After the deal is done, the pair quickly retracts into the kitchen. Only Leo gives you a final goodbye wave of his hand.. before Sofie pulls him out of view.")

	addContinue("setState", ["ePeekThirdEvent9"])

func ePeekThirdEvent9_state():
	addChar(C_OFFICER)
	playAnimation(StageScene.Duo, "stand", {npc=C_OFFICER, bodyState={leashedBy=C_OFFICER}})
	aimCamera(L_DOCKS)
	saynn("The officer helps you to get up.. and then clips a leash to your collar..")

	talk(C_OFFICER, "Well.. let's go then.")
	saynn("You nod and follow the wolf down into the docks. As you look through the window, you see his ship.. it's huge.. barely fitting.")

	saynn("Your eyes pick up on the AlphaCorp emblems everywhere. Whoever he is, he must be someone high on the food chain.")

	saynn("You approach the docking port. He opens the airlock.. and invites you in. You give the cafe the last glimpse.. before stepping inside.")

	addContinue("ENDING", ["end_officer"])




func intro_state():
	aimCamera(L_DOCKS)
	GM.pc.setLocation(L_CENTER)
	playAnimation(StageScene.Solo, "kneel")
	saynn("You find yourself.. in something that looks like the trunk of the spacetruck. There are a few crates around, most of them locked. You manage to peek into one of them and find.. fruits and vegetables. Weird.")

	saynn("Apart from the cargo.. you're alone in here.")

	saynn("The spacetruck is certainly moving.. somewhere. You look around a bit more.")

	saynn("There are two ways out of here, in the form of two doors. One of them is wide, designed for unloading stuff.. and certainly leads into outer space. The second one is a small one and probably leads into the cockpit. That one is locked. You hear some voices behind it.. but that's about it.")

	saynn("Might as well just wait and see what happens next..")

	addContinue("setState", ["intro2"])

func intro2_state():
	playAnimation(StageScene.Duo, "stand", {pc=C_GIRL, npc=C_GUY})
	saynn("Soon, the spacetruck starts to dock somewhere. After the.. less than smooth.. docking process, the engines finally shut off.")

	saynn("Two.. dragons.. enter the cargo space. The girl starts speaking first.")

	talk(C_GIRL, "You're still alive. Good. Gonna start slow. Here is the deal. In case you haven't noticed it yet, we have bought you.")
	saynn("Two versus one.. and you're not exactly armed. Who knows how many others are behind the wall as well.")

	talk(C_GIRL, "Since you are now our property.. you are gonna do exactly what we tell you to do. Otherwise.. Show {pc.him}, Leo.")
	talk(C_GUY, "Sure.")
	saynn("The guy pulls out a.. what looks like a collapsable baton.. but with a little fork at the tip. He squeezes the handle.. and a little lightning of electricity spawns between the fork's tines.")

	talk(C_GUY, "If this touches you, it will hurt.")
	saynn("Yeah, that seems obvious.")

	talk(C_GIRL, "Now. I'm gonna put a leash on you. Leo?")
	talk(C_GUY, "I got you.")
	talk(C_GIRL, "You fucking better.")
	saynn("The girl.. Sofie.. pulls out a leash and reaches out to clip it to your collar. All the while the guy is ready to strike you at any point.")

	saynn("You stand still and let them do whatever they have to do.")

	talk(C_GIRL, "Now grab a crate.")
	saynn("They're not too heavy.. but they're not exactly light either. After you do that, the girl starts glaring at the guy.. clearly confusing him.")

	talk(C_GUY, "Sofie?")
	talk(C_GIRL, "Grab one too, don't be a lazy fuck.")
	talk(C_GUY, "Alright.")
	saynn("The guy puts the weapon away and grabs a crate.. before following you.")

	addContinue("setState", ["intro3"])

func intro3_state():
	addChar(C_GIRL)
	addChar(C_GUY)
	playAnimation(StageScene.Duo, "stand", {npc=C_GIRL, flipNPC=true, bodyState={leashedBy=C_GIRL}})
	aimCamera(L_COUNTER)
	saynn("You step out of the spacetruck.. and see some kind of docks. There are a few other docking ports.. but all of them are not occupied currently. Whatever this place is, it doesn't get a lot of traffic.")

	saynn("As you follow the docks, still on a leash, you begin to see.. a structure at the end of it. You could say that it's a space station.. but that would be exaggerating things greatly. It's the size of a two-story building.")

	saynn("It's hard to see through the dock's windows.. but you do notice a giant neon sign above the structure. It says.. 'The Daily Drip'.")

	saynn("Inside it.. you see a seating area consisting out of a few pink tables.. and a counter, with a small kitchen behind it.")

	saynn("The girl walks you behind the counter.. and towards the door at the back of the kitchen.")

	addContinue("setState", ["intro4"])

func intro4_state():
	aimCamera(L_CENTER)
	addChar(C_GIRL)
	addChar(C_GUY)
	saynn("Behind the door.. There are some small stairs that lead into darkness.")

	talk(C_GIRL, "Keep going, animal.")
	saynn("Animal? Carefully, you step down the stairs, awkwardly looking from around the crate that you're carrying.")

	saynn("Your eyes begin to slowly adapt to the darkness. While that is happening, they also begin to pick up on some silhouettes. Before you can make out any details, the girl yanks on the leash.")

	talk(C_GIRL, "You will get a chance to say hi later.")
	
	addContinue("setState", ["intro5"])
	
func intro5_state():
	aimCamera(L_SLEEP)
	playAnimation(StageScene.Duo, "stand", {npc=C_GIRL})
	saynn("You follow the mean girl into some kind of.. industrial freezer? It's a big cold room that is divided into a few sections but only one of them seems to be actually powered. You place the crate exactly where you are told to do so.")

	talk(C_GIRL, "Go sleep now.")
	saynn("She points at one of the empty sections of the cold room.")

	saynn("You step inside.. The door behind you closes shut.")

	saynn("It's chilly here.. but it will have to do.")

	addContinue("setState", ["intro6"])

func intro6_state():
	GM.main.startNewDay()
	playAnimation(StageScene.Sleeping, "sleep")
	saynn("You manage to get some sleep.. but it wasn't exactly the pleasant kind.")

	addStamina(20)
	addPain(-50)
	day = 0
	saynn("You hear the banging on the door.. which means.. it's probably time to get up.")
	
	addContinue("setState", ["intro7"])
	
func intro7_state():
	aimCamera(L_CENTER)
	addChar(C_GIRL)
	addChar(C_GUY)
	playAnimation(StageScene.Duo, "stand", {npc=C_GIRL})
	saynn("You get up and step out into the main space. You're not the only one who got woken up it seems.. From the other sections of the fridge, come out two other.. slaves.. a horse and a colorful puppy.")

	saynn("The girl and the guy from yesterday are here too.. your new owners.")

	talk(C_GIRL, "Everyone welcome the new animal.")
	saynn("The girl catches your confused stare. You look around a bit more.. and notice a lot of.. strange equipment. In the corner of this.. basement.. there seems to be a special walled-off space.. with a little garden. The sunlight that comes through the ceiling of that garden is the only light that illuminates the rest of the basement.")

	talk(C_GIRL, "Yes. You are now an animal.")
	talk(C_GUY, "We're running a cafe and we need milk and cream to keep it running.")
	saynn("Leo receives a glare from Sofie.")

	talk(C_GIRL, "Why don't you tell them the exact coordinates of this cafe while you're at it, huh?")
	talk(C_GUY, "My bad.")
	saynn("The girl turns towards you again.")

	talk(C_GIRL, "He is not wrong though. Ever so often, we are gonna come down here and milk you. All of you.")
	saynn("Milk? So that's probably what the equipment is for.")

	talk(C_GUY, "Once you help the cafe earn enough credits, we will actually let you go.")
	talk(C_GIRL, "We will consider that, yes. How much is enough? Right now it's 250 thousand credits.")
	addCredits(-250000)
	saynn("That's a lot..")

	saynn("Sofie approaches you specifically.")

	talk(C_GIRL, "So. How are you gonna be useful to us? We already have a cow and a bull so you could be either, I don't care. I just don't take 'no' for an answer.")

	addAction("Milk", "Your breasts will be milked. Their size will be increased over time", "setState", ["intro8milk"])
	if(GM.pc.hasReachablePenis() || GM.pc.isWearingChastityCage()):
		addAction("Seed", "Your cock will be milked", "setState", ["intro8seed"])
		addAction("Both", "Both, your breasts and your cock will be milked", "setState", ["intro8both"])
	else:
		addDisabledAction("Seed", "Sadly, you don't have a penis to be seed-milked")
		addDisabledAction("Both", "Sadly, you don't have a penis to also be seed-milked")

func intro8milk_state():
	agreeMilk = true
	agreeSeed = false
	addChar(C_GIRL)
	addChar(C_GUY)
	saynn("You tell the owners that you choose your breasts.")

	talk(C_GIRL, "Alright. And if you're not lactating, we will find a way to make you do it, don't you worry, cow.")
	saynn("A cow.. is that who you are now?")

	talk(C_GIRL, "We will start milking you soon. If you're hungry, go eat grass.")
	saynn("And with that, your new owners leave you be.")

	saynn("The other slaves.. animals.. the cow and the bull.. head towards their corners.")
	addContinue("setState", ["main"])

func intro8seed_state():
	agreeMilk = false
	agreeSeed = true
	addChar(C_GIRL)
	addChar(C_GUY)
	saynn("You tell the owners that you choose your cock.")

	talk(C_GIRL, "Alright. So you're a bull then. Good.")
	saynn("A bull.. is that who you are now?")

	talk(C_GIRL, "We will start milking you soon. If you're hungry, go eat grass.")
	saynn("And with that, your new owners leave you be.")

	saynn("The other slaves.. animals.. the cow and the bull.. head towards their corners.")
	addContinue("setState", ["main"])

func intro8both_state():
	agreeMilk = true
	agreeSeed = true
	addChar(C_GIRL)
	addChar(C_GUY)
	saynn("You tell the owners that you choose.. both your cock and your breasts.")

	talk(C_GIRL, "Alright. We shouldn't have any problems milking your cock. But if you're not lactating, we will find a way to make you do it, don't you worry, cow.")
	saynn("A cow.. is that who you are now?")

	talk(C_GIRL, "We will start milking you soon. If you're hungry, go eat grass.")
	saynn("And with that, your new owners leave you be.")

	saynn("The other slaves.. animals.. the cow and the bull.. head towards their corners.")
	addContinue("setState", ["main"])
