extends Object
class_name SmartLock

const SlutLock = "SlutLock"
const KeyholderLock = "KeyholderLock"
const TightLock = "TightLock"

static func getAll():
	return [TightLock, SlutLock]#[TightLock, SlutLock]

static func create(_theID:String):
	if(_theID == TightLock):
		return load("res://Inventory/SmartLocks/Locks/TightLock.gd").new()
	if(_theID == SlutLock):
		return load("res://Inventory/SmartLocks/Locks/SlutLock.gd").new()
	
	return null
