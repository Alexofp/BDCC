extends Node2D
class_name GameWorld

enum Direction {WEST, NORTH, EAST, SOUTH}

var cells: Dictionary = {}
var roomDict: Dictionary = {}
var gridsize = 64
onready var connections = $Connections
onready var camera = $Camera2D
var highlightedRoom: Node2D

var roomConnectionScene = preload("res://Game/World/RoomConnection.tscn")

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
	
	var newpos = applyDirection(room.getCell(), dir)
	if(cells.has(newpos)):
		return cells[newpos].roomID
	else:
		return ""
	
func canGoID(roomid: String, dir):
	var room = getRoomByID(roomid)
	if(!room):
		return false
	
	return canGo(room.getCell(), dir)
	
func canGo(pos: Vector2, dir):
	if(!cells.has(pos)):
		return false
	var pos2 = applyDirection(pos, dir)
	if(!cells.has(pos2)):
		return false
	
	var room1 = cells[pos]
	var room2 = cells[pos2]
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
	Util.delete_children(connections)
	
	for pos in cells:
		var _room = cells[pos]
		if(canGo(pos, Direction.EAST)):
			#print("ADD TRANSITION FROM "+str(pos)+" TO EAST")
			var transitionLine = roomConnectionScene.instance()
			transitionLine.position = (pos + Vector2(0.5, 0))*gridsize
			connections.add_child(transitionLine)
		if(canGo(pos, Direction.SOUTH)):
			#print("ADD TRANSITION FROM "+str(pos)+" TO SOUTH")
			var transitionLine = roomConnectionScene.instance()
			transitionLine.position = (pos + Vector2(0, 0.5))*gridsize
			transitionLine.rotation_degrees = 90
			connections.add_child(transitionLine)

# Called when the node enters the scene tree for the first time.
func _ready():
	GM.world = self
	#print(cells)
	addTransitions()
	#print(roomDict)
	aimCamera("r3")

func hasRoom(pos: Vector2):
	return cells.has(pos)

func getRoomByID(id:String):
	if(!roomDict.has(id)):
		return null
	return roomDict[id]

func registerRoom(room):
	var pos:Vector2 = room.getCell()
	
	if(hasRoom(pos)):
		print("Map Error: there is already a room at cell "+str(pos))
		room.queue_free()
		return
		
	if(!room.roomID):
		print("Map Error: room at "+str(pos)+" has no roomID")
	else:
		if(roomDict.has(room.roomID)):
			print("Map Error: room with id "+room.roomID+" is already registered")
			room.queue_free()
			return
		roomDict[room.roomID] = room
	
	cells[pos] = room

func aimCamera(roomID):
	var room = getRoomByID(roomID)
	
	if(!room):
		return
		
	camera.global_position = room.global_position
	
	if(highlightedRoom):
		highlightedRoom.self_modulate = Color.white
	highlightedRoom = room
	highlightedRoom.self_modulate = Color.purple

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
