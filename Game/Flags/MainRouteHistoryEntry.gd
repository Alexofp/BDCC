extends Reference
class_name MainRouteHistoryEntry

var day:int = 0 # At what day did we detect that we have reached an ending
var ending:int = MainRouteEnding.NoEnding

func saveData() -> Dictionary:
	return {
		day = day,
		ending = ending,
	}

func loadData(_data:Dictionary):
	day = SAVE.loadVar(_data, "day", 0)
	ending = SAVE.loadVar(_data, "ending", MainRouteEnding.NoEnding)
