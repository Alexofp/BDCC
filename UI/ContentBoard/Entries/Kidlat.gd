extends ContentBoardEntryBase

func _init():
	id = "Kidlat"
	
func getName() -> String:
	return "Kidlat"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Find a cute cat that got stuck in the endless maintenance tunnels and see if you can help her out."+("\n\nSilly sprite original is from [url=https://www.furaffinity.net/view/53363888/]Kidlat's FurAffinity[/url]" if getStatus() == ContentBoardStatus.Completed else "")
	return "Find a cute cat that got stuck in the endless maintenance tunnels. See if you can help her out"

func getKinks() -> Array:
	return [
		"Player is dominant",
		"Roguelike element",
		"Sex/Breeding (pc is top)",
		"Groping",
		"Exhibitionism",
	]

func getCompletedDesc() -> String:
	return "Kidlat is no longer in the drugden!"

func getStatus() -> int:
	if(getFlag("DrugDenModule.Kidlat8Hap", false)):
		return ContentBoardStatus.Completed
	if(getFlag("DrugDenModule.Kidlat1Hap", false)):
		return ContentBoardStatus.InProgress
	return ContentBoardStatus.ConditionsNotMet

func getStartConditions() -> Array:
	return [
		[completeIf("ElizaModule.s0hap"), "Find Eliza Quinn in the medbay and ask if you can become her lab assistant."],
		[completeIf("ElizaModule.s3hap"), "Follow the \"Queen of Alchemy\" task until you get access to the drug den."],
		[completeIf("DrugDenModule.Kidlat1Hap"), "Start a drug den run and find Kidlat there."],
	]

func getProgressText() -> String:
	return "Follow the \"Kidlat's Shop of Wonders\" task!"
