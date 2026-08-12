extends Reference
class_name CombatAnimApplier

var theCombatAnimTree:AnimationNodeStateMachine = preload("res://Player/StageScene3D/Scenes3/CombatAnimTree.tres")

func applyCombatAnims():
	for theID in GlobalRegistry.combatAnims:
		var theAnim:CombatAnimBase = GlobalRegistry.combatAnims[theID]
		
		if(!theAnim.animName.empty()):
			if(theCombatAnimTree.has_node(theAnim.animName)):
				if(!theAnim.allowStateReuse):
					Log.printerr("ANIM STATE "+theAnim.animName+" ALREADY EXISTS")
			else:
				var newAnimNode:AnimationNodeAnimation = AnimationNodeAnimation.new()
				newAnimNode.animation = theAnim.animName
				
				theCombatAnimTree.add_node(theAnim.animName, newAnimNode)
				
				addTransition("IDLE", theAnim.animName, theAnim.fadeIn)
				addTransition(theAnim.animName, "IDLE", theAnim.fadeOut, !theAnim.isLooped)
				
		if(!theAnim.animNameKnockedDown.empty()):
			if(theCombatAnimTree.has_node(theAnim.animNameKnockedDown)):
				if(!theAnim.allowStateReuse):
					Log.printerr("KNOCKED DOWN ANIM STATE "+theAnim.animNameKnockedDown+" ALREADY EXISTS")
			else:
				var newAnimNode:AnimationNodeAnimation = AnimationNodeAnimation.new()
				newAnimNode.animation = theAnim.animNameKnockedDown
				
				theCombatAnimTree.add_node(theAnim.animNameKnockedDown, newAnimNode)
				
				addTransition("KnockedDown-loop", theAnim.animNameKnockedDown, theAnim.fadeIn)
				addTransition(theAnim.animNameKnockedDown, "KnockedDown-loop", theAnim.fadeOut, !theAnim.isLooped)
				

func addTransition(_from:String, _to:String, _time:float, _autoAdvance:bool = false):
	var theTrans := AnimationNodeStateMachineTransition.new()
	theTrans.xfade_time = _time
	theTrans.auto_advance = _autoAdvance
	if(_autoAdvance):
		theTrans.switch_mode = AnimationNodeStateMachineTransition.SWITCH_MODE_AT_END
	theCombatAnimTree.add_transition(_from, _to, theTrans)
