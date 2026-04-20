#tool
extends Control
class_name CurveEditorCustom

var _curve: Curve

const ASPECT_RATIO: float = 2.0 / 13.0
const MIN_X: float = 0.0
const MAX_X: float = 1.0

const BASE_POINT_RADIUS = 4
const BASE_HOVER_RADIUS = 10
const BASE_TANGENT_RADIUS = 3
const BASE_TANGENT_HOVER_RADIUS = 8
const BASE_TANGENT_LENGTH = 36

enum GrabMode { NONE, ADD, MOVE }
enum TangentIndex { NONE = -1, LEFT = 0, RIGHT = 1 }

var point_radius: int = BASE_POINT_RADIUS
var hover_radius: int = BASE_HOVER_RADIUS
var tangent_radius: int = BASE_TANGENT_RADIUS
var tangent_hover_radius: int = BASE_TANGENT_HOVER_RADIUS
var tangent_length: int = BASE_TANGENT_LENGTH

var selected_index: int = -1
var hovered_index: int = -1
var selected_tangent_index: int = TangentIndex.NONE
var hovered_tangent_index: int = TangentIndex.NONE

var grabbing: int = GrabMode.NONE
var initial_grab_pos: Vector2
var initial_grab_index: int
var initial_grab_left_tangent: float
var initial_grab_right_tangent: float

var snap_enabled: bool = false
var snap_count: int = 10

var _world_to_view: Transform2D

var _editor_scale: float = 1.0

func _ready() -> void:
	focus_mode = Control.FOCUS_ALL
	#clip_contents = true
	rect_clip_content = true
	
	_editor_scale = 1.0#EditorInterface.get_editor_scale()
	
	if _curve == null:
		_curve = Curve.new()
		_curve.connect("range_changed", self, "_on_curve_changed")
		#_curve.range_changed.connect(_on_curve_changed)
		
func _on_curve_changed() -> void:
	update() # queue_redraw()
	if selected_index >= _curve.get_point_count():
		set_selected_index(-1)
		
func get_data() -> Curve:
	return _curve
	
func set_curve(curve: Curve):
	_curve = curve
	update() # queue_redraw()


func _get_minimum_size() -> Vector2:
	var size := rect_size
	return Vector2(64, max(35, size.x * ASPECT_RATIO) * 1.0)

func roundi(_num) -> int:
	return int(round(_num))

func _notification(what: int) -> void:
	match what:
		NOTIFICATION_MOUSE_EXIT:
			if hovered_index != -1 or hovered_tangent_index != TangentIndex.NONE:
				hovered_index = -1
				hovered_tangent_index = TangentIndex.NONE
				set_selected_index(-1)
				update() # queue_redraw()
				
			#if selected_index != -1 and grabbing != GrabMode.NONE:
				# FIXME: If the mouse moves out we want to clear out hover, but holding left click causes an error
			#	grabbing = GrabMode.NONE
			#	set_selected_index(-1)
			#	update() # queue_redraw()

		10000, NOTIFICATION_THEME_CHANGED:
			var gizmo_scale: int = 1 # EditorInterface.get_editor_settings().get_setting(
					# "interface/touchscreen/scale_gizmo_handles")
			var theme_scale = 1.0#get_theme_default_base_scale()

			point_radius = roundi(BASE_POINT_RADIUS * theme_scale * gizmo_scale)
			hover_radius = roundi(BASE_HOVER_RADIUS * theme_scale * gizmo_scale)
			tangent_radius = roundi(BASE_TANGENT_RADIUS * theme_scale * gizmo_scale)
			tangent_hover_radius = roundi(BASE_TANGENT_HOVER_RADIUS * theme_scale * gizmo_scale)
			tangent_length = roundi(BASE_TANGENT_LENGTH * theme_scale * gizmo_scale)

		NOTIFICATION_DRAW:
			_draw()

		NOTIFICATION_VISIBILITY_CHANGED:
			if visible == false:
				grabbing = GrabMode.NONE

func clampVec2(_vec:Vector2, _vecMin:Vector2, _vecMax:Vector2) -> Vector2:
	return Vector2(clamp(_vec.x, _vecMin.x, _vecMax.x), clamp(_vec.y, _vecMin.y, _vecMax.y))

