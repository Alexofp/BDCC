tool
extends Node2D

enum PropType {Bench, Bed, CoolChair}

const propData = {
	PropType.Bench:{
		texture = preload("res://Images/WorldProps/bench.png")
	},
	PropType.Bed:{
		texture = preload("res://Images/WorldProps/bed.png")
	},
	PropType.CoolChair:{
		texture = preload("res://Images/WorldProps/coolchair.png")
	},
}

export(PropType) var propType setget onPropTypeChanged

func onPropTypeChanged(newPropType):
	propType = newPropType
	
	if(!propData.has(propType)):
		return
	
	var propInfo = propData[propType]
	
	$WorldPropSprite.texture = propInfo["texture"]
