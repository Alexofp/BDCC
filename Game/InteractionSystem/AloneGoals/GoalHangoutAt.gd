extends "res://Game/InteractionSystem/AloneGoals/GoalPatrol.gd"

func getScore(_pawn:CharacterPawn) -> float:
	if(globalTask != ""):
		return 0.3
	return 0.0

func getKeepScore() -> float:
	return 0.4

func getText():
	return "{main.name} is hanging out!"
