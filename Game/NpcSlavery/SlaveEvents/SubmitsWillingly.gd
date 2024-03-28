extends SlaveEventBase

func _init():
	id = "SubmitsWillingly"
	eventWeight = 1.0

func canHappen(_npcSlavery:NpcSlave):
	if(_npcSlavery.hasSubmittedToPC()):
		return false
	if(_npcSlavery.getObedience() < 0.9):
		return false
	return true

func shouldHappenChance(_npcSlavery:NpcSlave):
	return 10.0 + clamp(_npcSlavery.getAwareness()-0.5, 0.0, 1.0) * 100.0

func runEvent(_npcSlavery:NpcSlave):
	var theText = "{npc.name} lowers {npc.his} gaze when you approach {npc.him}. {npc.His} lips are trembling, {npc.he} clearly wants to say something."

	theText += "\n\n[say=npc]"+RNG.pick([
		"I.. I wanna tell you something.",
		"I think it's time..",
		"I hope you have a minute.. I wanna say something..",
		"May I tell you something..",
		"Have a minute?.. I gotta say something..",
	])+"[/say]\n\n"
	
	theText += "Very interesting, you nod.. and watch your slave slowly get on {npc.his} knees before you, {npc.his} gaze still directed down."
	
	theText += "\n\n[say=npc]"+RNG.pick([
		"Thank you for training me.. And making me yours.. I'm happy to be your slave.. forever..",
		"I'm glad I belong to you.. Thank you for training me, I will try to obey as best as I can..",
		"I'm yours.. Forever and ever. Thank you for training me.. I will do my best as your slave..",
	])+"[/say]\n\n"
	
	theText += "You can't help but to smile, your slave has just willingly submitted to you! {npc.He} slowly looks up, {npc.his} gaze radiating obedience. You give {npc.him} a good headpat and feel {npc.him} nuzzling your hand."
	
	theText += "\n\nThis means that {npc.his} obedience, love and broken spirit won't decay anymore."
	
	_npcSlavery.doSubmitToPC()
	
	_npcSlavery.deservesReward(4)
	
	return {
		text = theText,
	}

func getAnimInfo(_npcSlavery:NpcSlave):
	return [StageScene.Duo, "stand", {npc=_npcSlavery.getChar().getID(), npcAction="kneel"}]
