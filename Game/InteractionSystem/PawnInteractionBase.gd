extends Reference
class_name PawnInteractionBase

var location:String = "main_punishment_spot"
var id:String = "error"

var involvedPawns:Dictionary = {}
var currentPawn:String = ""

var nextInteractionAt:int = 0

func start(_pawns:Dictionary):
	pass

func getOutputText() -> String:
	return "Something something"

func getActions() -> Array:
	return [
		{
			id = "test",
			name = "Test",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 60,
		},
	]

func doAction(_id:String, _args:Dictionary, _actionEntry=null):
	pass

#func getNextInteractionTime() -> int:
#	return 30

func getLocation() -> String:
	return location

#func markAsUpdated():
#	lastUpdatedSeconds = GM.main.getTime()

func getPawn(pawnID:String) -> CharacterPawn:
	return GM.main.IS.getPawn(pawnID)

func setLocation(newLoc:String):
	location = newLoc
	
	for role in involvedPawns:
		var thePawn = getPawn(involvedPawns[role])
		if(thePawn == null):
			continue
		thePawn.setLocation(location)
