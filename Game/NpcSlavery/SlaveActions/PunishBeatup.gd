extends SlaveActionBase

func _init():
	id = "PunishBeatup"
	actionType = Punishment
	#extraSlaves = {}
	#sceneID = "MeScene"
	#endsTalkScene = true
	slaveResistChanceMult = 1.0
	
	buttonPriority = 70
	rewardHint = -3

func getVisibleName():
	return "Beat up"

func getVisibleDesc():
	return "Give your slave a good beating"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var character:DynamicCharacter = GlobalRegistry.getCharacter(_slaveID)
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	npcSlavery.handlePunishment(3)
	if(RNG.chance(50)):
		npcSlavery.addTired(1)
	return {
		text = "You beat {npc.name} up!",
	}

func getAnimationInfo(_slaveID, _extraSlavesIDs = {}):
	return [StageScene.Duo, "punch", {pc="pc", npc=_slaveID, npcAction="hurt"}]
