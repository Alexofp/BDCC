extends NpcOwnerEventBase

#var creditsAmount:int = 10

func _init():
	id = "TaskProstitution"
	reactsToTags = [E_APPROACH]
	
	eventWeight = 0.5
	eventTags = {NOET.Tasks: 0.5, NOET.Prostitution: 1.0}

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var theNpcOwner := getNpcOwner()
	if(theNpcOwner.hasGivenPCAnyTasks()):
		return false
	theNpcOwner.generateTasks(1, 1.0, 2.0, NpcTaskPool.Prostitution)
	GM.main.addMessage("Tasks menu updated.")
	return true

func start():
	playStand()
	saynn("{npc.name} approaches you.")
	talkModularOwnerToPC("SoftSlaveryTaskProstitutionGive")
	saynn("Your owner gives you a task.")
	sayTaskInfo()
	sayOwnerRandomTaskLine()
	saynn("{npc.He} {npc.verb('nod')}.")
	talkModularOwnerToPC("SoftSlaveryTaskCheck")
	saynn("Looks like you only have a few days to complete it..")
	addButton("Okay", "Agree to the tasks", "endEvent")

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
