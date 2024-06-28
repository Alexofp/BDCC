extends SlaveActionBase

func _init():
	id = "RewardSybian"
	actionType = Reward
	#extraSlaves = {}
	#sceneID = ""
	slaveResistChanceMult = 1.0
	slaveOnlyActiveResist = true

	buttonPriority = 60
	rewardHint = 4

func getVisibleName():
	return "Sybian"

func getVisibleDesc():
	return "Let your slave experience a powerful orgasm by making them sit on a sybian"

func checkCanDo(_slaveID, _extraSlavesIDs = {}):
	if(!getFlag("NpcSlaveryModule.hasSybian", false)):
		return [false, "You need to install a sybian in your cell first"]
	
	return [true]

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var character:DynamicCharacter = GlobalRegistry.getCharacter(_slaveID)
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	var text = "You lead {npc.name} to the sybian machine and secure {npc.him} to it before turning the machine on to its maximum vibration setting, a reward for {npc.his} great efforts.\n\n"
	
	if(npcSlavery.getDespair() > 0.8):
		text += "Even though the vibrations are extremely powerful, {npc.heShe} exhibits a passive response, showing no enthusiasm for the experience."
	elif(npcSlavery.getSpoiling() > 0.7):
		text += "But even that setting doesn't seem to be enough, your slave demanding even more pleasure."
	elif(npcSlavery.isResistingSuperActively()):
		text += "With a visible struggle, {npc.heShe} attempts to dismount the sybian. But you are quick to put {npc.him} back, {npc.his} crotch pressed snuggly against the vibrating elements."
	elif(npcSlavery.isActivelyResisting()):
		text += "Tension builds in {npc.his} body as the sybian activates. Though reluctant at first, {npc.heShe} succumbs to the overwhelming sensations, the undeniable pleasure overtakes {npc.his} resistance."
	#elif(npcSlavery.rewardBalance <= 0):
	#	text += ""
	elif(npcSlavery.getObedience() > 0.5 || npcSlavery.getLove() > 0.5 || npcSlavery.getBrokenSpirit() > 0.5):
		text += "{npc.HeShe} eagerly complies, settling onto the sybian with anticipation. A shiver of excitement courses through {npc.his} body as the device comes to life. {npc.HeShe} moans passionately, {npc.his} crotch pressed firmly against the vibrating elements."
	else:
		text += "{npc.His} eyes flicker with uncertainty, but as the vibrations begin, {npc.heShe} succumbs to the overwhelming sensations. Though reluctant at first, the undeniable pleasure overtakes {npc.his} resistance."
	
	if(character.hasReachableVagina()):
		text += " Soon, {npc.his} body experiences a powerful orgasm, {npc.his} {pussy} releasing a shower of transparent fluids."
	elif(character.isWearingChastityCage()):
		text += " Soon, {npc.his} body experiences a powerful orgasm, {npc.his} locked away {penis} shooting a few weak spurts of {npc.cum} through the small hole of the chastity cage."
	elif(character.hasReachablePenis()):
		text += " Soon, {npc.his} body experiences a powerful orgasm, {npc.his} {npc.penis} throbbing and shooting long strings of {npc.cum}."
	else:
		text += " Soon, {npc.his} body experiences a powerful orgasm, squirming and shivering a lot."
	
	character.orgasmFrom("pc")
	npcSlavery.handleReward(4)
	return {
		text = text,
	}

func getAnimationInfo(_slaveID, _extraSlavesIDs = {}):
	var npcSlavery:NpcSlave = getSlave(_slaveID)
	if(npcSlavery.isActivelyResisting() || npcSlavery.isResistingSuperActively()):
		return [StageScene.SybianOral, "hold", {npc="pc", pc=_slaveID, pcCum=true, bodyState={naked=true,hard=true,leashedBy="pc"}}]
	return [StageScene.SybianOral, "intense", {npc="pc", pc=_slaveID, pcCum=true, bodyState={naked=true,hard=true,leashedBy="pc"}}]

func getTimePass(_slaveID, _extraSlavesIDs = {}):
	return 60*30
