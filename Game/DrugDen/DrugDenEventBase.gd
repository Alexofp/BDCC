extends Reference
class_name DrugDenEventBase

var id:String = "error"
var loc:String = ""
var eventWeight:float = 1.0

func canSpawn(_drugDen) -> bool:
	return true

func onSpawn(_drugDen):
	pass

func getMaxPerFloor() -> int:
	return 2

func getCooldown() -> int:
	return 0

func getStartCooldown() -> int:
	return 0

func getEventWeight() -> float:
	return eventWeight

func getLoc() -> String:
	return loc

func getInteractInfo() -> Dictionary:
	return {
		text = "You found something!",
		actions = [
			{
				id = "act",
				name = "Act",
				desc = "Do something!",
				args = [],
				disabled = false,
			},
		],
	}

func doInteract(_actionID:String, _args:Array = []) -> Dictionary:
	return {text="You did it!", lootTable="medicalstorage", ended=true, anim=[StageScene.Sleeping, "sleep"]}

func getMapIcon():
	return RoomStuff.RoomSprite.BED

func endEvent():
	if(loc == ""):
		return
	if(GM.main.DrugDenRun == null):
		return
	GM.main.DrugDenRun.removeEventFromRoom(loc)
	loc = ""

# These 3 functions are called on a 'ref' of an event, don't access any fields here!
func onRunStart(_drugDen):
	pass

func onRunEnd(_drugDen):
	pass

func onRunNextFloor(_drugDen):
	pass

func saveData() -> Dictionary:
	return {}

func loadData(_data:Dictionary):
	pass

func getDrugDenFlag(theFlagID:String, defaultValue):
	return GM.main.DrugDenRun.getFlag(theFlagID, defaultValue)

func setDrugDenFlag(theFlagID:String, newVal):
	return GM.main.DrugDenRun.setFlag(theFlagID, newVal)
