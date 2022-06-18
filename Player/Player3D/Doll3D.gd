extends Spatial
class_name Doll3D

var state = {}
var parts = {}
var dollAttachmentZones = {}
var hiddenPartZones = {}
var overridenPartHidden = {}
var savedCharacterID: String

export(bool) var addTestBody = false

var dollAttachmentZoneScene = preload("res://Player/Player3D/Parts/DollAttachmentZone.tscn")

func getDollSkeleton():
	return $DollSkeleton

func _ready():
	if(addTestBody):
		testBody()
	pass

func testBody():
	addPartObject("body", load("res://Player/Player3D/Parts/Body/HumanBody/HumanBody.tscn").instance())
	#addPartObject("legs", load("res://Player/Player3D/Parts/Legs/HumanLegs/HumanLegs.tscn").instance())
	addPartObject("legs", load("res://Player/Player3D/Parts/Legs/DigiLegs/DigiLegs.tscn").instance())
	#addPartObject("head", load("res://Player/Player3D/Parts/Head/HumanHead/HumanHead.tscn").instance())
	addPartObject("head", load("res://Player/Player3D/Parts/Head/FelineHead/FelineHead.tscn").instance())
	#addPartObject("head", load("res://Player/Player3D/Parts/Head/CanineHead/CanineHead.tscn").instance())
	#addPartObject("head", load("res://Player/Player3D/Parts/Head/FoxHead/FoxHead.tscn").instance())
	#addPartObject("head", load("res://Player/Player3D/Parts/Head/WolfHead/WolfHead.tscn").instance())
	
	#addPartObject("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsFlat/BreastsFlat.tscn").instance())
	#addPartObject("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsSmall/BreastsSmall.tscn").instance())
	#addPartObject("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsMedium/BreastsMedium.tscn").instance())
	#addPartObject("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsCurvy/BreastsCurvy.tscn").instance())
	addPartObject("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsBig/BreastsBig.tscn").instance())
	addPartObject("hands", load("res://Player/Player3D/Parts/Arms/HumanArms/HumanArms.tscn").instance())
	#addPartObject("ears", load("res://Player/Player3D/Parts/Ears/HumanEars/HumanEars.tscn").instance())
	#addPartObject("ears", load("res://Player/Player3D/Parts/Ears/DragonEars/DragonEars.tscn").instance())
	#addPartObject("ears", load("res://Player/Player3D/Parts/Ears/CanineEars/CanineEars.tscn").instance())
	#addPartObject("ears", load("res://Player/Player3D/Parts/Ears/CatEars/CatEars.tscn").instance())
	#addPartObject("ears", load("res://Player/Player3D/Parts/Ears/LynxEars/LynxEars.tscn").instance())
	#addPartObject("ears", load("res://Player/Player3D/Parts/Ears/LynxEars2/LynxEars2.tscn").instance())
	addPartObject("ears", load("res://Player/Player3D/Parts/Ears/WolfEars/WolfEars.tscn").instance())
	#addPartObject("ears", load("res://Player/Player3D/Parts/Ears/DragonEars2/DragonEars2.tscn").instance())
	addPartObject("tail", load("res://Player/Player3D/Parts/Tail/DragonTail/DragonTail.tscn").instance())
	#addPartObject("tail", load("res://Player/Player3D/Parts/Tail/FelineTail/FelineTail.tscn").instance())
	#addPartObject("tail", load("res://Player/Player3D/Parts/Tail/CanineTail/CanineTail.tscn").instance())
	#addPartObject("tail", load("res://Player/Player3D/Parts/Tail/ShortTail/ShortTail.tscn").instance())
	#addPartObject("tail", load("res://Player/Player3D/Parts/Tail/HuskyTail/HuskyTail.tscn").instance())
	#addPartObject("penis", load("res://Player/Player3D/Parts/Penis/DragonPenis/DragonPenis.tscn").instance())
	#addPartObject("penis", load("res://Player/Player3D/Parts/Penis/HumanPenis/HumanPenis.tscn").instance())
	addPartObject("penis", load("res://Player/Player3D/Parts/Penis/CaninePenis/CaninePenis.tscn").instance())
	addPartObject("hair", load("res://Player/Player3D/Parts/Hair/FerriHair/FerriHair.tscn").instance())
	#addPartObject("hair", load("res://Player/Player3D/Parts/Hair/PonytailHair/PonytailHair.tscn").instance())
	#addPartObject("hair", load("res://Player/Player3D/Parts/Hair/CombedBackHair/CombedBackHair.tscn").instance())
	#addPartObject("hair", load("res://Player/Player3D/Parts/Hair/LongHair/LongHair.tscn").instance())
	#addPartObject("hair", load("res://Player/Player3D/Parts/Hair/MessyHair/MessyHair.tscn").instance())
	#addPartObject("hair", load("res://Player/Player3D/Parts/Hair/MohawkHair/MohawkHair.tscn").instance())
	#addPartObject("hair", load("res://Player/Player3D/Parts/Hair/ShortHair/ShortHair.tscn").instance())
	#addPartObject("hair", load("res://Player/Player3D/Parts/Hair/SimpleHair/SimpleHair.tscn").instance())
	#addPartObject("head", load("res://Player/Player3D/Parts/Head/DragonHead/DragonHead.tscn").instance())
	addPartObject("horns", load("res://Player/Player3D/Parts/Horns/DragonHorns/DragonHorns.tscn").instance())
	#addPartObject("horns", load("res://Player/Player3D/Parts/Horns/DragonHorns2/DragonHorns2.tscn").instance())
	
	setState("gag", "gagged")
	setState("blindfold", "blindfolded")
	
	#setShapeKeyValue("Pregnant", 1.0)
	pass 