func snappedf(x: float, step: float) -> float:
	if step == 0.0:
		return x
	return step * round(x / step)

func _gui_input(event: InputEvent) -> void:
	if _curve == null:
		return

	#var is_command_or_control_pressed: bool = false
	
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_DELETE:
			if selected_tangent_index != TangentIndex.NONE:
				toggle_linear(selected_index, selected_tangent_index)
			elif selected_index != -1:
				if grabbing == GrabMode.ADD:
					remove_point(selected_index)
					set_selected_index(-1)
				else:
					remove_point(selected_index)
			
				grabbing = GrabMode.NONE
				hovered_index = -1
				hovered_tangent_index = TangentIndex.NONE
			
			accept_event()
		
		if event.scancode == KEY_SHIFT or event.scancode == KEY_ALT:
			update() # queue_redraw()  # redraw to show the axes or constraints
	
	if event is InputEventMouseButton and event.pressed:
		var mpos: Vector2 = event.position

		if event.button_index == BUTTON_RIGHT or event.button_index == BUTTON_MIDDLE:
			if event.button_index == BUTTON_RIGHT and grabbing == GrabMode.MOVE:
				_curve.set_point_value(selected_index, initial_grab_pos.y)
				_curve.set_point_offset(selected_index, initial_grab_pos.x)
				set_selected_index(initial_grab_index)
				hovered_index = get_point_at(mpos)
				grabbing = GrabMode.NONE
			else:
				# Remove a point or make a tangent linear
				selected_tangent_index = get_tangent_at(mpos)
				if selected_tangent_index != TangentIndex.NONE:
					toggle_linear(selected_index, selected_tangent_index)
				else:
					var point_to_remove: int = get_point_at(mpos)
					if point_to_remove == -1:
						set_selected_index(-1)
					else:
						if grabbing == GrabMode.ADD:
							_curve.remove_point(point_to_remove)
							set_selected_index(-1)
						else:
							remove_point(point_to_remove) 
							
						hovered_index = get_point_at(mpos)
						grabbing = GrabMode.NONE
		
		# SELECTING OR CREATING POINTS
		if event.button_index == BUTTON_LEFT:
			if grabbing == GrabMode.NONE:
				selected_tangent_index = get_tangent_at(mpos)
				if selected_tangent_index == TangentIndex.NONE:
					set_selected_index(get_point_at(mpos))
				
				update() # queue_redraw()
		
			if selected_index != -1:
				grabbing = GrabMode.MOVE
				initial_grab_pos = _curve.get_point_position(selected_index)
				initial_grab_index = selected_index
				
				if selected_index > 0:
					initial_grab_left_tangent = _curve.get_point_left_tangent(selected_index)
				if selected_index < _curve.get_point_count() - 1:
					initial_grab_right_tangent = _curve.get_point_right_tangent(selected_index)
					
			elif grabbing == GrabMode.NONE:
				var new_pos: Vector2 = clampVec2(get_world_pos(mpos), Vector2(0, _curve.min_value), Vector2(1.0, _curve.max_value))
				if snap_enabled or Input.is_key_pressed(KEY_CONTROL):#event.is_command_or_control_pressed():
					new_pos.x = snappedf(new_pos.x, 1.0 / snap_count)
					new_pos.y = snappedf(new_pos.y, 1.0 / snap_count)
					
				new_pos.x = get_offset_without_collision(selected_index, new_pos.x, mpos.x >= get_view_pos(new_pos).x)
		
				var new_idx: int = _curve.add_point(new_pos)
				set_selected_index(new_idx)
				grabbing = GrabMode.ADD
				initial_grab_pos = new_pos

	# Tangents
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and !event.pressed:
		if selected_tangent_index != TangentIndex.NONE:
			# Finish moving the tangent control
			if selected_index == 0:
				set_point_right_tangent(selected_index, _curve.get_point_right_tangent(selected_index))
			elif selected_index == _curve.get_point_count() - 1:
				set_point_left_tangent(selected_index, _curve.get_point_left_tangent(selected_index))
			else:
				set_point_tangents(selected_index, _curve.get_point_left_tangent(selected_index), _curve.get_point_right_tangent(selected_index))
			grabbing = GrabMode.NONE
		elif grabbing == GrabMode.MOVE:
			set_point_position(selected_index, _curve.get_point_position(selected_index))
			grabbing = GrabMode.NONE
		elif grabbing == GrabMode.ADD:
			# Finish inserting the new point, remove the temporary point
			var new_pos: Vector2 = _curve.get_point_position(selected_index)
			_curve.remove_point(selected_index)
			add_point(new_pos)
			grabbing = GrabMode.NONE
		
		update() # queue_redraw()
			
	if event is InputEventMouseMotion:
		var mpos: Vector2 = event.position
		
		if grabbing != GrabMode.NONE:
			if selected_index != -1:
				# Dragging a point
				if selected_tangent_index == TangentIndex.NONE:
					var new_pos: Vector2 = clampVec2(get_world_pos(mpos), Vector2(0.0, _curve.min_value), Vector2(1.0, _curve.max_value))
					
					if snap_enabled or Input.is_key_pressed(KEY_CONTROL):#event.is_command_or_control_pressed():
						new_pos.x = snappedf(new_pos.x, 1.0 / snap_count)
						new_pos.y = snappedf(new_pos.y - _curve.min_value, (_curve.max_value - _curve.min_value) / snap_count) + _curve.min_value
					
					if Input.is_key_pressed(KEY_SHIFT):
						var initial_mpos: Vector2 = get_view_pos(initial_grab_pos)
						if abs(mpos.x - initial_mpos.x) > abs(mpos.y - initial_mpos.y):
							new_pos.y = initial_grab_pos.y
						else:
							new_pos.x = initial_grab_pos.x
					
					if Input.is_key_pressed(KEY_ALT):#event.is_alt_pressed():
						var prev_point_offset: float = (_curve.get_point_position(selected_index - 1).x + 0.00001) if (selected_index > 0) else 0.0
						var next_point_offset: float = (_curve.get_point_position(selected_index + 1).x - 0.00001) if (selected_index < _curve.get_point_count() - 1) else 1.0
						new_pos.x = clamp(new_pos.x, prev_point_offset, next_point_offset)
						
					new_pos.x = get_offset_without_collision(selected_index, new_pos.x, mpos.x >= get_view_pos(new_pos).x)
					
					var i: int = _curve.set_point_offset(selected_index, new_pos.x)
					hovered_index = i
					set_selected_index(i)
					
					new_pos.y = clamp(new_pos.y, _curve.min_value, _curve.max_value)
					_curve.set_point_value(i, new_pos.y)
					
				else:
					# Drag a tangent
					var new_pos: Vector2 = _curve.get_point_position(selected_index)
					var control_pos: Vector2 = get_world_pos(mpos)
					
					var dir: Vector2 = (control_pos - new_pos).normalized()
					var tangent = dir.y / (max(dir.x, 0.00001) if dir.x > 0 else min(dir.x, -0.00001))
					
					hovered_tangent_index = selected_tangent_index
					
					if selected_tangent_index == TangentIndex.LEFT:
						_curve.set_point_left_tangent(selected_index, tangent)
					
						if selected_index != _curve.get_point_count() - 1  and _curve.get_point_right_mode(selected_index) != _curve.TANGENT_LINEAR:
							_curve.set_point_right_tangent(selected_index, initial_grab_right_tangent if Input.is_key_pressed(KEY_SHIFT) else tangent)
					else:
						_curve.set_point_right_tangent(selected_index, tangent)
						
						if selected_index != 0 and _curve.get_point_left_tangent(selected_index) != _curve.TANGENT_LINEAR:
							_curve.set_point_left_tangent(selected_index, initial_grab_left_tangent if Input.is_key_pressed(KEY_SHIFT) else tangent)
					
					update() # queue_redraw()
		else:
			# Grab mode is none, so do hovering logic
			hovered_index = get_point_at(mpos)
			hovered_tangent_index = get_tangent_at(mpos)
			update() # queue_redraw()

