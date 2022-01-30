extends Node2D
class_name Doll

onready var skeleton = $Skeleton2D
onready var retargetedSkeleton = $RetargetedSkeleton

var skeletonNodes = {}
var limbs = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	$Catgirlexample.queue_free()
	saveBones(skeleton)

func saveBones(node: Node2D):
	if(node is Bone2D):
		var bonename = node.name

		skeletonNodes[bonename] = node
	
	for n in node.get_children():
		saveBones(n)

func applyOffsets(node: Node2D):
	if(node is Bone2D):
		var info = skeletonNodes[node.name]
		
		node.position = info.position - info.rest.get_origin() + node.rest.get_origin()
		node.rotation_degrees = info.rotation_degrees - info.rest.get_rotation() + node.rest.get_rotation()
		
	for n in node.get_children():
		applyOffsets(n)

func _process(_delta):
	applyOffsets(retargetedSkeleton)

func set_limb(slot, type):
	if(limbs.has(slot)):
		limbs[slot].queue_free()
		limbs.erase(slot)
	
	if(!LimbTypes.Registry.has(slot)):
		assert(false)
		return
	if(!LimbTypes.Registry[slot].has(type)):
		assert(false)
		return
		
	var limbScene: PackedScene = load(LimbTypes.Registry[slot][type])
	var limb: Limb = limbScene.instance()
	
	add_child(limb)
	limbs[slot] = limb
	limb.applySkeleton(retargetedSkeleton)

func remove_limb(slot):
	if(limbs.has(slot)):
		limbs[slot].queue_free()
		limbs.erase(slot)

func clear():
	for limbSlot in limbs.keys():
		var limb = limbs[limbSlot]
		limb.queue_free()
	limbs.clear()

func loadFromPlayer(player: Player):
	clear()
	
	var bodyparts = player.getBodyparts()
	for bodypartSlot in bodyparts:
		var bodypart: Bodypart = bodyparts[bodypartSlot]
		
		if(bodypart == null || bodypart.getLimbSlot() == null || bodypart._getDollType() == null):
			continue
		
		set_limb(bodypart.getLimbSlot(), bodypart._getDollType())
	
