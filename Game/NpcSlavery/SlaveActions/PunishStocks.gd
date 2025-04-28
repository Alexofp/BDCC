extends SlaveActionBase

func _init():
	id = "PunishStocks"
	actionType = Punishment
	#extraSlaves = {}
	#sceneID = "MeScene"
	#endsTalkScene = true
	slaveResistChanceMult = 1.0
	slaveOnlyActiveResist = true
	
	buttonPriority = 70
	rewardHint = -3

func getVisibleName():
	return "Stocks"

func getVisibleDesc():
	return "Put your slave into the stocks and see how they like it"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var npcSlavery:NpcSlave = getSlave(_slaveID)
	
	var text = "Eager to punish, you leash {npc.name} and bring {npc.him} to the main punishment platform. You find a free set of stocks and then throw your slave into them, amplying force if needed."
	
	text += "\n\nYou make sure {npc.his} head and arms are secured properly and just let {npc.him} 'enjoy' being forced into such a vulnerable exposed position for about half an hour.\n\n"
	
	if(npcSlavery.getSpoiling() > 0.7):
		text += "Your slave is not happy about this one bit, {npc.he} glares at you with {npc.his} spoiled eyes, clearly expecting you to free {npc.him} this very second. Luckily, you don't have to obey."
	
	elif(npcSlavery.isActivelyResisting()):
		text += "Your slave is obviously not happy about any of it, {npc.he} actively tries to struggle out of the metal stocks but they prove to be sturdy enough, only leaving {npc.him} exhausted."
	elif(npcSlavery.getFear() > 0.6 && npcSlavery.personalityScore({PersonalityStat.Coward: 1.0}) > 0.1):
		text += "Your slave was quite scared before but {npc.he} {npc.isAre} practically shaking, the embarrassment of the position coupled with not being able to look behind makes {npc.him} quite.. obedient."
		npcSlavery.addObedience(0.05)
	elif(npcSlavery.rewardBalance >= 0):
		text += "Hints of confusion and frustration are visible on your slave's face as you subject {npc.him} to this unfair punishment."
	else:
		text += "Your slave complies even if the device brings {npc.him} quite a high level of discomfort. But that's what the punishments are for."
	
	npcSlavery.handlePunishment(3)
	npcSlavery.addTired(0.5)
	return {
		text = text,
	}

func getAnimationInfo(_slaveID, _extraSlavesIDs = {}):
	return [StageScene.StocksSexOral, "tease", {npc="pc", pc=_slaveID}]

func getActionLocation(_slaveID, _extraSlavesIDs = {}):
	return "main_punishment_spot"

func getTimePass(_slaveID, _extraSlavesIDs = {}):
	return 60*30

func getExtraActions(_slaveID, _extraSlavesIDs = {}):
	return [
		{
			name = "Keep in stocks",
			desc = "Keep your slave in the stocks",
			sceneID = "PunishSlaveryLeaveInStocks",
			args = [],
			buttonChecks = [],
		}
	]
