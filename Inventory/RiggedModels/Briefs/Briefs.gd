extends "res://Player/Player3D/Parts/Part3D.gd"

onready var bodywidepng = $bodywidepng
onready var legup_deformable = $legupDeformable
onready var legup_deformable_001 = $legupDeformable001

func setColor(newColor):
	for theMesh in [bodywidepng, legup_deformable, legup_deformable_001]:
		var theMat:ShaderMaterial = getShaderMatUnique(theMesh)
		if(!theMat):
			continue
		theMat.set_shader_param("color_r", newColor)

func updateFromItem(_item):
	if(!(_item.itemState is PantiesState)):
		return
	var _state:PantiesState = _item.itemState
	var _dam:bool = _state.clothesDamaged
	bodywidepng.visible = !_state.arePantiesPulledDown()
	#legup_deformable.visible = bodywidepng.visible
	#legup_deformable_001.visible = bodywidepng.visible
	var theMat1:ShaderMaterial = getShaderMatUnique(legup_deformable)
	if(theMat1):
		theMat1.set_shader_param("uv1_offset", Vector2(0.0, -0.15 if !bodywidepng.visible else 0.0))
	var theMat2:ShaderMaterial = getShaderMatUnique(legup_deformable_001)
	if(theMat2):
		theMat2.set_shader_param("uv1_offset", Vector2(0.0, -0.15 if !bodywidepng.visible else 0.0))
	
	for theMesh in [bodywidepng, legup_deformable, legup_deformable_001]:
		var theMat:ShaderMaterial = getShaderMatUnique(theMesh)
		if(!theMat):
			continue
		theMat.set_shader_param("damage", 0.25 if _dam else 0.0)