var someFont :Font = preload("res://Fonts/smallconsolefont.tres")
func update_view_transform() -> void:
	var font: Font = someFont#get_theme_font("name", "Label")
	#var font_size: int = get_theme_font_size("font_size", "Label")
	
	var margin = font.get_height() + 2 * _editor_scale

	var min_y: float = _curve.min_value
	var max_y: float = _curve.max_value

	var world_rect: Rect2 = Rect2(MIN_X, min_y, MAX_X, max_y - min_y)
	var view_margin: Vector2 = Vector2(margin, margin)
	var view_size: Vector2 = rect_size - view_margin * 2
	var view_scale = view_size / world_rect.size
	
	var world_trans: Transform2D
	
	world_trans = world_trans.translated(-world_rect.position - Vector2(0, world_rect.size.y))
	#world_trans = world_trans.translated_local(-world_rect.position - Vector2(0, world_rect.size.y))
	world_trans = world_trans.scaled(Vector2(view_scale.x, -view_scale.y))
	 
	var view_trans: Transform2D
	#view_trans = view_trans.translated_local(view_margin)
	view_trans = view_trans.translated(view_margin)
	
	_world_to_view = view_trans * world_trans


func _curve_changed() -> void:
	update() # queue_redraw()
	
	if selected_index >= _curve.get_point_count():
		set_selected_index(-1)


