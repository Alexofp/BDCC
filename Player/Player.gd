extends Node
class_name Player

signal stat_changed
signal bodypart_changed
signal location_changed(newloc)

var gamename = "Rahi"
var pain:int = 0
var lust:int = 0
var credits:int = 0
var location:String = "r1"
var legs: BodypartLeg
var arms
var head
var ears
var tail
var breasts: BodypartBreasts
var hair

# Called when the node enters the scene tree for the first time.
func _ready():
	#legs = GlobalRegistry.getBodypart("humanleg")
	setLegs(GlobalRegistry.getBodypart("felineleg"))
	var mybreasts: BodypartBreasts = GlobalRegistry.getBodypart("humanbreasts")
	mybreasts.size = BodypartBreasts.BreastsSize.C
	setBreasts(mybreasts)
	pass

func updateAppearance():
	emit_signal("bodypart_changed")

func setLegs(bodypart: BodypartLeg):
	legs = bodypart
	emit_signal("bodypart_changed")

func setBreasts(bodypart: BodypartBreasts):
	breasts = bodypart
	emit_signal("bodypart_changed")

func setLocation(newRoomID:String):
	location = newRoomID
	#var roomInfo = GM.world.getRoomByID(location)
	#if(roomInfo):
	#	var roomName = roomInfo.getName()
	#	GM.ui.setLocationName(roomName)
	emit_signal("location_changed", newRoomID)

func addPain(_p: int):
	pain += _p
	emit_signal("stat_changed")

func addLust(_l: int):
	lust += _l
	emit_signal("stat_changed")

func getPain() -> int:
	return pain

func getLust() -> int:
	return lust
	
func getName() -> String:
	return gamename
	
func addCredits(_c: int):
	credits += _c
	emit_signal("stat_changed")

func getCredits() -> int:
	return credits
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
