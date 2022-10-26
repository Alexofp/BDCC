tool
extends Node2D

enum LightType {Default, Big, BigGlow}

const propData = {
	LightType.Default:{
		texture = preload("res://Images/WorldProps/LightShapes/default.png"),
		offset = [0, 4],
	},
	LightType.Big:{
		texture = preload("res://Images/WorldProps/LightShapes/big.png"),
		offset = [0, 4],
	},
	LightType.BigGlow:{
		texture = preload("res://Images/WorldProps/LightShapes/bigglow.png"),
		offset = [0, 4],
	},
}

export(LightType) var lightType setget onPropTypeChanged
export(bool) var aboveWalls = true setget onAboveWallsChanged

func onPropTypeChanged(newPropType):
	lightType = newPropType
	
	if(!propData.has(lightType)):
		return
	
	var propInfo = propData[lightType]
	
	$WorldPropSprite.texture = propInfo["texture"]
	if("offset" in propInfo):
		$WorldPropSprite.offset.x = propInfo["offset"][0]
		$WorldPropSprite.offset.y = propInfo["offset"][1]
	else:
		$WorldPropSprite.offset.x = 0
		$WorldPropSprite.offset.y = 0

func onAboveWallsChanged(newabove):
	aboveWalls = newabove
	if(newabove):
		z_index = 2
	else:
		z_index = -6
