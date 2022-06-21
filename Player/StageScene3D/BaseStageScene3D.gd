extends Spatial
class_name BaseStageScene3D

var id = "error"

func _init():
	id = "error"

func _ready():
	pass

func playAnimation(animID, _args = {}):
	print("Playing: "+str(animID))

func updateSubAnims():
	pass
