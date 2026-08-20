extends "res://Player/Player3D/Parts/Part3D.gd"

onready var bodywidepng = $"%bodywidepng"
onready var armpng = $"%armpng"
onready var armpng_001 = $"%armpng001"
onready var legup_deformable = $"%legupDeformable"
onready var legup_deformable_001 = $"%legupDeformable001"
onready var breasts_scalable_001 = $"%breastsScalable001"

const BODY := 0
const ARM := 1
const LEG := 2

# wip
const SPRITES:Dictionary = {
	InmateType.General: {
		BODY: {
			0: "res://Inventory/RiggedModels/InmateUniform/orangeUniform.png",
			1: "res://Inventory/RiggedModels/InmateUniform/damaged/dam2OrangeBody.png",
			2: "res://Inventory/RiggedModels/InmateUniform/damaged/damOrangeBody.png",
			3: "res://Inventory/RiggedModels/InmateUniform/damaged/dam3OrangeBody.png",
		},
	},

}

func updateFromItem(_item):
	var _inmateType:int = _item.inmateType # InmateType.General
	var _state:ShirtAndShortsState = _item.itemState
	var _dam:int = _state.getDamageState() # 0, 1, 2, 3
	
	if(_inmateType == InmateType.General):
		setMatTexturePath(bodywidepng, "res://Inventory/RiggedModels/InmateUniform/orangeUniform.png")
	elif(_inmateType == InmateType.HighSec):
		setMatTexturePath(bodywidepng, "res://Inventory/RiggedModels/InmateUniform/redUniform.png")
	else:
		setMatTexturePath(bodywidepng, "res://Inventory/RiggedModels/InmateUniform/lilacUniform.png")
