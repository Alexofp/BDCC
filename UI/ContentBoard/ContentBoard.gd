extends Node2D

onready var camera_2d = $"%Camera2D"
var draggingCamera:bool = false
var previousPosition: Vector2 = Vector2(0, 0)
var startMousePosition: Vector2 = Vector2(0, 0)
onready var right_panel_canvas = $"%RightPanelCanvas"
onready var content_board_info_panel = $"%ContentBoardInfoPanel"
var ContentBoardCardFontDesc := preload("res://UI/ContentBoard/Util/ContentBoardCardFontDesc.tres")
var ContentBoardCardFontName := preload("res://UI/ContentBoard/Util/ContentBoardCardFontName.tres")

signal onClosePressed(_board)

func _enter_tree():
	get_node("/root").get_texture().flags = Texture.FLAG_FILTER

func _ready():
	if(OPTIONS.isVerticalOrientation()):
		content_board_info_panel.anchor_left = 0.0
		ContentBoardCardFontDesc.font_data.override_oversampling = 1.5
		ContentBoardCardFontName.font_data.override_oversampling = 1.5
	else:
		content_board_info_panel.anchor_left = 0.7
		ContentBoardCardFontDesc.font_data.override_oversampling = 0.0
		ContentBoardCardFontName.font_data.override_oversampling = 0.0

#func _unhandled_input(event):
func _input(event):
	if(right_panel_canvas.visible):
		return
	
	if event is InputEventMouseButton && event.button_index == BUTTON_MIDDLE:
		camera_2d.zoom = Vector2.ONE
		camera_2d.position = Vector2.ZERO
	
	if event is InputEventMouseButton:
		if(event.button_index == BUTTON_WHEEL_UP):
			camera_2d.zoom *= 0.9
		if(event.button_index == BUTTON_WHEEL_DOWN):
			camera_2d.zoom *= 1.1
		camera_2d.zoom.x = clamp(camera_2d.zoom.x, 0.1, 10.0)
		camera_2d.zoom.y = clamp(camera_2d.zoom.y, 0.1, 10.0)

	if event is InputEventMouseButton:
		if event.pressed:
			draggingCamera = true
			startMousePosition = event.position
			previousPosition = event.position
		else:
			draggingCamera = false
	elif touch_points.size() <= 1 && draggingCamera && event is InputEventMouseMotion:
		var delta = previousPosition - event.position
		camera_2d.translate(Vector2(delta.x * camera_2d.zoom.x, delta.y * camera_2d.zoom.y))
		previousPosition = event.position

	if event is InputEventScreenTouch:
		_handle_touch(event)
	elif event is InputEventScreenDrag:
		_handle_drag(event)

var touch_points: Dictionary = {}

func _handle_touch(event: InputEventScreenTouch):
	if event.pressed:
		touch_points[event.index] = event.position
	else:
		if(touch_points.has(event.index)):
			touch_points.erase(event.index)

func _handle_drag(event: InputEventScreenDrag):
	#if touch_points.size() == 1:
		#print(touch_points)
		#offset -= event.relative / zoom.x
		#touch_points[event.index] = event.position
		#touch_points[1] = Vector2(0.0, 0.0)

	if touch_points.size() == 2:
		var pivot_point: Vector2
		
		# Find the index of the other finger
		var pivot_index:int = -1
		for fingerIndex in touch_points:
			if(fingerIndex != event.index):
				pivot_index = fingerIndex
				break
		if(pivot_index < 0):
			return
		pivot_point = touch_points[pivot_index]
		
		var old_point: Vector2 = touch_points[event.index]
		var new_point: Vector2 = event.position

		var old_vector: Vector2 = old_point - pivot_point
		var new_vector: Vector2 = new_point - pivot_point
		
		var delta_scale:float = new_vector.length() / old_vector.length()
		#camera3d.size *= delta_scale
		camera_2d.zoom /= delta_scale
		#world.zoomRaw(delta_scale)
		touch_points[event.index] = new_point
		
		var drag_vector: Vector2 = event.relative
		#offset -= drag_vector / 2 * zoom
		var offsetTranslate :Vector2 = drag_vector# / 2.0 * camera3d.zoom
		#camera3d.translate(Vector3(offsetTranslate.x * camera3d.size / 500.0, -offsetTranslate.y * camera3d.size / 500.0, 0.0))
		camera_2d.translate(Vector2(offsetTranslate.x * camera_2d.zoom.x, offsetTranslate.y * camera_2d.zoom.y))

var selectedPanel = null

func _on_ContentBoardContent_onCardPressed(_id:String, _panel):
	right_panel_canvas.visible = true
	content_board_info_panel.setEntry(_id)
	_panel.setSelected(true)
	selectedPanel = _panel

func _on_ContentBoardInfoPanel_onClose():
	right_panel_canvas.visible = false
	if(selectedPanel):
		selectedPanel.setSelected(false)
		selectedPanel = null

func _on_CloseButton_pressed():
	emit_signal("onClosePressed", self)
