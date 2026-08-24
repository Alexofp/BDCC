extends "res://Player/Player3D/Parts/Part3D.gd"

onready var bodywidepng = $bodywidepng
onready var legup_deformable = $legupDeformable

func setColor(newColor):
	for theMesh in [bodywidepng, legup_deformable]:
		var theMat:ShaderMaterial = getShaderMatUnique(theMesh)
		if(!theMat):
			continue
		theMat.set_shader_param("color_r", newColor)

func updateFromItem(_item):
	if(!(_item.itemState is PantiesState)):
		return
	var _state:PantiesState = _item.itemState
	var _dam:bool = _state.clothesDamaged
	
	legup_deformable.visible = _state.pulledDown
	bodywidepng.visible = !_state.pulledDown
	
	for theMesh in [bodywidepng, legup_deformable]:
		var theMat:ShaderMaterial = getShaderMatUnique(theMesh)
		if(!theMat):
			continue
		theMat.set_shader_param("damage", 0.25 if _dam else 0.0)
