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
	return "FILL ME"

func getCompletionString() -> String:
	return str(Util.roundF(curAmount, 1)+"/"+str(Util.roundF(needAmount, 1)))+"ml"

func setTaskData(_data:Dictionary):
	fluidID = _data["fluidID"]
	needAmount = _data["needAmount"]

func generatePossibleTasks() -> Array:
	var result:Array = []
	
	for possibleFluidID in ["", "Cum", "Milk"]:
		result.append({
			credits = RNG.randi_range(1, 3),
			sciPoints = RNG.randi_range(10, 20),
			fluidID = possibleFluidID,
			needAmount = (RNG.randi_range(1, 5)+RNG.randi_range(1, 5))*50.0,
		})
	
	return result

func isSameAs(_otherTask) -> bool:
	return fluidID == _otherTask.fluidID

func handleBountyFluid(_fluidType:String, _amount:float):
	if(_fluidType == fluidID || fluidID == ""):
		curAmount += _amount
	
		if(curAmount >= needAmount):
			completeSelf()
