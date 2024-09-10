extends EventBase

var datapack
var datapackScene
var datapackSceneTrigger
var triggerCodeContext:DatapackTriggerCodeContext = DatapackTriggerCodeContext.new()

func setDatapackData(theDatapack, theScene, theTrigger):
	datapack = theDatapack
	datapackScene = theScene
	datapackSceneTrigger = theTrigger
	
	triggerCodeContext.setDatapack(datapack)
	triggerCodeContext.setDatapackScene(datapackScene)
	triggerCodeContext.setSceneTrigger(datapackSceneTrigger)
	triggerCodeContext.setEvent(self)

func registerTriggers(es):
	var triggerType = datapackSceneTrigger.triggerType
	
	if(triggerType == DatapackSceneTriggerType.EnterPlayerCell):
		es.addDatapackTrigger(self, Trigger.EnteringPlayerCell)
	elif(triggerType == DatapackSceneTriggerType.EnterAnyRoom):
		es.addDatapackTrigger(self, Trigger.EnteringRoom)
	elif(triggerType == DatapackSceneTriggerType.EnterRoomOnFloor):
		es.addDatapackTrigger(self, Trigger.EnteringRoom)
	elif(triggerType == DatapackSceneTriggerType.EnterRoom):
		es.addDatapackTrigger(self, Trigger.EnteringRoom, datapackSceneTrigger.getSetting("room"))
	elif(triggerType == DatapackSceneTriggerType.TalkingToNPC):
		es.addDatapackTrigger(self, Trigger.TalkingToNPC, datapackSceneTrigger.getSetting("npc"))
	elif(triggerType == DatapackSceneTriggerType.SceneAndStateHook):
		es.addDatapackTrigger(self, Trigger.SceneAndStateHook, [datapackSceneTrigger.getSetting("scene"), datapackSceneTrigger.getSetting("state")])
	else:
		es.addDatapackTrigger(self, triggerType)

func react(_triggerID, _args):
	if(!customTriggerCheck(_triggerID, _args)):
		return false
	var result = triggerCodeContext.react(_triggerID, _args)
	
	if(result):
		runScene(datapack.id+":"+datapackScene.id)
	
	return result
	
func run(_triggerID, _args):
	if(!customTriggerCheck(_triggerID, _args)):
		return
	triggerCodeContext.run(_triggerID, _args)

func getPriority():
	return datapackSceneTrigger.priority

func onButton(_method, _args):
	if(triggerCodeContext.onButton(_method, _args)):
		runScene(datapack.id+":"+datapackScene.id)

func customTriggerCheck(_triggerID, _args):
	var triggerType = datapackSceneTrigger.triggerType
	
	if(triggerType == DatapackSceneTriggerType.EnterRoomOnFloor):
		var room = GM.world.getRoomByID(GM.pc.getLocation())
		var roomFloor = room.getCachedFloorID()
		if(datapackSceneTrigger.getSetting("floor") != roomFloor):
			return false
	elif(triggerType in [DatapackSceneTriggerType.TalkingToDynamicNPC, DatapackSceneTriggerType.MeetDynamicNPC]):
		var npcID = datapackSceneTrigger.getSetting("npc")
		
		if(_args[0] != npcID):
			return false
	
	return true