func setState(stateID, value):
	state[stateID] = value
	
	for slot in parts:
		var part = parts[slot]
		part.setState(stateID, value)

func clearState():
	for slot in parts:
		var part = parts[slot]
		for stateID in state:
			part.setState(stateID, "")
	state.clear()

func addPart(slot, partPath):
	addPartObject(slot, load(partPath).instance())

func addPartUnlessSame(slot, partPath):
	if(parts.has(slot)):
		var oldpart: Spatial = parts[slot]
		if(oldpart.filename == partPath):
			return
	addPart(slot, partPath)
		

func addPartObject(slot, part: Spatial):
	if(parts.has(slot)):
		parts[slot].queue_free()
		parts.erase(slot)
	
	parts[slot] = part
	getDollSkeleton().getSkeleton().add_child(part)
	
	part.initPart(self)
	
	for attachmentProxy in part.getAttachProxies():
		var dollAttachmentZone = dollAttachmentZoneScene.instance()
		
		$DollAttachmentZones.add_child(dollAttachmentZone)
		dollAttachmentZone.setProxy(attachmentProxy)
		dollAttachmentZone.setSkeletonPath(dollAttachmentZone.get_path_to(getDollSkeleton().getSkeleton()))
		attachmentProxy.dollAttachmentZone = dollAttachmentZone
		
		if(!dollAttachmentZones.has(attachmentProxy.zoneName)):
			dollAttachmentZones[attachmentProxy.zoneName] = []
		dollAttachmentZones[attachmentProxy.zoneName].append(dollAttachmentZone)
		
	
	for stateID in state:
		part.setState(stateID, state[stateID])
	
func removeDollAttachmentZone(attachZone):
	attachZone.queue_free()
	dollAttachmentZones[attachZone.zoneName].erase(attachZone)
	# remove it from our list
	
func removeSlot(slot):
	if(parts.has(slot)):
		parts[slot].onRemoved()
		parts[slot].queue_free()
		parts.erase(slot)

func hasSlot(slot):
	if(parts.has(slot)):
		return true
	return false

func setShapeKeyValue(shapeKey: String, value: float):
	for slot in parts:
		var part = parts[slot]
		
		part.setShapeKeyValue(shapeKey, value)

func disconnectFromOld():
	if(savedCharacterID != null && savedCharacterID != ""):
		var ch = GlobalRegistry.getCharacter(savedCharacterID)
		if(ch == null || !is_instance_valid(ch)):
			return
		if(ch.is_connected("bodypart_changed", self, "onCharacterBodypartChanged")):
			ch.disconnect("bodypart_changed", self, "onCharacterBodypartChanged")

func loadCharacter(charID):
	if(savedCharacterID == charID):
		return
	
	var ch = GlobalRegistry.getCharacter(charID)
	if(ch == null || !is_instance_valid(ch)):
		return
	
	if(ch.has_method("updateDoll")):
		disconnectFromOld()
		ch.updateDoll(self)
		savedCharacterID = charID
		var _ok = ch.connect("bodypart_changed", self, "onCharacterBodypartChanged")
		
func prepareCharacter(charID):
	loadCharacter(charID)
	clearOverrideAlpha()
		
func onCharacterBodypartChanged():
	var ch = GlobalRegistry.getCharacter(savedCharacterID)
	if(ch == null || !is_instance_valid(ch)):
		return
	if(ch.has_method("updateDoll")):
		ch.updateDoll(self)

func setBoneScaleVector(boneName: String, boneScale: Vector3):
	var skeleton:Skeleton = getDollSkeleton().getSkeleton()
	var boneId = skeleton.find_bone(boneName)
	if(boneId < 0):
		return
	var newTransform:Transform = Transform.IDENTITY
	newTransform = newTransform.scaled(boneScale)
	
	skeleton.set_bone_custom_pose(boneId, newTransform)

func setBoneScale(boneName: String, boneScale: float):
	var skeleton:Skeleton = getDollSkeleton().getSkeleton()
	var boneId = skeleton.find_bone(boneName)
	if(boneId < 0):
		return
	var newTransform:Transform = Transform.IDENTITY
	newTransform = newTransform.scaled(Vector3(boneScale,boneScale,boneScale))
	
	skeleton.set_bone_custom_pose(boneId, newTransform)

