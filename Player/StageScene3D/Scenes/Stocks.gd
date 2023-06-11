extends BaseStageScene3D

onready var animationPlayer = $AnimationPlayer
onready var doll = $Doll3D

func _init():
	id = StageScene.Stocks

#func _ready():
#	animationTree.active = true
	
func playAnimation(animID, _args = {}):
	print("Playing stocks: "+str(animID))
	if(_args.has("pc")):
		doll.prepareCharacter(_args["pc"])
	else:
		doll.prepareCharacter("pc")
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	
	if(animID == "idle"):
		animationPlayer.play("Idle")
	else:
		Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))

func getSupportedStates():
	return ["idle"]
