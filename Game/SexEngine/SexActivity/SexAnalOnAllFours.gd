extends "res://Game/SexEngine/SexActivity/SexVaginalOnAllFours.gd"

func _init():
	id = "SexAnalOnAllFours"
	usedBodypart = BodypartSlot.Anus
	usedTag = SexActivityTag.AnusUsed
	usedTagInside = SexActivityTag.AnusPenetrated
	fetishGiving = Fetish.AnalSexGiving
	fetishReceiving = Fetish.AnalSexReceiving
	usedBodypartNames = ["anus", "tailhole", "backdoor", "star", "anal ring"]
	switchHoleActivity = "SexVaginalOnAllFours"
	otherHoleNames = ["pussy"]
	otherHoleBodypart = BodypartSlot.Vagina
	otherHoleTag = SexActivityTag.VaginaUsed
	otherHoleFetishGiving = Fetish.VaginalSexGiving
	otherHoleFetishReceiving = Fetish.VaginalSexReceiving
	otherGoal = SexGoal.FuckVaginal
	aboutToPenetrateReaction = SexReaction.AboutToPenetrateAnal
	sexReactionPullOut = SexReaction.BeggingToPullOutAnal
	
func getGoals():
	if(currentPose == POSE_CHOKEFUCK):
		return {
			SexGoal.ChokeSexAnal: 1.0,
			SexGoal.FuckAnal: 1.0,
			SexGoal.StraponAnal: 1.0,
		}
	return {
		SexGoal.FuckAnal: 1.0,
		SexGoal.StraponAnal: 1.0,
	}

func getVisibleName():
	return "Anal"