func get_view_pos(world_pos: Vector2) -> Vector2:
	# This is wrong
	return _world_to_view * world_pos


func get_world_pos(view_pos: Vector2) -> Vector2:
	# This is likely wrong
	return _world_to_view.affine_inverse() * view_pos


func get_point_at(pos: Vector2) -> int:
	if _curve == null:
		return -1
	
	var hover_rect: Rect2 = Rect2(pos, Vector2(0, 0)).grow(hover_radius)
	var closest_idx = -1
	var closest_dist_squared: float = hover_radius * hover_radius * 2
	
	for i in range(_curve.get_point_count()):
		var p: Vector2 = get_view_pos(_curve.get_point_position(i))
		if hover_rect.has_point(p) && p.distance_squared_to(pos) < closest_dist_squared:
			closest_dist_squared = p.distance_squared_to(pos)
			closest_idx = i
	
	#for i in range(_curve.get_point_count()):
	#	var p: Vector2 = get_view_pos(_curve.get_point_position(i))
	
	return closest_idx


func get_tangent_at(pos: Vector2) -> int:
	if _curve == null or selected_index < 0:
		return TangentIndex.NONE

	var hover_rect: Rect2 = Rect2(pos, Vector2(0, 0)).grow(tangent_hover_radius)

	if selected_index != 0:
		var control_pos: Vector2 = get_tangent_view_pos(selected_index, TangentIndex.LEFT);
		if hover_rect.has_point(control_pos):
			return TangentIndex.LEFT

	if selected_index != _curve.get_point_count() - 1:
		var control_pos: Vector2 = get_tangent_view_pos(selected_index, TangentIndex.RIGHT)
		if hover_rect.has_point(control_pos):
			return TangentIndex.RIGHT

	return TangentIndex.NONE;


func get_offset_without_collision(current_index: int, offset: float, prioritize_right: bool) -> float:
	var safe_offset: float = offset
	var prioritizing_right: bool = prioritize_right
	
	for i in range(_curve.get_point_count()):
		if i == current_index:
			continue
			
		if _curve.get_point_position(i).x > safe_offset:
			break
			
		if _curve.get_point_position(i).x == safe_offset:
			if prioritizing_right:
				safe_offset += 0.00001
				if safe_offset > 1.0:
					safe_offset = 1.0
					prioritizing_right = false
			else:
				safe_offset -= 0.00001
				if safe_offset < 0.0:
					safe_offset = 0.0
					prioritizing_right = true
			
			i = -1
			
	
	return safe_offset


func add_point(pos: Vector2) -> void:
	var new_idx: int = _curve.add_point(pos)
	set_selected_index(new_idx)
	
	
	update() # queue_redraw()


func remove_point(index: int) -> void:
	#var cur_pos: Vector2 = _curve.get_point_position(index)
	#var old_pos: Vector2 = initial_grab_pos if grabbing == GrabMode.MOVE else cur_pos

	var new_selected_index: int = selected_index
	
	if new_selected_index > index:
		new_selected_index = -1
	elif new_selected_index == index:
		new_selected_index = -1
		
	_curve.remove_point(index)
	set_selected_index(new_selected_index)
		
	update() # queue_redraw()


