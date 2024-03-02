extends SlaveActionBase

func _init():
	id = "RewardPat"
	actionType = Reward
	#extraSlaves = {}
	#sceneID = ""
	slaveResistChanceMult = 0.4
	
	buttonPriority = 80
	rewardHint = 2

func getVisibleName():
	return "Headpats"

func getVisibleDesc():
	return "Give your slave a pat"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var character:DynamicCharacter = GlobalRegistry.getCharacter(_slaveID)
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	npcSlavery.handleReward(2)
	return {
		text = "You pat "+character.getName()+" on the head!",
	}
