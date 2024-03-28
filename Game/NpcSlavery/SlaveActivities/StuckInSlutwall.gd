extends "res://Game/NpcSlavery/SlaveActivities/StuckInStocks.gd"

func _init():
	id = "StuckInSlutwall"
	
func getVisibleName():
	return "Stuck in a slutwall"

func getActivityText():
	return "{npc.name} is currently stuck in a slutwall so {npc.he} {npc.isAre} not here."

func getInteractActions():
	return [
	]
