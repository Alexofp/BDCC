extends SlaveActionBase

func _init():
	id = "RewardBestReward"
	actionType = Reward
	#extraSlaves = {}
	#sceneID = ""
	slaveResistChanceMult = 0.3

func getVisibleName():
	return "Best reward"

func getVisibleDesc():
	return "I dunno what to put here"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var character:DynamicCharacter = GlobalRegistry.getCharacter(_slaveID)
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	npcSlavery.handleReward(4)
	return {
		text = "You give {npc.name} the best reward possible.",
	}
