extends Reference
class_name DrugDen

const DrugDenFloor = "DrugDenDungeon"

var started:bool = false
var level:int = 1
var handledPCLevel:int = 0
var lastSelectedStat:String = ""

var map:Dictionary = {}

var startLevelRoom:String = ""
var nextLevelRoom:String = ""

var encounterRooms:Dictionary = {}
var events:Dictionary = {} # location = drug den event
var flags:Dictionary = {}
var eventCooldowns:Dictionary = {}

var savedCredits:int = 0
var savedSkillsData:Dictionary = {}

const ENCOUNTER_NOTHING = 0
const ENCOUNTER_NORMAL = 1
const ENCOUNTER_BOSS = 2

func generateMap():
	var result:Array = []
	map = {}
	encounterRooms = {}
	events = {}
	
	var targetMapSize:int = 10
	var shouldHaveBoss:bool = (level % 3 == 0)
	
	var dunGen:DungeonMapGenerator = DungeonMapGenerator.new()
	dunGen.generate({
		mainPathLen = targetMapSize,
	})
	var randomEventsPosList:Array = dunGen.findRandomSpots(3)
	var bossPosList:Array = []
	
	if(shouldHaveBoss && !randomEventsPosList.empty()):
		bossPosList.append(RNG.grab(randomEventsPosList))
	
	var mapIndex:int = 1
	var posToIDMap:Dictionary = {}
	for thePos in dunGen.map:
		#var theCellInfo:Dictionary = dunGen.map[thePos]
		var thisRoomID:String = "drugDenRoom"+str(mapIndex)
		var customIcon = RoomStuff.RoomSprite.NONE
		
		var isEncounter:bool = (thePos in randomEventsPosList)
		var isBoss:bool = (thePos in bossPosList)
		var isDeadend:bool = (thePos in dunGen.deadends)
		
		if(isDeadend):
			var newEvent = generateEvent()
			if(newEvent == null):
				isDeadend = false
			else:
				events[thisRoomID] = newEvent
				newEvent.loc = thisRoomID
				newEvent.onSpawn(self)
				customIcon = newEvent.getMapIcon()
				var theCooldown:int = newEvent.getCooldown()
				if(theCooldown > 0):
					eventCooldowns[newEvent.id] = theCooldown+1
		
		posToIDMap[thePos] = thisRoomID
		map[thisRoomID] = {x=int(thePos.x),y=int(thePos.y),
			canN=dunGen.canGo(thePos, DungeonMapGenerator.DIR_N),
			canS=dunGen.canGo(thePos, DungeonMapGenerator.DIR_S),
			canE=dunGen.canGo(thePos, DungeonMapGenerator.DIR_E),
			canW=dunGen.canGo(thePos, DungeonMapGenerator.DIR_W),
			isEncounter = isEncounter,
			isBoss = isBoss,
			isDeadend = isDeadend,
			customIcon = customIcon,
			}
		result.append(thisRoomID)
		
		if(isEncounter):
			encounterRooms[thisRoomID] = ENCOUNTER_NORMAL
		if(isBoss):
			encounterRooms[thisRoomID] = ENCOUNTER_BOSS
		
		mapIndex += 1
	
	startLevelRoom = posToIDMap[dunGen.startPos]
	nextLevelRoom = posToIDMap[dunGen.endPos]
	
	return result

