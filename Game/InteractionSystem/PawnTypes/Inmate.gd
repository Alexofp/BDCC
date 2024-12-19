extends PawnTypeBase

func _init():
	id = CharacterType.Inmate

func getDistributionWeight() -> float:
	return 3.0

func getSpawnLocations(_character) -> Array:
	if(_character == null):
		return ["main_stairs1", "main_stairs2"]
		
	var inmateType = _character.getInmateType()
	
	if(inmateType == InmateType.SexDeviant):
		return ["main_stairs1", "main_stairs2", "cellblock_lilac_nearcell"]
	elif(inmateType == InmateType.HighSec):
		return ["main_stairs1", "main_stairs2", "cellblock_red_nearcell"]
	
	return ["main_stairs1", "main_stairs2", "cellblock_orange_nearcell"]

func getCharacterPool() -> String:
	return CharacterPool.Inmates

func getCharacterGenerator():
	return InmateGenerator.new()
