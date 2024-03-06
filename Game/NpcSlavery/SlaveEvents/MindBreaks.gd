extends SlaveEventBase

func _init():
	id = "MindBreaks"
	eventWeight = 1.0

func canHappen(_npcSlavery:NpcSlave):
	if(_npcSlavery.isMindBroken()):
		return false
	if(_npcSlavery.getDespair() < 0.95): # Treat your slave well, yo
		return false
	return true

func shouldHappenChance(_npcSlavery:NpcSlave):
	return 33.3

func runEvent(_npcSlavery:NpcSlave):
	var theText = "Something is wrong about {npc.name}. Something is very wrong.."
	
	theText += "\n\nThe more you look into {npc.his} eyes, the more empty they seem.. There is nothing there, no anger, no joy.. there is no life.."
	
	theText += "\n\nAs you grab and move {npc.his} hand, {npc.he} just lets you pose it, in any way you want. Like a doll.."
	
	theText += "\n\nSeems, whatever torture you made {npc.him} go through, it was a little too much for the poor {npc.boy}. You broke {npc.him}."

	_npcSlavery.doMindBreak()
	
	return {
		text = theText,
	}

func getAnimInfo(_npcSlavery:NpcSlave):
	return [StageScene.Duo, "stand", {npc=_npcSlavery.getChar().getID(), npcAction="stand"}]
