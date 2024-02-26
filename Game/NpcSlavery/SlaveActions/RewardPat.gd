extends SlaveActionBase

func _init():
	id = "RewardPat"
	actionType = Reward
	#extraSlaves = {}
	#sceneID = ""

func getVisibleName():
	return "Headpats"

func getVisibleDesc():
	return "Give your slave a pat"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var character:DynamicCharacter = GlobalRegistry.getCharacter(_slaveID)
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	npcSlavery.handleReward(1)
	return {
		text = "You pat "+character.getName()+" on the head!",
	}
