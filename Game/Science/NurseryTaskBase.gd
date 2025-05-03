extends Reference
class_name NurseryTaskBase

var id:String = "error"

var credits:int = 0
var sciPoints:int = 0
var days:int = 1

const DIFFICULTY_EASY = 0
const DIFFICULTY_MEDIUM = 1
const DIFFICULTY_HARD = 2
const DIFFICULTY_VERY_HARD = 3

func getName() -> String:
	return "ERROR"

func getDescription() -> String:
	return "FILL ME"

func getCompletionString() -> String:
	return ""

func getRewardString() -> String:
	var result:String = ""
	if(credits != 0):
		result = str(credits)+" credit"+("s" if credits != 1 else "")
	if(sciPoints != 0):
		if(result != ""):
			result += ", "
		result += str(sciPoints)+" science point"+("s" if sciPoints != 1 else "")
	return result

func getDeadlineString() -> String:
	if(days <= 1):
		return "Last day before task expires"
	else:
		return "Expires in "+str(days)+" days"

func setTaskDataFinal(_data:Dictionary):
	if(_data.has("credits")):
		credits = _data["credits"]
	if(_data.has("sciPoints")):
		sciPoints = _data["sciPoints"]
	if(_data.has("days")):
		days = _data["days"]
	setTaskData(_data)

func setTaskData(_data:Dictionary):
	pass

func generatePossibleTasks() -> Array:
	return []

func completeSelf():
	if(GM.main.SCI.removeNurseryTask(self)):
		GM.pc.addCredits(credits)
		GM.main.SCI.addPoints(sciPoints, false)
		GM.main.SCI.nurseryTasksCompleted += 1
		GM.main.addMessage("Nursery bounty '"+getName()+"' got completed! Received "+getRewardString())

func handleBountyFluid(_fluidType:String, _amount:float):
	pass

func handleSexEvent(_event:SexEvent):
	pass

func isCompleted() -> bool:
	return false

func shouldBeCancelled() -> bool:
	return false

static func getFloorName(floorID:String) -> String:
	#var room = GM.world.getRoomByID(loc)
	#var floorID:String = room.getFloorID()
	if(floorID == "Cellblock"):
		return "Cellblock"
	if(floorID == "MainHall"):
		return "Main prison floor"
	if(floorID == "Medical"):
		return "Medical wing"
	if(floorID == "MiningFloor"):
		return "Mining floor"
	
	return "Unknown"

func getCharName(theCharID:String) -> String:
	if(theCharID != ""):
		var character = GlobalRegistry.getCharacter(theCharID)
		if(character != null):
			return character.getName()
	
	return "Unknown"

static func getCharDescription(theCharID:String) -> String:
	var character:BaseCharacter = GlobalRegistry.getCharacter(theCharID)
	if(character == null):
		return "ERROR, NO CHARACTER FOUND WITH ID "+str(theCharID)
	
	var desc:String = ""
	desc = "Occupation: "+CharacterType.getName(character.getCharType())
	if(GM.main.IS.hasPawn(theCharID)):
		var pawn:CharacterPawn = GM.main.IS.getPawn(theCharID)
		var room = GM.world.getRoomByID(pawn.getLocation())
		if(room == null):
			desc += "\nCurrent location: Error.."
		else:
			var floorID:String = room.getFloorID()
			desc += "\nCurrent location: "+getFloorName(floorID)
	else:
		desc += "\nCurrent location: Resting (Can meet through the Encounters menu)"
	
	return desc

func saveData() -> Dictionary:
	return {
		credits = credits,
		sciPoints = sciPoints,
		days = days,
	}

func loadData(_data:Dictionary):
	credits = SAVE.loadVar(_data, "credits", 0)
	sciPoints = SAVE.loadVar(_data, "sciPoints", 0)
	days = SAVE.loadVar(_data, "days", 1)
