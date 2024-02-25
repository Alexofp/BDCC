extends SlaveTypeBase

func _init():
	id = SlaveType.Submissive

func getVisibleName():
	return "Submissive"

func getTrainTexts(_npc):
	return [
		"You train {npc.him}.",
		"You train {npc.him} very hard.",
	]