func setBoneScaleAndOffset(boneName: String, boneScale: float, offset: Vector3):
	var skeleton:Skeleton = getDollSkeleton().getSkeleton()
	var boneId = skeleton.find_bone(boneName)
	if(boneId < 0):
		return
	var newTransform:Transform = Transform.IDENTITY
	newTransform = newTransform.scaled(Vector3(boneScale,boneScale,boneScale))
	newTransform = newTransform.translated(offset)
	
	skeleton.set_bone_custom_pose(boneId, newTransform)

func setBoneOffset(boneName: String, offset: Vector3):
	var skeleton:Skeleton = getDollSkeleton().getSkeleton()
	var boneId = skeleton.find_bone(boneName)
	if(boneId < 0):
		return
	var newTransform:Transform = Transform.IDENTITY
	newTransform = newTransform.translated(offset)
	
	skeleton.set_bone_custom_pose(boneId, newTransform)

func setButtScale(buttScale: float):
	setBoneScale("DeformButt", buttScale)
	setBoneOffset("Tail1", Vector3(0.409556, 0.409556, 0.0)*max(buttScale-1.0, 0.0))

func setBreastsScale(breastsScale: float):
	var mul = 0.0
	if(breastsScale <= 1.0):
		mul = max(1.0 - breastsScale, 0.0)
	setBoneScaleAndOffset("DeformBreasts", breastsScale, Vector3(0.18713, 0.199727, 0.0)*mul)

func setPregnancy(progress: float):
	setBoneOffset("DeformBelly", Vector3(-0.03244, 0.706324, 0.0)*progress)

func setThighThickness(progress: float):
	setBoneOffset("DeformThigh.L", Vector3(-0.008168, 0.386037, 0.0)*progress)
	setBoneOffset("DeformThigh.R", Vector3(-0.008168, 0.386037, 0.0)*progress)

func setPenisScale(penisScale: float):
	setBoneScale("Penis", penisScale)

func setBallsScale(newScale: float):
	var offsetScale = 0.0
	if(newScale <= 1.0):
		offsetScale = 0.0
	elif(newScale <= 3.0):
		offsetScale = newScale / 3.0
	else:
		offsetScale = 1.0
	
	setBoneScaleAndOffset("Balls", newScale, Vector3(0.0, 0.156431, 0.0)*offsetScale)


func _on_Doll3DTooltip_mouseEntered(bodypartID):
	if(savedCharacterID != "" && bodypartID != ""):
		var character = GlobalRegistry.getCharacter(savedCharacterID)
		if(character == null):
			return
		
		var bodypart:Bodypart = character.getBodypart(bodypartID)
		if(bodypart == null):
			return
			
		GlobalTooltip.showTooltip(bodypart.getName(), bodypart.getTooltipInfo())
		

func _on_Doll3DTooltip_mouseExited(bodypartID):
	if(savedCharacterID != "" && bodypartID != ""):
		var character = GlobalRegistry.getCharacter(savedCharacterID)
		if(character == null):
			return
		
		var bodypart:Bodypart = character.getBodypart(bodypartID)
		if(bodypart == null):
			return
		GlobalTooltip.hideTooltip()

func setHiddenParts(newHiddenParts):
	hiddenPartZones = newHiddenParts

func updateAlpha():
	for slot in parts:
		if(hiddenPartZones.has(slot) && !overridenPartHidden.has(slot)):
			parts[slot].visible = false
		else:
			parts[slot].visible = true

func setParts(newparts: Dictionary):
	var dirtyFlags = {}
	for slot in parts:
		dirtyFlags[slot] = false
		
	for newslot in newparts:
		addPartUnlessSame(newslot, newparts[newslot])
		dirtyFlags[newslot] = true
	
	for slot in parts.keys():
		if(!dirtyFlags[slot]):
			removeSlot(slot)
			
	updateAlpha()

func clearOverrideAlpha():
	for slot in overridenPartHidden:
		if(hiddenPartZones.has(slot)):
			parts[slot].visible = false
		else:
			parts[slot].visible = true
	overridenPartHidden.clear()

func forceSlotToBeVisible(zone):
	overridenPartHidden[zone] = true
	if(parts.has(zone)):
		parts[zone].visible = true

func setUnriggedParts(scenes):
	for zone in dollAttachmentZones:
		for attachment in dollAttachmentZones[zone]:
			if(scenes.has(zone)):
				attachment.setScenes(scenes[zone])
			else:
				attachment.setScenes([])
	
#	for part in parts:
#		for zone in parts[part].getAttachZones():
#			var attachments = parts[part].getAttachZones()[zone]
#			for attachment in attachments:
#				if(scenes.has(zone)):
#					attachment.setScenes(scenes[zone])
#				else:
#					attachment.setScenes([])

func playAnimation(animName, blend = 0.1, speed = 1.0):
	$DollSkeleton/AnimationPlayer.play(animName, blend, speed)

func getAnimPlayer():
	return $DollSkeleton/AnimationPlayer
