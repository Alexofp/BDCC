extends GlobalTask

func _init():
	id = "Prostitution"
	goalID = InteractionGoal.Prostitute
	maxAssignedUnscaled = 5

func getMaxAssigned(_maxPawnCount:int) -> int:
	return .getMaxAssigned(_maxPawnCount) - GM.main.IS.getInteractionsOfTypeAmount("Prostitution")

func canDoTask(_pawn:CharacterPawn) -> bool:
	return _pawn.isInmate()

func configureGoal(_pawn:CharacterPawn, _goal):
	#_goal.zone = patrolZone
	pass
