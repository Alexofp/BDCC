extends SlaveActionBase

func _init():
	id = "PunishTorture"
	actionType = Punishment
	#extraSlaves = {}
	#sceneID = "MeScene"
	#endsTalkScene = true
	slaveResistChanceMult = 1.0

func getVisibleName():
	return "Torture"

func getVisibleDesc():
	return "Torture your slave"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var character:DynamicCharacter = GlobalRegistry.getCharacter(_slaveID)
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	npcSlavery.handlePunishment(4)
	npcSlavery.addTired(1)
	return {
		text = "You torture {npc.name}!",
	}
