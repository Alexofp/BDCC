extends QuestBase
class_name MissionQuestProxy

var mission:MissionBase

func getVisibleName():
	return mission.getName()

func getProgress():
	return mission.getObjectives()

func isVisible():
	return GM.main.MS.isDoingMission(mission.id) || GM.main.MS.isCompleted(mission.id)

func isCompleted():
	return GM.main.MS.isCompleted(mission.id)

func isMainQuest():
	return true

func getPriority():
	return 0
