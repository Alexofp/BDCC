extends Position3D
class_name MyBoneAttachment

export(NodePath) var skeleton: NodePath
export(String) var boneId
var startTransform:Transform
var correctedTransform: Transform
var shouldScaleWithBone = true
var chainOffset := Vector3(0,0,0)

func getAllRestTransformsForBone(skeletonObject:Skeleton, boneIdx):
	var result = []
	var startIdx = boneIdx
	
	while(boneIdx >= 0):
		#print(skeletonObject.get_bone_name(boneIdx))
		if(startIdx != boneIdx):
			result.append(skeletonObject.get_bone_rest(boneIdx))
		
		boneIdx = skeletonObject.get_bone_parent(boneIdx)
	result.invert()
	
	var resultTranform = Transform.IDENTITY
	for tran in result:
		resultTranform = resultTranform * tran
	
	return resultTranform

func _ready():
	startTransform = transform
	if(!skeleton.is_empty()):
		setSkeletonPath(skeleton)
#	var skeletonObject:Skeleton = get_node_or_null(skeleton)
#	if(skeletonObject != null):
#		var boneIdx = skeletonObject.find_bone(boneId)
#		var boneTransform = getAllRestTransformsForBone(skeletonObject, boneIdx) * skeletonObject.get_bone_rest(boneIdx)#skeletonObject.get_bone_rest(boneIdx)
#
#		correctedTransform = (boneTransform.inverse() * startTransform)

func setSkeletonPath(skeletonPath: NodePath):
	skeleton = skeletonPath
	var skeletonObject:Skeleton = get_node_or_null(skeleton)
	if(skeletonObject != null):
		var boneIdx = skeletonObject.find_bone(boneId)
		var boneTransform = getAllRestTransformsForBone(skeletonObject, boneIdx) * skeletonObject.get_bone_rest(boneIdx)#skeletonObject.get_bone_rest(boneIdx)
		
		correctedTransform = (boneTransform.inverse() * startTransform)

func _process(_delta):
	var skeletonObject:Skeleton = get_node_or_null(skeleton)
	if(skeletonObject != null):
		#var newt = skeletonObject.get_bone_global_pose(boneIdx)
		var boneIdx = skeletonObject.find_bone(boneId)
		transform = skeletonObject.get_bone_global_pose(boneIdx) * correctedTransform
		if(!shouldScaleWithBone):
			scale = startTransform.basis.get_scale()
		#print(str(skeletonObject.get_bone_global_pose(boneIdx)))
		#print(str(skeletonObject.get_bone_rest(boneIdx)))
