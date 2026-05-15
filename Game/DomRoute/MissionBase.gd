extends Reference
class_name MissionBase

var id:String

var name:String = "Change me"
var desc:String = "Change me please please please"
var startScene:String = "MISSING_MISSION_SCENE"
var requiredMissions:Array = []

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

func getStartScene() -> String:
	return startScene

func getFlags():
	return flags

func setFlag(_flagID:String, _value):
	GM.main.MS.setFlag(id, _flagID, _value)

func getFlag(_flagID:String, _default = null):
	return GM.main.MS.getFlag(id, _flagID, _default)

func flag(type:int) -> Dictionary:
	return {
		"type": type,
	}
