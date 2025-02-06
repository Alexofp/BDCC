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

export(RoomStuff.RoomSprite) var roomSprite = RoomStuff.RoomSprite.NONE setget setRoomSprite
export(RoomStuff.RoomColor) var roomColor = RoomStuff.RoomColor.White setget onRoomChangeColor
export(RoomStuff.RoomColor) var gridColor = RoomStuff.RoomColor.White setget onGridChangeColor
const RoomColorToColor = {
	RoomStuff.RoomColor.White : Color.white,
	RoomStuff.RoomColor.Green : Color(0.7, 1.0, 0.7),
	RoomStuff.RoomColor.Red : Color(1.0, 0.6, 0.6),
	RoomStuff.RoomColor.Blue : Color(0.7, 0.7, 1.0),
	RoomStuff.RoomColor.Pink : Color(1.0, 0.6, 0.8),
	RoomStuff.RoomColor.Orange : Color(255.0/255.0, 204.0/255.0, 153.0/255.0),
	RoomStuff.RoomColor.Yellow : Color(1.0, 1.0, 0.7),
	RoomStuff.RoomColor.Grey : Color(0.5, 0.5, 0.5),
	RoomStuff.RoomColor.LightGrey : Color(0.7, 0.7, 0.7),
}

const sprites = {
	#RoomSprite.NONE: ,
	RoomStuff.RoomSprite.PERSON: preload("res://Images/World/person.png"),
	RoomStuff.RoomSprite.CANTEEN: preload("res://Images/World/canteen.png"),
	RoomStuff.RoomSprite.STAIRS: preload("res://Images/World/stairs.png"),
	RoomStuff.RoomSprite.IMPORTANT: preload("res://Images/World/important.png"),
	RoomStuff.RoomSprite.COMPUTER: preload("res://Images/World/computer.png"),
	RoomStuff.RoomSprite.VENDOMAT: preload("res://Images/World/vendomat.png"),
	RoomStuff.RoomSprite.SHOWER: preload("res://Images/World/shower.png"),
	RoomStuff.RoomSprite.WC: preload("res://Images/World/wc.png"),
	RoomStuff.RoomSprite.LAUNDRY: preload("res://Images/World/laundry.png"),
	RoomStuff.RoomSprite.BED: preload("res://Images/World/bed.png"),
	RoomStuff.RoomSprite.BOSS: preload("res://Images/World/boss.png"),
}

onready var roomSpriteObject = $Sprite
onready var gridSprite = $Grid

signal onEnter(room)
signal onPreEnter(room)
signal onReact(room, key)

# Room tags
export(bool) var loctag_Greenhouses = false
export(bool) var loctag_MentalWard = false
export(bool) var loctag_GuardsEncounter = false
export(bool) var loctag_EngineersEncounter = false
export(bool) var loctag_Offlimits = false
export(bool) var loctag_OldGuardsEncounter = false
export(bool) var loctag_NoWallsNear = false

export(int, FLAGS, "Inmates", "Guards") var population = 0

export(bool) var lootable = false
export(String) var lootTableId = ""
export(String) var lootAroundMessage = ""
export(PoolStringArray) var lootItemIds = PoolStringArray()
export(int) var lootCredits = 0
export(int) var lootEveryXDays = 0

var astarID
export(PoolStringArray) var astarConnectedTo = PoolStringArray()
var astarConnections:Array = []

var floorID = ""

func getPopulation():
	var result = []
	if(Util.isBitEnabled(population, 0)):
		result.append(WorldPopulation.Inmates)
	if(Util.isBitEnabled(population, 1)):
		result.append(WorldPopulation.Guards)
	return result

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
	
	
	
	#if(world):
	#	world.registerRoom(self)
	if(RoomColorToColor.has(roomColor)):
		self_modulate = RoomColorToColor[roomColor]
	if(sprites.has(roomSprite)):
		roomSpriteObject.texture = sprites[roomSprite]
		
func setRoomColor(newColor):
	if(newColor != roomColor && RoomColorToColor.has(newColor)):
		roomColor = newColor
		
func setRoomGridColor(newColor):
	if(newColor != gridColor && RoomColorToColor.has(newColor)):
		gridColor = newColor
		
func setRoomSprite(newSprite):
	if(newSprite == RoomStuff.RoomSprite.NONE):
		roomSprite = newSprite
		$Sprite.texture = null
	
	if(newSprite != roomSprite && sprites.has(newSprite)):
		roomSprite = newSprite
		#roomSpriteObject.texture = sprites[roomSprite]
		$Sprite.texture = sprites[roomSprite]
	

	
func getFloorID():
	var myParent = get_parent()
	while(!myParent.has_method("getRooms")):
		myParent = myParent.get_parent()
	return myParent.id
	
func getFloor():
	var myParent = get_parent()
	while(!myParent.has_method("getRooms")):
		myParent = myParent.get_parent()
	return myParent
	
func getCell() -> Vector2:
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
		addButton(text, ButtonChecks.getPrefix(checks) + tooltip, arg)
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
	
	if(newvalue == RoomStuff.RoomColor.White):
		$Grid.visible = false
	else:
		$Grid.visible = true
	
	$Grid.self_modulate = RoomColorToColor[gridColor]

func getCachedFloorID():
	return floorID

func isOfflimitsForInmates() -> bool:
	if(loctag_GuardsEncounter || loctag_Greenhouses):
		return true
	if(loctag_EngineersEncounter || loctag_MentalWard):
		return true
	if(loctag_Offlimits):
		return true
	
	return false

func isLocToCatchOfflimits() -> bool:
	if(loctag_GuardsEncounter || loctag_Greenhouses):
		return true
	if(loctag_EngineersEncounter || loctag_MentalWard):
		return true
	
	return false

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
