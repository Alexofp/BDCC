extends "res://Game/SexEngine/SexActivity/ThreeDDS_SpitroastVag.gd"

func _init():
	id = "ThreeDDS_SpitroastAnal"
	
	usedBodypart = S_ANUS
	usedFetish = Fetish.AnalSexGiving
	
	activityName = "Spitroast (anal)"
	activityDesc = "Fuck the sub's ass and mouth with the other dom at the same time"
	activityCategory = ["Fuck", "Threesome"]

func getGoals():
	return {
		SexGoal.FuckAnal: 1.0,
		SexGoal.StraponAnal: 1.0,
	}
