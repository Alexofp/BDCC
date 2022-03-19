tool
extends Sprite
class_name GameRoom

export(String) var roomName = ""
export(String) var roomID = ""
export(String, MULTILINE) var roomDescription = ""
export(String, MULTILINE) var blindRoomDescription = ""

export(bool) var canWest = true
export(bool) var canNorth = true
export(bool) var canEast = true
export(bool) var canSouth = true

enum RoomSprite { NONE, PERSON, CANTEEN, STAIRS, IMPORTANT, COMPUTER, VENDOMAT, SHOWER, WC, LAUNDRY }
export(RoomSprite) var roomSprite = RoomSprite.NONE
enum RoomColor { White, Green, Red, Blue, Pink, Orange, Yellow, Grey, LightGrey }
export(RoomColor) var roomColor = RoomColor.White setget onRoomChangeColor
export(RoomColor) var gridColor = RoomColor.White setget onGridChangeColor
const RoomColorToColor = {
	RoomColor.White : Color.white,
	RoomColor.Green : Color(0.7, 1.0, 0.7),
	RoomColor.Red : Color(1.0, 0.6, 0.6),
	RoomColor.Blue : Color(0.7, 0.7, 1.0),
	RoomColor.Pink : Color(1.0, 0.6, 0.8),
	RoomColor.Orange : Color(255.0/255.0, 204.0/255.0, 153.0/255.0),
	RoomColor.Yellow : Color(1.0, 1.0, 0.7),
	RoomColor.Grey : Color(0.5, 0.5, 0.5),
	RoomColor.LightGrey : Color(0.7, 0.7, 0.7),
}

const sprites = {
	#RoomSprite.NONE: ,
	RoomSprite.PERSON: preload("res://Game/World/sprites/person.png"),
	RoomSprite.CANTEEN: preload("res://Game/World/sprites/canteen.png"),
	RoomSprite.STAIRS: preload("res://Game/World/sprites/stairs.png"),
	RoomSprite.IMPORTANT: preload("res://Game/World/sprites/important.png"),
	RoomSprite.COMPUTER: preload("res://Game/World/sprites/computer.png"),
	RoomSprite.VENDOMAT: preload("res://Game/World/sprites/vendomat.png"),
	RoomSprite.SHOWER: preload("res://Game/World/sprites/shower.png"),
	RoomSprite.WC: preload("res://Game/World/sprites/wc.png"),
	RoomSprite.LAUNDRY: preload("res://Game/World/sprites/laundry.png"),
}

onready var roomSpriteObject = $Sprite
onready var gridSprite = $Grid

signal onEnter(room)
signal onPreEnter(room)
signal onReact(room, key)

# Room tags
export(bool) var loctag_Greenhouses = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if(Engine.editor_hint):
		return
	
	if(!roomID):
		roomID = name
	if(!roomName):
		roomName = roomID
	
	#if(get_parent() is GameWorld):
	#	world = get_parent()
	#	gridsize = world.gridsize
	#if(get_parent() is SubGameWorld):
	#	world = get_parent().get_parent()
	#	gridsize = world.gridsize
	
	self_modulate = RoomColorToColor[roomColor]
	
	#if(world):
	#	world.registerRoom(self)
		
	if(sprites.has(roomSprite)):
		roomSpriteObject.texture = sprites[roomSprite]
	
func getFloorID():
	var myParent = get_parent()
	while(!myParent.has_method("getRooms")):
		myParent = myParent.get_parent()
	return myParent.id
	
func getCell():
	return Vector2(round(global_position.x / GameWorld.gridsize), round(global_position.y / GameWorld.gridsize))

func getDescription() -> String:
	return _getDescription()

func _getDescription() -> String:
	return roomDescription

func getBlindDescription() -> String:
	if(blindRoomDescription == ""):
		return "You don't understand where you are"
	else:
		return blindRoomDescription

func getName():
	return roomName

func say(_text: String):
	if(GM.ui):
		GM.ui.say(_text)

func sayn(_text: String):
	say(_text+"\n")

func saynn(_text: String):
	say(_text+"\n\n")

func addButton(text: String, tooltip: String = "", arg: String = ""):
	GM.ui.addButton(text, tooltip, "roomCallback", [roomID, arg])
	#emit_signal("addButton", text, method, tooltip)
	
func addDisabledButton(text: String, tooltip: String = ""):
	GM.ui.addDisabledButton(text, tooltip)
	#emit_signal("addDisabledButton", text, tooltip)
	
func addButtonUnlessLate(text: String, tooltip: String = "", arg: String = "", latetext: String = "It's way too late for that"):
	if(GM.main.isVeryLate()):
		addDisabledButton(text, latetext)
	else:
		addButton(text, tooltip, arg)
	
func addButtonWithChecks(text: String, tooltip: String, arg: String, checks: Array):
	var badCheck = ButtonChecks.check(checks)
	if(badCheck == null):
		addButton(text, tooltip, arg)
	else:
		addDisabledButton(text, ButtonChecks.getReasonText(badCheck))
	
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

func _onPreEnter():
	emit_signal("onPreEnter", self)

func _onEnter():
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

func onRoomChangeColor(newvalue):
	roomColor = newvalue
	
	self_modulate = RoomColorToColor[roomColor]

func onGridChangeColor(newvalue):
	gridColor = newvalue
	
	if(newvalue == RoomColor.White):
		$Grid.visible = false
	else:
		$Grid.visible = true
	
	$Grid.self_modulate = RoomColorToColor[gridColor]

# https://github.com/godotengine/godot/issues/43491
# This function should just start working after the issue is fixed
func _get_property_list():
	var properties = []
	properties.append({
			name = "Location Tags",
			type = TYPE_NIL,
			hint_string = "loctag_",
			usage = PROPERTY_USAGE_GROUP | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	return properties
