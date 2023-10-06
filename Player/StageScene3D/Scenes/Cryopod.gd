extends BaseStageScene3D

onready var animationPlayer = $AnimationPlayer
onready var doll = $Doll3D

func _init():
	id = StageScene.Cryopod

#func _ready():
#	animationTree.active = true
	
func playAnimation(animID, _args = {}):
	print("Playing cryopod: "+str(animID))
	if(_args.has("pc")):
		doll.prepareCharacter(_args["pc"])
	else:
		doll.prepareCharacter("pc")
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	
	if(_args.has("nopod") && _args["nopod"]):
		$MeshInstance.visible = false
		$MeshInstance2.visible = false
		$CPUParticles.visible = false
		$Sprite3D.visible = false
		$Hose.visible = false
	
	
	if(animID == "idle"):
		animationPlayer.play("Idle")
	else:
		Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))

func getSupportedStates():
	return ["idle"]
