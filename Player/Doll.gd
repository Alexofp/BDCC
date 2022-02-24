extends Node2D
class_name Doll

onready var skeleton = $Skeleton2D
onready var retargetedSkeleton = $RetargetedSkeleton
onready var animationTree = $AnimationTree

var skeletonNodes = {}
var limbs = {}
var limbsTypes = {}

signal onBodypartMouseEntered(who, what)
signal onBodypartMouseExited(who, what)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Catgirlexample.queue_free()
	saveBones(skeleton)
	animationTree.active = true

func setTargetSkeleton(newskeleton):
	if(newskeleton == null):
		saveBones(skeleton)
		return
	
	saveBones(newskeleton)

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
		if(n is Bone2D):
			applyOffsets(n)

func _process(_delta):
	applyOffsets(retargetedSkeleton)

func set_limb(slot, type):
	if(limbs.has(slot)):
		if(limbsTypes[slot] == type):
			return
		
		limbs[slot].queue_free()
		limbs.erase(slot)
		limbsTypes.erase(slot)
	
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
	limbsTypes[slot] = type
	limb.applySkeleton(retargetedSkeleton)

func remove_limb(slot):
	if(limbs.has(slot)):
		limbs[slot].queue_free()
		limbs.erase(slot)
		limbsTypes.erase(slot)

func clear():
	for limbSlot in limbs.keys():
		var limb = limbs[limbSlot]
		limb.queue_free()
	limbs.clear()
	limbsTypes.clear()

func loadFromPlayer(player: Player):
	clear()
	
	var bodyparts = player.getBodyparts()
	for bodypartSlot in bodyparts:
		var bodypart: Bodypart = bodyparts[bodypartSlot]
		
		if(bodypart == null || bodypart.getLimbSlot() == null || bodypart._getDollType() == null):
			continue
		
		set_limb(bodypart.getLimbSlot(), bodypart._getDollType())
	
func playAnimation(animation):
	var state_machine = animationTree["parameters/playback"]
	state_machine.travel(animation)


func _on_BoobsHitbox_mouse_entered():
	emit_signal("onBodypartMouseEntered", self, BodypartSlot.Breasts)


func _on_BoobsHitbox_mouse_exited():
	emit_signal("onBodypartMouseExited", self, BodypartSlot.Breasts)

func setTooltipsActive(a):
	if(a):
		$RetargetedSkeleton/Hip/Chest/BoobsHitbox.setIgnoreInput(false)
		$RetargetedSkeleton/Hip/Penis/PenisHitbox.setIgnoreInput(false)
		$RetargetedSkeleton/Hip/Chest/VaginaHitbox.setIgnoreInput(false)
		$RetargetedSkeleton/Hip/Chest/AnusHitbox.setIgnoreInput(false)
	else:
		$RetargetedSkeleton/Hip/Chest/BoobsHitbox.setIgnoreInput(true)
		$RetargetedSkeleton/Hip/Penis/PenisHitbox.setIgnoreInput(true)
		$RetargetedSkeleton/Hip/Chest/VaginaHitbox.setIgnoreInput(true)
		$RetargetedSkeleton/Hip/Chest/AnusHitbox.setIgnoreInput(true)

	


func _on_PenisHitbox_mouse_entered():
	emit_signal("onBodypartMouseEntered", self, BodypartSlot.Penis)


func _on_PenisHitbox_mouse_exited():
	emit_signal("onBodypartMouseExited", self, BodypartSlot.Penis)


func _on_VaginaHitbox_mouse_entered():
	emit_signal("onBodypartMouseEntered", self, BodypartSlot.Vagina)

func _on_VaginaHitbox_mouse_exited():
	emit_signal("onBodypartMouseExited", self, BodypartSlot.Vagina)


func _on_AnusHitbox_mouse_entered():
	emit_signal("onBodypartMouseEntered", self, BodypartSlot.Anus)

func _on_AnusHitbox_mouse_exited():
	emit_signal("onBodypartMouseExited", self, BodypartSlot.Anus)