func set_point_position(index: int, pos: Vector2) -> void:
	if initial_grab_pos == pos:
		return
		
	_curve.set_point_value(index, initial_grab_pos.y)
	_curve.set_point_offset(index, initial_grab_pos.x)

	_curve.set_point_value(initial_grab_index, pos.y)
	_curve.set_point_offset(initial_grab_index, pos.x)
	set_selected_index(index)



func set_point_tangents(index: int, left: float, right: float) -> void:
	if initial_grab_left_tangent == left:
		set_point_right_tangent(index, right)
		return
	elif initial_grab_right_tangent == right:
		set_point_left_tangent(index, left)
		return

	_curve.set_point_left_tangent(index, initial_grab_left_tangent)
	_curve.set_point_right_tangent(index, initial_grab_right_tangent)
	
	_curve.set_point_left_tangent(index, left)
	_curve.set_point_right_tangent(index, right)
	set_selected_index(index)
	


func set_point_left_tangent(index: int, tangent: float) -> void:
	if initial_grab_left_tangent == tangent:
		return

	_curve.set_point_left_tangent(index, initial_grab_left_tangent)
	
	_curve.set_point_left_tangent(index, tangent)
	set_selected_index(index)

func set_point_right_tangent(index: int, tangent: float) -> void:
	if initial_grab_right_tangent == tangent:
		return

	_curve.set_point_right_tangent(index, initial_grab_right_tangent)

	_curve.set_point_right_tangent(index, tangent)
	set_selected_index(index)

func toggle_linear(index: int, tangent: int) -> void:
	if tangent == TangentIndex.NONE:
		return
		
	var prev_mode = _curve.get_point_left_mode(index) if tangent == TangentIndex.LEFT else _curve.get_point_right_mode(index)
	var mode = _curve.TANGENT_FREE if prev_mode == _curve.TANGENT_LINEAR else _curve.TANGENT_LINEAR

	#var prev_angle: float = _curve.get_point_left_tangent(index) if tangent == TangentIndex.LEFT else _curve.get_point_right_tangent(index)
	
	if tangent == TangentIndex.LEFT:
		_curve.set_point_left_mode(index, mode)
	else:
		_curve.set_point_right_mode(index, mode)
		


func set_selected_index(index: int) -> void:
	if index != selected_index:
		selected_index = index
	
	update() # queue_redraw()


