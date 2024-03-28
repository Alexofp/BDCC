extends SlaveEventBase

func _init():
	id = "SubmitsOutOfNeediness"
	eventWeight = 1.0

func canHappen(_npcSlavery:NpcSlave):
	if(_npcSlavery.hasSubmittedToPC()):
		return false
	if(_npcSlavery.getNeediness() < 80.0):
		return false
	return true

func shouldHappenChance(_npcSlavery:NpcSlave):
	return 10.0 + clamp(_npcSlavery.getLove(), 0.0, 1.0) * 100.0

func runEvent(_npcSlavery:NpcSlave):
	var theText = "{npc.name} is shaking when you approach {npc.him}. {npc.His} lips are trembling, {npc.he} clearly wants to say something."

	theText += "\n\n[say=npc]"+RNG.pick([
		"I can't.. I fucking can't anymore.. I give up.. You win..",
	])+"[/say]\n\n"
	
	theText += "Very interesting.. you watch your slave slowly get on {npc.his} knees before you, {npc.his} eyes show an extreme amount of lust."
	
	theText += "\n\n[say=npc]"+RNG.pick([
		"PLEASE! FUCK ME! LET ME CUM! I WILL DO ANYTHING! LITERALLY ANYTHING.. I just want to cum.. I will be your bitch.. I will do anything.. Anything for you.. Ple-e-ease.. Please fuck me.. please..",
	])+"[/say]\n\n"
	
	theText += "You can't help but to smile, your slave has just submitted to you! Who knew that keeping someone horny for so long can lead to such a good result."
	
	theText += "\n\nThis means that {npc.his} obedience, love and broken spirit won't decay anymore."
	
	_npcSlavery.doSubmitToPC()
	
	_npcSlavery.deservesReward(4)
	
	return {
		text = theText,
	}

func getAnimInfo(_npcSlavery:NpcSlave):
	return [StageScene.Duo, "stand", {npc=_npcSlavery.getChar().getID(), npcAction="kneel"}]
