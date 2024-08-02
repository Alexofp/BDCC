extends Control

onready var world = $VBoxContainer/HBoxContainer/PanelContainer/Viewport/World
onready var floor_list = $VBoxContainer/HBoxContainer/FloorList
onready var cell_list = $VBoxContainer/HBoxContainer/CellList

var cells = []
var selectedCell = ""
var selectedFloor = ""

signal onCellSelected(newCell)
signal onCancelPressed

func _init():
	if(GlobalRegistry.mapFloors.empty()):
		GlobalRegistry.registerMapFloorFolder("res://Game/World/Floors/")

func _ready():
	updateFloorsList()
	
	setSelectedCell("main_stairs2")

func setSelectedCell(newCell):
	selectedCell = newCell
	world.aimCamera(selectedCell)
	
	var gameRoom = world.getRoomByID(selectedCell)
	if(gameRoom == null):
		return
	selectedFloor = gameRoom.getFloorID()
	
	var _i = 0
	for floorID in GlobalRegistry.mapFloors:
		if(floorID == selectedFloor):
			floor_list.select(_i)
		_i += 1
	updateCellList()

func updateFloorsList():
	floor_list.clear()
	for floorID in GlobalRegistry.mapFloors:
		floor_list.add_item(floorID)
	
func updateCellList():
	cell_list.clear()
	cells.clear()
	
	if(floor_list.get_selected_items().size() <= 0):
		return
	var selectedFloorID = GlobalRegistry.mapFloors.keys()[floor_list.get_selected_items()[0]]
	
	var worldFloor:WorldFloor = world.floorDict[selectedFloorID]
	
	var _i = 0
	for room in worldFloor.getRooms():
		cell_list.add_item(room.roomID+" - "+room.getName())
		cells.append(room.roomID)
		if(room.roomID == selectedCell):
			cell_list.select(_i)
		_i += 1


func _on_FloorList_item_selected(_index):
	updateCellList()

func _on_CellList_item_selected(index):
	if(index < 0 || index >= cells.size()):
		return
	setSelectedCell(cells[index])
	
func _on_ConfirmButton_pressed():
	emit_signal("onCellSelected", selectedCell)

func _on_CancelButton_pressed():
	emit_signal("onCancelPressed")
