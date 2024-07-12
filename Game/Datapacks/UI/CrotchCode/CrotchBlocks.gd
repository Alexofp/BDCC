extends Object
class_name CrotchBlocks

const CALL = 0
const VALUE = 1
const LOGIC = 2

static func getLeftBracket(theType):
	if(theType == CALL):
		return "v"
	if(theType == VALUE):
		return "("
	if(theType == LOGIC):
		return "<"
	return ""
	
static func getRightBracket(theType):
	if(theType == CALL):
		return ""
	if(theType == VALUE):
		return ")"
	if(theType == LOGIC):
		return ">"
	return ""

static func getAll():
	return [
		"AlwaysTrue",
		"AlwaysFalse",
		"AlwaysNull",
		"FlowIf",
		"FlowWhile",
		
		"MathPlus",
		"MathMinus",
		"MathMult",
		"MathDivide",
		"MathFMod",
		"MathMod",
		"MathPow",
		"MathOp",
		
		"Print",
		
		"SceneOutput",
		"SceneButton",
		"SceneButtonDisabled",
		"SceneAimCamera",
		"ScenePlayAnim",
		"SceneCharAdd",
		"SceneCharRem",
		
		"LogicAnd",
		"LogicOr",
		"LogicNot",
		
		"MathLogicEquals",
		"MathLogicNotEquals",
		"MathLogicBiggerThan",
		"MathLogicLessThan",
		"MathLogicBiggerThanOrEq",
		"MathLogicLessThanOrEq",
		
		#"TestList",
		"VarGet",
		"VarSet",
		"VarSetStr",
		"VarSetBool",
		"VarInc",
		"VarIsNull",
		"VarIsBool",
		"VarIsNumber",
		"VarIsString",
		
		"RawString",
		"RawInt",
		
		"FlagGet",
		"FlagSet",
		"FlagSetStr",
		"FlagSetBool",
		"FlagInc",
		
		"ToString",
		"ToInt",
		"ToFloat",
		]

static func createBlock(theID):
	var resourcePath = "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/"+theID+".gd"
	var newBlockScene = load(resourcePath)
	if(newBlockScene == null):
		return null
	var newBlock = newBlockScene.new()
		
	if(newBlock != null):
		newBlock.id = theID
	#	newBlock.initWithDefaultData()
	return newBlock

