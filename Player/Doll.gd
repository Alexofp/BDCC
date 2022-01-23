extends Node2D
class_name Doll
#var a= 0
export(String, "Flat", "Curvy") var breastsType = "Flat"
export(String, "Human", "Digi") var legsType = "Human"
export(String, "Human") var armsType = "Human"
export(String, "Human", "Cat") var headType = "Human"
export(String, "Human", "Cat") var earsType = "Human"
export(String, "Bald", "Ponytail", "Ferri") var hairType = "Bald"
export(String, "Nothing", "Cat", "Dragon") var tailType = "Nothing"
#onready var breastsNode = $BreastsNode

const breastsList = {
	"Flat": "res://Player/Limbs/breasts/BreastsFlat.tscn",
	"Curvy": "res://Player/Limbs/breasts/BreastsCurvy.tscn"
}
const legsList = {
	"Human": "res://Player/Limbs/leg/HumanLeg.tscn",
	"Digi": "res://Player/Limbs/leg/DigiLeg.tscn"
}
const armsList = {
	"Human": "res://Player/Limbs/arm/HumanArms.tscn"
}
const headList = {
	"Human": "res://Player/Limbs/head/HumanHead.tscn",
	"Cat": "res://Player/Limbs/head/CatHead.tscn"
}
const earsList = {
	"Human": "res://Player/Limbs/ear/HumanEars.tscn",
	"Cat": "res://Player/Limbs/ear/CatEars.tscn" 
}
const hairList = {
	"Bald": "res://Player/Limbs/hair/HairBase.tscn",
	"Ponytail": "res://Player/Limbs/hair/PonytailHair.tscn",
	"Ferri": "res://Player/Limbs/hair/FerriHair.tscn"
}
const tailList = {
	"Nothing": "res://Player/Limbs/tail/TailBase.tscn",
	"Cat": "res://Player/Limbs/tail/CatTail.tscn",
	"Dragon": "res://Player/Limbs/tail/DragonTail.tscn"
}
onready var skeleton = $Skeleton2D
onready var retargetedSkeleton = $RetargetedSkeleton

var skeletonNodes = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	#set_breasts(breastsType)
	saveOffsets(skeleton)
	#$AnimationPlayer.play("Test")
	set_limb("BreastsNode", breastsType, breastsList)
	set_limb("LegsNode", legsType, legsList)
	set_limb("ArmsNode", armsType, armsList)
	set_limb("HeadNode", headType, headList)
	set_limb("EarsNode", earsType, earsList)
	set_limb("HairNode", hairType, hairList)
	set_limb("TailNode", tailType, tailList)

func saveOffsets(node: Node2D):
	if(node is Bone2D):
		var bonename = node.name

		skeletonNodes[bonename] = node
	
	for n in node.get_children():
		saveOffsets(n)

func applyOffset(node: Node2D):
	if(node is Bone2D):
		var info = skeletonNodes[node.name]
		
		node.position = info.position - info.rest.get_origin() + node.rest.get_origin()#+ info[0]
		node.rotation_degrees = info.rotation_degrees - info.rest.get_rotation() + node.rest.get_rotation()# info[1]
		
	for n in node.get_children():
		applyOffset(n)

func set_limb(_node, _type, _list):
#func set_breasts(_type):
	#print("Trying "+_type)
	var limb
	if(_list.has(_type)):
		limb = load(_list[_type]).instance()
	
	if(!limb):
		print("Error: Couldn't find limb with type "+_type)
		return
	
	Util.delete_children(get_node(_node))
	get_node(_node).add_child(limb)
	limb.set_owner(get_tree().edited_scene_root)
	limb.applySkeleton(retargetedSkeleton)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	applyOffset(retargetedSkeleton)
#	a += delta
	#$Skeleton2D/Hip/LLeg/LLLeg.rest.origin.x = sin(a)*50 - 200
	#$Skeleton2D/Hip/LLeg/LLLeg.rotation_degrees = 90

func loadFromPlayer(player: Player):
	if(player.hasBodypart(BodypartSlot.Legs)):
		legsType = player.getBodypart(BodypartSlot.Legs)._getDollType()
		set_limb("LegsNode", legsType, legsList)
	else:
		printerr("Error: player has no legs?")
		
	if(player.hasBodypart(BodypartSlot.Breasts)):
		breastsType = player.getBodypart(BodypartSlot.Breasts)._getDollType()
		set_limb("BreastsNode", breastsType, breastsList)
	else:
		printerr("Error: player has no breasts? (even flat ones?)")

	if(player.hasBodypart(BodypartSlot.Hair)):
		hairType = player.getBodypart(BodypartSlot.Hair)._getDollType()
		set_limb("HairNode", hairType, hairList)
	else:
		printerr("Error: player has no hair?")
