extends BaseStageScene3D

onready var animationPlayer = $AnimationPlayer
onready var doll = $Doll3D

func _init():
	id = StageScene.Stocks

#func _ready():
#	animationTree.active = true
	
func playAnimation(animID, _args = {}):
	print("Playing stocks: "+str(animID))
	doll.prepareCharacter("pc")
	
	if(_args.has("exposedBodyparts")):
		doll.setExposedBodyparts(_args["exposedBodyparts"])
	else:
		doll.setExposedBodyparts([])
	
	if(animID == "idle"):
		animationPlayer.play("Idle")
	else:
		printerr("Action "+str(animID)+" is not found for stage "+str(id))
