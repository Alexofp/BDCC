extends PawnTypeBase

func _init():
	id = CharacterType.Guard

func getDistributionWeight() -> float:
	return 2.0

func getSpawnLocations(_character) -> Array:
	return ["hall_elevator", "main_greenhouses"]

func getCharacterPool() -> String:
	return CharacterPool.Guards

func getCharacterGenerator():
	return GuardGenerator.new()
