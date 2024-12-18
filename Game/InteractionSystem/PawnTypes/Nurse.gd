extends PawnTypeBase

func _init():
	id = CharacterType.Nurse

func getDistributionWeight() -> float:
	return 1.0

func getSpawnLocations(_character) -> Array:
	return ["med_elevator"]

func getCharacterPool() -> String:
	return CharacterPool.Nurses

func getCharacterGenerator():
	return NurseGenerator.new()
