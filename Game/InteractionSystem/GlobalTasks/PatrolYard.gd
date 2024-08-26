extends "res://Game/InteractionSystem/GlobalTasks/PatrolGreenhouses.gd"

func _init():
	id = "PatrolYard"
	patrolZone = WorldZone.YardPatrol

func getMaxAssigned() -> int:
	return 2
