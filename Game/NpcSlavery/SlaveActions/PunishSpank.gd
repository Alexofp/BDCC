extends SlaveActionBase

func _init():
	id = "PunishSpank"
	actionType = Punishment
	#extraSlaves = {}
	#sceneID = "MeScene"
	#endsTalkScene = true
	slaveResistChanceMult = 0.6
	
	buttonPriority = 80
	rewardHint = -2

func getVisibleName():
	return "Spank"

func getVisibleDesc():
	return "Give your slave a good spank"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var character:DynamicCharacter = GlobalRegistry.getCharacter(_slaveID)
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	npcSlavery.handlePunishment(2)
	return {
		text = "You spank "+character.getName()+"'s butt!",
	}

func getAnimationInfo(_slaveID, _extraSlavesIDs = {}):
	return [StageScene.Spanking, "spankonce", {pc="pc", npc=_slaveID}]