func _draw():
	if _curve == null:
		return
	
	var is_shift_pressed: bool = Input.is_key_pressed(KEY_SHIFT)
	#KEY_SHIFT
		
	update_view_transform()
	
	# Draw Style Box
	#draw_style_box(get_theme_stylebox("panel", "Tree"), Rect2(Vector2.ZERO, size))
	#draw_style_box(get_theme_stylebox("panel", "Tree"), Rect2(Vector2.ZERO, size))
	
	# Draw Grid
	draw_set_transform_matrix(_world_to_view)
	
	var min_edge: Vector2 = get_world_pos(Vector2(0, rect_size.y))
	var max_edge: Vector2 = get_world_pos(Vector2(rect_size.x, 0))
	
	# FIXME: Get editor theme colors, not GraphEdit, can't find how to get them
	var grid_color_primary: Color = Color.whitesmoke*Color(1, 1, 1, 0.25)#get_theme_color(&"mono_color", &"Editor") * Color(1, 1, 1, 0.25)
	var grid_color: Color = Color.gray*Color(1, 1, 1, 0.1)#get_theme_color(&"mono_color", &"Editor") * Color(1, 1, 1, 0.1)
	
	var grid_steps: Vector2 = Vector2(4, 2)
	var step_size: Vector2 = Vector2(1, (_curve.max_value - _curve.min_value)) / grid_steps
	
	draw_line(Vector2(min_edge.x, _curve.min_value), Vector2(max_edge.x, _curve.min_value), grid_color_primary)
	draw_line(Vector2(max_edge.x, _curve.max_value), Vector2(min_edge.x, _curve.max_value), grid_color_primary)
	draw_line(Vector2(0, min_edge.y), Vector2(0, max_edge.y), grid_color_primary)
	draw_line(Vector2(1, max_edge.y), Vector2(1, min_edge.y), grid_color_primary)

	for i in range(1, grid_steps.x):
		var x = i * step_size.x
		draw_line(Vector2(x, min_edge.y), Vector2(x, max_edge.y), grid_color)

	for i in range(1, grid_steps.y):
		var y = _curve.min_value + i * step_size.y
		draw_line(Vector2(min_edge.x, y), Vector2(max_edge.x, y), grid_color)
	
	# Draw Number Markings
	draw_set_transform_matrix(Transform2D())
	
	var font: Font = someFont#get_theme_font("font", "Label")
	#var font_size: int = get_theme_font_size("font_size", "Label")
	var font_height: float = font.get_height()
	# FIXME: Get Editor Font Color, not others
	var text_color: Color = Color.white#get_theme_color(&"font_color", &"Editor")

	for i in range(grid_steps.x + 1):
		var x = i * step_size.x;

		draw_string(
			font, 
			get_view_pos(Vector2(x - step_size.x / 2, _curve.min_value)) + Vector2(0, font_height - round(2 * _editor_scale)),
			str(Util.roundF(x, 2)),# String.num(x, 2), 
			#HORIZONTAL_ALIGNMENT_CENTER,
			#get_view_pos(Vector2(step_size.x, 0)).x, 
			#font_size, 
			text_color
		)
		#void draw_string(font: Font, position: Vector2, text: String, modulate: Color = Color( 1, 1, 1, 1 ), clip_w: int = -1)


	for i in range(grid_steps.y + 1):
		var y = _curve.min_value + i * step_size.y
		draw_string(
			font,
			get_view_pos(Vector2(0, y)) + Vector2(2, -2),
			str(Util.roundF(y, 2)),#String.num(y, 2),
			#HORIZONTAL_ALIGNMENT_LEFT,
			#-1,
			#font_size,
			text_color
		)
	
	# Draw Curve
	draw_set_transform_matrix(Transform2D(0, get_view_pos(Vector2(0, 0))))
	
	var theRange: float = _curve.max_value - _curve.min_value	
	var plot_scale: Vector2 = (get_view_pos(Vector2(1, _curve.max_value)) - get_view_pos(Vector2(0, _curve.min_value))) / Vector2(1, theRange)
	plot_curve_accurate(2.0, plot_scale)
	
	draw_set_transform_matrix(Transform2D())
	
	var point_color: Color = Color.cyan#get_theme_color(&"font_color", &"Editor")
	# Change this if you want to a different color for the hovered point
	var hovered_point_color: Color = point_color
	
	#Draw points
	for i in range(_curve.get_point_count()):
		var pos = get_view_pos(_curve.get_point_position(i))
		
		if selected_index != i:
			draw_rect(Rect2(pos, Vector2(0, 0)).grow(point_radius), point_color)
		if hovered_index == i and hovered_tangent_index == TangentIndex.NONE:
			draw_rect(
				Rect2(pos, Vector2(0, 0)).grow(hover_radius - round(3 * _editor_scale)),
				hovered_point_color,
				false,
				round(1 * _editor_scale)
			)
			
	# Draw selected points and tangents
	if selected_index >= 0:
		var point_pos: Vector2 = _curve.get_point_position(selected_index)
		var selected_point_color = Color.aquamarine#get_theme_color(&"accent_color", &"Editor")
		
		if grabbing == GrabMode.NONE || initial_grab_pos == point_pos || selected_tangent_index != TangentIndex.NONE:
			var selected_tangent_color = Color.darkcyan#get_theme_color(&"accent_color", &"Editor").darkened(0.25)
			var tangent_color = Color.darkblue#get_theme_color(&"font_color", &"Editor").darkened(0.25)
			
			if selected_index != 0:
				var control_pos: Vector2 = get_tangent_view_pos(selected_index, TangentIndex.LEFT)
				var left_tangent_color: Color = selected_tangent_color if (selected_tangent_index == TangentIndex.LEFT) else tangent_color
				
				draw_line(get_view_pos(point_pos), control_pos, left_tangent_color, 0.5 * _editor_scale, true)
				
				if _curve.get_point_left_mode(selected_index) == _curve.TANGENT_FREE:
					draw_circle(control_pos, tangent_radius, left_tangent_color)
				else:
					draw_rect(Rect2(control_pos, Vector2(0, 0)).grow(tangent_radius), left_tangent_color)
				
				# Hover Indicator
				if hovered_tangent_index == TangentIndex.LEFT or (hovered_tangent_index == TangentIndex.RIGHT and !is_shift_pressed and _curve.get_point_left_mode(selected_index) != _curve.TANGENT_LINEAR):
					draw_rect(
						Rect2(
							control_pos,
							Vector2(0, 0)).grow(tangent_hover_radius - round(3 * _editor_scale)),
						tangent_color,
						false,
						round(1 * _editor_scale)
					)
				
			if selected_index != _curve.get_point_count() - 1:
				var control_pos = get_tangent_view_pos(selected_index, TangentIndex.RIGHT)
				var right_tangent_color: Color = selected_tangent_color if selected_tangent_index == TangentIndex.RIGHT else tangent_color
				
				draw_line(get_view_pos(point_pos), control_pos, right_tangent_color, 0.5 * _editor_scale, true)
				
				if _curve.get_point_right_mode(selected_index) == _curve.TANGENT_FREE:
					draw_circle(control_pos, tangent_radius, right_tangent_color)
				else:
					draw_rect(Rect2(control_pos, Vector2(0, 0)).grow(tangent_radius), right_tangent_color)
					
				# Hover Indicator
				if hovered_tangent_index == TangentIndex.RIGHT or (hovered_tangent_index == TangentIndex.LEFT and !is_shift_pressed and _curve.get_point_right_mode(selected_index) != _curve.TANGENT_LINEAR):
					draw_rect(
						Rect2(
							control_pos,
							Vector2(0, 0)).grow(tangent_hover_radius - round(3 * _editor_scale)),
						tangent_color,
						false,
						round(1 * _editor_scale)
					)
					
		draw_rect(Rect2(get_view_pos(point_pos), Vector2(0, 0)).grow(point_radius), selected_point_color)

	# Draw Helper Text
	if selected_index > 0 and selected_index < _curve.get_point_count() - 1 and selected_tangent_index == TangentIndex.NONE and hovered_tangent_index != TangentIndex.NONE and !is_shift_pressed:
		#var width: float = rect_size.x - 50 * _editor_scale
		text_color.a *= 0.4;

