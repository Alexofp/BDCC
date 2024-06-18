extends "res://Modules/PortalPantiesModule/PortalPanties/PortalPanties.gd"

func _init():
	id = "PortalPantiesUnlocked"
	unlocked = true

func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.PortalPanties]