func buildMap():
	GM.world.clearFloor(DrugDenFloor)
	for roomID in map:
		var roomInfo:Dictionary = map[roomID]
		var pos:Vector2 = Vector2(roomInfo["x"], roomInfo["y"])
		
		var theIcon = roomInfo["customIcon"] if roomInfo.has("customIcon") else RoomStuff.RoomSprite.NONE
		if(roomID == nextLevelRoom):
			theIcon = RoomStuff.RoomSprite.STAIRS
		if(roomInfo.has("isEncounter") && roomInfo["isEncounter"]):
			theIcon = RoomStuff.RoomSprite.PERSON
		if(roomInfo.has("isBoss") && roomInfo["isBoss"]):
			theIcon = RoomStuff.RoomSprite.BOSS
		#if(roomInfo.has("isDeadend") && roomInfo["isDeadend"]):
		#	theIcon = RoomStuff.RoomSprite.IMPORTANT
		
		GM.world.addRoom(DrugDenFloor, roomID, pos, {
			name = "Drug Den",
			desc = "The tunnel is dimly lit by the flickering emergency lights. Crumpled rags, used syringes, and shattered glass litter the floor, crunching softly underfoot. The air is thick - stale with sweat, smoke, and something sickly sweet that clings to your throat. Distant echoes bounce through the tunnels - low murmurs, the occasional rustling, maybe even a quiet, breathy laugh.",
			icon = theIcon,
			canW = roomInfo["canW"],
			canE = roomInfo["canE"],
			canS = roomInfo["canS"],
			canN = roomInfo["canN"],
		})
	GM.world.addTransitions([DrugDenFloor])

func start():
	level = 1
	
	#GM.main.IS.deleteAllNonImportantPawns()
	
	transferAllItems(GM.pc, GlobalRegistry.getCharacter("DrugDenStash"))

	savedCredits = GM.pc.getCredits()
	GM.pc.addCredits(-savedCredits)
	
	savedSkillsData = GM.pc.skillsHolder.saveData().duplicate(true)
	GM.pc.resetSkillHolderFully()
	GM.pc.updateNonBattleEffects()
	GM.pc.addStamina(-GM.pc.getStamina()) # Remove any excess stamina that we might have after resetting stats
	GM.pc.addStamina(GM.pc.getMaxStamina()) # Reset stamina to max
	GM.pc.addPain(-GM.pc.getPain())
	GM.pc.addLust(-GM.pc.getLust())
	GM.pc.getSkillsHolder().addPerk(Perk.StartMaleInfertility) # No babies while in a dungen
	GM.pc.getSkillsHolder().addPerk(Perk.StartInfertile)
	
	for eventID in GlobalRegistry.getDrugDenEvents():
		var theEvent = GlobalRegistry.getDrugDenEventRef(eventID)
		var theCooldown:int = theEvent.getStartCooldown()
		if(theCooldown > 0):
			eventCooldowns[eventID] = theCooldown
	for eventID in GlobalRegistry.getDrugDenEvents():
		var theEvent = GlobalRegistry.getDrugDenEventRef(eventID)
		theEvent.onRunStart(self)
			
	generateMap()
	buildMap()
	GM.pc.setLocation(startLevelRoom)

func endRun():
	GM.world.clearFloor(DrugDenFloor)
	
	var drugDenChar = GlobalRegistry.getCharacter("DrugDenStash")
	#transferAllItems(GM.pc, drugDenChar) # So the order of the items would be correct
	
	var keepAll:bool = GM.main.SCI.hasUpgrade("drugDenLoot")
	
	# Only keep items that have the item tag
	var pcItems:Array = GM.pc.getInventory().getItems()
	while(!pcItems.empty()):
		var theItem:ItemBase = pcItems[0]
		GM.pc.getInventory().removeItem(theItem)
		if(theItem.hasTag(ItemTag.KeptAfterDrugDenRun) || keepAll):
			drugDenChar.getInventory().addItem(theItem)
			if(!keepAll):
				addMessage("You managed to keep "+str(theItem.getAStackName())+"!")
		
	transferAllItems(drugDenChar, GM.pc)
	
	GM.pc.addCredits(-GM.pc.getCredits())
	GM.pc.addCredits(savedCredits)
	GM.pc.resetSkillHolderFully()
	GM.pc.skillsHolder.loadData(savedSkillsData)
	GM.pc.updateNonBattleEffects()
	
	for eventID in GlobalRegistry.getDrugDenEvents():
		var theEvent = GlobalRegistry.getDrugDenEventRef(eventID)
		theEvent.onRunEnd(self)
	
	if(checkSetNewHighestLevelReached()):
		addMessage("Your highest reached Drug Den level is now "+str(level)+"!")

