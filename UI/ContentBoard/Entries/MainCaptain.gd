extends ContentBoardEntryBase

func _init():
	id = "MainCaptain"
	
func getName() -> String:
	return "Captain Route"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Become captain's most trusted inmate and help him on his quest. This route is designed for submissive players. (Work on this route will begin after Kait's route completion)"
	return "Become captain's most trusted inmate. Designed for submissive players. (Planned)"

func getCompletedDesc() -> String:
	return "You did the impossible!"

func getStatus() -> int:
	if(GM.main.MRH.didCompleteCaptainRouteBefore() && !GM.main.hasCommittedToCaptainMainRoute()):
		return ContentBoardStatus.Completed
	#if(GM.main.hasCommittedToMainRoute() && !GM.main.hasCommittedToCaptainMainRoute()):
	#	return ContentBoardStatus.Cancelled
	return ContentBoardStatus.Unavailable

func getStartConditions() -> Array:
	return [
		[ContentBoardCondition.InProgress, "Be kind to Rahi and wait until this route is released."],
		[ContentBoardCondition.Incomplete, "Enjoy the route."],
	]

func getProgressText() -> String:
	return "Complete tasks that the captain will give you."