#		draw_multiline_string(
#			font, 
#			Vector2(25 * _editor_scale, font_height - round(2 * _editor_scale)),
#			"Hold Shift to edit tangents individually",
#			#HORIZONTAL_ALIGNMENT_CENTER,
#			#width, 
#			#font_size, 
#			#-1,
#			text_color
#		)
	elif selected_index != -1 and selected_tangent_index == TangentIndex.NONE:
		var point_pos: Vector2 = _curve.get_point_position(selected_index)
		#var width: float = rect_size.x - 50 * _editor_scale
		text_color.a *= 0.8;

		draw_string(
			font, 
			Vector2(25 * _editor_scale, font_height - round(2 * _editor_scale)),
			"(%.2f, %.2f)" % [point_pos.x, point_pos.y], 
			#HORIZONTAL_ALIGNMENT_CENTER, 
			#width, 
			#font_size, 
			text_color
		)
	elif selected_index != -1 and selected_tangent_index != TangentIndex.NONE:
		#var width: float = rect_size.x - 50 * _editor_scale
		text_color.a *= 0.8
		var theta = rad2deg(atan(-1 * _curve.get_point_left_tangent(selected_index) if selected_tangent_index == TangentIndex.LEFT else _curve.get_point_right_tangent(selected_index)))

		draw_string(
			font,
			Vector2(25 * _editor_scale, font_height - round(2 * _editor_scale)),
			str(Util.roundF(theta, 1)) + " °", # String.num(theta, 1)
			#HORIZONTAL_ALIGNMENT_CENTER,
			#width,
			#font_size,
			text_color
		)

	# Draw temporary constraints and snapping axes.
	draw_set_transform_matrix(_world_to_view);

	if Input.is_key_pressed(KEY_ALT) && grabbing != GrabMode.NONE and selected_tangent_index == TangentIndex.NONE:
		var prev_point_offset: float = _curve.get_point_position(selected_index - 1).x if selected_index > 0 else 0.0
		var next_point_offset: float = _curve.get_point_position(selected_index + 1).x if selected_index < _curve.get_point_count() - 1 else 1.0

		draw_line(
			Vector2(prev_point_offset, _curve.min_value),
			Vector2(prev_point_offset, _curve.max_value),
			Color(point_color, 0.6)
		)
		draw_line(
			Vector2(next_point_offset, _curve.min_value),
			Vector2(next_point_offset, _curve.max_value),
			Color(point_color, 0.6)
		)

	if is_shift_pressed and grabbing != GrabMode.NONE and selected_tangent_index == TangentIndex.NONE:
		draw_line(
			Vector2(initial_grab_pos.x, _curve.min_value),
			Vector2(initial_grab_pos.x, _curve.max_value),
			Color.darkgreen#get_theme_color(&"axis_x_color", &"Editor").darkened(0.4)
		)
		draw_line(
			Vector2(0, initial_grab_pos.y),
			Vector2(1, initial_grab_pos.y),
			Color.darkmagenta#get_theme_color(&"axis_y_color", &"Editor").darkened(0.4)
		)


