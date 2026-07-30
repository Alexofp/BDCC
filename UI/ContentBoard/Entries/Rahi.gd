extends ContentBoardEntryBase

func _init():
	id = "Rahi"
	
func getName() -> String:
	return "Rahi"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Help a shy brown kitty with her drinking problem. Keep Rahi's body and mind occupied in order to help her cope.\nSilly Rahi sprite drawn by [url=https://silkiedraws.carrd.co/]Silkie! [img=32]res://UI/ContentBoard/Util/heart_silkie2.png[/img][/url]"
	return "Help a shy brown kitty with her drinking problem."

func getKinks() -> Array:
	return [
		"Player is dominant",
		"Vaginal sex/Breeding",
		"Anal sex",
		"Masochism (Rahi)",
		"Role switch (Dom -> Sub)",
		"Exhibitionism",
		"Petplay",
		"Prostitution/Sharing (optional)",
		"Watersports (optional)",
	]

func getCompletedDesc() -> String:
	if(getFlag("RahiModule.rahiMile7Proposed")):
		return "Rahi is now your happy wife! Meow meow."
	return "Rahi is now your personal slave! Meow meow."

func getStatus() -> int:
	if(getFlag("RahiModule.rahiMile8Happened", false)):
		return ContentBoardStatus.Completed
	if(getFlag("RahiModule.rahi5SceneHappened", false)):
		return ContentBoardStatus.InProgress
	if(getFlag("RahiModule.rahi4SceneHappened", false)):
		return ContentBoardStatus.NotStarted
	if(getFlag("RahiModule.Rahi_Denied", false)):
		return ContentBoardStatus.Cancelled
	return ContentBoardStatus.ConditionsNotMet

func getStartConditions() -> Array:
	return [
		[completeIf("RahiModule.Rahi_GaveApple"), "Steal an apple from the greenhouses and give it to Rahi at the bench near the stocks."],
		[completeIf("RahiModule.Rahi_ShowerHappened"), "Find Rahi in the showers and have fun with her there."],
		[completeIf("RahiModule.rahi1ElizaSceneHappened"), "Sleep in your cell and see what happens."],
		[completeIf("RahiModule.rahi2SceneHappened"), "Talk with Rahi about her problem."],
		[completeIf("RahiModule.rahi3SceneHappened"), "Sleep in your cell and see what happens."],
		[completeIf("RahiModule.rahi4SceneHappened"), "Find Rahi."],
		[completeIf("RahiModule.rahi5SceneHappened"), "Talk with Rahi in the general population inmate cellblock."],
	]

func getProgressText() -> String:
	return "Train Rahi every day, raise her obedience or affection stats. When you raise either one of them enough, you will get a chance to trigger the next milestone."
