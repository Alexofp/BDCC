extends "res://Player/Player3D/Parts/Part3D.gd"

onready var bodywidepng = $"%bodywidepng"
onready var bodywidepng_2 = $"%bodywidepng2"
onready var armpng = $"%armpng"
onready var armpng_001 = $"%armpng001"
onready var legup_deformable = $"%legupDeformable"
onready var legup_deformable_001 = $"%legupDeformable001"
onready var breasts_scalable_001 = $"%breastsScalable001"

func setColor(_newColor):
	var _col2:Color = _newColor
	_col2.v *= 0.9
	_col2.s *= 1.1
	setShirtAndShortsColors(_newColor, _col2)

func setShirtAndShortsColors(_shirt:Color, _shorts:Color):
	for theMesh in [bodywidepng, bodywidepng_2, armpng, armpng_001, legup_deformable, legup_deformable_001, breasts_scalable_001]:
		var theMat:ShaderMaterial = getShaderMatUnique(theMesh)
		if(!theMat):
			continue
		theMat.set_shader_param("color_r", _shirt)
		theMat.set_shader_param("color_g", _shorts)

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
	#var _inmateType:int = _item.inmateType # InmateType.General
	var _state:ShirtAndShortsState = _item.itemState
	var _dam:int = _state.getDamageState() # 0, 1, 2, 3
	
	if(_item.id == "EngineerClothesOld"):
		setShirtAndShortsColors(Color("CC8822"), Color("A85C19"))
	
	setShaderMatTexturePath(bodywidepng, "res://Inventory/RiggedModels/CasualClothes/body.png" if !_state.isShirtOpened() else "res://Inventory/RiggedModels/CasualClothes/ShirtOpen.png")
	
	bodywidepng.visible = !_state.shouldHideShirt()
	armpng.visible = bodywidepng.visible
	armpng_001.visible = bodywidepng.visible
	breasts_scalable_001.visible = !_state.isShirtOpened()
	bodywidepng_2.visible = !_state.areShortsPulledDown()
	#legup_deformable.visible = true#bodywidepng_2.visible
	#legup_deformable_001.visible = true#bodywidepng_2.visible
	var theMat1:ShaderMaterial = getShaderMatUnique(legup_deformable)
	if(theMat1):
		theMat1.set_shader_param("uv1_offset", Vector2(0.0, -0.15 if _state.areShortsPulledDown() else 0.0))
	var theMat2:ShaderMaterial = getShaderMatUnique(legup_deformable_001)
	if(theMat2):
		theMat2.set_shader_param("uv1_offset", Vector2(0.0, -0.15 if _state.areShortsPulledDown() else 0.0))


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
	
