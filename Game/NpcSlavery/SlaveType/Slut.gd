extends SlaveTypeBase

func _init():
	id = SlaveType.Slut

func getVisibleName():
	return "Slut"

# F- F  F+ D- D  D+ C- C  B- B  A- A  S- S  S+ S++
# 0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15
func getTrainText(_npc, _skillLevel):
	return RNG.pick([
		"You train {npc.him}.",
		"You train {npc.him} very hard.",
	])