func nextLevel():
	level += 1
	
	GM.pc.addIntoxication(-0.2)
	
	for eventID in eventCooldowns.keys():
		eventCooldowns[eventID] -= 1
		if(eventCooldowns[eventID] <= 0):
			eventCooldowns.erase(eventID)
	for eventID in GlobalRegistry.getDrugDenEvents():
		var theEvent = GlobalRegistry.getDrugDenEventRef(eventID)
		theEvent.onRunNextFloor(self)
	
	generateMap()
	buildMap()
	GM.pc.setLocation(startLevelRoom)
	
	addMessage("You reached Drug Den level "+str(level))

func addMessage(theText:String):
	GM.main.addMessage(theText)

func getLevel() -> int:
	return level

func getDifficultyFloat() -> float:
	var flevel = float(level)
	
	var result:float = 0.1 + flevel*0.02 + flevel*flevel*0.01
	
	result += fmod(flevel, 3.0)*(0.1 + flevel*0.01)
	
	return result

func getRunInfo() -> Array:
	var result:Array = []
	
	result.append("Drug den level: "+str(level))
	result.append("Difficulty: "+str(round(getDifficultyFloat()*100.0))+"%")
	if(flags.has("hasKidlatUniform") && flags["hasKidlatUniform"]):
		result.append("You have Kidlat's uniform.")
	
	return result

func getNextLevelRoom() -> String:
	return nextLevelRoom

func hasEncounterInRoom(roomID:String):
	return encounterRooms.has(roomID) && encounterRooms[roomID]

func getEncounterType(roomID:String) -> int:
	if(!encounterRooms.has(roomID)):
		return ENCOUNTER_NOTHING
	return encounterRooms[roomID]

func markEncounterAsCompleted(roomID:String):
	if(encounterRooms.has(roomID)):
		encounterRooms.erase(roomID)
		
		GM.world.setRoomSprite(roomID, RoomStuff.RoomSprite.NONE)
		map[roomID]["isEncounter"] = false
	if(events.has(roomID)):
		removeEventFromRoom(roomID)

func shouldShowLevelUpScreen() -> bool:
	return handledPCLevel < GM.pc.getLevel()

func afterLevelUp():
	handledPCLevel += 1

func getPerksForReachingLevel(_level:int) -> Array:
	if(_level % 2 == 0):
		return []
	
	var result:Array = []
	var skillsHolder:SkillsHolder = GM.pc.getSkillsHolder()
	
	var possiblePerkIDWithWeight:Dictionary = {}
	for perkID in GlobalRegistry.getPerks():
		if(skillsHolder.hasPerkDisabledOrNot(perkID)):
			continue
		
		var thePerk:PerkBase = GlobalRegistry.getPerk(perkID)
		
		if(!thePerk.canAppearInDungeons()):
			continue
		if(!skillsHolder.hasRequiredPerksToUnlockPerk(perkID)):
			continue
		
		var theWeight:float = thePerk.getDungeonWeight()
		possiblePerkIDWithWeight[perkID] = theWeight
	
	for _i in range(3):
		if(possiblePerkIDWithWeight.empty()):
			break
		
		var nextPerkID:String = RNG.pickWeightedDict(possiblePerkIDWithWeight)
		result.append(nextPerkID)
		possiblePerkIDWithWeight.erase(nextPerkID)
	
	return result

func getEventAmountOfType(theType:String):
	var result:int = 0
	
	for loc in events:
		var theEvent = events[loc]
		if(theEvent.id == theType):
			result += 1
	
	return result

