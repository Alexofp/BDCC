extends "res://Attacks/PlayerOnly/PunchPCAttack.gd"

func _init():
	id = "simplepunchattack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	isPlayerAttack = false
	
