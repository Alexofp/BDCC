extends ImmediateGeometry
class_name CurveRenderer

export (NodePath) var anchorPath
export (Vector3) var anchorOffset := Vector3(0,0,0)

export (float, 0.001, 10) var width := 1.0
export (float, 0.1, 1) var flex := 0.5
export (float, 0.1, 10) var sag_static := 1.0
export (float, 0.1, 20) var expected_length := 5.0
export (float, 0.1, 20) var max_sagging_length := 2.5
export (float, 0.0, 1) var sag_from_length := 0.5

var anchor: Spatial
var curve := Curve3D.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	curve.clear_points()
	curve.add_point(Vector3(0,0,0))
	curve.add_point(Vector3(-1,0,0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(!self.visible or (!is_instance_valid(anchor) and anchorPath == null)):
		return
	if(!is_instance_valid(anchor)):
		anchor = get_node_or_null(anchorPath)
		anchorPath = null #null out the path to avoid checking every frame
			
	var anchor_point = self.to_local(anchor.to_global(anchorOffset))
	var mid_point = (anchor_point * 0.5) 
	var down_vec = (self.to_local(Vector3(0,-1,0)) - self.to_local(Vector3(0,0,0))).normalized()
	var unused_length = expected_length - anchor_point.length()
	if(unused_length > max_sagging_length):
		unused_length = max_sagging_length
	if(unused_length < 0):
		unused_length = 0
	var mid_point_sagged = mid_point + (down_vec * sag_static) + (down_vec * sag_from_length * unused_length)
	curve.set_point_out(0, mid_point_sagged * flex)
	curve.set_point_in(1, (mid_point_sagged - anchor_point) * flex)
	curve.set_point_position(1, anchor_point)
	
	var points = curve.tessellate()
	
	clear()
	begin(Mesh.PRIMITIVE_TRIANGLES)
	
	#var start_to_end = -anchor_point.normalized()
	
	var first_tangent = (points[1] - points[0]).normalized()
	var first_normal = Vector3(0,0,1)#first_tangent.cross(start_to_end).normalized()
	var first_other_normal = first_normal.cross(first_tangent).normalized()
	if(first_other_normal.y > 0):
		first_other_normal *= -1
	if(first_other_normal.z < 0):
		first_other_normal.z *= -1
	#set_normal(first_normal)
	#set_uv(Vector2(0,1))
	#add_vertex(Vector3(0,0,0) - first_other_normal * (width * 0.5))
	#set_normal(first_normal)
	#set_uv(Vector2(1,0))
	#add_vertex(Vector3(0,0,0) + first_other_normal * (width * 0.5))
	
	var dist = 0
	for i in range(1, points.size()):
		var prev_point = points[i - 1]
		var point = points[i]
		var diff = (point - prev_point)
		var length = diff.length()
		#
		var tangent = diff.normalized()
		#var normal = start_to_end.cross(tangent).normalized()
		var other_normal = first_normal.cross(tangent).normalized()
		if(other_normal.y > 0):
			other_normal *= -1
		set_normal(first_normal)
		set_uv(Vector2(0,dist))
		add_vertex(prev_point - other_normal * (width * 0.5))
		
		set_normal(first_normal)
		set_uv(Vector2(0,dist + length))
		add_vertex(point - other_normal * (width * 0.5))
		
		set_normal(first_normal)
		set_uv(Vector2(1,dist + length))
		add_vertex(point + other_normal * (width * 0.5))
		
		set_normal(first_normal)
		set_uv(Vector2(1,dist + length))
		add_vertex(point + other_normal * (width * 0.5))
		
		set_normal(first_normal)
		set_uv(Vector2(1,dist))
		add_vertex(prev_point + other_normal * (width * 0.5))
		
		set_normal(first_normal)
		set_uv(Vector2(0,dist))
		add_vertex(prev_point - other_normal * (width * 0.5))
		
		dist += length
	end()
