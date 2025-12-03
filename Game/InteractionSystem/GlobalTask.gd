extends Reference
class_name GlobalTask

var id:String = "error"
var uniqueID:String = ""
var goalID:String = InteractionGoal.Patrol
var maxAssignedUnscaled:float = 1.0 # For 30 pawns
var assigned:Array = [] # Pawn ids
var assignedCached:int = 0
var maxAssignedCached:int = 0

func onPawnStoppedDoingTask(_pawn:CharacterPawn):
	if(assigned.has(_pawn.charID)):
		assigned.erase(_pawn.charID)
		assignedCached -= 1

func onPawnStartedDoingTask(_pawn:CharacterPawn):
	assigned.append(_pawn.charID)
	assignedCached += 1

func getMaxAssigned(_maxPawnCount:int) -> int:
	return Util.maxi(1, int(round(maxAssignedUnscaled*(_maxPawnCount/30.0))))

func canDoTask(_pawn:CharacterPawn) -> bool:
	return true

func shouldIgnoreCharType(_pawn:CharacterPawn) -> bool:
	if(_pawn.canDoTaskOverride(id, self)):
		return true
	return false

func canDoTaskFinal(_pawn:CharacterPawn) -> bool:
	if(assignedCached >= maxAssignedCached):
		return false
	
	if(!_pawn.canBeInterrupted()):
		return false
	
	return canDoTask(_pawn)
	
func isAssigned(_pawn:CharacterPawn) -> bool:
	#return _pawn.isDoingTask(id)
	return assigned.has(_pawn.charID)

func getAllAssignedPawns() -> Array:
	var result:Array = []
	
	for pawnID in assigned:
		var pawn:CharacterPawn = GM.main.IS.getPawn(pawnID)
		
		if(pawn):
			result.append(pawn)
	
	return result

func sanityCheckPawns():
	for pawnID in assigned:
		var thePawn:CharacterPawn = GM.main.IS.getPawn(pawnID)
		assert(thePawn != null)
		assert(thePawn.isDoingTask(id))

func getGoalID(_pawn:CharacterPawn):
	return goalID

func configureGoalFinal(_pawn:CharacterPawn, _goal):
	_goal.globalTask = id
	configureGoal(_pawn, _goal)

func configureGoal(_pawn:CharacterPawn, _goal):
	pass

func processTime(_howMuch:int):
	pass

func resetTask():
	pass
