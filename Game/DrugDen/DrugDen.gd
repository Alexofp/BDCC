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

var savedCredits:int = 0
var savedSkillsData:Dictionary = {}

func generateMap():
	var result:Array = []
	map = {}
	encounterRooms = {}
	
	var targetMapSize:int = 10
	
	var dunGen:DungeonMapGenerator = DungeonMapGenerator.new()
	dunGen.generate({
		mainPathLen = targetMapSize,
	})
	var randomEventsPosList:Array = dunGen.findRandomSpots(3)
	
	var mapIndex:int = 1
	var posToIDMap:Dictionary = {}
	for thePos in dunGen.map:
		#var theCellInfo:Dictionary = dunGen.map[thePos]
		var thisRoomID:String = "drugDenRoom"+str(mapIndex)
		
		var isEncounter:bool = (thePos in randomEventsPosList)
		
		posToIDMap[thePos] = thisRoomID
		map[thisRoomID] = {x=int(thePos.x),y=int(thePos.y),
			canN=dunGen.canGo(thePos, DungeonMapGenerator.DIR_N),
			canS=dunGen.canGo(thePos, DungeonMapGenerator.DIR_S),
			canE=dunGen.canGo(thePos, DungeonMapGenerator.DIR_E),
			canW=dunGen.canGo(thePos, DungeonMapGenerator.DIR_W),
			isEncounter = isEncounter,
			isDeadend = (thePos in dunGen.deadends),
			}
		result.append(thisRoomID)
		
		if(isEncounter):
			encounterRooms[thisRoomID] = true
		
		mapIndex += 1
	
	startLevelRoom = posToIDMap[dunGen.startPos]
	nextLevelRoom = posToIDMap[dunGen.endPos]
	
	return result

func buildMap():
	GM.world.clearFloor(DrugDenFloor)
	for roomID in map:
		var roomInfo:Dictionary = map[roomID]
		var pos:Vector2 = Vector2(roomInfo["x"], roomInfo["y"])
		
		var theIcon = RoomStuff.RoomSprite.NONE
		if(roomID == nextLevelRoom):
			theIcon = RoomStuff.RoomSprite.STAIRS
		if(roomInfo.has("isEncounter") && roomInfo["isEncounter"]):
			theIcon = RoomStuff.RoomSprite.PERSON
		if(roomInfo.has("isDeadend") && roomInfo["isDeadend"]):
			theIcon = RoomStuff.RoomSprite.IMPORTANT
		
		GM.world.addRoom(DrugDenFloor, roomID, pos, {
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
	
	var theStashChar = GlobalRegistry.getCharacter("DrugDenStash")
	var pcItems:Array = GM.pc.getInventory().getItems()
	var itemAmount:int = pcItems.size()
	for _i in range(itemAmount):
		var theItem = pcItems[itemAmount - _i -1]
		
		GM.pc.getInventory().removeItem(theItem)
		theStashChar.getInventory().addItem(theItem)

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
	
	generateMap()
	buildMap()
	GM.pc.setLocation(startLevelRoom)
	


func endRun():
	GM.world.clearFloor(DrugDenFloor)
	
	var theStashChar = GlobalRegistry.getCharacter("DrugDenStash")
	var stashItems:Array = theStashChar.getInventory().getItems()
	var itemAmount:int = stashItems.size()
	for _i in range(itemAmount):
		var theItem = stashItems[itemAmount - _i -1]
		
		theStashChar.getInventory().removeItem(theItem)
		GM.pc.getInventory().addItem(theItem)
	
	GM.pc.addCredits(-GM.pc.getCredits())
	GM.pc.addCredits(savedCredits)
	GM.pc.resetSkillHolderFully()
	GM.pc.skillsHolder.loadData(savedSkillsData)
	GM.pc.updateNonBattleEffects()

func nextLevel():
	level += 1
	
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
	
	var result:float = flevel*0.05 + flevel*flevel*0.01
	
	result += fmod(flevel, 5.0)*(0.1 + flevel*0.01)
	
	return result

func getRunInfo() -> Array:
	var result:Array = []
	
	result.append("Drug den level: "+str(level))
	result.append("Difficulty: "+str(Util.roundF(getDifficultyFloat(), 2)))
	
	return result

func getNextLevelRoom() -> String:
	return nextLevelRoom

func hasEncounterInRoom(roomID:String):
	return encounterRooms.has(roomID) && encounterRooms[roomID]

func markEncounterAsCompleted(roomID:String):
	if(encounterRooms.has(roomID)):
		encounterRooms.erase(roomID)
		
		GM.world.setRoomSprite(roomID, RoomStuff.RoomSprite.NONE)
		map[roomID]["isEncounter"] = false

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

func saveData():
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
	buildMap()
