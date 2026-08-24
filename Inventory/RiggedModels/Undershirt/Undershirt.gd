extends "res://Player/Player3D/Parts/Part3D.gd"

onready var bodywidepng = $bodywidepng
onready var breasts_scalable_001 = $PartStatePicker/PartState/breastsScalable001

func setColor(newColor):
	for theMesh in [bodywidepng, breasts_scalable_001]:
		var theMat:ShaderMaterial = getShaderMatUnique(theMesh)
		if(!theMat):
			continue
		theMat.set_shader_param("color_r", newColor)

func updateFromItem(_item):
	if(!(_item.itemState is BraState)):
		return
	var _state:BraState = _item.itemState
	var _dam:bool = _state.clothesDamaged
	
	breasts_scalable_001.visible = !_state.pulledUp
	setShaderMatTexturePath(bodywidepng, "res://Inventory/RiggedModels/Undershirt/body.png" if !_state.pulledUp else "res://Inventory/RiggedModels/Undershirt/bodyOpen.png")
	
	for theMesh in [bodywidepng, breasts_scalable_001]:
		var theMat:ShaderMaterial = getShaderMatUnique(theMesh)
		if(!theMat):
			continue
		theMat.set_shader_param("damage", 0.25 if _dam else 0.0)
