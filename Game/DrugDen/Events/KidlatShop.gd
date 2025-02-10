extends DrugDenEventBase

func _init():
	id = "KidlatShop"
	eventWeight = 10.5

func getMaxPerFloor() -> int:
	return 1

func getCooldown() -> int:
	return 0#RNG.randi_range(2, 10)

func getStartCooldown() -> int:
	return 0#RNG.randi_range(1, 2)

func getInteractInfo() -> Dictionary:
	return {
		text = "KIDLAAAAT.",
		actions = [
			{
				id = "approach",
				name = "Approach",
				desc = "See what's up",
				args = [],
				disabled = false,
			},
		],
	}

func doInteract(_actionID:String, _args:Array = []) -> Dictionary:
	var scene1Hap:bool = getModuleFlag("Kidlat1Hap", false)
	
	if(!scene1Hap):
		setModuleFlag("Kidlat1Hap", true)
		return {sceneID="DrugDenKidlat1Scene"}
	
	return {sceneID="DrugDenKidlatShopScene"}

func getMapIcon():
	return RoomStuff.RoomSprite.IMPORTANT

func getModuleFlag(flagID:String, default):
	return GM.main.getFlag("DrugDenModule."+flagID, default)

func setModuleFlag(flagID:String, newVal):
	return GM.main.setFlag("DrugDenModule."+flagID, newVal)

func isFirstTimeThisFloor():
	return true

func isFirstTimeThisRun():
	return true

func isOutOfItems():
	return true

func addBuyButtons(_scene):
	pass

func getItemsListText():
	return "STUFF"
