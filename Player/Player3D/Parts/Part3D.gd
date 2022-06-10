extends Spatial

var dollSkeleton: DollSkeleton

func initPart(newDollSkeleton):
	dollSkeleton = newDollSkeleton
	
	for child in get_children():
		setSkeletonRecursive(child, dollSkeleton.getSkeleton())
#		if(child is MeshInstance):
#			#child.skeleton = dollSkeleton.getSkeleton().get_path()
#			child.skeleton = child.get_path_to(dollSkeleton.getSkeleton())

func setSkeletonRecursive(childnode, skeleton):
	if(childnode is MeshInstance):
		childnode.skeleton = childnode.get_path_to(skeleton)
	if(childnode is MyBoneAttachment):
		childnode.setSkeletonPath(childnode.get_path_to(skeleton))
	
	for child in childnode.get_children():
		setSkeletonRecursive(child, skeleton)

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
