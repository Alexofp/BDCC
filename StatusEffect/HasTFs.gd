extends StatusEffectBase

func _init():
	id = StatusEffect.HasTFs
	isBattleOnly = false

	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 95
	
func shouldApplyTo(_npc):
	if(_npc.hasActiveTransformations()):
		return true
	return false

func getEffectName():
	return "Transformations"

func getEffectDesc():
	var tfHolder:TFHolder = character.getTFHolder()
	if(tfHolder == null):
		return "You shouldn't see this.."
	var tfCount:int = tfHolder.getActiveTransformationsCount()
	
	#var theText:String = "You are under the effects of "+str(tfCount)+" unknown transformation"+("s" if tfCount != 1 else "")+".."
	var theText:String = "You are under the effects of "+str(tfCount)+" drug"+("s" if tfCount != 1 else "")+":"
	
	for tfa in tfHolder.transformations:
		var tf:TFBase = tfa
		var tfID:String = tf.id
		var pillName:String = tf.getPillName()
		var isUnlocked:bool = GM.main.SCI.isTransformationUnlocked(tfID)
		var isTested:bool = GM.main.SCI.isTransformationTested(tfID)
		var canBeTestedIfUnlocked:bool = tf.canBeTested()
		var reachedLastStage:bool = !tf.canTransformFurther()
		
		theText += "\n - "+(pillName if isUnlocked else "Unknown drug")
		if(!isTested && isUnlocked && canBeTestedIfUnlocked):
			theText += " (Can be scanned by Eliza!)"
		elif(reachedLastStage):
			theText += " (Last stage reached)"
		elif(tf.getStage() >= 1):
			theText += " (stage "+str(tf.getStage())+")"
	
	return theText
	
func getEffectImage():
	var canScanAmount:int = GM.main.SCI.getTFsCanScanAmount(character)
	if(canScanAmount > 0):
		return "res://Images/StatusEffects/dna1-can-scan.png"
	return "res://Images/StatusEffects/dna1.png"

func getIconColor():
	return IconColorCyan

func getBuffs():
	var tfHolder:TFHolder = character.getTFHolder()
	if(tfHolder != null):
		return tfHolder.getBuffs()
	return []