func generateEvent():
	var possible:Dictionary = {}
	
	for eventID in GlobalRegistry.getDrugDenEvents():
		if(eventCooldowns.has(eventID)):
			continue
		
		var theEvent = GlobalRegistry.getDrugDenEventRef(eventID)
		
		if(!theEvent.canSpawn(self)):
			continue
		
		var eventAmount:int = getEventAmountOfType(eventID)
		if(eventAmount >= theEvent.getMaxPerFloor()):
			continue
		
		var weight:float = theEvent.getEventWeight()
		if(weight <= 0.0):
			continue
		
		possible[eventID] = weight
		
	if(possible.empty()):
		return null
	
	var pickedEventID:String = RNG.pickWeightedDict(possible)
	
	var theEvent = GlobalRegistry.createDrugDenEvent(pickedEventID)
	return theEvent

func getEventInRoom(roomID:String):
	if(!events.has(roomID)):
		return null
	return events[roomID]

func removeEventFromRoom(roomID:String):
	if(!events.has(roomID)):
		return
	
	events.erase(roomID)
	GM.world.setRoomSprite(roomID, RoomStuff.RoomSprite.NONE)
	map[roomID]["isDeadend"] = false

func getFlag(flagID:String, defaultValue = null):
	if(!flags.has(flagID)):
		return defaultValue
	return flags[flagID]

func setFlag(flagID:String, newValue):
	flags[flagID] = newValue

func getHighestLevelReached() -> int:
	return int(GM.main.getFlag("DrugDenModule.HighestDrugDenLevel", 0))

func checkSetNewHighestLevelReached() -> bool:
	var currentHighestLevel:int = getHighestLevelReached()
	
	if(level <= currentHighestLevel):
		return false
	
	GM.main.setFlag("DrugDenModule.HighestDrugDenLevel", level)
	return true

func transferAllItems(_charFrom, _charTo):
	var theItems:Array = _charFrom.getInventory().getItems()
	while(!theItems.empty()):
		var theItem = theItems[0]
		
		_charFrom.getInventory().removeItem(theItem)
		_charTo.getInventory().addItem(theItem)

func saveData():
	var eventData:Dictionary = {}
	for loc in events:
		var theEvent = events[loc]
		
		eventData[loc] = {
			id = theEvent.id,
			data = theEvent.saveData(),
		}
	
	return {
		started = started,
		level = level,
		map = map,
		startLevelRoom = startLevelRoom,
		nextLevelRoom = nextLevelRoom,
		savedCredits = savedCredits,
		encounterRooms = encounterRooms,
		savedSkillsData = savedSkillsData,
		handledPCLevel = handledPCLevel,
		lastSelectedStat = lastSelectedStat,
		flags = flags,
		events = eventData,
		eventCooldowns = eventCooldowns,
	}

func loadData(_data:Dictionary):
	started = SAVE.loadVar(_data, "started", false)
	level = SAVE.loadVar(_data, "level", 1)
	map = SAVE.loadVar(_data, "map", {})
	startLevelRoom = SAVE.loadVar(_data, "startLevelRoom", "")
	nextLevelRoom = SAVE.loadVar(_data, "nextLevelRoom", "")
	savedCredits = SAVE.loadVar(_data, "savedCredits", 0)
	encounterRooms = SAVE.loadVar(_data, "encounterRooms", {})
	savedSkillsData = SAVE.loadVar(_data, "savedSkillsData", {})
	handledPCLevel = SAVE.loadVar(_data, "handledPCLevel", 0)
	lastSelectedStat = SAVE.loadVar(_data, "lastSelectedStat", "")
	flags = SAVE.loadVar(_data, "flags", {})
	eventCooldowns = SAVE.loadVar(_data, "eventCooldowns", {})
	
	events = {}
	var eventData:Dictionary = SAVE.loadVar(_data, "events", {})
	for loc in eventData:
		var eventEntry:Dictionary = eventData[loc]
		
		var eventID:String = SAVE.loadVar(eventEntry, "id", "")
		if(eventID == ""):
			continue
		var newEvent = GlobalRegistry.createDrugDenEvent(eventID)
		if(newEvent == null):
			continue
		
		newEvent.loc = loc
		events[loc] = newEvent
		newEvent.loadData(SAVE.loadVar(eventEntry, "data", {}))
	
	buildMap()
