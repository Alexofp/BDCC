extends Reference
class_name SlaveTypeBase

var id = "ERROR"

func getVisibleName():
	return "CHANGE ME"

# F- F  F+ D- D  D+ C- C  B- B  A- A  S- S  S+ S++
# 0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15
func getTrainText(_npc, _skillLevel):
	return RNG.pick([
		"You train {npc.him}.",
		"You train {npc.him} very hard.",
	])

func getFailedTrainTextGreatSuccess(_npc):
	return "{npc.name} is making great progress!"

func getFailedTrainTextSomeSuccess(_npc):
	return "{npc.name} is making some progress."

func getFailedTrainTextResist(_npc):
	return "{npc.name} actively resists any attempts to be trained. That deserves a punishment."

func getFailedTrainTextWeak(_npc):
	return "{npc.name} can barely follow your intructions, looking extremely weak and tired."

func getFailedTrainTextBad(_npc):
	return "{npc.name} is doing a poor job following your lesson."
