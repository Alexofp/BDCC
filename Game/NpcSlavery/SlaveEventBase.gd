extends Reference
class_name SlaveEventBase

var id = "error"
var eventWeight = 1.0 # Relative weight that helps decide what event is chosen when 2+ events want to happen at the same time
var sceneID = ""
var supportedActivities = [""]
var canHappenIfMindbroken = false

func canHappen(_npcSlavery:NpcSlave):
	return false

func shouldHappenChance(_npcSlavery:NpcSlave):
	return 0.0

func shouldHappen(_npcSlavery:NpcSlave):
	return RNG.chance(shouldHappenChance(_npcSlavery))

func shouldHappenFinal(_npcSlavery:NpcSlave):
	if(!canHappenIfMindbroken && _npcSlavery.isMindBroken()):
		return false
	return canHappen(_npcSlavery) && shouldHappen(_npcSlavery)

func runEvent(_npcSlavery:NpcSlave):
	return {
		text = "AN EVENT HAPPENED!",
	}

func reactSceneEnd(_npcSlavery:NpcSlave, _sceneResult):
	return

func onEventSkipped(_npcSlavery:NpcSlave):
	return

func getEventWeight():
	return eventWeight

func supportsActivity(theActivityID):
	return theActivityID in supportedActivities

func getAnimInfo(_npcSlavery:NpcSlave):
	return null

func getCooldown(_npcSlavery:NpcSlave):
	return 0
