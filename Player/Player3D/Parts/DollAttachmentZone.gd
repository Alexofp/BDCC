extends MyBoneAttachment
class_name DollAttachmentZone

export(String) var zoneName = ""
var savedScenes = {}

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
