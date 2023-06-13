extends Node2D
class_name GameWorld

enum Direction {WEST, NORTH, EAST, SOUTH}

var cells: Dictionary = {}
var roomDict: Dictionary = {}
var floorDict: Dictionary = {}
const gridsize = 64
onready var camera = $Camera2D
var highlightedRoom: Node2D
var lastAimedRoomID = null

var roomConnectionScene = preload("res://Game/World/RoomConnection.tscn")
onready var worldFloorScene = load("res://Game/World/WorldFloor.tscn")

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

func addTransitions():
	#Util.delete_children(connections)
	
	for floorid in cells:
		var floorcells = cells[floorid]		
		for pos in floorcells:
			var _room = floorcells[pos]
			for extraAstarConnection in _room.astarConnectedTo:
				var extraRoom = getRoomByID(extraAstarConnection)
				if(extraRoom != null):
					astar.connect_points(_room.astarID, extraRoom.astarID)
			
			if(canGo(floorid, pos, Direction.EAST)):
				#print("ADD TRANSITION FROM "+str(pos)+" TO EAST")
				var transitionLine = roomConnectionScene.instance()
				_room.add_child(transitionLine)
				transitionLine.global_position = (pos + Vector2(0.5, 0))*gridsize
				
				var nextRoomID = applyDirectionID(_room.roomID, Direction.EAST)
				var nextRoom = getRoomByID(nextRoomID)
				astar.connect_points(_room.astarID, nextRoom.astarID)
				
			if(canGo(floorid, pos, Direction.SOUTH)):
				#print("ADD TRANSITION FROM "+str(pos)+" TO SOUTH")
				var transitionLine = roomConnectionScene.instance()
				transitionLine.rotation_degrees = 90
				_room.add_child(transitionLine)
				transitionLine.global_position = (pos + Vector2(0, 0.5))*gridsize
				
				var nextRoomID = applyDirectionID(_room.roomID, Direction.SOUTH)
				var nextRoom = getRoomByID(nextRoomID)
				astar.connect_points(_room.astarID, nextRoom.astarID)

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
	
	for f in get_children():
		if(f.has_method("getRooms")):
			if(floorDict.has(f.id)):
				assert(false)
			floorDict[f.id] = f
			
			var _cells = f.getRooms()
			
			for cell in _cells:
				cell.global_position.x = round(cell.global_position.x / gridsize) * gridsize
				cell.global_position.y = round(cell.global_position.y / gridsize) * gridsize
				
				registerRoom(f.id, cell)
	
	addTransitions()
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

func setDarknessVisible(vis):
	$CanvasLayer/DarknessControl.visible = vis

func setDarknessSize(darknessSize):
	$CanvasLayer/DarknessControl/DCenter.margin_left = -darknessSize
	$CanvasLayer/DarknessControl/DCenter.margin_top = -darknessSize
	$CanvasLayer/DarknessControl/DCenter.margin_right = darknessSize
	$CanvasLayer/DarknessControl/DCenter.margin_bottom = darknessSize

	$CanvasLayer/DarknessControl/DTop.margin_bottom = -darknessSize + 0.5
	$CanvasLayer/DarknessControl/DBottom.margin_top = darknessSize - 0.5
	$CanvasLayer/DarknessControl/DLeft.margin_right = -darknessSize + 0.5
	$CanvasLayer/DarknessControl/DRight.margin_left = darknessSize - 0.5

func saveData():
	var data = {}
	data["lastAimedRoomID"] = lastAimedRoomID
	
	return data
	
func loadData(data):
	lastAimedRoomID = SAVE.loadVar(data, "lastAimedRoomID", "")
	
	if(lastAimedRoomID != null && lastAimedRoomID != ""):
		aimCamera(lastAimedRoomID, true)
