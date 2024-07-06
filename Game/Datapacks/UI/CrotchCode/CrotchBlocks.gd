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
		"AlwaysTrueBlock",
		"AlwaysFalseBlock",
		"IfCodeBlock",
		"WhileCodeBlock",
		
		"MathPlusBlock",
		"MathMinusBlock",
		"MathMultBlock",
		"MathDivideBlock",
		"MathFModBlock",
		"MathModBlock",
		"MathPowBlock",
		"MathOpBlock",
		
		"PrintBlock",
		"OutputBigBlock",
		
		"RawStringBlock",
		"RawIntBlock",
		
		"LogicAndBlock",
		"LogicOrBlock",
		"LogicNotBlock",
		
		"MathLogicEqualsBlock",
		"MathLogicNotEqualsBlock",
		"MathLogicBiggerThanBlock",
		"MathLogicLessThanBlock",
		"MathLogicBiggerThanOrEqBlock",
		"MathLogicLessThanOrEqBlock",
		
		"TestList",
		"VarSetBlock",
		"VarGetBlock",
		"VarIncBlock",
		
		"ToStringBlock",
		"ToIntBlock",
		"ToFloatBlock",
		]

static func createBlock(theID):
	var newBlock = load("res://Game/Datapacks/UI/CrotchCode/CodeBlocks/"+theID+".gd").new()
		
	if(newBlock != null):
		newBlock.id = theID
	#	newBlock.initWithDefaultData()
	return newBlock

