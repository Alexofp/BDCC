extends Node2D
class_name Limb

var outlineMaterial = preload("res://Player/Limbs/OutlineMaterial.tres")
export(bool) var addOutline = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$RigSkeleton.queue_free()
	$TestLimbs.queue_free()
	$References.queue_free()
	
	# https://github.com/godotengine/godot/issues/35726
	for thing in get_children():
		if(thing is Polygon2D):
			VisualServer.canvas_item_set_custom_rect(thing.get_canvas_item(), true, Rect2(Vector2.ZERO,Vector2(1000,1000)))

func applySkeleton(_skeleton: Skeleton2D):
	var toadd = []
	for N in get_children():
		if(N is Polygon2D):
			N.set_skeleton(_skeleton.get_path())
			if(addOutline):
				var outlineN: Node2D = N.duplicate()
				
				outlineN.self_modulate = Color.black
				outlineN.z_index -= 1
				outlineN.material = outlineMaterial
				
				# https://github.com/godotengine/godot/issues/35726
				VisualServer.canvas_item_set_custom_rect(outlineN.get_canvas_item(), true, Rect2(Vector2.ZERO,Vector2(1000,1000)))
				
				toadd.append(outlineN)
	for outlineN in toadd:
		add_child(outlineN)
