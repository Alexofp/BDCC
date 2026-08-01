extends Reference
class_name MissionBase

var id:String

var name:String = "Change me"
var desc:String = "Change me please please please"
var startScene:String = "MISSING_MISSION_SCENE"
var requiredMissions:Array = []
var startLoc:String = "hideout_hq" # Player's starting loc
var sideMission:bool = false
var addAsAQuest:bool = true
var rewardExp:int = 0
var rewardCredits:int = 0
var rewardItems:Array = []
var rewardExtra:String = ""
var rewardRepeatRate:float = 0.1

var flags:Dictionary
var decisions:Dictionary

const DECISION_EFFECT_AVY_LOVE := 0
const DECISION_EFFECT_KAIT_LOVE := 1
const DECISION_EFFECT_AVY_OBEDIENCE := 2
const DECISION_EFFECT_KAIT_OBEDIENCE := 3

# if true, doesn't even get counted into the total mission amount. Use for secret missions or whatever
func isDisabled() -> bool:
	return false

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
	if(isDisabled()):
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

func giveReward(_isRepeat:bool):
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

func isSideMission() -> bool:
	return sideMission

func getRewardString() -> String:
	var result:Array = []
	
	if(rewardExp != 0):
		result.append(str(rewardExp)+" Experience")
	if(rewardCredits != 0):
		result.append(str(rewardCredits)+"x Credits")
	if(!rewardItems.empty()):
		for theItemID in rewardItems:
			var theItemRef = GlobalRegistry.getItemRef(theItemID)
			if(!theItemRef):
				continue
			result.append(theItemRef.getName())
	if(!rewardExtra.empty()):
		result.append(rewardExtra)
	return Util.join(result, ", ")

func giveRewardFinal(_isRepeat:bool):
	var finalRewardExp:int = rewardExp if !_isRepeat else int(rewardRepeatRate*rewardExp)
	if(finalRewardExp != 0):
		GM.main.addMessage("You received "+str(finalRewardExp)+" experience")
		GM.pc.addExperience(finalRewardExp)
	var finalRewardCredits:int = rewardCredits if !_isRepeat else int(rewardRepeatRate*rewardCredits)
	if(finalRewardCredits != 0):
		GM.main.addMessage("You received "+str(finalRewardCredits)+" credits")
		GM.pc.addCredits(finalRewardCredits)
	if(!_isRepeat):
		for theItemID in rewardItems:
			var theItem = GlobalRegistry.createItem(theItemID)
			if(!theItem):
				return
			GM.pc.getInventory().addItem(theItem)
			GM.main.addMessage("You received "+theItem.getAStackName())
	giveReward(_isRepeat)

func canCancelAtAnyTime() -> bool:
	return true

func clearMissionMarkers():
	GM.main.MS.clearMissionMarkers()

func setMissionMarkers(_Ar:Array):
	GM.main.MS.setMissionMarkers(_Ar)

func setMissionMarker(_loc:String):
	GM.main.MS.setMissionMarker(_loc)
