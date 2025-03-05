extends Object
class_name DatapackSceneTriggerType

const None = "None"
const EnterRoom = "EnterRoom"
const EnterAnyRoom = "EnterAnyRoom"
const EnterPlayerCell = "EnterPlayerCell"
const EnterRoomOnFloor = "EnterRoomOnFloor"

const TalkingToDynamicNPC = "TalkingToDynamicNPC"
const MeetDynamicNPC = "MeetDynamicNPC"
const TalkingToNPC = "TalkingToNPC"

const TakingAShower = "TakingAShower"
const Waiting = "Waiting"
const EatingInCanteen = "EatingInCanteen"
const WorkingInMines = "WorkingInMines"
const SleepInCell = "SleepInCell"
const WakeUpInCell = "WakeUpInCell"
const ApproachedYogaMats = "ApproachedYogaMats"
const ApproachedWeightsBench = "ApproachedWeightsBench"
const InsideElevator = "InsideElevator"
const PCLookingForTrouble = "PCLookingForTrouble"
const SceneAndStateHook = "SceneAndStateHook"

static func getAll():
	return [
		None,
		EnterRoom,
		EnterAnyRoom,
		EnterPlayerCell,
		EnterRoomOnFloor,
		
		TalkingToDynamicNPC,
		MeetDynamicNPC,
		TalkingToNPC,
		
		TakingAShower,
		Waiting,
		EatingInCanteen,
		WorkingInMines,
		SleepInCell,
		WakeUpInCell,
		ApproachedYogaMats,
		ApproachedWeightsBench,
		InsideElevator,
		PCLookingForTrouble,
		SceneAndStateHook,
	]

static func getName(triggerType):
	return str(triggerType)

static func getDescription(triggerType):
	if(triggerType == None):
		return "This trigger type will never happen, could be used to disable the trigger"
	if(triggerType == EnterRoom):
		return "If set to React, will execute code as soon as you enter a specific room. If set to Run, allows you to add buttons and output text"
	if(triggerType == EnterAnyRoom):
		return "If set to React, will execute code as soon as you enter any room. If set to Run, allows you to add buttons and output text"
	if(triggerType == EnterPlayerCell):
		return "If set to React, will execute code as soon as you enter player's cell. If set to Run, allows you to add buttons and output text"
	if(triggerType == EnterRoomOnFloor):
		return "Will execute code when you enter any room on the specified floor"
	
	if(triggerType == TalkingToDynamicNPC):
		return "Will execute code when you run into this dynamic npc during any encounter (that encounter will be cancelled) OR if you Meet them through the encounters menu. ONLY supports REACT execute type"
	if(triggerType == MeetDynamicNPC):
		return "Will execute code when you Meet them through the encounters menu (Has higher priority than TalkingToDynamicNPC too). ONLY supports REACT execute type"
	if(triggerType == TalkingToNPC):
		return "Will execute code when you talk to certain static npcs. Only the supported npcs are provided to you"
	
	if(triggerType == TakingAShower):
		return "Happens when the player takes a shower"
	if(triggerType == Waiting):
		return "Happens when the player waits. ONLY supports REACT execute type"
	if(triggerType == EatingInCanteen):
		return "Happens when the player eats in a canteen"
	if(triggerType == WorkingInMines):
		return "Happens when the player works in the mineshaft"
	if(triggerType == SleepInCell):
		return "Happens when the player goes to sleep in their cell (before sleeping). ONLY supports REACT execute type"
	if(triggerType == WakeUpInCell):
		return "Happens when the player wakes up in their cell (after sleeping)"
	if(triggerType == ApproachedYogaMats):
		return "Happens when the player approaches yoga mats"
	if(triggerType == ApproachedWeightsBench):
		return "Happens when the player approaches weights bench"
	if(triggerType == InsideElevator):
		return "Happens when the player is inside the elevator. ONLY supports RUN execute type"
	if(triggerType == PCLookingForTrouble):
		return "(Disabled, pls no use) Happens when the player presses the 'look for trouble' button. ONLY supports REACT execute type"
	if(triggerType == SceneAndStateHook):
		return "Advanced trigger that lets you hook into any scene. Only use if you know what you are doing. ONLY supports RUN execute type"
	
	return "No description provided"

static func getAllWithNames():
	var result = []
	for triggerType in getAll():
		result.append([triggerType, getName(triggerType)])
	return result

static func getEditVars(triggerType):
	if(triggerType == EnterRoom):
		return {
			"room": {
				name = "Room name",
				type = "location",
				value = "main_punishment_spot",
			},
		}
	if(triggerType == SceneAndStateHook):
		return {
			"scene": {
				name = "Scene id",
				type = "string",
				value = "MeScene",
			},
			"state": {
				name = "Scene state",
				type = "string",
				value = "wait",
			},
		}
	if(triggerType == EnterRoomOnFloor):
		var allFloors = GlobalRegistry.getMapFloors().keys()
		return {
			"floor": {
				name = "Floor",
				type = "selector",
				value = allFloors[0] if allFloors.size() > 0 else "",
				values = allFloors,
			},
		}
	if(triggerType in [TalkingToDynamicNPC, MeetDynamicNPC]):
		return {
			"npc": {
				name = "Npc",
				type = "selector",
				value = "",
				values = [],
				involvedDatapackNPCs = true,
			},
		}
	if(triggerType == TalkingToNPC):
		return {
			"npc": {
				name = "Npc",
				type = "selector",
				value = "alexrynard",
				values = [
					"alexrynard",
					"eliza",
					"artica",
					"rahi",
					"rahiSlavery",
					"announcer",
					"avy",
					"bulldog",
					"jacki",
					"nurse",
					"nova",
					"tavi",
					"taviSlavery",
					"kidlat",
					"kidlatShop",
				],
			},
		}
	
	return {}
