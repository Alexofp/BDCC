extends SlaveEventBase

func _init():
	id = "SubmitsOutOfLove"
	eventWeight = 1.0

func canHappen(_npcSlavery:NpcSlave):
	if(_npcSlavery.hasSubmittedToPC()):
		return false
	if(_npcSlavery.getLove() < 0.9):
		return false
	return true

func shouldHappenChance(_npcSlavery:NpcSlave):
	return 10.0 + clamp(_npcSlavery.getTrust()-0.5, 0.0, 1.0) * 100.0

func runEvent(_npcSlavery:NpcSlave):
	var theText = "{npc.name} lowers {npc.his} gaze a little when you approach, {npc.his} lips stay slightly parted as {npc.he} {npc.isAre} gathering courage."

	theText += "\n\n[say=npc]"+RNG.pick([
		"I've been.. wanting to express my feelings to you.. for a while..",
		"My heart is full, and I need to share it with you.",
		"I hope you have a minute.. I wanna say something..",
		"Can I confess something? It's about.. my feelings for you..",
		"I.. I wanna tell you something.. It's about us..",
	])+"[/say]\n\n"
	
	theText += "With a warm smile, you encourage {npc.him} to speak, sensing something warm in {npc.his} voice."
	
	theText += "\n\n[say=npc]"+RNG.pick([
		"I love you deeply, and being yours is the greatest joy.. I hope it will stay like that forever..",
		"You mean the world to me. I love you with all my heart..",
		"Thank you for being in my life. Thank you for making me yours.. I love you so much..",
		"I feel so lucky to belong to you. I love you endlessly..",
		"Being your slave is a privilege because I love you.. unconditionally..",
	])+"[/say]\n\n"
	
	theText += "You're touched by {npc.his} sincere words, you can't help but to embrace {npc.him}, and feel {npc.him} doing the same to you. Hard to believe, your slave has submitted out of love to you!"
	
	theText += "\n\nThis means that {npc.his} obedience, love and broken spirit won't decay anymore."
	
	_npcSlavery.doSubmitToPC()
	
	_npcSlavery.deservesReward(4)
	
	return {
		text = theText,
	}

func getAnimInfo(_npcSlavery:NpcSlave):
	return [StageScene.Hug, "hug", {npc=_npcSlavery.getChar().getID()}]
