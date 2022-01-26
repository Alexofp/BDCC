extends Sprite
class_name GameRoom

export(String) var roomName = ""
export(String) var roomID = ""
export(String, MULTILINE) var roomDescription = ""

export(bool) var canWest = true
export(bool) var canNorth = true
export(bool) var canEast = true
export(bool) var canSouth = true

enum RoomSprite { NONE, PERSON, CANTEEN, STAIRS }
export(RoomSprite) var roomSprite = RoomSprite.NONE
enum RoomColor { White, Green, Red }
export(RoomColor) var roomColor = RoomColor.White
const RoomColorToColor = {
	RoomColor.White : Color.white,
	RoomColor.Green : Color(0.7, 1.0, 0.7),
	RoomColor.Red : Color(1.0, 0.7, 0.7),
}

var world: GameWorld
var gridsize = 64

var sprites = {
	#RoomSprite.NONE: ,
	RoomSprite.PERSON: preload("res://Game/World/sprites/person.png"),
	RoomSprite.CANTEEN: preload("res://Game/World/sprites/canteen.png"),
	RoomSprite.STAIRS: preload("res://Game/World/sprites/stairs.png"),
}
onready var roomSpriteObject = $Sprite

signal onEnter(room)
signal onReact(room, key)

# Called when the node enters the scene tree for the first time.
func _ready():
	if(!roomID):
		roomID = name
	if(!roomName):
		roomName = roomID
	
	if(get_parent() is GameWorld):
		world = get_parent()
		gridsize = world.gridsize
	if(get_parent() is SubGameWorld):
		world = get_parent().get_parent()
		gridsize = world.gridsize
	
	global_position.x = round(global_position.x / gridsize) * gridsize
	global_position.y = round(global_position.y / gridsize) * gridsize
	self_modulate = RoomColorToColor[roomColor]
	
	if(world):
		world.registerRoom(self)
		
	if(sprites.has(roomSprite)):
		roomSpriteObject.texture = sprites[roomSprite]
	
func getCell():
	return Vector2(round(global_position.x / gridsize), round(global_position.y / gridsize))

func getDescription() -> String:
	return _getDescription()

func _getDescription() -> String:
	return roomDescription

func getName():
	return roomName

func say(_text: String):
	if(GM.ui):
		GM.ui.say(_text)

func addButton(text: String, tooltip: String = "", arg: String = ""):
	GM.ui.addButton(text, tooltip, "roomCallback", [roomID, arg])
	#emit_signal("addButton", text, method, tooltip)
	
func addDisabledButton(text: String, tooltip: String = ""):
	GM.ui.addDisabledButton(text, tooltip)
	#emit_signal("addDisabledButton", text, tooltip)
	
func clearScreen():
	GM.ui.clearText()
	GM.ui.clearButtons()
	
func runScene(id: String, args = []):
	GM.main.runScene(id, args)

func addActions():
	for action in get_children():
		if(action is RoomAction):
			var roomAction:RoomAction = action
			if(roomAction._shouldShow()):
				if(roomAction._canRun()):
					GM.ui.addButton(roomAction.ActionName, roomAction.ActionTooltip, "actionCallback", [roomAction.ActionScene])
				else:
					GM.ui.addDisabledButton(roomAction.ActionName, roomAction.ActionTooltip)
func _onEnter():
	say(getDescription())
	addActions()
	
	emit_signal("onEnter", self)

func _onButton(key):
	GM.ui.clearText()
	GM.ui.clearButtons()
	emit_signal("onReact", self, key)
	return true

func setHighlighted(high):
	if(high):
		self_modulate = Color.purple
	else:
		self_modulate = RoomColorToColor[roomColor]

