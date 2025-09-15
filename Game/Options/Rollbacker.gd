extends Reference
class_name Rollbacker

var rollbackStates:Array = []
var currentChoice = 0
var rollbacking:bool = false

var madeChoice:bool = false

var usesThread:bool = false
var saveThread:Thread

func _init():
	usesThread = OPTIONS.isRollbackThreadEnabled()
	if(usesThread):
		saveThread = Thread.new()

func onDestroy():
	if(usesThread && saveThread.is_active()):
		saveThread.wait_to_finish()

func notifyMadeChoice():
	if(usesThread && saveThread.is_active()):
		saveThread.wait_to_finish()
	madeChoice = true
	
	if(OPTIONS.isRollbackEnabled() && rollbackStates.size() == 0):
		pushRollbackState_THREAD()

func pushRollbackState():
	if(!OPTIONS.isRollbackEnabled()):
		return
		
	currentChoice += 1
	if(currentChoice < OPTIONS.getRollbackSaveEveryXChoices()):
		return
	currentChoice = 0
		
	if(usesThread):
		if(saveThread.is_active()):
			saveThread.wait_to_finish()
		saveThread = Thread.new()
		saveThread.start(self, "pushRollbackState_THREAD")
	else:
		pushRollbackState_THREAD()

func pushRollbackState_THREAD():
	var newdata = SAVE.saveData().duplicate(true)
	if(newdata != null):
		rollbackStates.append(newdata)
	
	if(rollbackStates.size() > (OPTIONS.getRollbackSlotsAmount()+1)):
		rollbackStates.pop_front()
			
func canRollback():
	if(GM.main != null && !GM.main.canRollback()):
		return false
	if(madeChoice && rollbackStates.size() > 0):
		return true
	return (rollbackStates.size() > 0 && !madeChoice) || (rollbackStates.size() > 1 && madeChoice)

func clear():
	rollbackStates.clear()
	
func rollback():
	if(usesThread && saveThread.is_active()):
		saveThread.wait_to_finish()
	if(!canRollback()):
		return
	
	if(madeChoice):
		madeChoice = false
		rollbackStates.pop_back()
	
	Log.print("ROLLBACK")
	rollbacking = true
	SAVE.loadData(rollbackStates.back())
	rollbackStates.pop_back()
	rollbacking = false
	Log.print("ROLLBACK FINISHED")
