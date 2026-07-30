extends ContentBoardEntryBase

func _init():
	id = "ElizaLab"
	
func getName() -> String:
	return "BioLab Assistant"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Become Eliza's assistant and get a chance to work in her lab, researching new transformation drugs. Upgrade the lab to get access to new prototypes."
	return "Become Eliza's assistant and get a chance to work in her lab, researching new transformation drugs"

func getKinks() -> Array:
	return [
		"Transformation drugs",
		"Roguelike element (optional)",
	]

func getCompletedDesc() -> String:
	return "You now have a cool chemistry lab!"

func getStatus() -> int:
	if(getFlag("ElizaModule.storyCompleted", false)):
		return ContentBoardStatus.Completed
	if(getFlag("ElizaModule.s0hap", false)):
		return ContentBoardStatus.InProgress
	return ContentBoardStatus.NotStarted

func getStartConditions() -> Array:
	return [
		[completeIf("ElizaModule.s0hap"), "Find Eliza Quinn in the medbay and ask if you can become her lab assistant."],
	]

func getProgressText() -> String:
	return "Follow the \"Queen of Alchemy\" task!"
