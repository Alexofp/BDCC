extends BodypartBody

func _init():
	visibleName = "human body"
	id = "humanbody"
	dollType = "Human"

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Body/HumanBody/HumanBody.tscn"
