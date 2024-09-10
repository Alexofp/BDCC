extends Node
class_name ChildSystem

var children: Array = []

func _ready():
	GM.CS = self
	name = "ChildSystem"

func addChild(child):
	children.append(child)
	
func getChildren():
	return children

func getChildrenOf(charID):
	var result = []
	for child in children:
		if((child.getMotherID() == charID) || (child.getFatherID() == charID)):
			result.append(child)
	return result

func getChildrenAmountOf(charID):
	var result = 0
	for child in children:
		if((child.getMotherID() == charID) || (child.getFatherID() == charID)):
			result += 1
	return result

func getChildrenAmountOfOnlyMother(charID):
	var result = 0
	for child in children:
		if(child.getMotherID() == charID):
			result += 1
	return result

func getChildrenAmountOfOnlyFather(charID):
	var result = 0
	for child in children:
		if(child.getFatherID() == charID):
			result += 1
	return result

func getSharedChildren(firstCharID, secondCharID):
	var result = []
	for child in children:
		if(((child.getMotherID() == firstCharID) && (child.getFatherID() == secondCharID)) || ((child.getFatherID() == firstCharID) && (child.getMotherID() == secondCharID))):
			result.append(child)
	return result

func getSharedChildrenAmount(firstCharID, secondCharID):
	var result = 0
	for child in children:
		if(((child.getMotherID() == firstCharID) && (child.getFatherID() == secondCharID)) || ((child.getFatherID() == firstCharID) && (child.getMotherID() == secondCharID))):
			result += 1
	return result

func getSharedChildrenAmountFatherMother(firstCharID, secondCharID):
	var result = 0
	for child in children:
		if((child.getFatherID() == firstCharID) || (child.getMotherID() == secondCharID)):
			result += 1
	return result

func getChildBirthInfoString(childs):
	var bornChildString = ""
	
	for child in childs:
		var fatherObject = GlobalRegistry.getCharacter(child.fatherID)
		var fatherName = "unknown"
		if(fatherObject != null):
			fatherName = fatherObject.getName()
		
		var motherObject = GlobalRegistry.getCharacter(child.motherID)
		var motherName = "unknown"
		if(motherObject != null):
			motherName = motherObject.getName()
		
		bornChildString += "[color="+NpcGender.getColorString(child.gender)+"]"+ NpcGender.getVisibleName(child.gender)+"[/color]"+" - "+Util.getSpeciesName(child.species)+" - "+"Mother: "+motherName+" - "+"Father: "+fatherName+"\n"
	return bornChildString

func saveData():
	var data = {}

	var childData = []
	for child in children:
		childData.append(child.saveData())

	data["children"] = childData

	return data

func loadData(data):
	children.clear()
	var childData = SAVE.loadVar(data, "children", [])
	
	for child in childData:
		var childObject = Child.new()
		childObject.loadData(child)
		children.append(childObject)
