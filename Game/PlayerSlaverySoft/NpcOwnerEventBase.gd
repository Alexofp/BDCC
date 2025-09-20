extends Reference
class_name NpcOwnerEventBase

var id:String = "error"
var state:String = "start"

var runner:WeakRef

func setEventRunner(_eventRunner):
	if(!_eventRunner):
		runner = null
		return
	runner = weakref(_eventRunner)

func getRunner():
	if(!runner):
		return null
	return runner.get_ref()

func startEvent(_args:Array):
	pass

func run():
	if(!has_method(state)):
		Log.printerr("Npc Event "+str(id)+" has no state '"+str(state)+"'!")
		return
	call(state)
		
func setState(_newState:String):
	state = _newState

func saynn(_text:String):
	getRunner().saynn(_text)

func addButton(_name:String, _desc:String, _action:String, _args:Array = []):
	pass

func endEvent(_args:Array = []):
	pass

func saveData() -> Dictionary:
	return {
		state = state,
	}

func loadData(_data:Dictionary):
	state = SAVE.loadVar(_data, "state", "start")
