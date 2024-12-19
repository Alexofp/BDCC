extends SkinBase

func _init():
	id = "FurGirl"

func getName():
	return "Fur Girl"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/FurGirl/FurGirl.png")

func getFittingSkinTypes():
	return {
		SkinType.SkinAndFur: 1.0,
		#SkinType.Fur: 1.0,
	}
