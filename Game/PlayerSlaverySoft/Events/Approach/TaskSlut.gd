extends NpcOwnerEventBase

#var creditsAmount:int = 10

func _init():
	id = "TaskSlut"
	reactsToTags = [E_APPROACH]
	
	eventMinLevel = 0
	eventMaxLevel = 2
	eventWeight = 0.5
	eventTags = {NOET.Tasks: 1.0}

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var theNpcOwner := getNpcOwner()
	if(!theNpcOwner.tasks.empty()):
		return false
	theNpcOwner.generateTasks()
	return true

func start():
	playStand()
	saynn("YOUR OWNER GIVES YOU TASKS!")
	
	sayTaskInfo()
	
	addButton("Okay", "Agree to the tasks", "endEvent")
	#addButton("Different?", "Ask the owner to give you different tasks", "askDifferent")

func start_do(_id:String, _args:Array):
	if(_id == "resist"):
		runResist()

func saveData() -> Dictionary:
	var data := .saveData()
	
	#data["creditsAmount"] = creditsAmount
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	#creditsAmount = SAVE.loadVar(_data, "creditsAmount", 10)
