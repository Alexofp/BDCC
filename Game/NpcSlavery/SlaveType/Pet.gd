extends SlaveTypeBase

func _init():
	id = SlaveType.Pet

func getVisibleName():
	return "Pet"

func getTrainTexts(_npc):
	return [
		"You train {npc.him}.",
		"You train {npc.him} very hard.",
	]
