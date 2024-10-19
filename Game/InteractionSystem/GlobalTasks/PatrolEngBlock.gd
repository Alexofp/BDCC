extends "res://Game/InteractionSystem/GlobalTasks/PatrolGreenhouses.gd"

func _init():
	id = "PatrolEngBlock"
	patrolZone = WorldZone.EngPatrol
	maxAssignedUnscaled = 4

func canDoTask(_pawn:CharacterPawn) -> bool:
	return _pawn.isEngineer() && !_pawn.isSlaveToPlayer()
