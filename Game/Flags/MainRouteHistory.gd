extends Reference
class_name MainRouteHistory

var canRestart:bool = false
var endingDay:int = 0

var history:Array = [] # Array of MainRouteHistoryEntry

func canRestartMainRoute() -> bool:
	return canRestart

func checkCanRestart():
	if(canRestart):
		return
	var theEnding:int = MainRouteEnding.getCurrentEnding()
	if(theEnding == MainRouteEnding.NoEnding):
		return
	
	allowCanRestart()
	
func allowCanRestart(_forced:bool = false):
	if(canRestart):
		return
	canRestart = true
	endingDay = GM.main.getDays()
	if(!_forced):
		GM.main.addMessage("You have reached one of the main route endings!")
		GM.main.addMessage("You can now choose to restart the main route if you want to try the other routes.")
	else:
		GM.main.addMessage("You can now choose to restart the main route if you want to try the other routes. A new option has appeared in your cell's bed.")

func resetMainRoute(_ending:int=-1):
	var theEnding:int = _ending if _ending >= 0 else MainRouteEnding.getCurrentEnding()
	var theDay:int = endingDay if canRestart else GM.main.getDays()
	
	var theEntry:MainRouteHistoryEntry = MainRouteHistoryEntry.new()
	theEntry.day = theDay
	theEntry.ending = theEnding
	
	history.append(theEntry)
	
	# DO THE RESET
	canRestart = false
	endingDay = 0
	
	GM.main.setFlag("Mining_IntroducedToMinning", false)
	
	for moduleID in GlobalRegistry.modules:
		var theModule = GlobalRegistry.modules[moduleID]
		
		theModule.resetMainRoute()
	GM.main.applyAllWorldEdits()

func didCompleteTaviRouteBefore() -> bool:
	for theEntry in history:
		if(theEntry.ending == MainRouteEnding.TaviKillEnding):
			return true
		if(theEntry.ending == MainRouteEnding.TaviNoEnding):
			return true
		if(theEntry.ending == MainRouteEnding.TaviYesEnding):
			return true
	return false

func didCompleteKaitRouteBefore() -> bool:
	return false
func didCompleteCaptainRouteBefore() -> bool:
	return false

func saveData() -> Dictionary:
	var theEndings:Array = []
	for theEnding in history:
		theEndings.append(theEnding.saveData())
	return {
		canRestart = canRestart,
		endingDay = endingDay,
		history = theEndings,
	}

func loadData(_data:Dictionary):
	canRestart = SAVE.loadVar(_data, "canRestart", false)
	endingDay = SAVE.loadVar(_data, "endingDay", 0)
	history.clear()
	var theEndings:Array = SAVE.loadVar(_data, "history", [])
	for theEndingEntry in theEndings:
		var newEnding := MainRouteHistoryEntry.new()
		newEnding.loadData(theEndingEntry)
		history.append(newEnding)
