extends NpcOwnerEventBase

#var creditsAmount:int = 10

func _init():
	id = "TaskProstitution"
	reactsToTags = [E_APPROACH]
	
	eventWeight = 0.5
	eventTags = {NOET.Tasks: 0.5, NOET.Prostitution: 1.0}

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var theNpcOwner := getNpcOwner()
	if(!theNpcOwner.tasks.empty()):
		return false
	theNpcOwner.generateTasks(1, NpcTaskPool.Prostitution)
	GM.main.addMessage("Tasks menu updated.")
	return true

func start():
	playStand()
	saynn("YOUR OWNER APPROACHES YOU!")
	
	talkModularOwnerToPC("SoftSlaveryTaskSlutGive")
	
	saynn("YOUR OWNER STARTS LISTING TASKS.")
	
	sayTaskInfo()
	
	#Random line based on a random task
	sayOwnerRandomTaskLine()
	
	saynn("YOUR OWNER SMILES.")
	
	talkModularOwnerToPC("SoftSlaveryTaskCheck")
	
	saynn("Looks like you only have a few days to complete these..")
	
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
