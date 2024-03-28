extends SlaveEventBase

func _init():
	id = "SubmitsUnwillingly"
	eventWeight = 1.0

func canHappen(_npcSlavery:NpcSlave):
	if(_npcSlavery.hasSubmittedToPC()):
		return false
	if(_npcSlavery.getBrokenSpirit() < 0.9):
		return false
	return true

func shouldHappenChance(_npcSlavery:NpcSlave):
	return 10.0 + min(0.5, _npcSlavery.getDespair()) * 100.0

func runEvent(_npcSlavery:NpcSlave):
	var theText = "Something is different about {npc.name}. As soon as you approach {npc.him}, {npc.he} starts shaking."

	theText += "\n\n[say=npc]"+RNG.pick([
		"I can't.. Fuck it..",
		"Alright.. You won, okay?",
		"Listen, you..",
		"I can't..",
		"You can stop.. you won.",
		"I give up..",
		"I.. I can't anymore.. I give up..",
		"You forced me..",
		"I hate you.. But..",
	])+"[/say]\n\n"
	
	theText += "After that, {npc.he} drops to {npc.his} knees before you, {npc.his} eyes full of desperation."
	
	theText += "\n\n[say=npc]"+RNG.pick([
		"I.. submit.",
		"I'm yours now, okay? I'm tired of.. all of this..",
		"I submit.. I will do anything you say..",
		"I will do anything.. I submit..",
	])+"[/say]\n\n"
	
	theText += "You can't help but to smile, looks like you broke your slave enough for {npc.him} to finally submit to you."
	
	theText += "\n\nThis means that {npc.his} obedience, love and broken spirit won't decay anymore."
	
	_npcSlavery.doSubmitToPC()
	
	_npcSlavery.deservesReward(3)
	
	return {
		text = theText,
	}

func getAnimInfo(_npcSlavery:NpcSlave):
	return [StageScene.Duo, "stand", {npc=_npcSlavery.getChar().getID(), npcAction="kneel"}]
