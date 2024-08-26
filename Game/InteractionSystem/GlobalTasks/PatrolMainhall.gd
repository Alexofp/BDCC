extends "res://Game/InteractionSystem/GlobalTasks/PatrolGreenhouses.gd"

func _init():
	id = "PatrolMainhall"
	patrolZone = WorldZone.MainHallPatrol

func getMaxAssigned() -> int:
	return 2
