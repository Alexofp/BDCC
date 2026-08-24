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
	
	bodywidepng.visible = !_state.shirtOpened
	#bodywidepng_3.visible = _state.shirtOpened
	armpng.visible = bodywidepng.visible
	armpng_001.visible = bodywidepng.visible
	breasts_scalable_001.visible = bodywidepng.visible
	bodywidepng_2.visible = !_state.shortsPulledDown
	legup_deformable.visible = bodywidepng_2.visible
	legup_deformable_001.visible = bodywidepng_2.visible
	
#	if(_inmateType == InmateType.General):
#		setUniformColor(Color("ff6600"))
#		#setMatTexturePath(bodywidepng, "res://Inventory/RiggedModels/InmateUniform/orangeUniform.png")
#	elif(_inmateType == InmateType.HighSec):
#		#setMatTexturePath(bodywidepng, "res://Inventory/RiggedModels/InmateUniform/redUniform.png")
#		setUniformColor(Color("FF1500"))
#	else:
#		#setMatTexturePath(bodywidepng, "res://Inventory/RiggedModels/InmateUniform/lilacUniform.png")
#		setUniformColor(Color("AE00FF"))
	
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
	
