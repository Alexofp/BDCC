extends "res://Game/InteractionSystem/GlobalTasks/PatrolGreenhouses.gd"

func _init():
	id = "PatrolMedStaffArea"
	patrolZone = WorldZone.MedPatrol

func getMaxAssigned() -> int:
	return 3

func canDoTask(_pawn:CharacterPawn) -> bool:
	return _pawn.isNurse()
