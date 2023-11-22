extends "res://Game/SexEngine/SexActivity/DomRidingSubVaginal.gd"

func _init():
	id = "DomRidingSubAnal"
	usedBodypart = BodypartSlot.Anus
	usedTag = SexActivityTag.AnusUsed
	usedTagInside = SexActivityTag.AnusPenetrated
	fetishGiving = Fetish.AnalSexGiving
	fetishReceiving = Fetish.AnalSexReceiving
	usedBodypartNames = ["anus", "tailhole", "backdoor", "star", "anal ring"]
	switchHoleActivity = "DomRidingSubVaginal"
	otherHoleNames = ["pussy"]
	otherHoleBodypart = BodypartSlot.Vagina
	otherHoleTag = SexActivityTag.VaginaUsed
	otherHoleFetishGiving = Fetish.VaginalSexGiving
	otherHoleFetishReceiving = Fetish.VaginalSexReceiving
	otherGoal = SexGoal.ReceiveVaginal
	aboutToRideReaction = SexReaction.AboutToRideAnal
	isVag = false
	
func getGoals():
	return {
		SexGoal.ReceiveAnal: 1.0,
		SexGoal.ReceiveStraponAnal: 1.0,
	}

func getVisibleName():
	return "Cowgirl Anal"

