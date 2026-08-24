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
		var theMat:ShaderMaterial = getShaderMatUnique(theMesh)
		if(!theMat):
			continue
		theMat.set_shader_param("color_r", _col)

func setDamageFloat(_obj:MeshInstance, _fl:float):
	var theMat := getShaderMatUnique(_obj)
	if(!theMat):
		return
	if(theMat is ShaderMaterial):
		theMat.set_shader_param("damage", _fl)

func updateFromItem(_item):
	if(!(_item.itemState is ShirtAndShortsState)):
		Log.printerr("Something is wrong, inmate uniform has wrong item state: "+str(_item.itemState))
		return
	var _inmateType:int = _item.inmateType # InmateType.General
	var _state:ShirtAndShortsState = _item.itemState
	var _dam:int = _state.getDamageState() # 0, 1, 2, 3
	
	setShaderMatTexturePath(bodywidepng, "res://Inventory/RiggedModels/InmateUniform/Textures/Shirt.png" if !_state.shirtOpened else "res://Inventory/RiggedModels/InmateUniform/Textures/ShirtOpen.png")
	setShaderMatTexturePath(bodywidepng, "res://Inventory/RiggedModels/InmateUniform/Textures/ShirtColorMask.png" if !_state.shirtOpened else "res://Inventory/RiggedModels/InmateUniform/Textures/ShirtOpenColorMask.png", "texture_colormask")
	
	#armpng.visible = true#bodywidepng.visible
	#armpng_001.visible = true#bodywidepng.visible
	breasts_scalable_001.visible = !_state.shirtOpened
	bodywidepng_2.visible = !_state.shortsPulledDown
	#legup_deformable.visible = true#bodywidepng_2.visible
	#legup_deformable_001.visible = true#bodywidepng_2.visible
	var theMat1:ShaderMaterial = getShaderMatUnique(legup_deformable)
	if(theMat1):
		theMat1.set_shader_param("uv1_offset", Vector2(0.0, -0.15 if _state.shortsPulledDown else 0.0))
	var theMat2:ShaderMaterial = getShaderMatUnique(legup_deformable_001)
	if(theMat2):
		theMat2.set_shader_param("uv1_offset", Vector2(0.0, -0.15 if _state.shortsPulledDown else 0.0))

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
	
