extends PlayerSlaveryBase

var totalMilk:float = 0.0
var totalSeed:float = 0.0

var cowTrust:float = 0.0
var bullTrust:float = 0.0

var girlLove:float = 0.0
var guyLove:float = 0.0

var needsPunishment:bool = false

var mindset:float = 0.0

var day:int = 0

var milkedToday:int = 0
var milkedTotal:int = 0

var agreeMilk:bool = true
var agreeSeed:bool = false

var state:String = "intro"
var texts:Array = []
var actions:Array = []

const C_PC = "pc"
const C_COW = "rahi" #TODO: Change me
const C_BULL = "rahiRabi"
const C_GIRL = "tavi"
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

func saveData() -> Dictionary:

	return {
		totalMilk = totalMilk,
		totalSeed = totalSeed,
		cowTrust = cowTrust,
		bullTrust = bullTrust,
		girlLove = girlLove,
		guyLove = guyLove,
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
	}

func loadData(_data:Dictionary):
	totalMilk = SAVE.loadVar(_data, "totalMilk", 0.0)
	totalSeed = SAVE.loadVar(_data, "totalSeed", 0.0)
	cowTrust = SAVE.loadVar(_data, "cowTrust", 0.0)
	bullTrust = SAVE.loadVar(_data, "bullTrust", 0.0)
	girlLove = SAVE.loadVar(_data, "girlLove", 0.0)
	guyLove = SAVE.loadVar(_data, "guyLove", 0.0)
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

func _init():
	id = "MilkCafe"

func onSlaveryStart():
	intro_state()

func onSlaveryEnd():
	pass

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

func doFinalAction(_finalActionEntry:Array):
	if(_finalActionEntry[1] == "action"):
		var _actionEntry:Array = _finalActionEntry[4]
		actions.clear()
		texts.clear()
		
		var theID:String = _actionEntry[4]
		var theArgs:Array = _actionEntry[5]
		
		if(theID == "setState"):
			state = theArgs[0]
			call(state + "_state")
			return
		
		call(state + "_do", theID, theArgs)
		if(texts.empty() && actions.empty()):
			call(state + "_state")
		elif(actions.empty()):
			addAction("Continue", "See what happens next", "setState", [state])

func processTurn():
	GM.main.processTime(60*60)

func addUpTextNum(_value:String, _howMuch:int):
	var howMuchStr:String = ("+" if _howMuch >= 0 else "")+str(_howMuch)
	if(_howMuch >= 0):
		addTextToBack("[color=#00CC00]("+_value+" "+howMuchStr+")[/color]")
	else:
		addTextToBack("[color=red]("+_value+" "+howMuchStr+")[/color]")
func addUpText(_value:String, _howMuch:int):
	if(_howMuch == 0):
		_howMuch = 1
	var howMuchStr:String = ("+".repeat(_howMuch) if _howMuch >= 0 else "-".repeat(_howMuch))
	if(_howMuch >= 0):
		addTextToBack("[color=#00CC00]("+_value+" "+howMuchStr+")[/color]")
	else:
		addTextToBack("[color=red]("+_value+" "+howMuchStr+")[/color]")

func addCredits(_howMuch:int):
	GM.pc.addCredits(_howMuch)
	addUpTextNum("Credits", _howMuch)
func addStamina(_howMuch:int):
	GM.pc.addStamina(_howMuch)
	addUpTextNum("Stamina", _howMuch)

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
	aimCamera(L_CENTER)
	
	saynn("MAIN LOOP.")
	
	sayn("Day: "+str(day))
	
	#talk(C_GIRL, "Hello.")
	
	addAction("Graze", "Spend time doing nothing", "goIdle")
	addAction("Eat", "Go eat out of a trough", "goEat")
	addAction("Cow", "Spend time with the cow", "talkCow")
	addAction("Bull", "Spend time with the bull", "talkBull")

func lateCheck() -> bool:
	if(GM.main.isVeryLate()):
		setState("sleep")
		return true
	return false

func triggerEventMaybe():
	if(lateCheck()):
		return
	
	if(RNG.chance(50)):
		addContinue("startEvent", ["test"])

func main_do(_id:String, _args:Array):
	if(_id == "goIdle"):
		processTurn()
		aimCamera(L_FIELD)
		saynn("YOU SPEND SOME TIME GRAZING.")
		triggerEventMaybe()
	if(_id == "goEat"):
		processTurn()
		aimCamera(L_EAT)
		addStamina(20)
		addUpText("Obedience", 1)
		
		saynn("YOU EAT SOME HAY OUT OF A TROUGH.")
		triggerEventMaybe()
	if(_id == "talkCow"):
		processTurn()
		aimCamera(L_COW)
		saynn("YOU SPEND SOME TIME WITH THE COW.")
		addUpText("Cow", 1)
		triggerEventMaybe()
	if(_id == "talkBull"):
		processTurn()
		aimCamera(L_BULL)
		saynn("YOU SPEND SOME TIME WITH THE BULL.")
		addUpText("Bull", 1)
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
