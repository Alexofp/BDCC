tool
extends Node

export var copyy = false setget doCopy

func doCopy(a):
	if(!a):
		return
	
	var doll = $"../Doll3D"
	
	var text = 'playAnimation(StageScene.Solo, "custom", {anim='+to_json(calculateDifferences(doll))+'  })'
	OS.clipboard = text
	

func calculateDifferences(doll):
	var skeleton:Skeleton = doll.get_node("DollSkeleton").get_node("Doll3D/Skeleton")
	
	var result = {}
	var ini = Transform.IDENTITY
	
	for boneID in range(skeleton.get_bone_count()):
		var boneName = skeleton.get_bone_name(boneID)
		
		var pose:Transform = skeleton.get_bone_pose(boneID)
		if(pose != ini):
			var stuff = {}
			if(pose.origin != ini.origin && pose.origin.length()>0.001):
				stuff["p"] = [Util.roundF(pose.origin.x, 2), Util.roundF(pose.origin.y, 2), Util.roundF(pose.origin.z, 2)]
			if(pose.basis.get_rotation_quat() != ini.basis.get_rotation_quat()):
				var euler = pose.basis.get_euler()
				stuff["a"] = [Util.roundF(euler.x, 2), Util.roundF(euler.y, 2), Util.roundF(euler.z, 2)]
			#print(pose)
			result[boneName] = stuff
	
	return result
