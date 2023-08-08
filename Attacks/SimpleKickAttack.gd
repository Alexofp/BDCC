extends "res://Attacks/PlayerOnly/KickPCAttack.gd"

func _init():
	id = "simplekickattack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	isPlayerAttack = false
