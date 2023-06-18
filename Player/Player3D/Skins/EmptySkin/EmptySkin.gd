extends SkinBase

func _init():
	id = "EmptySkin"
	hasRedChannel = true
	hasBlueChannel = true
	hasGreenChannel = true

func getName():
	return "Empty skin"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/EmptySkin/EmptySkin.png")
