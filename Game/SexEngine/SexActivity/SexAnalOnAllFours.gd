extends "res://Game/SexEngine/SexActivity/SexVaginalOnAllFours.gd"

func _init():
	id = "SexAnalOnAllFours"
	usedBodypart = BodypartSlot.Anus
	fetishGiving = Fetish.AnalSexGiving
	fetishReceiving = Fetish.AnalSexReceiving
	aboutToPenetrateReaction = SexReaction.AboutToPenetratePussy
	usedBodypartNames = ["anus", "tailhole", "backdoor", "star", "anal ring"]
	switchHoleActivity = "SexVaginalOnAllFours"
	otherHoleNames = ["pussy"]
	otherHoleBodypart = BodypartSlot.Vagina
	
func getGoals():
	return {
		SexGoal.FuckAnal: 1.0,
	}

func getVisibleName():
	return "Anal"

func getCategory():
	return ["Fuck"]

func getSubTags():
	return [SexActivityTag.AnusUsed]
