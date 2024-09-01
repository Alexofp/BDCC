extends GlobalTask

var patrolZone:String = WorldZone.FightClub
var canHangout:bool = false

func _init():
	id = "HangOutAtFightclub"
	goalID = InteractionGoal.HangoutAt
	maxAssignedUnscaled = 4

func canDoTask(_pawn:CharacterPawn) -> bool:
	return canHangout && _pawn.isInmate()

func configureGoal(_pawn:CharacterPawn, _goal):
	_goal.zone = patrolZone

func processTime(_howMuch:int):
	if(GM.main.IS.getInteractionsOfTypeAmount("InSlutwall") > 0):
		canHangout = true
	else:
		canHangout = false

func resetTask():
	canHangout = false
