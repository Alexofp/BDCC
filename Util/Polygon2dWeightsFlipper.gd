tool
extends Polygon2D

export var flipWeights = false setget setFlipWeights
export var flipLegPos = false setget SetFlipLegPos
export var flipArmPos = false setget SetFlipArmPos
var legsSwitchDifference = Vector2(9.38516, 7.681711)

const flipWords = [
	["LArm", "RArm"],
	["LForeArm", "RForeArm"],
	["LHand", "RHand"],
	["LLeg", "RLeg"],
	["LLLeg", "RLLeg"],
	["LFoot", "RFoot"],
]

func setFlipWeights(_new_value):
	if(!_new_value):
		return
	#print(bones)
	
	for i in range(bones.size()):
		var boneString = bones[i]
		if(!(boneString is String)):
			continue
		
		var oldString = boneString
		var splitted = boneString.split("/")
		var newSplitted = []
		for subWord in splitted:
			var found = false
			
			for replacePair in flipWords:
				if(subWord == replacePair[0]):
					newSplitted.append(replacePair[1])
					found = true
					break
				if(subWord == replacePair[1]):
					newSplitted.append(replacePair[0])
					found = true
					break
			
			if(!found):
				newSplitted.append(subWord)
		
		var newBoneString = Util.join(newSplitted, "/")
		print("Old:"+oldString +" new:"+newBoneString)
		bones[i] = newBoneString
				
func SetFlipLegPos(_newvalue):
	if(!_newvalue):
		return
	if(color.r >= 0.99):
		# was left, became right
		color = Color("#AAAAAA")
		global_position -= legsSwitchDifference
	else:
		# was right, became left
		color = Color.white
		global_position += legsSwitchDifference

func SetFlipArmPos(_newvalue):
	if(!_newvalue):
		return
	if(color.r >= 0.99):
		# was left, became right
		color = Color("#AAAAAA")
	else:
		# was right, became left
		color = Color.white
