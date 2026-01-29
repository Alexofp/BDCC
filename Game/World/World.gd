extends Node2D
class_name GameWorld

enum Direction {WEST, NORTH, EAST, SOUTH}

static func getAllDirections():
	return [Direction.WEST, Direction.NORTH, Direction.EAST, Direction.SOUTH]

static func getOppositeDir(theDir):
	if(theDir == Direction.WEST):
		return Direction.EAST
	if(theDir == Direction.NORTH):
		return Direction.SOUTH
	if(theDir == Direction.EAST):
		return Direction.WEST
	if(theDir == Direction.SOUTH):
		return Direction.NORTH
	return -1

var cells: Dictionary = {}
var roomDict: Dictionary = {}
var floorDict: Dictionary = {}
const gridsize = 64
onready var camera = $Camera2D
var highlightedRoom: Node2D
var lastAimedRoomID = null

var pawns:Dictionary = {}
var entities:Dictionary = {}

var roomConnectionScene = preload("res://Game/World/RoomConnection.tscn")
onready var worldFloorScene = load("res://Game/World/WorldFloor.tscn")
var worldPawnScene = preload("res://Game/World/WorldPawn.tscn")
var worldEntityScene = preload("res://Game/World/WorldEntity.tscn")

var astar:AStar2D
var astarIDToRoomIDMap: Dictionary = {}

func calculatePath(startRoomID:String, endRoomID:String):
	if(!hasRoomID(startRoomID) || !hasRoomID(endRoomID)):
		return []
	var startRoom = getRoomByID(startRoomID)
	var endRoom = getRoomByID(endRoomID)

	var result = astar.get_id_path(startRoom.astarID, endRoom.astarID)
	var resultRooms = []
	for astarID in result:
		if(astarIDToRoomIDMap.has(astarID)):
			resultRooms.append(astarIDToRoomIDMap[astarID])
		else:
			Log.print("calculatePath() Unknown atarID "+str(astarID))
	
	return resultRooms

func opposite(dir):
	if(dir == Direction.WEST):
		return Direction.EAST
	if(dir == Direction.EAST):
		return Direction.WEST
	if(dir == Direction.NORTH):
		return Direction.SOUTH
	if(dir == Direction.SOUTH):
		return Direction.NORTH
	return null

func applyDirection(pos: Vector2, dir):
	var newpos = pos
	if(dir == Direction.WEST):
		newpos.x -= 1
	elif(dir == Direction.NORTH):
		newpos.y -= 1
	elif(dir == Direction.EAST):
		newpos.x += 1
	elif(dir == Direction.SOUTH):
		newpos.y += 1
	return newpos
	
func applyDirectionID(roomid: String, dir) -> String:
	var room = getRoomByID(roomid)
	if(!room):
		return ""
	var currentFloor = room.getFloorID()
	
	var newpos = applyDirection(room.getCell(), dir)
	if(hasRoom(currentFloor, newpos)):
		return cells[currentFloor][newpos].roomID
	else:
		return ""
	
func canGoID(roomid: String, dir):
	var room = getRoomByID(roomid)
	if(!room):
		return false
	
	return canGo(room.getFloorID(), room.getCell(), dir)
	
func canGo(floorid: String, pos: Vector2, dir):
	if(!hasRoom(floorid, pos)):
		return false
	var pos2 = applyDirection(pos, dir)
	if(!hasRoom(floorid, pos2)):
		return false
	
	var room1 = cells[floorid][pos]
	var room2 = cells[floorid][pos2]
	if(dir == Direction.WEST):
		if(room1.canWest && room2.canEast):
			return true
		return false
	if(dir == Direction.EAST):
		if(room1.canEast && room2.canWest):
			return true
		return false
	if(dir == Direction.NORTH):
		if(room1.canNorth && room2.canSouth):
			return true
		return false
	if(dir == Direction.SOUTH):
		if(room1.canSouth && room2.canNorth):
			return true
		return false
	return false

