extends SkinBase

func _init():
	id = "MonsterGirl"

func getName():
	return "Monster Girl"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/MonsterGirl/MonsterGirl.png")

func getFittingSkinTypes():
	return {
		SkinType.SkinAndFur: 1.0,
		SkinType.Fur: 1.0,
	}
