extends "res://Game/InteractionSystem/GlobalTasks/PatrolGreenhouses.gd"

func _init():
	id = "PatrolMedLobby"
	patrolZone = WorldZone.MedLobby
	maxAssignedUnscaled = 1

func canDoTask(_pawn:CharacterPawn) -> bool:
	return _pawn.isNurse() && !_pawn.isSlaveToPlayer()