var roomScene
func addRoom(floorID:String, roomID:String, roomPosition:Vector2, roomData:Dictionary):
	if(!cells.has(floorID)):
		return
	#var floorcells = cells[floorID]
	var floorObject = floorDict[floorID]
	
	roomPosition.x = round(roomPosition.x)
	roomPosition.y = round(roomPosition.y)
	var mapRoomPos:Vector2 = roomPosition * gridsize
	
	if(roomScene == null):
		roomScene = load("res://Game/World/GameRoom.tscn")
	var newCell = roomScene.instance()
	floorObject.add_child(newCell)
	newCell.global_position = mapRoomPos
	
	newCell.roomID = roomID
	newCell.roomName = roomData["name"] if roomData.has("name") else "Unknown room"
	newCell.roomDescription = roomData["desc"] if roomData.has("desc") else "You're standing in some kind of room. There is not much else to say about it."
	newCell.roomSprite = roomData["icon"] if roomData.has("icon") else RoomStuff.RoomSprite.NONE
	newCell.roomColor = roomData["color"] if roomData.has("color") else RoomStuff.RoomColor.White
	newCell.gridColor = roomData["gridColor"] if roomData.has("gridColor") else RoomStuff.RoomColor.White
	newCell.canWest = roomData["canW"] if roomData.has("canW") else true
	newCell.canNorth = roomData["canN"] if roomData.has("canN") else true
	newCell.canEast = roomData["canE"] if roomData.has("canE") else true
	newCell.canSouth = roomData["canS"] if roomData.has("canS") else true
	
	registerRoom(floorID, newCell)

func clearFloor(floorID:String):
	if(!cells.has(floorID)):
		return
	var floorcells = cells[floorID]
	for pos in floorcells.keys():
		var _room = floorcells[pos]
		
		roomDict.erase(_room.roomID)
		for otherRoomAStarID in _room.astarConnections:
			if(astar.has_point(otherRoomAStarID)):
				astar.disconnect_points(_room.astarID, otherRoomAStarID)
		
		astar.remove_point(_room.astarID)
		astarIDToRoomIDMap.erase(_room.astarID)
		
		_room.queue_free()
		floorcells.erase(pos)
	

func addTransitions(floorIDs:Array = []):
	#Util.delete_children(connections)
	if(floorIDs.empty()):
		floorIDs = cells.keys()
	
	for floorid in floorIDs:
		var floorcells = cells[floorid]
		for pos in floorcells:
			var _room = floorcells[pos]
			for extraAstarConnection in _room.astarConnectedTo:
				var extraRoom = getRoomByID(extraAstarConnection)
				if(extraRoom != null):
					astar.connect_points(_room.astarID, extraRoom.astarID)
					_room.astarConnections.append(extraRoom.astarID)
			
			if(canGo(floorid, pos, Direction.EAST)):
				#print("ADD TRANSITION FROM "+str(pos)+" TO EAST")
				var transitionLine = roomConnectionScene.instance()
				_room.add_child(transitionLine)
				transitionLine.global_position = (pos + Vector2(0.5, 0))*gridsize
				
				var nextRoomID = applyDirectionID(_room.roomID, Direction.EAST)
				var nextRoom = getRoomByID(nextRoomID)
				astar.connect_points(_room.astarID, nextRoom.astarID)
				_room.astarConnections.append(nextRoom.astarID)
				
			if(canGo(floorid, pos, Direction.SOUTH)):
				#print("ADD TRANSITION FROM "+str(pos)+" TO SOUTH")
				var transitionLine = roomConnectionScene.instance()
				transitionLine.rotation_degrees = 90
				_room.add_child(transitionLine)
				transitionLine.global_position = (pos + Vector2(0, 0.5))*gridsize
				
				var nextRoomID = applyDirectionID(_room.roomID, Direction.SOUTH)
				var nextRoom = getRoomByID(nextRoomID)
				astar.connect_points(_room.astarID, nextRoom.astarID)
				_room.astarConnections.append(nextRoom.astarID)

func _exit_tree():
	pass
	#assert(GM.world == self)
	#GM.world = null

# Called when the node enters the scene tree for the first time.
func _ready():
	#assert(GM.world == null)
	GM.world = self
	astar = AStar2D.new()
	
	var mapFloors = GlobalRegistry.getMapFloors()
	for mapID in mapFloors:
		var mapPath = mapFloors[mapID]
		var mapObject = load(mapPath).instance()
		
		var newWorldFloor = worldFloorScene.instance()
		newWorldFloor.id = mapID
		
		add_child(newWorldFloor)
		newWorldFloor.add_child(mapObject)
	
		if(mapObject.get("canMeetNPCs")):
			newWorldFloor.canMeetNPCs = mapObject.canMeetNPCs
	
	for f in get_children():
		if(f.has_method("getRooms")):
			if(floorDict.has(f.id)):
				assert(false)
			floorDict[f.id] = f
			if(!cells.has(f.id)):
				cells[f.id] = {}
			var _cells = f.getRooms()
			
			for cell in _cells:
				cell.global_position.x = round(cell.global_position.x / gridsize) * gridsize
				cell.global_position.y = round(cell.global_position.y / gridsize) * gridsize
				
				registerRoom(f.id, cell)
	
	#print(roomDict)
	#aimCamera("ScriptedRoom")#"cellblock_orange_playercell")

