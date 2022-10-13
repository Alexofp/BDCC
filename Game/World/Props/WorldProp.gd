tool
extends Node2D

enum PropType {Bench, Bed, BedRed, BedLilac, CoolChair}

const propData = {
	PropType.Bench:{
		texture = preload("res://Images/WorldProps/bench.png")
	},
	PropType.Bed:{
		texture = preload("res://Images/WorldProps/bed.png")
	},
	PropType.BedRed:{
		texture = preload("res://Images/WorldProps/bedRed.png")
	},
	PropType.BedLilac:{
		texture = preload("res://Images/WorldProps/bedLilac.png")
	},
	PropType.CoolChair:{
		texture = preload("res://Images/WorldProps/coolchair.png")
	},
}

export(PropType) var propType setget onPropTypeChanged
export(bool) var showShadow = true setget onShowShadowChanged

func onPropTypeChanged(newPropType):
	propType = newPropType
	
	if(!propData.has(propType)):
		return
	
	var propInfo = propData[propType]
	
	if($WorldPropSprite == null):
		return
	$WorldPropSprite.texture = propInfo["texture"]
	$WorldPropSpriteShadow.texture = propInfo["texture"]

func onShowShadowChanged(newshowshadow):
	showShadow = newshowshadow
	
	if(showShadow):
		$WorldPropSpriteShadow.visible = true
	else:
		$WorldPropSpriteShadow.visible = false
