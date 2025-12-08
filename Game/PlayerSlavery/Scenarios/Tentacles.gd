extends PlayerSlaveryBase

const STAGE_EGG = 0
const STAGE_TINY = 1
const STAGE_SMALL = 2
const STAGE_NORMAL = 3

var growStage:int = STAGE_EGG

const LOC_BED = "pstent_bed"
const LOC_FRIDGE = "pstent_fridge"
const LOC_IMPORTANT = "pstent_important"
const LOC_SHOWER = "pstent_shower"
const LOC_PLAY = "pstent_play"
const LOC_MIDDLE = "pstent_middle"

# mood

# personality
var anger:int = 0
var perception:int = 0
var mind:int = 0
var lust:int = 0

func _init():
	id = "Tentacles"

func onSlaveryStart():
	pass

func onSlaveryEnd():
	pass

# Gets called after onSlaveryStart()
func getStartScene() -> String:
	return "PSTentaclesStart"

func getPCViewDistance() -> float:
	return 70.0

func getText(_loc:String) -> String:
	if(_loc == LOC_IMPORTANT):
		return "Test test TEST TEST"
	
	return ""

func action(_name:String, _desc:String, _sceneID:String, _args:Array = []):
	return [_name, _desc, _sceneID, _args]

func getActions(_loc:String) -> Array:
	var theActions:Array = []
	
	if(_loc == LOC_IMPORTANT):
		theActions.append(action("MEOW", "TEST ACTION", "MeScene"))
	
	return theActions

func doAction(_scene, _action:Array):
	GM.main.runScene(_action[2], _action[3])

func checkEvent(_scene, _loc:String) -> Array:
	if(_loc == LOC_SHOWER):
		return ["MeScene"]
	return []

func saveData() -> Dictionary:
	return {}

func loadData(_data:Dictionary):
	pass
