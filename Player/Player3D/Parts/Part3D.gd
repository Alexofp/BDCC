extends Spatial

var dollSkeleton: DollSkeleton
var doll3D
var attachProxies = []
var partPickers = {}
var meshesThatUpdateMaterial = []

func initPart(newDoll3d):
	doll3D = newDoll3d
	dollSkeleton = doll3D.getDollSkeleton()
	
	meshesThatUpdateMaterial = []
	for child in get_children():
		setSkeletonRecursive(child, dollSkeleton.getSkeleton())
#		if(child is MeshInstance):
#			#child.skeleton = dollSkeleton.getSkeleton().get_path()
#			child.skeleton = child.get_path_to(dollSkeleton.getSkeleton())

func setDoll3d(newDoll3d):
	doll3D = newDoll3d
	dollSkeleton = doll3D.getDollSkeleton()

func getDoll():
	return doll3D

func onRemoved():
	for proxy in attachProxies:
		doll3D.removeDollAttachmentZone(proxy.dollAttachmentZone)

func setSkeletonRecursive(childnode, skeleton):
	if(childnode is MeshInstance):
		childnode.skeleton = childnode.get_path_to(skeleton)
		childnode.software_skinning_transform_normals = false # Removing this will make Software Skinning break so don't
		childnode.sorting_offset = 0.001 # IF REMOVED WILL LEAD TO FLICKERING. FOR WHATEVER REASON THIS LINE FIXES IT
		
		if(childnode.mesh != null):
			for _i in range(childnode.mesh.get_surface_count()):
				var material = childnode.mesh.surface_get_material(_i)
				if(material is SpatialMaterial):
					material.flags_unshaded = true
					material.params_depth_draw_mode = SpatialMaterial.DEPTH_DRAW_OPAQUE_ONLY
					material.params_cull_mode = SpatialMaterial.CULL_DISABLED
					# Fixes wrong colors on HTML5/Android builds, I dunno, something about Srgb and linear colors
					if(OS.get_name() in ["Android", "HTML5"] && ProjectSettings.get_setting("rendering/quality/driver/driver_name") == "GLES3"):
						material.flags_albedo_tex_force_srgb = true
			for _i in range(childnode.get_surface_material_count()):
				var material = childnode.get_surface_material(_i)
				if(material is SpatialMaterial):
					material.flags_unshaded = true
					material.params_depth_draw_mode = SpatialMaterial.DEPTH_DRAW_OPAQUE_ONLY
					material.params_cull_mode = SpatialMaterial.CULL_DISABLED
					if(OS.get_name() in ["Android", "HTML5"] && ProjectSettings.get_setting("rendering/quality/driver/driver_name") == "GLES3"):
						material.flags_albedo_tex_force_srgb = true
				
	if(childnode is MyBoneAttachment):
		childnode.setSkeletonPath(childnode.get_path_to(skeleton))
	if(childnode is AttachmentProxy):
		attachProxies.append(childnode)
	if(childnode is PartStatePicker):
		if(!partPickers.has(childnode.getState())):
			partPickers[childnode.getState()] = []
		partPickers[childnode.getState()].append(childnode)
	if(childnode is MeshInstanceWithPattern):
		childnode.partRef = weakref(self)
		childnode.updateMaterial()
		meshesThatUpdateMaterial.append(childnode)
	
	for child in childnode.get_children():
		setSkeletonRecursive(child, skeleton)

func updateMaterial():
	for themesh in meshesThatUpdateMaterial:
		themesh.updateMaterial()

func setStateRecursive(childnode, stateID, value):
	if(childnode is PartStatePicker):
		if(childnode.getState() == stateID):
			childnode.setValue(value)
	
	for child in childnode.get_children():
		setStateRecursive(child, stateID, value)

func setState(stateID, value):
	if(!partPickers.has(stateID)):
		return
	for picker in partPickers[stateID]:
		picker.setValue(value)
	#setStateRecursive(self, stateID, value)

func setShapeKeyValue(shapekey: String, value: float):
	setShapeKeyValueRecursive(self, shapekey, value)

func setShapeKeyValueRecursive(childnode, shapekey: String, value: float):
	if(childnode is MeshInstance):
		childnode.set("blend_shapes/"+shapekey, value)
	
	for child in childnode.get_children():
		setShapeKeyValueRecursive(child, shapekey, value)

func getAttachProxies():
	return attachProxies

func setColor(newColor):
	setColorRecursive(newColor, self)

func setColorRecursive(newColor, theNode):
	for mesh in theNode.get_children():
		if(mesh is MeshInstance && !(mesh is MeshInstanceWithPattern)):
			var theMat1:SpatialMaterial = mesh.get_surface_material(0)
			var newMat:SpatialMaterial = theMat1.duplicate()
			newMat.albedo_color = newColor
			mesh.set_surface_material(0, newMat)
			
		setColorRecursive(newColor, mesh)
