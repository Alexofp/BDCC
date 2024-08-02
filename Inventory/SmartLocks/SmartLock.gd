extends Object
class_name SmartLock

const TightLock = "TightLock"
const SlutLock = "SlutLock"
const KeyholderLock = "KeyholderLock"

static func getAll():
	return [TightLock, SlutLock, KeyholderLock]

static func getRandomSmartLock():
	#return KeyholderLock#RNG.pick(getAll())
	return RNG.pickWeightedPairs([
		[TightLock, 1.0],
		[SlutLock, 5.0], # Slutlocks are the most interesting ones
		[KeyholderLock, 1.0],
	])

static func create(_theID:String):
	if(_theID == TightLock):
		return load("res://Inventory/SmartLocks/Locks/TightLock.gd").new()
	if(_theID == SlutLock):
		return load("res://Inventory/SmartLocks/Locks/SlutLock.gd").new()
	if(_theID == KeyholderLock):
		return load("res://Inventory/SmartLocks/Locks/KeyholderLock.gd").new()
	
	return null
