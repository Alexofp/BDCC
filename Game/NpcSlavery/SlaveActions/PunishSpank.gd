extends SlaveActionBase

func _init():
	id = "PunishSpank"
	actionType = Punishment
	#extraSlaves = {}
	#sceneID = "MeScene"
	#endsTalkScene = true

func getVisibleName():
	return "Spank"

func getVisibleDesc():
	return "Give your slave a light spank"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var character:DynamicCharacter = GlobalRegistry.getCharacter(_slaveID)
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	npcSlavery.handlePunishment(1)
	return {
		text = "You spank "+character.getName()+"'s butt!",
	}
