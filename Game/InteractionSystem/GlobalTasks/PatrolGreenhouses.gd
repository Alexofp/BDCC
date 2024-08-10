extends GlobalTask

var patrolZone:String = WorldZone.Greenhouses

func _init():
	id = "PatrolGreenhouses"
	goalID = InteractionGoal.Patrol

func getMaxAssigned() -> int:
	return 1

func configureGoal(_pawn:CharacterPawn, _goal):
	_goal.zone = patrolZone
