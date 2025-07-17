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

var state:String = "main"
var texts:Array = []
var actions:Array = []

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

func _init():
	id = "MilkCafe"

func onSlaveryStart():
	main_state()

func onSlaveryEnd():
	pass

# Gets called after onSlaveryStart()
func getStartScene() -> String:
	return "PSMilkCafeGameplayScene"

func getPCViewDistance() -> float:
	return 64.0

func setState(_state:String):
	state = _state

func saynn(_text:String):
	texts.append(_text+"\n\n")

func addAction(_name:String, _desc:String, _id:String, _args:Array = []):
	actions.append([true, -1, _name, _desc, _id, _args])

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
	

func main_state():
	saynn("Test")
	
	addAction("Meow", "Do a hecking meow", "meow")
	addAction("Meow2", "Do a hecking meow twice", "meow2")
	addAction("Meow3", "Do a hecking meow 3 times", "meow3")

func main_do(_id:String, _args:Array):
	if(_id == "meow"):
		saynn("YOU DO A HECKING MEOW.")
		setState("test")
	if(_id == "meow2"):
		saynn("You do a double-meow.")
	if(_id == "meow3"):
		saynn("You do a TRIPLE-meow.")
		addAction("Meow meow", "MEOW MEOW", "meowmeow")
	if(_id == "meowmeow"):
		setState("test")
		
func test_state():
	saynn("TEST STATE!")
	
	addAction("Back", "Go back", "setState", ["main"])

func test_do(_id:String, _args:Array):
	pass
