extends NpcOwnerEventBase

#var creditsAmount:int = 10

func _init():
	id = "TaskSlut"
	reactsToTags = [E_APPROACH]
	
	eventWeight = 0.4
	eventTagWeightOverrides = {NOET.Tasks: 1.0}

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var theNpcOwner := getNpcOwner()
	if(theNpcOwner.hasGivenPCAnyTasks()):
		return false
	genTasks()
	return true

func genTasks():
	var theNpcOwner := getNpcOwner()
	if(RNG.chance(50)):
		theNpcOwner.generateTasks(2, 1.5, 3.0) # 2 hard tasks
	else:
		theNpcOwner.generateTasks(RNG.randi_range(3, 5), 1.0, 1.5) # 3-5 simple tasks
	GM.main.addMessage("Tasks menu updated.")

func start():
	playStand()
	saynn("{npc.name} approaches you.")
	talkModularOwnerToPC("SoftSlaveryTaskSlutGive")
	saynn("{npc.He} {npc.verb('start')} listing things that {npc.he} {npc.verb('want')} you to do.")
	sayTaskInfo()
	sayOwnerRandomTaskLine()
	saynn("Your owner offers you a smile..")
	talkModularOwnerToPC("SoftSlaveryTaskCheck")
	saynn("Looks like you only have a few days to complete these..")
	addButton("Okay", "Agree to the tasks", "endEvent")
	addButton("Different?", "Ask the owner to give you different tasks", "askDifferent")

func start_do(_id:String, _args:Array):
	if(_id == "askDifferent"):
		genTasks()
		setState("askedDifferent")

func askedDifferent():
	saynn("You ask your owner if they can give you different tasks.")
	sayTaskInfo()
	sayOwnerRandomTaskLine()
	addButton("Okay", "Agree to the tasks", "endEvent")
	addButton("Different?", "Ask the owner to give you different tasks", "askDifferent")

func askedDifferent_do(_id:String, _args:Array):
	if(_id == "askDifferent"):
		genTasks()
		setState("askedDifferent")

func saveData() -> Dictionary:
	var data := .saveData()
	
	#data["creditsAmount"] = creditsAmount
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	#creditsAmount = SAVE.loadVar(_data, "creditsAmount", 10)
