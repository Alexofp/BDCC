extends MyBoneAttachment
class_name DollAttachmentZone

export(String) var zoneName = ""
var savedScenes = {}
var temporaryScenes = []

func setProxy(attachmentProxy):
	startTransform = attachmentProxy.transform
	boneId = attachmentProxy.boneId
	zoneName = attachmentProxy.zoneName

func setScenes(scenes):
	if(scenes.size() == 0 && savedScenes.empty()):
		return
	if(scenes.size() == 0 && !savedScenes.empty()):
		for scene in savedScenes:
			savedScenes[scene].queue_free()
		savedScenes.clear()
		return

	var shouldDelteScenes = {}
	for scenePath in savedScenes:
		shouldDelteScenes[scenePath] = true
	
	for newScene in scenes:
		if(!savedScenes.has(newScene)):
			var sceneOBJ = GlobalRegistry.instanceCached(newScene)
			add_child(sceneOBJ)
			savedScenes[newScene] = sceneOBJ
		else:
			shouldDelteScenes.erase(newScene)

	for sceneToDelete in shouldDelteScenes:
		savedScenes[sceneToDelete].queue_free()
		savedScenes.erase(sceneToDelete)

func addTemporaryScene(scene):
	var sceneOBJ = GlobalRegistry.instanceCached(scene)
	add_child(sceneOBJ)
	temporaryScenes.append(sceneOBJ)

func clearTemporaryScenes():
	for scene in temporaryScenes:
		scene.queue_free()
	temporaryScenes.clear()
	
