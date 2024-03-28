extends SlaveActionBase

func _init():
	id = "PunishWoodenHorse"
	actionType = Punishment
	#extraSlaves = {}
	#sceneID = "MeScene"
	#endsTalkScene = true
	slaveResistChanceMult = 1.0
	slaveOnlyActiveResist = true
	
	buttonPriority = 60
	rewardHint = -4

func getVisibleName():
	return "Wooden horse"

func getVisibleDesc():
	return "Torture your slave using a wooden horse"

func checkCanDo(_slaveID, _extraSlavesIDs = {}):
	if(!getFlag("NpcSlaveryModule.hasWoodenHorse", false)):
		return [false, "You need to install a wooden horse in your cell first"]
	
	return [true]

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var character:DynamicCharacter = GlobalRegistry.getCharacter(_slaveID)
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	var text = "Feeling very mean, you throw {npc.name} onto the wooden horse, making {npc.him} straddle its sharp metal edge that instantly digs into {npc.his} crotch with painful levels of discomfort!\n\n"
	
	if(npcSlavery.isActivelyResisting()):
		text += "{npc.HeShe} struggles against the restraints, but the firm bindings hold {npc.him} in place, forcing {npc.him} to endure the punishment."
	else:
		text += "Despite the discomfort, {npc.heShe} accepts the position willingly and just endures the punishment for as long as {npc.he} can."

	if(character.hasReachableVagina()):
		text += " After about an hour of pure torture, your slave is grunting painfully, {npc.his} {pussy} looking extremely bruised!"
	elif(character.hasPenis()):
		text += " After about an hour of pure torture, your slave is grunting painfully, {npc.his} balls and cock looking extremely bruised!"
	else:
		text += " After about an hour of pure torture, your slave is grunting painfully, {npc.his} crotch looking extremely bruised!"
		
	npcSlavery.handlePunishment(4)
	npcSlavery.addTired(1)
	return {
		text = text,
	}

func getAnimationInfo(_slaveID, _extraSlavesIDs = {}):
	return [StageScene.WoodenHorseSolo, "struggle", {pc=_slaveID, bodyState={naked=true,hard=true}}]

func getTimePass(_slaveID, _extraSlavesIDs = {}):
	return 60*50
