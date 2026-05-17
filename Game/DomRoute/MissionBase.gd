extends Reference
class_name MissionBase

var id:String

var name:String = "Change me"
var desc:String = "Change me please please please"
var startScene:String = "MISSING_MISSION_SCENE"
var requiredMissions:Array = []
var startLoc:String = "hideout_hq" # Player's starting loc

var flags:Dictionary

func isVisible() -> bool:
	return true

func isVisibleFinal() -> bool:
	if(GM.main.MS.isCompleted(id)):
		return false
	
	for theMissionID in requiredMissions:
		if(!GM.main.MS.isCompleted(theMissionID)):
			return false
	
	if(!isVisible()):
		return false
	return true

func getName() -> String:
	return name

func getDescription() -> String:
	return desc

func getObjectives() -> Array:
	var result:Array = []
	
	return result

func getStartSceneButtonsLoc(_loc:String) -> Array:
	return []

func getStartSceneButtonsCharacter(_char:String) -> Array:
	return []

func getEventSceneLoc(_loc:String) -> Array:
	return [] # [sceneid, args]

# Gets called for scenes started by getStartSceneButtonsLoc/getStartSceneButtonsCharacter only
func onSceneStart(_sceneID:String, _args:Array):
	pass

func onSimpleScene(_eventID:String, _args:Array, _scene):
	pass

func onMissionStart():
	pass

func startSceneButton(_sceneID:String, _args:Array=[], _name:String = "Mission", _desc:String = "Start the mission-related scene!") -> Array:
	return [_sceneID, _args, _name, _desc]

func startSimpleSceneButton(_text:String, _eventID:String = "", _args:Array=[], _name:String = "Mission", _desc:String = "Start the mission-related scene!") -> Array:
	return ["MissionSimpleScene", [_text, _eventID, _args], _name, _desc]

func getStartScene() -> String:
	return startScene

func getFlags():
	return flags

func setFlag(_flagID:String, _value):
	GM.main.MS.setSpecificFlag(id, _flagID, _value)

func getFlag(_flagID:String, _default = null):
	return GM.main.MS.getSpecificFlag(id, _flagID, _default)

func flag(type:int) -> Dictionary:
	return {
		"type": type,
	}

func getStartLoc() -> String:
	return startLoc
