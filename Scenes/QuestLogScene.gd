extends "res://Scenes/SceneBase.gd"

class MyQuestSorter:
	static func sort_descending(a, b):
		if a.getPriority() > b.getPriority():
			return true
		return false

func _init():
	sceneID = "QuestLogScene"

func _run():
	if(state == ""):
		var quests = GM.QS.getAllQuests()
		
		var mainQuests = []
		var sideQuests = []
		var completedQuests = []
		
		for questID in quests:
			var quest:QuestBase = quests[questID]
			if(!quest.isVisible()):
				continue
			
			if(quest.isCompleted()):
				completedQuests.append(quest)
				continue
			
			if(quest.isMainQuest()):
				mainQuests.append(quest)
			else:
				sideQuests.append(quest)
		
		mainQuests.sort_custom(MyQuestSorter, "sort_descending")
		sideQuests.sort_custom(MyQuestSorter, "sort_descending")
		completedQuests.sort_custom(MyQuestSorter, "sort_descending")
		
		var showedNpcOwnerThing:bool = false
		for ownerID in GM.main.RS.special:
			var theSpecialRelationship = GM.main.RS.special[ownerID]
			if(theSpecialRelationship.id == "SoftSlavery" && theSpecialRelationship.npcOwner):
				var theNpcOwner:NpcOwnerBase = theSpecialRelationship.npcOwner
				if(theNpcOwner.hasTasks && !theNpcOwner.tasks.empty()):
					if(!showedNpcOwnerThing):
						saynn("[i]Owner tasks:[/i]")
						showedNpcOwnerThing = true
					
					var theOwner = getCharacter(ownerID)
					if(!theOwner):
						continue
					sayn("[b]"+theOwner.getName()+" tasks:[/b]")
					var theTaskLines := theNpcOwner.getQuestProgressArray()
					for textLine in theTaskLines:
						sayn("* "+textLine)
					sayn("")
		
		saynn("[i]Main tasks:[/i]")
		
		if(mainQuests.size() == 0):
			saynn("Nothing")
		
		for quest in mainQuests:
			sayn("[b]"+quest.getVisibleName()+"[/b]")
			var progress = quest.getProgress()
			progress.invert()
			for line in progress:
				sayn("* "+line)
			sayn("")
			
		saynn("[i]Side tasks:[/i]")
		
		if(sideQuests.size() == 0):
			saynn("Nothing")
		
		for quest in sideQuests:
			sayn("[b]"+quest.getVisibleName()+"[/b]")
			var progress = quest.getProgress()
			progress.invert()
			for line in progress:
				sayn("* "+line)
			sayn("")
			
		saynn("[i]Completed tasks:[/i]")
		
		if(completedQuests.size() == 0):
			saynn("Nothing")
		
		for quest in completedQuests:
			sayn("[b]"+quest.getVisibleName()+"[/b] (Completed)")
			var progress = quest.getProgress()
			progress.invert()
			for line in progress:
				sayn("* "+line)
			sayn("")
		
		addButton("Close", "Close the quest log", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

func _react_scene_end(_tag, _result):
	setState("")

func supportsShowingPawns() -> bool:
	return true
