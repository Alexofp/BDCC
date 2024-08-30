extends Object
class_name InteractionGoal

const Wander = "Wander"
const Eat = "Eat"
const Hangout = "Hangout"
const WorkMine = "WorkMine"
const Patrol = "Patrol"
const POI = "POI" # Point of interest
const Save = "Save"
const Prostitute = "Prostitute"

static func getAll():
	return [Wander, Eat, Hangout, WorkMine, Patrol, POI, Save, Prostitute]

static func getAllAlone():
	return [Wander, Eat, Hangout, WorkMine, POI]

static func create(theID:String):
	var newGoal
	if(GlobalRegistry.interactionGoalCache.has(theID)):
		newGoal = GlobalRegistry.interactionGoalCache[theID]
	else:
		var resourcePath = "res://Game/InteractionSystem/AloneGoals/Goal"+theID+".gd"
		newGoal = load(resourcePath)
		if(newGoal != null):
			GlobalRegistry.interactionGoalCache[theID] = newGoal
			
	if(newGoal == null):
		return null
	var newBlock = newGoal.new()
		
	if(newBlock != null):
		newBlock.id = theID
	return newBlock

static func getRef(theID:String):
	if(GlobalRegistry.interactionGoalRefCache.has(theID)):
		return GlobalRegistry.interactionGoalRefCache[theID]
	
	GlobalRegistry.interactionGoalRefCache[theID] = create(theID)
	return GlobalRegistry.interactionGoalRefCache[theID]
