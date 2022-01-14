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

func _init():
	initialDodgeChance = 0.05 # Player has a small chance to dodge anything

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
	return ["simplepunchattack", "scratchattack", "biteattack", "simplekickattack", "shoveattack", "strongkickattack", "simplelustattack", "begattack", "youslutattack", "gropeattack"]

func hasBoundArms():
	return false

func hasBoundLegs():
	return false

func isBlindfolded():
	return false

func isGagged():
	return false

# They may have effect on your damage in battles but they're not a 'battle' effects
func updateNonBattleEffects():
	if(hasBoundArms()):
		if(!hasEffect(StatusEffect.ArmsBound)):
			addEffect(StatusEffect.ArmsBound)
	else:
		if(hasEffect(StatusEffect.ArmsBound)):
			removeEffect(StatusEffect.ArmsBound)
			
	if(hasBoundLegs()):
		if(!hasEffect(StatusEffect.LegsBound)):
			addEffect(StatusEffect.LegsBound)
	else:
		if(hasEffect(StatusEffect.LegsBound)):
			removeEffect(StatusEffect.LegsBound)
			
	if(isBlindfolded()):
		if(!hasEffect(StatusEffect.Blindfolded)):
			addEffect(StatusEffect.Blindfolded)
	else:
		if(hasEffect(StatusEffect.Blindfolded)):
			removeEffect(StatusEffect.Blindfolded)
			
	if(isGagged()):
		if(!hasEffect(StatusEffect.Gagged)):
			addEffect(StatusEffect.Gagged)
	else:
		if(hasEffect(StatusEffect.Gagged)):
			removeEffect(StatusEffect.Gagged)

func processBattleTurn():
	.processBattleTurn()
	updateNonBattleEffects()

func processTime(_minutesPassed):
	updateNonBattleEffects()

func saveData():
	var data = {
		"gamename": gamename,
		"credits": credits,
		"pain": pain,
		"lust": lust,
		"stamina": stamina,
		"location": location,
	}
	
	data["legs"] = legs.id
	data["legsData"] = legs.saveData()
	data["breasts"] = breasts.id
	data["breastsData"] = breasts.saveData()
	data["statusEffects"] = saveStatusEffectsData()
	
	return data

func loadData(data):
	gamename = SAVE.loadVar(data, "gamename", "Player")
	credits = SAVE.loadVar(data, "credits", 0)
	pain = SAVE.loadVar(data, "pain", 0)
	lust = SAVE.loadVar(data, "lust", 0)
	stamina = SAVE.loadVar(data, "stamina", 100)
	location = SAVE.loadVar(data, "location", "ScriptedRoom")

	setLegs(GlobalRegistry.getBodypart(SAVE.loadVar(data, "legs", "humanleg")))
	legs.loadData(SAVE.loadVar(data, "legsData", {}))
	setBreasts(GlobalRegistry.getBodypart(SAVE.loadVar(data, "breasts", "humanbreasts")))
	breasts.loadData(SAVE.loadVar(data, "breastsData", {}))
	
	loadStatusEffectsData(SAVE.loadVar(data, "statusEffects", {}))
