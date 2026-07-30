extends ContentBoardEntryBase

func _init():
	id = "Socket"
	
func getName() -> String:
	return "Socket"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Meet a kind, easy-going fennec engineer with a very interesting outfit. Help her with her tasks all around the prison. Resist the temptations of doing lewd stuff with her out in the public.. or don't."
	return "Meet a kind fennec engineer with an interesting outfit. Help her with her tasks all around the prison."

func getKinks() -> Array:
	return [
		"Player is dominant",
		"Public sex",
		"Public use",
		"Free use",
		"Stealth sex",
		"Exhibitionism",
		"Hypnosis",
	]

func getCompletedDesc() -> String:
	if(getFlag("SocketModule.removedWombImplant", false)):
		return "You helped Socket with all her tasks! You even removed her womb implant!"
	return "You helped Socket with all her tasks!"

func getStatus() -> int:
	if(getFlag("SocketModule.h5completed", false)):
		return ContentBoardStatus.Completed
	if(getFlag("SocketModule.socketIntroduced", false)):
		return ContentBoardStatus.InProgress
	return ContentBoardStatus.ConditionsNotMet

func getStartConditions() -> Array:
	return [
		[completeIf("Mining_IntroducedToMinning"), "Follow Risha's order and go work in the mines."],
		[completeIf("PortalPantiesModule.Alex_FirstTimeTalked"), "Talk with Alex Rynard near the entrance to the mines."],
		[completeIf("PortalPantiesModule.Panties_AskedAlex"), "Ask Alex Rynard if he can help you with credits."],
		[completeIfBool(getFlag("PortalPantiesModule.Panties_FleshlightsReturnedToAlex", false) || getFlag("PortalPantiesModule.Panties_PcDenied", false)), "Complete the 'portal panties' task that Alex Rynard gives fully or decline him after trying them once."],
		[completeIfBool(GM.pc.getSkillsHolder().getLevel() >= 10), "Reach level 10."],
		[completeIf("SocketModule.socketIntroduced"), "Enter the workshop to meet Socket!"],
	]

func getProgressText() -> String:
	return "Help Socket complete her tasks all around the prison."
