extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var doll = $Doll3D

func _init():
	id = StageScene.PuppySolo

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer())
	animationTree.active = true
	
#func updateSubAnims():
#	if(doll.getArmsCuffed()):
#		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
#	else:
#		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0
	
func playAnimation(animID, _args = {}):
	#print("Playing hogtied: "+str(animID))
	
	doll.setCustomParts({
		"PuppyGear": "res://Inventory/RiggedModels/PuppyRestraints/PuppyRestraints.tscn",
	})
	
	if(_args.has("pc")):
		doll.prepareCharacter(_args["pc"])
	else:
		doll.prepareCharacter("pc")
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	#updateSubAnims()
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	if(!stateMachineTravelPuppy(doll, state_machine, animID)):
		Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))

func getSupportedStates():
	return getSupportedStatesPuppy()
