extends "res://Player/Player3D/Parts/Part3D.gd"

onready var bodywidepng = $"%bodywidepng"
onready var bodywidepng_2 = $"%bodywidepng2"
onready var armpng = $"%armpng"
onready var armpng_001 = $"%armpng001"
onready var legup_deformable = $"%legupDeformable"
onready var legup_deformable_001 = $"%legupDeformable001"
onready var breasts_scalable_001 = $"%breastsScalable001"

func setUniformColor(_col:Color):
	for theMesh in [bodywidepng, bodywidepng_2, armpng, armpng_001, legup_deformable, legup_deformable_001, breasts_scalable_001]:
		var theMat:ShaderMaterial = getMatUnique(theMesh)
		if(!theMat):
			continue
		theMat.set_shader_param("color_r", _col)

func setDamageFloat(_obj:MeshInstance, _fl:float):
	var theMat := getMatUnique(_obj)
	if(!theMat):
		return
	if(theMat is ShaderMaterial):
		theMat.set_shader_param("damage", _fl)

func updateFromItem(_item):
	var _inmateType:int = _item.inmateType # InmateType.General
	var _state:ShirtAndShortsState = _item.itemState
	var _dam:int = _state.getDamageState() # 0, 1, 2, 3
	
	if(_inmateType == InmateType.General):
		setUniformColor(Color("ff6600"))
		#setMatTexturePath(bodywidepng, "res://Inventory/RiggedModels/InmateUniform/orangeUniform.png")
	elif(_inmateType == InmateType.HighSec):
		#setMatTexturePath(bodywidepng, "res://Inventory/RiggedModels/InmateUniform/redUniform.png")
		setUniformColor(Color("FF1500"))
	else:
		#setMatTexturePath(bodywidepng, "res://Inventory/RiggedModels/InmateUniform/lilacUniform.png")
		setUniformColor(Color("AE00FF"))
	
	if(_dam == 1):
		for theMesh in [bodywidepng, bodywidepng_2, armpng, armpng_001, legup_deformable, legup_deformable_001, breasts_scalable_001]:
			setDamageFloat(theMesh, 0.25)
		setDamageFloat(breasts_scalable_001, 0.0)
	elif(_dam == 2):
		for theMesh in [bodywidepng, bodywidepng_2, armpng, armpng_001, legup_deformable, legup_deformable_001, breasts_scalable_001]:
			setDamageFloat(theMesh, 0.5)
	elif(_dam == 3):
		for theMesh in [bodywidepng, bodywidepng_2, armpng, armpng_001, legup_deformable, legup_deformable_001, breasts_scalable_001]:
			setDamageFloat(theMesh, 0.75)
		setDamageFloat(breasts_scalable_001, 1.0)
		setDamageFloat(legup_deformable, 1.0)
	else:
		for theMesh in [bodywidepng, bodywidepng_2, armpng, armpng_001, legup_deformable, legup_deformable_001, breasts_scalable_001]:
			setDamageFloat(theMesh, 0.0)
	