func hasRoom(floorid: String, pos: Vector2):
	if(!cells.has(floorid)):
		return false
	
	if(!cells[floorid].has(pos)):
		return false
	
	return true

func getRoomByID(id:String):
	if(!roomDict.has(id)):
		return null
	return roomDict[id]

func setRoomSprite(id:String, newRoomSprite):
	var room = getRoomByID(id)
	if(room != null):
		room.setRoomSprite(newRoomSprite)

func setRoomColor(id:String, newRoomColor):
	var room = getRoomByID(id)
	if(room != null):
		room.setRoomColor(newRoomColor)

func setRoomGridColor(id:String, newRoomColor):
	var room = getRoomByID(id)
	if(room != null):
		room.setRoomGridColor(newRoomColor)

func hasRoomID(id:String):
	if(!roomDict.has(id)):
		return false
	return true

func registerRoom(floorid, room):
	var pos:Vector2 = room.getCell()
	
	if(hasRoom(floorid, pos)):
		Log.printerr("Map Error: there is already a room at cell "+str(pos)+" floor: "+str(floorid)+" roomid: "+str(room.roomID))
		room.queue_free()
		return
		
	if(!room.roomID):
		Log.printerr("Map Error: room at "+str(pos)+" has no roomID")
	else:
		if(roomDict.has(room.roomID)):
			Log.printerr("Map Error: room with id "+room.roomID+" is already registered")
			room.queue_free()
			return
		roomDict[room.roomID] = room
	
	if(!cells.has(floorid)):
		cells[floorid] = {}
	
	cells[floorid][pos] = room
	room.astarID = astar.get_available_point_id()
	astar.add_point(room.astarID, pos)
	astarIDToRoomIDMap[room.astarID] = room.roomID
	room.floorID = floorid

func switchToFloor(floorID):
	for myfloorid in floorDict:
		var floorObject = floorDict[myfloorid]
		
		if(myfloorid == floorID):
			floorObject.visible = true
		else:
			floorObject.visible = false

func aimCamera(roomID, instantly = false):
	var room = getRoomByID(roomID)
	
	if(!room):
		return
		
	switchToFloor(room.getFloorID())
		
	camera.global_position = room.global_position
	
	if(highlightedRoom):
		highlightedRoom.setHighlighted(false)
	highlightedRoom = room
	highlightedRoom.setHighlighted(true)
	
	lastAimedRoomID = roomID
	if(instantly):
		camera.reset_smoothing()

func zoomIn(mult:float = 1.0):
	camera.zoom *= 1.1 * mult
	updateDarknessSize()

func zoomOut(mult:float = 1.0):
	camera.zoom *= 0.9 / mult
	updateDarknessSize()

func zoomRaw(mult:float = 1.0):
	camera.zoom *= mult
	camera.zoom.x = clamp(camera.zoom.x, 0.2, 5.0)
	camera.zoom.y = clamp(camera.zoom.y, 0.2, 5.0)
	updateDarknessSize()

func zoomReset():
	camera.zoom = Vector2(1.0, 1.0)
	updateDarknessSize()

onready var darkness_control = $CanvasLayer/DarknessControl
onready var d_center = $CanvasLayer/DarknessControl/DCenter
onready var d_top = $CanvasLayer/DarknessControl/DTop
onready var d_bottom = $CanvasLayer/DarknessControl/DBottom
onready var d_left = $CanvasLayer/DarknessControl/DLeft
onready var d_right = $CanvasLayer/DarknessControl/DRight

func setDarknessVisible(vis):
	darkness_control.visible = vis

var savedDarknessSize:float = 32.0
func setDarknessSize(darknessSize):
	savedDarknessSize = darknessSize
	updateDarknessSize()

