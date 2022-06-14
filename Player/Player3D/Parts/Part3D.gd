extends Spatial

var dollSkeleton: DollSkeleton

func initPart(newDollSkeleton):
	dollSkeleton = newDollSkeleton
	
	var supportsBlendshapes = true
	if(OS.get_name() in ["Android", "iOS", "HTML5"]):
		supportsBlendshapes = false
	
	for child in get_children():
		setSkeletonRecursive(child, dollSkeleton.getSkeleton(), supportsBlendshapes)
#		if(child is MeshInstance):
#			#child.skeleton = dollSkeleton.getSkeleton().get_path()
#			child.skeleton = child.get_path_to(dollSkeleton.getSkeleton())

func setSkeletonRecursive(childnode, skeleton, supportsBlendshapes):
	if(childnode is MeshInstance):
		childnode.skeleton = childnode.get_path_to(skeleton)
		
		if(supportsBlendshapes && ("-noblendshapes" in childnode.name)):
			childnode.visible = false
		elif(!supportsBlendshapes && ("-hasblendshapes" in childnode.name)):
			childnode.visible = false
		
		if(childnode.mesh != null):
			for _i in range(childnode.mesh.get_surface_count()):
				var material = childnode.mesh.surface_get_material(_i)
				if(material is SpatialMaterial):
					material.flags_unshaded = true
					material.params_cull_mode = SpatialMaterial.CULL_DISABLED
				
	if(childnode is MyBoneAttachment):
		childnode.setSkeletonPath(childnode.get_path_to(skeleton))
	
	for child in childnode.get_children():
		setSkeletonRecursive(child, skeleton, supportsBlendshapes)

func setStateRecursive(childnode, stateID, value):
	if(childnode is PartStatePicker):
		if(childnode.getState() == stateID):
			childnode.setValue(value)
	
	for child in childnode.get_children():
		setStateRecursive(child, stateID, value)
		

func setState(stateID, value):
	setStateRecursive(self, stateID, value)

func setShapeKeyValue(shapekey: String, value: float):
	setShapeKeyValueRecursive(self, shapekey, value)

func setShapeKeyValueRecursive(childnode, shapekey: String, value: float):
	if(childnode is MeshInstance):
		childnode.set("blend_shapes/"+shapekey, value)
	
	for child in childnode.get_children():
		setShapeKeyValueRecursive(child, shapekey, value)
