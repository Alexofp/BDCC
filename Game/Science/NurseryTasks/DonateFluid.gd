extends NurseryTaskBase

var fluidID:String = ""
var curAmount:float = 0.0
var needAmount:float = 100.0

func _init():
	id = "DonateFluid"

func getName() -> String:
	if(fluidID == ""):
		return "Donate Any Fluid"
	else:
		var fluidObj:FluidBase = GlobalRegistry.getFluid(fluidID)
		if(fluidObj == null):
			return "Donate "+str(fluidID)
		return "Donate "+str(fluidObj.getVisibleName())

func getDescription() -> String:
	return "Use the donation machine here or get milked by Dr. Quinn."

func getCompletionString() -> String:
	return str(Util.roundF(curAmount, 1))+"/"+str(Util.roundF(needAmount, 1))+"ml"

func setTaskData(_data:Dictionary):
	fluidID = _data["fluidID"]
	needAmount = _data["needAmount"]

func generatePossibleTasks() -> Array:
	var result:Array = []
	
	var possibleFluids:Array = ["", "Cum", "Milk"]
	
	var importantID:String = RNG.pick(possibleFluids)
	
	for possibleFluidID in possibleFluids:
		var aneed:float = (RNG.randi_range(1, 5)+RNG.randi_range(1, 5))*50.0
		if(possibleFluidID == "Cum"):
			aneed *= 0.25
		result.append({
			difficulty = DIFFICULTY_EASY,
			fluidID = possibleFluidID,
			needAmount = aneed,
			days = 1,
			weight = 5.0 if importantID == possibleFluidID else 1.0,
		})
	
	return result

func handleBountyFluid(_fluidType:String, _amount:float):
	if(_fluidType == "Piss"):  # Nope
		return
	if(_fluidType == fluidID || fluidID == ""):
		curAmount += _amount
	
		if(curAmount >= needAmount):
			completeSelf()

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["fluidID"] = fluidID
	data["curAmount"] = curAmount
	data["needAmount"] = needAmount
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	fluidID = SAVE.loadVar(_data, "fluidID", "Milk")
	curAmount = SAVE.loadVar(_data, "curAmount", 0.0)
	needAmount = SAVE.loadVar(_data, "needAmount", 0.0)