func updateDarknessSize():
	var darknessSize:float = savedDarknessSize * 2.0 / max(camera.zoom.x, 0.1)
	
	d_center.margin_left = -darknessSize
	d_center.margin_top = -darknessSize
	d_center.margin_right = darknessSize
	d_center.margin_bottom = darknessSize

	d_top.margin_bottom = -darknessSize + 0.5
	d_bottom.margin_top = darknessSize - 0.5
	d_left.margin_right = -darknessSize + 0.5
	d_right.margin_left = darknessSize - 0.5

func clearEntities():
	for entityID in entities:
		entities[entityID].queue_free()
	entities.clear()

func hasEntity(theID:String) -> bool:
	if(entities.has(theID)):
		return true
	return false

func getEntity(_theID:String):
	if(!entities.has(_theID)):
		return null
	return entities[_theID]

func moveEntity(_theID:String, loc:String, _customOffset:bool = false, _theOffset:Vector2 = Vector2(0.0, 0.0)):
	var theEntity = getEntity(_theID)
	if(!theEntity):
		return
	var room = getRoomByID(loc)
	if(room == null):
		return
	if(theEntity.loc == loc):
		return
	
	if(room.getFloorID() == theEntity.floorid):
		theEntity.moveToPos(room.global_position, _customOffset, _theOffset)
		theEntity.loc = loc
	else:
		theEntity.get_parent().remove_child(theEntity)
		var roomFloor = room.getFloor()
		roomFloor.add_child(theEntity)
		theEntity.loc = loc
		theEntity.floorid = roomFloor.id
		theEntity.global_position = getRoomByID(loc).global_position + (Vector2(RNG.randf_range(-16.0, 16.0), RNG.randf_range(-16.0, 16.0)) if !_customOffset else _theOffset)
		#createWorldPawn(charID, pawn, loc)

func deleteEntity(_theID:String):
	if(!hasEntity(_theID)):
		return
	entities[_theID].queue_free()
	entities.erase(_theID)

func createEntity(theID:String, theTexture:Texture, loc:String, _customOffset:bool = false, _theOffset:Vector2 = Vector2(0.0, 0.0)):
	if(entities.has(theID)):
		entities[theID].queue_free()
		var _ok = entities.erase(theID)
	var room = getRoomByID(loc)
	var roomFloor = room.getFloor()
	
	var newWorldEntity = worldEntityScene.instance()
	roomFloor.add_child(newWorldEntity)
	newWorldEntity.loc = loc
	newWorldEntity.id = theID
	newWorldEntity.floorid = roomFloor.id
	newWorldEntity.global_position = getRoomByID(loc).global_position
	if(!_customOffset):
		newWorldEntity.position += Vector2(RNG.randf_range(-16.0, 16.0), RNG.randf_range(-16.0, 16.0))
	else:
		newWorldEntity.position += _theOffset
	newWorldEntity.setTexture(theTexture)
	entities[theID] = newWorldEntity

func setEntityTexture(_theID:String, _theTexture:Texture):
	if(!entities.has(_theID)):
		return
	entities[_theID].setTexture(_theTexture)

func clearPawns():
	for pawnID in pawns:
		pawns[pawnID].queue_free()
	pawns.clear()

func updatePawn(worldPawn, pawn):
	worldPawn.setPawnActivityIcon(pawn.getActivityIcon())
	var theTagAndColor:Array = pawn.getPawnRelationshipTextAndColor()
	worldPawn.setRelationshipText(theTagAndColor[0], theTagAndColor[1])

func updatePawns(IS):
	#var visiblePawns = {}
	var checkedPawns = pawns.duplicate()
	
	for charID in IS.getPawns():
		var pawn = IS.getPawn(charID)
		var loc:String = pawn.getLocation()
		
		var room = getRoomByID(loc)
		if(room == null):
			continue
		
		if(!pawns.has(charID)):
			createWorldPawn(charID, pawn, loc)
		else:
			checkedPawns.erase(charID)
			var worldPawn = pawns[charID]
			
			updatePawn(worldPawn, pawn)
			#worldPawn.setPawnActivityIcon(pawn.getActivityIcon())
			#var theTagAndColor:Array = pawn.getPawnRelationshipTextAndColor()
			#worldPawn.setRelationshipText(theTagAndColor[0], theTagAndColor[1])
			
			if(worldPawn.loc == loc):
				continue
			
			if(room.getFloorID() == worldPawn.floorid):
				worldPawn.moveToPos(room.global_position)
				worldPawn.loc = loc
			else:
				createWorldPawn(charID, pawn, loc)
		
	for removedPawn in checkedPawns.keys():
		pawns[removedPawn].queue_free()
		var _ok = pawns.erase(removedPawn)
		
