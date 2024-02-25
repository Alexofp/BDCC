extends Reference
class_name SlaveTypeBase

var id = "ERROR"

func getVisibleName():
	return "CHANGE ME"

func getTrainTexts(_npc):
	return [
		"You train {npc.him}.",
		"You train {npc.him} very hard.",
	]

func getFailedTrainTextsGreatSuccess(_npc):
	return [
		"{npc.name} is making great progress.",
	]

func getFailedTrainTextsSomeSuccess(_npc):
	return [
		"{npc.name} is making some progress.",
	]

func getFailedTrainTextsResist(_npc):
	return [
		"{npc.name} actively resists any attempts to be trained.",
	]

func getFailedTrainTextsWeak(_npc):
	return [
		"{npc.name} barely follows your intructions, looking extremely weak.",
	]
