extends RigidBody2D


export(NodePath) var bonePath
var bone: Bone2D
onready var origPos = global_position
var posDiff: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	
	bone = get_node(bonePath)
	if(bone):
		posDiff = bone.global_position - global_position

func _process(_delta):
	if(!bone):
		return
	
	bone.global_position = Vector2((origPos.x * 0.8 + global_position.x * 0.2), global_position.y) + posDiff

func _physics_process(_delta):
	var force = (origPos - global_position)*_delta
	apply_central_impulse(force*Vector2(1000.0, 100.0))