func get_tangent_view_pos(index: int, tangent: int) -> Vector2:
	var dir: Vector2
	if tangent == TangentIndex.LEFT:
		dir = -Vector2(1, _curve.get_point_left_tangent(index))
	else:
		dir = Vector2(1, _curve.get_point_right_tangent(index))

	var point_pos: Vector2 = _curve.get_point_position(index)
	var point_view_pos: Vector2 = get_view_pos(point_pos)
	var control_view_pos: Vector2 = get_view_pos(point_pos + dir)

	var distance_from_point: Vector2 = tangent_length * (control_view_pos - point_view_pos).normalized()
	var tangent_view_pos: Vector2 = point_view_pos + distance_from_point

	# Since the tangent is long, it might slip outside of the area of the editor for points close to the domain/range boundaries.
	# The code below shrinks the tangent control by up to 50% so it always stays inside the editor for points within the bounds.
	var fraction_inside: float = 1.0
	if distance_from_point.x != 0.0:
		fraction_inside = min(
			fraction_inside,
			((rect_size.x if distance_from_point.x > 0 else 0.0) - point_view_pos.x) / distance_from_point.x
		)
	if distance_from_point.y != 0.0:
		fraction_inside = min(
			fraction_inside,
			((rect_size.y if distance_from_point.y > 0 else 0.0) - point_view_pos.y) / distance_from_point.y
		)

	if fraction_inside < 1.0 and fraction_inside > 0.5:
		tangent_view_pos = point_view_pos + distance_from_point * fraction_inside

	return tangent_view_pos

		
func plot_curve_accurate(step: float, scaling: Vector2):
	var line_color: Color = Color.cadetblue#get_theme_color(&"font_color", &"Editor")
	
	if _curve.get_point_count() <= 1:
		var y: float = _curve.interpolate(0)# .sample(0)
		draw_line(Vector2(0, y) * scaling + Vector2(0.5, 0), Vector2(1.0, y) * scaling - Vector2(-1.5, 0), line_color)
		return
		
	var first_point = _curve.get_point_position(0)
	var last_point = _curve.get_point_position(_curve.get_point_count() - 1)
	
	# Edge Lines
	draw_line(Vector2(0, first_point.y) * scaling + Vector2(0.5, 0.0), first_point * scaling, line_color)
	draw_line(Vector2(MAX_X, last_point.y) * scaling - Vector2(-1.5, 0), last_point * scaling, line_color)
	
	for i in range(1, _curve.get_point_count()):
		var a = _curve.get_point_position(i - 1)
		var b = _curve.get_point_position(i)
		
		var pos = a
		var prev_pos = a
		
		var scaled_step = step / scaling.x
		var samples = (b.x - a.x) / scaled_step
		
		for j in range(1, samples):
			var x: float = float(j * scaled_step)
			pos.x = a.x + x
			pos.y = _curve.interpolate(pos.x)# .sample(pos.x)
			draw_line(prev_pos * scaling, pos * scaling, line_color, 1, true)
			prev_pos = pos
		
		draw_line(prev_pos * scaling, b * scaling, line_color, 1, true)
