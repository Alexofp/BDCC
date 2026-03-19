extends BaseStageScene3D

onready var start_egg_timer:Timer = $"%StartEggTimer"
onready var egg_timer:Timer = $"%EggTimer"
onready var egg_spawner_node:Spatial = $"%EggSpawnerNode"
const EggPropScene = preload("res://Player/Props/EggPhysicsProp.tscn")
onready var squirt_egg_particles:CPUParticles = $"%SquirtEggParticles"

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

var eggsLeft:int = 0
var didAtLeastOneEgg:bool = false

func _init():
	id = StageScene.EggLaying

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer3())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer3())
	animationTree2.active = true

func updateSubAnims():
	if(true):
		return
	if(doll.getArmsCuffed()):
		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
	else:
		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0
	
#	if(doll2.getArmsCuffed()):
#		animationTree2["parameters/CuffsBlend/blend_amount"] = 1.0
#	else:
#		animationTree2["parameters/CuffsBlend/blend_amount"] = 0.0

# StageScene.Duo, "kneel", {npc="nova", pc="pc"}
func playAnimation(animID, _args = {}):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	doll.prepareCharacter(firstDoll)
	var secondDoll = "pc"
	if(_args.has("npc") && !(_args.has("hideNPC") && _args["hideNPC"])):
		secondDoll = _args["npc"]
		doll2.prepareCharacter(secondDoll)
		doll2.visible = true
	else:
		doll2.prepareCharacter(secondDoll)
		doll2.visible = false
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	if(_args.has("npcBodyState")):
		doll2.applyBodyState(_args["npcBodyState"])
	else:
		doll2.applyBodyState({})
	
	
	updateSubAnims()
	
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	
	var state_machine:AnimationNodeStateMachinePlayback = animationTree["parameters/StateMachine/playback"]
	var state_machine2:AnimationNodeStateMachinePlayback = animationTree2["parameters/StateMachine/playback"]
	
	#print(state_machine.get_current_node())
	#print(state_machine.get_current_play_position())
	
	if(animID == "idle"):
		state_machine.travel("EggLaying-loop")
		state_machine2.travel("EggLaying_2-loop")
		didAtLeastOneEgg = false
	if(animID == "after"):
		state_machine.travel("EggLayingAfter-loop")
		state_machine2.travel("EggLayingAfter_2-loop")
	var theInt:int = int(animID)
	if(theInt > 0 || animID == "0"):
		eggsLeft = theInt

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	var secondDoll = "pc"
	if(_args.has("npc")):
		secondDoll = _args["npc"]
		
	if(doll.getCharacterID() != firstDoll || doll2.getCharacterID() != secondDoll):
		return false
	return true

func getSupportedStates():
	var theAr:Array = ["idle", "after"]
	for _i in range(21):
		theAr.append(str(_i))
	return theAr

func getVarNpcs():
	return ["pc", "npc"]

func _on_StartEggTimer_timeout():
	start_egg_timer.start(RNG.randf_range(0.5, 1.5))
	var state_machine:AnimationNodeStateMachinePlayback = animationTree["parameters/StateMachine/playback"]
	var state_machine2:AnimationNodeStateMachinePlayback = animationTree2["parameters/StateMachine/playback"]
	
	if(state_machine.get_current_node() == "EggLayingDo-loop"):
		return
	if(eggsLeft <= 0):
		if(didAtLeastOneEgg && state_machine.get_current_node() != "EggLayingAfter-loop"):
			state_machine.travel("EggLayingAfter-loop")
			state_machine2.travel("EggLayingAfter_2-loop")
		return
	
	eggsLeft -= 1
	didAtLeastOneEgg = true
	state_machine.travel("EggLayingDo-loop")
	state_machine2.travel("EggLayingDo_2-loop")
	egg_timer.start(1.45)

func _on_EggTimer_timeout():
	var newEgg:RigidBody = EggPropScene.instance()
	add_child(newEgg)
	newEgg.global_position = egg_spawner_node.global_position + Vector3(0.0, 0.0, -RNG.randf_range(0.0, 0.2))
	newEgg.global_rotation = egg_spawner_node.global_rotation
	
	newEgg.apply_central_impulse(Vector3( RNG.randf_range(-3.0, -1.0), RNG.randf_range(-1.0, 1.0), 0.0 ))
	
	squirt_egg_particles.emitting = true

func getVarOptions():
	var options = .getVarOptions()
	
	options["hideNPC"] = {
		type = "bool",
	}
	
	return options
