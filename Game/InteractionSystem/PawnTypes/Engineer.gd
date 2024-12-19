extends PawnTypeBase

func _init():
	id = CharacterType.Engineer

func getDistributionWeight() -> float:
	return 1.0

func getSpawnLocations(_character) -> Array:
	return ["mining_elevator"]

func getCharacterPool() -> String:
	return CharacterPool.Engineers

func getCharacterGenerator():
	return EngineerGenerator.new()
