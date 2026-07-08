extends ContentBoardEntryBase

func _init():
	id = "ElizaChastity"
	
func getName() -> String:
	return "Obedience Training"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Go through an experimental obedience training program created by Eliza Quinn. It's available only for inmates who posses the primary male reproductive organ, a penis. This little storyline is focused around chastity, anal sex and submission."
	return "Go through an obedience training program created by Eliza Quinn, focused all around male chastity"

func getKinks() -> Array:
	return [
		"Forced submission (pc is sub)",
		"Chastity cages",
		"Anal sex/Pegging (pc is bottom)",
		"Cum eating",
		"Permanent chastity (optional)",
	]

func getCompletedDesc() -> String:
	if(getFlag("MedicalModule.Chastity_Event5LockedForever", false)):
		return "You went through the whole program and even agreed to be locked forever!"
	if(getFlag("MedicalModule.Chastity_Event5BredEliza", false)):
		return "You went through the whole program and decided to decline eternal chastity and breed Eliza at the end!"
	return "You went through the whole program!"

func getStatus() -> int:
	if(getFlag("MedicalModule.Chastity_EventNumber", 0) >= 7):
		return ContentBoardStatus.Completed
	if(getFlag("MedicalModule.Chastity_EventNumber", 0) > 0 && !GM.pc.hasPenis()):
		return ContentBoardStatus.Cancelled
	if(getFlag("MedicalModule.Chastity_EventNumber", 0) > 0):
		return ContentBoardStatus.InProgress
	if(!GM.pc.hasPenis()):
		return ContentBoardStatus.Impossible
	return ContentBoardStatus.ConditionsNotMet

func getStartConditions() -> Array:
	var ppCond:int = ContentBoardCondition.Incomplete
	if(GM.pc.hasPenis()):
		ppCond = ContentBoardCondition.Complete
	else:
		ppCond = ContentBoardCondition.Impossible
	
	return [
		[ppCond, "Have a penis."],
		[completeIf("MedicalModule.PC_ReceivedPermanentCage"), "Find Eliza in the medbay and enroll into her obedience training program."],
		[completeIfBool(getFlag("MedicalModule.Chastity_EventNumber", 0) > 0), "Sleep in your cell while wearing chastity. Scenes happen every 5 days."],
	]

func getProgressText() -> String:
	return "Keep sleeping in your cell while wearing a chastity cage. New scenes happen every 5 days."
