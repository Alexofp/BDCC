tool
extends Polygon2D
export var convertMesh = false setget setTestThingie
export(NodePath) var spartial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func getBoneFullName(sk: Skeleton, boneid):
	var res = ""
	while(true):
		var boneName = sk.get_bone_name(boneid)
		var boneParent = sk.get_bone_parent(boneid)
		
		if(boneid == 0):
			break
		
		if(res != ""):
			res = boneName + "/" + res
		else:
			res = boneName
		
		boneid = boneParent
	return res

var globalBoneNames = []
func saveBones(node: Node2D, add: String):
	if(node is Bone2D):
		var bonename = node.name
		
		var mew
		if(add == ""):
			mew = bonename
		else:
			mew = add + "/" + bonename
		
		globalBoneNames.append(mew)
	
		for n in node.get_children():
			saveBones(n, mew)
	else:
		for n in node.get_children():
			saveBones(n, add)

func setTestThingie(newv):
	if(!newv):
		return
	
	globalBoneNames = []
	saveBones(get_parent().get_node("DollSkeleton"), "")
	
	var sp: Spatial = get_node(spartial)

	var mdt = MeshDataTool.new()
	mdt.create_from_surface(sp.get_node("Armature/Skeleton").get_child(0).mesh, 0)
	var sk:Skeleton = sp.get_node("Armature/Skeleton")
	
	clear_bones()
	polygon = PoolVector2Array([])
	uv = PoolVector2Array([])
	polygons.clear()
	
	var newPoses = []
	var newuvs = []
	var newpolygons = []
	for i in range(mdt.get_vertex_count()):
		var _pos = mdt.get_vertex(i) * 100.0
		_pos.y = -_pos.y
		var _bones = mdt.get_vertex_bones(i)
		var _uvs = mdt.get_vertex_uv(i)
		var _faces = mdt.get_vertex_faces(i)
		var _weigths = mdt.get_vertex_weights(i)
		
		for polygonID in _faces:
			if(polygonID >= newpolygons.size()):
				newpolygons.resize(polygonID + 1)
			if(newpolygons[polygonID] == null):
				newpolygons[polygonID] = []
			newpolygons[polygonID].append(i)
		
		newPoses.append(_pos)
		newuvs.append(_uvs * Vector2(128.0, 256.0))

	var newnewpolygons = []
	for p in newpolygons:
		newnewpolygons.append(PoolIntArray(p))
#	for f in range(mdt.get_face_count()):
#		var polygonArray = []
#		for ff in range(3):
#			var i = mdt.get_face_vertex(f, ff)
#			var _pos = mdt.get_vertex(i) * 100.0
#			_pos.y = -_pos.y
#			var _bones = mdt.get_vertex_bones(i)
#			var _uvs = mdt.get_vertex_uv(i)
#			var _faces = mdt.get_vertex_faces(i)
#			var _weigths = mdt.get_vertex_weights(i)
#
#			newPoses.append(_pos)
#			polygonArray.append(f*3 + ff)
#		newpolygons.append(PoolIntArray(polygonArray))
		
			
	polygon = PoolVector2Array(newPoses)
	uv = PoolVector2Array(newuvs)
	polygons = newnewpolygons

	var boneData = {}
	for bonename in globalBoneNames:
		boneData[bonename] = []
		
		for _mew in range(mdt.get_vertex_count()):
			boneData[bonename].append(0.0)
	
	for i in range(mdt.get_vertex_count()):
		var _pos = mdt.get_vertex(i)
		var _bones = mdt.get_vertex_bones(i)
		var _uvs = mdt.get_vertex_uv(i)
		var _faces = mdt.get_vertex_faces(i)
		var _weigths = mdt.get_vertex_weights(i)
		
		for w in range(_bones.size()):
			var _boneID = _bones[w]
			var _weightForThatBone = _weigths[w]
			
			var boneFullName = getBoneFullName(sk, _boneID)
			if(boneFullName == ""):
				continue
			#if(!boneData.has(boneFullName)):
			#	boneData[boneFullName] = []
			
			if(_weightForThatBone > 0):
				#if(i >= boneData[boneFullName].size()):
				#	boneData[boneFullName].resize(i+1)
				
				boneData[boneFullName][i] = _weightForThatBone
		
	for bone in boneData:
		var weights = boneData[bone]
		for i in weights.size():
			if(weights[i] == null):
				weights[i] = 0.0
	#print(boneData)
	bones = []
	var newbones = []
	for bone in boneData:
		var weights = boneData[bone]
		newbones.append(bone)
		newbones.append(PoolRealArray(weights))
	bones = newbones
