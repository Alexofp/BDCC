tool
extends Node2D

enum TileType {Floor1, Floor2, Floor3, WideStairs}

const propData = {
	TileType.Floor1:{
		texture = preload("res://Images/WorldTiles/floor1.png")
	},
	TileType.Floor2:{
		texture = preload("res://Images/WorldTiles/floor2.png")
	},
	TileType.Floor3:{
		texture = preload("res://Images/WorldTiles/floor3.png")
	},
	TileType.WideStairs:{
		texture = preload("res://Images/WorldTiles/widestairs.png")
	},
}

export(TileType) var tileType setget onPropTypeChanged

func onPropTypeChanged(newPropType):
	tileType = newPropType
	
	if(!propData.has(tileType)):
		return
	
	var propInfo = propData[tileType]
	
	$WorldTileSprite.texture = propInfo["texture"]
