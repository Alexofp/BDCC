extends BaseCharacter
class_name Player

signal bodypart_changed
signal location_changed(newloc)
signal animation_changed(newanim)

var gamename = "Player"
var credits:int = 0
var location:String = "cellblock_orange_playercell"#"ScriptedRoom"
var bodyparts: Dictionary
var pickedGender = Gender.Female
var pronounsGender = null
var pickedSpecies = ["feline"]

func _init():
	initialDodgeChance = 0.05 # Player has a small chance to dodge anything

# Called when the node enters the scene tree for the first time.
func _ready():
	name = "Player"
	resetSlots()
	#legs = GlobalRegistry.getBodypart("humanleg")
	giveBodypart(GlobalRegistry.getBodypart("felineleg"))
	var mybreasts: BodypartBreasts = GlobalRegistry.getBodypart("humanbreasts")
	mybreasts.size = BodypartBreasts.BreastsSize.C
	giveBodypart(mybreasts)
	giveBodypart(GlobalRegistry.getBodypart("baldhair"))
	giveBodypart(GlobalRegistry.getBodypart("felinetail"))
	giveBodypart(GlobalRegistry.getBodypart("felinehead"))
	giveBodypart(GlobalRegistry.getBodypart("humanbody"))
	giveBodypart(GlobalRegistry.getBodypart("humanarms"))
	giveBodypart(GlobalRegistry.getBodypart("felineears"))
	giveBodypart(GlobalRegistry.getBodypart("vagina"))
	giveBodypart(GlobalRegistry.getBodypart("anus"))
	updateNonBattleEffects()
	
	#inventory.addItem(GlobalRegistry.createItem("testitem"))
	#inventory.addItem(GlobalRegistry.createItem("testitem"))
	#inventory.addItem(GlobalRegistry.createItem("ballgag"))
	
	#inventory.equipItem(GlobalRegistry.createItem("ballgag"))

func updateAppearance():
	emit_signal("bodypart_changed")

func playAnimation(dollAnim):
	emit_signal("animation_changed", dollAnim)

func resetSlots():
	for slot in BodypartSlot.getAll():
		if(bodyparts.has(slot) && bodyparts[slot] != null):
			bodyparts[slot].queue_free()
		bodyparts[slot] = null

func giveBodypart(bodypart: Bodypart):
	var slot = bodypart.getSlot()
	if(bodyparts.has(slot) && bodyparts[slot] != null):
		bodyparts[slot].queue_free()
	bodyparts[slot] = bodypart
	emit_signal("bodypart_changed")

func hasBodypart(slot):
	if(bodyparts.has(slot) && bodyparts[slot] != null):
		return true
	return false
	
func getBodypart(slot):
	return bodyparts[slot]

func getBodyparts():
	return bodyparts
	
func removeBodypart(slot):
	if(bodyparts.has(slot) && bodyparts[slot] != null):
		bodyparts[slot].queue_free()
	bodyparts[slot] = null
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
	
func setName(newname: String):
	newname = newname.replace("{", "")
	newname = newname.replace("}", "")
	newname = newname.replace("[", "")
	newname = newname.replace("]", "")
	if(newname == ""):
		newname = "Player"
	
	gamename = newname
	emit_signal("stat_changed")
	
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
	return buffsHolder.hasBuff(Buff.RestrainedArmsBuff)

func hasBoundLegs():
	return false

func isBlindfolded():
	return false

func isGagged():
	return buffsHolder.hasBuff(Buff.GagBuff)
	
func calculateBuffs():
	buffsHolder.calculateBuffs()
	updateNonBattleEffects()

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

func getGender():
	return pickedGender

func getPronounGender():
	if(pronounsGender == null):
		return getGender()
	return pronounsGender

func setGender(newgender):
	pickedGender = newgender

func setPronounGender(newgender):
	pronounsGender = newgender

func getChatColor():
	var gender = getGender()
	
	if(gender == Gender.Male):
		return "#92B3DD"
	if(gender == Gender.Female):
		return "#FFB7B2"
	if(gender == Gender.Androgynous):
		return "#DABFFF"
	if(gender == Gender.Other):
		return "#C3E8BE"
	
	return "red"

func formatSay(text):
	var color = getChatColor()
	
	if(isGagged() && false):
		#text = Util.muffledSpeech(text)
		return "[color="+color+"]\""+Util.muffledSpeech(text)+"\" ("+text+") [/color]"
	
	if(isGagged()):
		text = Util.muffledSpeech(text)
	
	return "[color="+color+"]\""+text+"\"[/color]"

func getSpecies():
	return pickedSpecies

func setSpecies(species: Array):
	pickedSpecies = species
	emit_signal("stat_changed")

