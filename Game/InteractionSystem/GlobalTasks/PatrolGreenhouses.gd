extends GlobalTask

var patrolZone:String = WorldZone.Greenhouses

func _init():
	id = "PatrolGreenhouses"
	goalID = InteractionGoal.Patrol
	maxAssignedUnscaled = 3

func canDoTask(_pawn:CharacterPawn) -> bool:
	return (_pawn.isGuard() || shouldIgnoreCharType(_pawn)) && !_pawn.isSlaveToPlayer()

func configureGoal(_pawn:CharacterPawn, _goal):
	_goal.zone = patrolZone

