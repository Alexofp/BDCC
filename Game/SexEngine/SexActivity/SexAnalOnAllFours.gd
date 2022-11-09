extends "res://Game/SexEngine/SexActivity/SexVaginalOnAllFours.gd"

func _init():
	id = "SexAnalOnAllFours"
	usedBodypart = BodypartSlot.Anus
	usedTag = SexActivityTag.AnusUsed
	usedTagInside = SexActivityTag.AnusPenetrated
	fetishGiving = Fetish.AnalSexGiving
	fetishReceiving = Fetish.AnalSexReceiving
	aboutToPenetrateReaction = SexReaction.AboutToPenetratePussy
	usedBodypartNames = ["anus", "tailhole", "backdoor", "star", "anal ring"]
	switchHoleActivity = "SexVaginalOnAllFours"
	otherHoleNames = ["pussy"]
	otherHoleBodypart = BodypartSlot.Vagina
	otherHoleTag = SexActivityTag.VaginaUsed
	otherHoleFetishGiving = Fetish.VaginalSexGiving
	otherHoleFetishReceiving = Fetish.VaginalSexReceiving
	
func getGoals():
	return {
		SexGoal.FuckAnal: 1.0,
	}

func getVisibleName():
	return "Anal"

