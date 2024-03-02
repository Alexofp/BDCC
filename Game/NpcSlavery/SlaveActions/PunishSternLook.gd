extends SlaveActionBase

func _init():
	id = "PunishSternLook"
	actionType = Punishment
	#extraSlaves = {}
	#sceneID = "MeScene"
	#endsTalkScene = true
	slaveResistChanceMult = 0.2
	
	buttonPriority = 90
	rewardHint = -1

func getVisibleName():
	return "Stern look"

func getVisibleDesc():
	return "Give your slave a stern look"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var character:DynamicCharacter = GlobalRegistry.getCharacter(_slaveID)
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	if(character.isBlindfolded()):
		return {
			text = "You give {npc.name} a stern look. It didn't have much effect because {npc.he} {npc.isAre} blindfolded..",
		}
	
	npcSlavery.handlePunishment(1)
	return {
		text = "You give {npc.name} a stern look.",
	}
