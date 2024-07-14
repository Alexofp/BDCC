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
	elif(triggerType == DatapackSceneTriggerType.EnterRoom):
		es.addDatapackTrigger(self, Trigger.EnteringRoom, datapackSceneTrigger.getSetting("room"))
	elif(triggerType == DatapackSceneTriggerType.SceneAndStateHook):
		es.addDatapackTrigger(self, Trigger.SceneAndStateHook, [datapackSceneTrigger.getSetting("scene"), datapackSceneTrigger.getSetting("state")])
	else:
		es.addDatapackTrigger(self, triggerType)

func react(_triggerID, _args):
	var result = triggerCodeContext.react(_triggerID, _args)
	
	if(result):
		runScene("DatapackScene", [datapack.id, datapackScene.id])
	
	return result
	
func run(_triggerID, _args):
	triggerCodeContext.run(_triggerID, _args)

func getPriority():
	return datapackSceneTrigger.priority

func onButton(_method, _args):
	if(triggerCodeContext.onButton(_method, _args)):
		runScene("DatapackScene", [datapack.id, datapackScene.id])
