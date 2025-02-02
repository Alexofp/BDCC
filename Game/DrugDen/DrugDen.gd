extends Reference
class_name DrugDen

const DrugDenFloor = "DrugDenDungeon"

var started:bool = false
var level:int = 1

var map:Dictionary = {}

var startLevelRoom:String = ""
var nextLevelRoom:String = ""

var savedCredits:int = 0

func generateMap():
	var result:Array = []
	map = {}
	
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
		
		posToIDMap[thePos] = thisRoomID
		map[thePos] = {id=thisRoomID,
			canN=dunGen.canGo(thePos, DungeonMapGenerator.DIR_N),
			canS=dunGen.canGo(thePos, DungeonMapGenerator.DIR_S),
			canE=dunGen.canGo(thePos, DungeonMapGenerator.DIR_E),
			canW=dunGen.canGo(thePos, DungeonMapGenerator.DIR_W),
			isEvent = (thePos in randomEventsPosList),
			isDeadend = (thePos in dunGen.deadends),
			}
		result.append(thisRoomID)
		
		mapIndex += 1
	
	startLevelRoom = posToIDMap[dunGen.startPos]
	nextLevelRoom = posToIDMap[dunGen.endPos]
	
	return result

func buildMap():
	GM.world.clearFloor(DrugDenFloor)
	for pos in map:
		var roomInfo:Dictionary = map[pos]
		var roomID:String = roomInfo["id"]
		
		var theIcon = RoomStuff.RoomSprite.NONE
		if(roomID == nextLevelRoom):
			theIcon = RoomStuff.RoomSprite.STAIRS
		if(roomInfo["isEvent"]):
			theIcon = RoomStuff.RoomSprite.PERSON
		if(roomInfo["isDeadend"]):
			theIcon = RoomStuff.RoomSprite.IMPORTANT
		
		GM.world.addRoom(DrugDenFloor, roomInfo["id"], pos, {
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
	
	generateMap()
	buildMap()
	GM.pc.setLocation(startLevelRoom)
	
	var theStashChar = GlobalRegistry.getCharacter("DrugDenStash")
	var pcItems:Array = GM.pc.getInventory().getItems()
	var itemAmount:int = pcItems.size()
	for _i in range(itemAmount):
		var theItem = pcItems[itemAmount - _i -1]
		
		GM.pc.getInventory().removeItem(theItem)
		theStashChar.getInventory().addItem(theItem)

	savedCredits = GM.pc.getCredits()
	GM.pc.addCredits(-savedCredits)

func endRun():
	GM.world.clearFloor(DrugDenFloor)
	
	var theStashChar = GlobalRegistry.getCharacter("DrugDenStash")
	var stashItems:Array = theStashChar.getInventory().getItems()
	var itemAmount:int = stashItems.size()
	for _i in range(itemAmount):
		var theItem = stashItems[itemAmount - _i -1]
		
		theStashChar.getInventory().removeItem(theItem)
		GM.pc.getInventory().addItem(theItem)
	
	GM.pc.addCredits(savedCredits)

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

func getNextLevelRoom() -> String:
	return nextLevelRoom

func saveData():
	return {
		started = started,
		level = level,
		map = map,
		startLevelRoom = startLevelRoom,
		nextLevelRoom = nextLevelRoom,
		savedCredits = savedCredits,
	}

func loadData(_data:Dictionary):
	started = SAVE.loadVar(_data, "started", false)
	level = SAVE.loadVar(_data, "level", 1)
	map = SAVE.loadVar(_data, "map", {})
	startLevelRoom = SAVE.loadVar(_data, "startLevelRoom", "")
	nextLevelRoom = SAVE.loadVar(_data, "nextLevelRoom", "")
	savedCredits = SAVE.loadVar(_data, "savedCredits", 0)
	buildMap()