func createWorldPawn(charID, pawn, loc):
	if(pawns.has(charID)):
		pawns[charID].queue_free()
		var _ok = pawns.erase(charID)
	var room = getRoomByID(loc)
	var roomFloor = room.getFloor()
	
	var newWorldPawn = worldPawnScene.instance()
	#room.add_child(newWorldPawn)
	roomFloor.add_child(newWorldPawn)
	newWorldPawn.pawn = pawn
	newWorldPawn.loc = loc
	newWorldPawn.id = charID
	newWorldPawn.floorid = roomFloor.id
	newWorldPawn.global_position = getRoomByID(loc).global_position
	newWorldPawn.setPawnTexture(pawn.getPawnTexture())
	newWorldPawn.setPawnColor(pawn.getPawnColor())
	newWorldPawn.setShowCollar(pawn.getShouldShowCollarOnSprite())
	#newWorldPawn.setPawnActivityIcon(pawn.getActivityIcon())
	updatePawn(newWorldPawn, pawn)
	pawns[charID] = newWorldPawn

func getZoneRooms(zoneID:String, fallbackRooms:Array = []) -> Array:
	var finalZoneID:String = "zone_"+zoneID
	
	if(!get_tree().has_group(finalZoneID)):
		Log.printerr("Trying to find rooms for zone that doesn't exist: "+zoneID)
		return []
	var result := []
	
	var rooms = get_tree().get_nodes_in_group(finalZoneID)
	for room in rooms:
		if(!is_instance_valid(room)):
			continue
		if(!room.has_method("getFloorID")):
			continue
		result.append(room.roomID)
	if(result.size() <= 0):
		return fallbackRooms
	return result

func getRandomZoneRoom(zoneID:String, defaultValue:String = ""):
	var rooms = getZoneRooms(zoneID)
	
	if(rooms.size() <= 0):
		return defaultValue
	return RNG.pick(rooms)

func isRoomInZone(roomID:String, zoneID:String) -> bool:
	var theRoom = getRoomByID(roomID)
	if(theRoom == null):
		return false
	var finalZoneID:String = "zone_"+zoneID
	return theRoom.is_in_group(finalZoneID)

func simpleDistance(room1name:String, room2name:String) -> float:
	var room1 = getRoomByID(room1name)
	var room2 = getRoomByID(room2name)
	
	if(room1 == null || room2 == null):
		return 999999.9
	if(room1.getFloorID() != room2.getFloorID()):
		return 999999.9
	
	var room1cell:Vector2 = room1.getCell()
	var room2cell:Vector2 = room2.getCell()
	
	var diff:Vector2 = room2cell - room1cell
	var dumbDistance:float = abs(diff.x) + abs(diff.y) # Manhatten distance since we're can't move diagonally
	
	return dumbDistance

func simpleRingDistance(room1name:String, room2name:String) -> float:
	var room1 = getRoomByID(room1name)
	var room2 = getRoomByID(room2name)
	
	if(room1 == null || room2 == null):
		return 999999.9
	if(room1.getFloorID() != room2.getFloorID()):
		return 999999.9
	
	var room1cell:Vector2 = room1.getCell()
	var room2cell:Vector2 = room2.getCell()
	
	var diff:Vector2 = room2cell - room1cell
	var dumbDistance:float = max(abs(diff.x), abs(diff.y))
	
	return dumbDistance

func getSafeFromPCRandomRoom(possibleRooms:Array, pcLoc:String) -> String:
	var filtered:Array = []
	
	for roomID in possibleRooms:
		var dist:float = simpleDistance(roomID, pcLoc)
		if(dist >= 4.0):
			filtered.append(roomID)
	
	if(filtered.size() > 0):
		return RNG.pick(filtered)
	else:
		return RNG.pick(possibleRooms)

func isLocSafe(theLoc:String) -> bool:
	var room = getRoomByID(theLoc)
	if(room == null):
		return false
	return !room.isOfflimitsForInmates()

