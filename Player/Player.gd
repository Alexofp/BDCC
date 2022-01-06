extends BaseCharacter
class_name Player

signal bodypart_changed
signal location_changed(newloc)

var gamename = "Rahi"
var credits:int = 0
var location:String = "ScriptedRoom"
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
	updateNonBattleEffects()


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
	
func getName() -> String:
	return gamename
	
func addCredits(_c: int):
	credits += _c
	emit_signal("stat_changed")

func getCredits() -> int:
	return credits

func painThreshold():
	return 100

func isPlayer():
	return true

func _getAttacks():
	return ["simplepunchattack", "simplekickattack", "strongkickattack", "simplelustattack"]

func hasBoundArms():
	return false

# They may have effect on your damage in battles but they're not a 'battle' effects
func updateNonBattleEffects():
	if(hasBoundArms()):
		if(!hasEffect(StatusEffect.ArmsBound)):
			addEffect(StatusEffect.ArmsBound)
	else:
		if(hasEffect(StatusEffect.ArmsBound)):
			removeEffect(StatusEffect.ArmsBound)

func processBattleTurn():
	.processBattleTurn()
	updateNonBattleEffects()

func processTime(_minutesPassed):
	updateNonBattleEffects()
