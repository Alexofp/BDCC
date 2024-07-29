extends Reference
class_name SmartLockBase

var id = "base"

var restraintDataRef:WeakRef

func getName():
	return "Base lock"

func getUnlockDescription():
	return "You shouldn't see this"

func onLocked(_contex):
	pass

func canBeSimpleRemoved() -> bool:
	return false

func canBeUnlockedWithKeys() -> bool:
	return true

func getKeysAmountToUnlock() -> int:
	return 1

func canStruggle() -> bool:
	return false

func isKeyholder(_charID:String):
	return false

func handleSexEvent(_sexEvent:SexEvent):
	pass

func onSexEnded(_contex = {}):
	pass

func setRestraintData(theData):
	restraintDataRef = weakref(theData)

func getRestraintData():
	if(restraintDataRef == null):
		return null
	return restraintDataRef.get_ref()

func getItem():
	if(restraintDataRef == null):
		return null
	return restraintDataRef.get_ref().getItem()

func getWearer():
	var theItem = getItem()
	if(theItem == null):
		return null
	return theItem.getWearer()

func saveData():
	return {}

func loadData(_data):
	pass
