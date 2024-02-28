extends SlaveActionBase

func _init():
	id = "RewardMassage"
	actionType = Reward
	#extraSlaves = {}
	#sceneID = ""
	slaveResistChanceMult = 1.0

func getVisibleName():
	return "Massage"

func getVisibleDesc():
	return "Give your slave a massage as a reward"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var character:DynamicCharacter = GlobalRegistry.getCharacter(_slaveID)
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	npcSlavery.handleReward(3)
	if(RNG.chance(50)):
		npcSlavery.addTired(-1)
	return {
		text = "You give {npc.name} a sensual massage.",
	}