func resetBodypartsToDefault():
	var speciesIds = getSpecies()
	var myspecies = []
	for specieID in speciesIds:
		myspecies.append(GlobalRegistry.getSpecies(specieID))
	if(myspecies.size() == 0):
		return
	resetSlots()
	var allslots = BodypartSlot.getAll()
	
	for slot in allslots:
		var choices = []
		
		for specie in myspecies:
			var bodypartID = specie.getDefaultForSlot(slot, getGender())
			if(bodypartID == null):
				continue
			var bodypart = GlobalRegistry.getBodypart(bodypartID)
			choices.append(bodypart)
			
		if(choices.size() == 0):
			continue
		
		var bestBodypart = choices[0]
		for bodypart in choices:
			if(bodypart.getHybridPriority() > bestBodypart.getHybridPriority()):
				bestBodypart = bodypart
		bodyparts[slot] = bestBodypart
	emit_signal("bodypart_changed")

func saveData():
	var data = {
		"gamename": gamename,
		"credits": credits,
		"pain": pain,
		"lust": lust,
		"stamina": stamina,
		"location": location,
		"pickedGender": pickedGender,
		"pronounsGender": pronounsGender,
		"pickedSpecies": pickedSpecies,
	}
	
#	data["legs"] = legs.id
#	data["legsData"] = legs.saveData()
#	data["breasts"] = breasts.id
#	data["breastsData"] = breasts.saveData()
#	data["hair"] = hair.id
#	data["hairData"] = hair.saveData()
	data["bodyparts"] = {}
	for slot in bodyparts:
		if(bodyparts[slot] == null):
			data["bodyparts"][slot] = null
			continue
		
		data["bodyparts"][slot] = {
			"id": bodyparts[slot].id,
			"data": bodyparts[slot].saveData(),
		}
	
	data["statusEffects"] = saveStatusEffectsData()
	data["inventory"] = inventory.saveData()
	
	return data

func loadData(data):
	gamename = SAVE.loadVar(data, "gamename", "Player")
	credits = SAVE.loadVar(data, "credits", 0)
	pain = SAVE.loadVar(data, "pain", 0)
	lust = SAVE.loadVar(data, "lust", 0)
	stamina = SAVE.loadVar(data, "stamina", 100)
	location = SAVE.loadVar(data, "location", "ScriptedRoom")
	pickedGender = SAVE.loadVar(data, "pickedGender", Gender.Female)
	pronounsGender = SAVE.loadVar(data, "pronounsGender", null)
	pickedSpecies = SAVE.loadVar(data, "pickedSpecies", ["human"])
	
	resetSlots()
	var loadedBodyparts = SAVE.loadVar(data, "bodyparts", {})
	for slot in loadedBodyparts:
		if(loadedBodyparts[slot] == null):
			bodyparts[slot] = null
			continue
		var id = SAVE.loadVar(loadedBodyparts[slot], "id", "humanleg")
		var bodypart = GlobalRegistry.getBodypart(id)
		bodyparts[slot] = bodypart
		bodypart.loadData(SAVE.loadVar(loadedBodyparts[slot], "data", {}))
	
	emit_signal("bodypart_changed")
	loadStatusEffectsData(SAVE.loadVar(data, "statusEffects", {}))
	inventory.loadData(SAVE.loadVar(data, "inventory", {}))

func getFightState():
	if(getPain() > getLust()):
		var mypain = getPain()
		
		if(mypain >= 70):
			return "Everything hurts, you are barely able to continue fighting."
		if(mypain >= 50):
			return "The pain begins to take over your body, it's hard to concentrate on fighting"
		if(mypain >= 10):
			return "You got bruised but doing fine otherwise"
	else:
		var mylust = getLust()
		
		if(mylust >= 70):
			return "You feel so horny, you just can't stop thinking about your opponent, your hands sneak down to your privates and tease them"
		if(mylust >= 50):
			return "You feel very lusty, you find your opponent to be quite hot"
		if(mylust >= 10):
			return "You are slightly aroused but you manage to control it just fine"
		
	return "You seem to be doing just fine during this moment in a fight"

func getBodypartTooltipName(_bodypartSlot):
	if(hasBodypart(_bodypartSlot)):
		var bodypart: Bodypart = getBodypart(_bodypartSlot)
		return bodypart.getName()
	
	return "error"

func getBodypartTooltipInfo(_bodypartSlot):
	if(hasBodypart(_bodypartSlot)):
		var bodypart: Bodypart = getBodypart(_bodypartSlot)
		return bodypart.getTooltipInfo()
	
	return "error"

func hasPenis():
	return hasBodypart(BodypartSlot.Penis)

func hasVagina():
	return hasBodypart(BodypartSlot.Vagina)
