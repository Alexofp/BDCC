extends VBoxContainer

onready var vis_slot_calls = $ScrollContainer/PanelContainer/VisSlotCalls

var mainSlotCalls = preload("res://Game/Datapacks/UI/CrotchCode/SlotCalls.gd").new()
onready var undo_button = $HBoxContainer/UndoButton
onready var redo_button = $HBoxContainer/RedoButton
onready var scroll_container = $ScrollContainer

var editor = null

var undoStack = []
var redoStack = []

func _ready():
	vis_slot_calls.setSlotCalls(mainSlotCalls)
	updateButtons()

func getSlotCalls():
	return mainSlotCalls

func setEditor(newEd):
	editor = newEd
	
	vis_slot_calls.editor = editor

func setSlotCalls(newSlotCalls):
	undoStack = []
	redoStack = []
	mainSlotCalls = newSlotCalls
	vis_slot_calls.setSlotCalls(mainSlotCalls)
	vis_slot_calls.requestFullUpdate()
	updateButtons()

func loadCode(_codeData):
	undoStack = []
	redoStack = []
	mainSlotCalls.loadData(_codeData)
	vis_slot_calls.requestFullUpdate()
	updateButtons()

func makeSnapshot():
	redoStack = []
	undoStack.append(mainSlotCalls.saveData().duplicate(true))
	updateButtons()

func doUndo():
	if(!canUndo()):
		return
	redoStack.append(mainSlotCalls.saveData().duplicate(true))
	mainSlotCalls.loadData(undoStack.back())
	undoStack.pop_back()
	vis_slot_calls.requestFullUpdate()
	updateButtons()

func doRedo():
	if(!canRedo()):
		return
	undoStack.append(mainSlotCalls.saveData().duplicate(true))
	mainSlotCalls.loadData(redoStack.back())
	redoStack.pop_back()
	vis_slot_calls.requestFullUpdate()
	updateButtons()

func saveCode():
	return mainSlotCalls.saveData()

func canUndo():
	return undoStack.size() > 0

func canRedo():
	return redoStack.size() > 0

func updateButtons():
	undo_button.disabled = !canUndo()
	redo_button.disabled = !canRedo()

func _on_UndoButton_pressed():
	doUndo()

func _on_RedoButton_pressed():
	doRedo()

func resetScroll():
	scroll_container.get_v_scrollbar().value = 0
	scroll_container.get_h_scrollbar().value = 0
