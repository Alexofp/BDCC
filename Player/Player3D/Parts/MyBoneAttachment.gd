extends Spatial
class_name MyBoneAttachment

export(NodePath) var skeleton: NodePath
export(String) var boneId
var startTransform:Transform
var correctedTransform: Transform

func _ready():
	startTransform = transform
	var skeletonObject:Skeleton = get_node_or_null(skeleton)
	if(skeletonObject != null):
		var boneIdx = skeletonObject.find_bone(boneId)
		var boneTransform = skeletonObject.get_bone_global_pose(boneIdx)
		
		correctedTransform = (boneTransform.inverse() * startTransform)

func setSkeletonPath(skeletonPath: NodePath):
	skeleton = skeletonPath
	var skeletonObject:Skeleton = get_node_or_null(skeleton)
	if(skeletonObject != null):
		var boneIdx = skeletonObject.find_bone(boneId)
		var boneTransform = skeletonObject.get_bone_global_pose(boneIdx)
		
		correctedTransform = (boneTransform.inverse() * startTransform)

func _process(_delta):
	var skeletonObject:Skeleton = get_node_or_null(skeleton)
	if(skeletonObject != null):
		#var newt = skeletonObject.get_bone_global_pose(boneIdx)
		var boneIdx = skeletonObject.find_bone(boneId)
		transform = skeletonObject.get_bone_global_pose(boneIdx) * correctedTransform
