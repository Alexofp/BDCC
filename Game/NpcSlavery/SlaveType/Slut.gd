extends SlaveTypeBase

func _init():
	id = SlaveType.Slut

func getVisibleName():
	return "Slut"

func getTrainTexts(_npc):
	return [
		"You train {npc.him}.",
		"You train {npc.him} very hard.",
	]
