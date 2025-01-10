extends Reference
class_name NurseryTaskBase

var id:String = "error"

var credits:int = 0
var sciPoints:int = 0

#var completed:bool = false

func getName() -> String:
	return "ERROR"

func getDescription() -> String:
	return "FILL ME"

func getCompletionString() -> String:
	return ""

func setTaskDataFinal(_data:Dictionary):
	if(_data.has("credits")):
		credits = _data["credits"]
	if(_data.has("sciPoints")):
		sciPoints = _data["sciPoints"]
	setTaskData(_data)

func setTaskData(_data:Dictionary):
	pass

func generatePossibleTasks() -> Array:
	return []

func isSameAs(_otherTask) -> bool:
	return true
	
func isSameAsFinal(_otherTask) -> bool:
	if(id != _otherTask.id):
		return false
	return isSameAs(_otherTask)

func completeSelf():
	GM.main.SCI.removeNurseryTask(self)
	GM.pc.addCredits(credits)
	GM.main.SCI.addPoints(sciPoints)
	GM.main.addMessage("Nursery task '"+getName()+"' is completed! Received "+str(credits)+" credit"+("s" if credits != 1 else "")+" and "+str(sciPoints)+" science point"+("s" if sciPoints != 1 else "")+".")

#func isCompleted() -> bool:
#	return completed

func handleBountyFluid(_fluidType:String, _amount:float):
	pass
