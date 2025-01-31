extends Reference
class_name DrugDen

const DrugDenFloor = "DrugDenDungeon"

var started:bool = false
var level:int = 1

var map:Dictionary = {}

var startLevelRoom:String = ""
var nextLevelRoom:String = ""

func generateMap():
	var result:Array = []
	map = {}
	
	var targetMapSize:int = 10
	
	var curPos:Vector2 = Vector2(0, 0)
	
	var simpleLayout:Dictionary = {}
	simpleLayout[curPos] = true
	var lastAction:String = ""
	
	# Simple walker
	while(simpleLayout.size() < targetMapSize):
		var toAct:String = RNG.pick(["goN", "goS", "goE", "goW"])
		if(lastAction != "" && RNG.chance(25)):
			toAct = lastAction
		lastAction = toAct
		if(toAct == "goN"):
			curPos.y += 1
		if(toAct == "goS"):
			curPos.y -= 1
		if(toAct == "goE"):
			curPos.x -= 1
		if(toAct == "goW"):
			curPos.x += 1
		
		if(!simpleLayout.has(curPos)):
			simpleLayout[curPos] = true
	
	
	var mapIndex:int = 1
	for pos in simpleLayout:
		var thisRoomID:String = "drugDenRoom"+str(mapIndex)
		
		map[pos] = {id=thisRoomID}
		result.append(thisRoomID)
		
		mapIndex += 1
	
	startLevelRoom = result.front()
	nextLevelRoom = result.back()
	
	return result

func buildMap():
	GM.world.clearFloor(DrugDenFloor)
	for pos in map:
		var roomInfo:Dictionary = map[pos]
		var roomID:String = roomInfo["id"]
		
		var theIcon = RoomStuff.RoomSprite.NONE
		if(roomID == nextLevelRoom):
			theIcon = RoomStuff.RoomSprite.STAIRS
		
		GM.world.addRoom(DrugDenFloor, roomInfo["id"], pos, {
			icon = theIcon,
		})
	GM.world.addTransitions([DrugDenFloor])

func start():
	level = 1
	
	generateMap()
	buildMap()
	GM.pc.setLocation(startLevelRoom)

func end():
	GM.world.clearFloor(DrugDenFloor)

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
	}

func loadData(_data:Dictionary):
	started = SAVE.loadVar(_data, "started", false)
	level = SAVE.loadVar(_data, "level", 1)
	map = SAVE.loadVar(_data, "map", {})
	startLevelRoom = SAVE.loadVar(_data, "startLevelRoom", "")
	nextLevelRoom = SAVE.loadVar(_data, "nextLevelRoom", "")
	buildMap()