func getSafeLoc(theLoc:String) -> String:
	var toTest:Array = [theLoc]
	var checked:Dictionary = {}
	
	var dirs = getAllDirections()
	
	while(!toTest.empty()):
		var nextLoc:String = toTest.pop_front()
		var room = getRoomByID(nextLoc)
		
		if(room == null):
			continue
		if(!room.isOfflimitsForInmates()):
			return nextLoc
		
		for dir in dirs:
			if(canGoID(nextLoc, dir)):
				var nextNewLoc:String = applyDirectionID(nextLoc, dir)
				if(checked.has(nextNewLoc)):
					continue
				checked[nextNewLoc] = true
				toTest.append(nextNewLoc)
	return ""

func getConnectedRoomsNear(theLoc:String, maxDepth:int) -> Array:
	var origRoom = getRoomByID(theLoc)
	if(origRoom == null):
		return []
	
	var dirs = getAllDirections()
	
	var result:Array = []
	var checked:Dictionary = {theLoc:true}
	var toTest:Array = [theLoc]
	var toDepth:Array = [0]
	
	while(!toTest.empty()):
		var nextLoc:String = toTest.pop_front()
		var nextDepth:int = toDepth.pop_front()
		var room = getRoomByID(nextLoc)
		if(room == null):
			continue
		
		result.append(nextLoc)
		
		if(nextDepth >= maxDepth):
			continue
		
		for dir in dirs:
			if(canGoID(nextLoc, dir)):
				var nextNewLoc:String = applyDirectionID(nextLoc, dir)
				if(checked.has(nextNewLoc)):
					continue
				checked[nextNewLoc] = true
				
				#var dist:float = simpleDistance()
				
				toTest.append(nextNewLoc)
				toDepth.append(nextDepth+1)
	return result

func getConnectedRoomsNearLimitDistance(theLoc:String, maxDepth:int, maxDistance:float) -> Array:
	var origRoom = getRoomByID(theLoc)
	if(origRoom == null):
		return []
	
	var dirs = getAllDirections()
	
	var result:Array = []
	var checked:Dictionary = {theLoc:true}
	var toTest:Array = [theLoc]
	var toDepth:Array = [0]
	
	while(!toTest.empty()):
		var nextLoc:String = toTest.pop_front()
		var nextDepth:int = toDepth.pop_front()
		var room = getRoomByID(nextLoc)
		if(room == null):
			continue
		
		result.append(nextLoc)
		
		if(nextDepth >= maxDepth):
			continue
		
		for dir in dirs:
			if(canGoID(nextLoc, dir)):
				var nextNewLoc:String = applyDirectionID(nextLoc, dir)
				if(checked.has(nextNewLoc)):
					continue
				checked[nextNewLoc] = true
				
				var dist:float = simpleRingDistance(theLoc, nextNewLoc)
				if(dist > maxDistance):
					continue
				
				toTest.append(nextNewLoc)
				toDepth.append(nextDepth+1)
	return result

func setPawnsShowed(newS:bool):
	for pawnID in pawns:
		var worldPawn:Node2D = pawns[pawnID]
		worldPawn.visible = newS

func hasWallsNearby(locID:String) -> bool:
	var theRoom = getRoomByID(locID)
	if(theRoom == null):
		return false
	
	if(theRoom.loctag_NoWallsNear):
		return false
	
	for dir in getAllDirections():
		if(!canGo(theRoom.getFloorID(), theRoom.getCell(), dir)):
			return true
	return false

func canMeetOnFloor(floorID:String) -> bool:
	var theFloor = floorDict[floorID] if floorDict.has(floorID) else null
	if(theFloor && theFloor.canMeetNPCs):
		return true
	
	return false

func canMeetInLoc(_loc:String) -> bool:
	var theRoom = getRoomByID(_loc)
	if(!theRoom):
		return false
	return canMeetOnFloor(theRoom.getFloorID())

func saveData():
	var data = {}
	data["lastAimedRoomID"] = lastAimedRoomID
	data["zoomx"] = camera.zoom.x
	data["zoomy"] = camera.zoom.y
	
	return data
	
func loadData(data):
	lastAimedRoomID = SAVE.loadVar(data, "lastAimedRoomID", "")
	if(data.has("zoomx") && data.has("zoomy")):
		camera.zoom = Vector2(SAVE.loadVar(data, "zoomx", 1.0), SAVE.loadVar(data, "zoomy", 1.0))
	
	updateDarknessSize()
	if(lastAimedRoomID != null && lastAimedRoomID != ""):
		aimCamera(lastAimedRoomID, true)
