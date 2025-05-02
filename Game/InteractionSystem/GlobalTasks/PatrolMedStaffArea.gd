extends "res://Game/InteractionSystem/GlobalTasks/PatrolGreenhouses.gd"

func _init():
	id = "PatrolMedStaffArea"
	patrolZone = WorldZone.MedPatrol
	maxAssignedUnscaled = 3

func canDoTask(_pawn:CharacterPawn) -> bool:
	return (_pawn.isNurse() || shouldIgnoreCharType(_pawn)) && !_pawn.isSlaveToPlayer()
