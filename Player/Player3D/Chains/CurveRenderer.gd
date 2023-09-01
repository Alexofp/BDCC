extends ImmediateGeometry
class_name CurveRenderer

export (NodePath) var anchorPath
export (Vector3) var anchorOffset := Vector3(0,0,0)
export (NodePath) var originPath 	#if unset, origin defaults to self
export (Vector3) var originOffset := Vector3(0,0,0)

export (float, 0.001, 10) var width := 1.0
export (float, 0.1, 1) var flex := 0.5
export (float, 0.1, 10) var sag_static := 1.0
export (float, 0.1, 20) var expected_length := 5.0
export (float, 0.1, 20) var max_sagging_length := 2.5
export (float, 0.0, 1) var sag_from_length := 0.5

var anchor: Spatial
var origin: Spatial
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
		
	#check for and assign anchor and origin	
	if(!is_instance_valid(anchor)):
		anchor = get_node_or_null(anchorPath)
		anchorPath = null #null out the path to avoid checking every frame
	if(!is_instance_valid(origin)):
		if(originPath != ""):
			origin = get_node_or_null(originPath)
			if(origin == null):
				origin = self
		else:
			origin = self
		originPath = null #null out the path to avoid checking every frame
	
	#calculate bezier curve points
	var origin_point = self.to_local(origin.to_global(originOffset))
	var anchor_point = self.to_local(anchor.to_global(anchorOffset))
	var mid_point = ((origin_point + anchor_point) * 0.5) 
	var down_vec = (self.to_local(Vector3(0,-1,0)) - self.to_local(Vector3(0,0,0))).normalized()
	var unused_length = expected_length - anchor_point.length()
	if(unused_length > max_sagging_length):
		unused_length = max_sagging_length
	if(unused_length < 0):
		unused_length = 0
	var mid_point_sagged = mid_point + (down_vec * sag_static) + (down_vec * sag_from_length * unused_length)
	curve.set_point_position(0, origin_point)
	curve.set_point_out(0, mid_point_sagged * flex)
	curve.set_point_in(1, (mid_point_sagged - anchor_point) * flex)
	curve.set_point_position(1, anchor_point)
	
	var points = curve.tessellate()
	
	#turn curve into a strip by offsetting the points by half-width in each direction
	var camera_normal = Vector3(0,0,1)
	var topPoints = [points.size()]
	var botPoints = [points.size()]
	
	topPoints[0] = points[0]
	botPoints[0] = points[0]
	
	for i in range(1, points.size()):
		var prev_point = points[i - 1]
		var point = points[i]
		var diff = (point - prev_point)
		var tangent = diff.normalized()
		var curve_normal = camera_normal.cross(tangent).normalized()
		
		var prev_pointTop = prev_point + (curve_normal * (width * 0.5))
		var prev_pointBot = prev_point - (curve_normal * (width * 0.5))
		if(i > 1):
			topPoints[i - 1] = (topPoints[i - 1] + prev_pointTop) * 0.5
			botPoints[i - 1] = (botPoints[i - 1] + prev_pointBot) * 0.5
		else:
			topPoints[i - 1] = prev_pointTop
			botPoints[i - 1] = prev_pointBot
		
		var pointTop = point + (curve_normal * (width * 0.5))
		var pointBot = point - (curve_normal * (width * 0.5))
		topPoints.append(pointTop)
		botPoints.append(pointBot)
	
	#create mesh
	clear()
	begin(Mesh.PRIMITIVE_TRIANGLES)
	
	var dist = 0
	for i in range(1, points.size()):
		var diff = points[i] - points[i - 1]
		var length = diff.length()
			
		#tri 1
		set_normal(camera_normal)
		set_uv(Vector2(0,dist))
		add_vertex(botPoints[i - 1])
		set_normal(camera_normal)
		set_uv(Vector2(0,dist + length))
		add_vertex(botPoints[i])
		set_normal(camera_normal)
		set_uv(Vector2(1,dist + length))
		add_vertex(topPoints[i])
		
		#tri 2
		set_normal(camera_normal)
		set_uv(Vector2(1,dist + length))
		add_vertex(topPoints[i])
		set_normal(camera_normal)
		set_uv(Vector2(1,dist))
		add_vertex(topPoints[i - 1])
		set_normal(camera_normal)
		set_uv(Vector2(0,dist))
		add_vertex(botPoints[i - 1])
		
		dist += length
	
	#finalize mesh
	end()
