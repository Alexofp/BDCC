extends SkinBase

func _init():
	id = "SocketSkin"

func getName():
	return "Socket"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/SocketSkin/SocketSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
