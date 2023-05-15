extends Control

onready var slotSlit = $HBoxContainer/PanelContainer/VBoxContainer/SlotList
onready var bodypartList = $HBoxContainer/PanelContainer/VBoxContainer/BodypartList
onready var doll = $HBoxContainer/DollWrapper/Viewport/Doll3D
onready var currentBodypartChoicesList = $HBoxContainer/PanelContainer/VBoxContainer/Control/HBoxContainer/CurrentBodypartChoices
onready var outputText = $HBoxContainer/PanelContainer/VBoxContainer/Control/HBoxContainer/OutputText
onready var thicknessSlider = $HBoxContainer/PanelContainer/VBoxContainer/Thickness
onready var feminitySlider = $HBoxContainer/PanelContainer/VBoxContainer/Feminity
var currentSlot
var bodypartChoices = []
var bodyparts = {}
var currentBodypart

var pickedThickness = 50
var pickedFemininity = 50

var optionListType = preload("res://UI/Options/OptionListType.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	thicknessSlider.setOptionName("Thickness")
	thicknessSlider.setOptionValue(pickedThickness)
	feminitySlider.setOptionValue(pickedFemininity)
	feminitySlider.setOptionName("Femininity")
	
	updateBodypartSlotsList()

func updateBodypartSlotsList():
	slotSlit.clear()
	for bodypartSlot in BodypartSlot.getAll():
		slotSlit.add_item(bodypartSlot)

func updateBodypartList():
	bodypartList.clear()
	bodypartChoices.clear()

	if(!BodypartSlot.isEssential(currentSlot)):
		bodypartList.add_item("nothing")
		bodypartChoices.append("NULL")

	var allbodypartsIDs = GlobalRegistry.getBodypartsIdsBySlot(currentSlot)
	for bodypartID in allbodypartsIDs:
		#var bodypart = GlobalRegistry.getBodypartRef(bodypartID)
		bodypartList.add_item(bodypartID)
		bodypartChoices.append(bodypartID)


func _on_SlotList_item_selected(index):
	var selectedSlot = BodypartSlot.getAll()[index]
	currentSlot = selectedSlot
	print(selectedSlot)
	
	updateBodypartList()


func _on_BodypartList_item_selected(index):
	if(currentSlot == null || currentSlot == ""):
		return
	
	var selectedBodypart = bodypartChoices[index]
	if(selectedBodypart == "NULL" && currentSlot != ""):
		doll.removeSlot(currentSlot)
		if(bodyparts.has(currentSlot)):
			bodyparts[currentSlot].queue_free()
			bodyparts.erase(currentSlot)
			generateText()
		return
	
	var bodypart:Bodypart = GlobalRegistry.createBodypart(selectedBodypart)
	
	if(bodyparts.has(currentSlot)):
		if(bodyparts[currentSlot].id == selectedBodypart):
			currentBodypart = bodyparts[currentSlot]
			updateCurrentBodypart()
			
			return
		
		bodyparts[currentSlot].queue_free()
		bodyparts.erase(currentSlot)
	bodyparts[currentSlot] = bodypart
	add_child(bodypart)
	
	var scenePath = bodypart.getDoll3DScene()
	if(scenePath != null && scenePath != ""):
		doll.addPartUnlessSame(currentSlot, scenePath)
	currentBodypart = bodypart
	updateCurrentBodypart()
	updateDoll()

func updateCurrentBodypart():
	Util.delete_children(currentBodypartChoicesList)

	if(currentBodypart == null):
		return
	
	var attributes = currentBodypart.getPickableAttributes()
	if(attributes == null):
		return
	
	for attribID in attributes:
		var data = attributes[attribID]
		
		var optionListObject = optionListType.instance()
		currentBodypartChoicesList.add_child(optionListObject)
		optionListObject.setValues(data["options"])
		optionListObject.setOptionName(data["textButton"])
		optionListObject.connect("value_changed", self, "onOptionListValueChanged")
		optionListObject.id = attribID
		
func onOptionListValueChanged(_categoryID, id, newvalue):
	if(currentBodypart == null):
		return
	
	currentBodypart.applyAttribute(id, newvalue)

	var scenePath = currentBodypart.getDoll3DScene()
	if(scenePath != null && scenePath != ""):
		doll.addPartUnlessSame(currentBodypart.getSlot(), scenePath)
	updateDoll()

func hasBodypart(slot):
	return bodyparts.has(slot)

func getThickness():
	return pickedThickness

func getFemininity():
	return pickedFemininity

func getPregnancyProgress():
	return 0.0

func getBodypart(slot):
	if(!hasBodypart(slot)):
		return null
	return bodyparts[slot]

func updateDoll():
	var breastsScale = 1.0
	if(hasBodypart(BodypartSlot.Breasts)):
		var breasts = getBodypart(BodypartSlot.Breasts)
		if(breasts.has_method("getBreastsScale")):
			breastsScale = breasts.getBreastsScale()
	doll.setBreastsScale(breastsScale)
	
	var penisScale = 1.0
	var ballsScale = 1.0
	if(hasBodypart(BodypartSlot.Penis)):
		var penis = getBodypart(BodypartSlot.Penis)
		if(penis.has_method("getPenisScale")):
			penisScale = penis.getPenisScale()
		if(penis.has_method("getBallsScale")):
			ballsScale = penis.getBallsScale()
	doll.setPenisScale(penisScale)
	doll.setBallsScale(ballsScale)
	
	var thicknessNorm = getThickness() / 100.0
	var femNorm = getFemininity() / 100.0
	var pregnancyAddition = 0.0
	if(femNorm < 0.5):
		pregnancyAddition = -0.1 * (1.0 - (femNorm * 2.0))
	doll.setPregnancy(getPregnancyProgress() + pregnancyAddition)
	
	if(thicknessNorm <= 0.5):
		doll.setButtScale(1.0 - 0.2 * (1.0 - thicknessNorm * 2))
		doll.setThighThickness(- 0.4 * (1.0 - thicknessNorm * 2))
	else:
		doll.setButtScale(1.0 + (thicknessNorm - 0.5)/1.5)
		doll.setThighThickness((thicknessNorm - 0.5))
	generateText()

#func createBodyparts():
#	var mybreasts: BodypartBreasts = GlobalRegistry.createBodypart("humanbreasts")
#	mybreasts.size = BreastsSize.G
#	giveBodypartUnlessSame(mybreasts)
#	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
#	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
#	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
#	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanbody"))
#	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninearms"))
#	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
#	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorthair"))
#	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineleg"))
#	var penis:BodypartPenis = GlobalRegistry.createBodypart("caninepenis")
#	penis.lengthCM = 21
#	giveBodypartUnlessSame(penis)
#	giveBodypartUnlessSame(GlobalRegistry.createBodypart("huskytail"))

func generateText():
	var text = "func getThickness() -> int:\n"
	text += "\treturn "+str(pickedThickness)+"\n\n"
	text += "func getFemininity() -> int:\n"
	text += "\treturn "+str(pickedFemininity)+"\n\n"
	
	text += "func createBodyparts():\n"
	
	for bodypartSlot in bodyparts:
		var bodypart = bodyparts[bodypartSlot]
		var charData = bodypart.getCharCreatorData()
		if(charData == null || charData.size() == 0):
			text += "\tgiveBodypartUnlessSame(GlobalRegistry.createBodypart(\""+bodypart.id+"\"))\n"
		else:
			text += "\tvar "+str(bodypartSlot)+" = GlobalRegistry.createBodypart(\""+bodypart.id+"\")\n"
			for thing in charData:
				text += "\t"+str(bodypartSlot)+"."+thing[0]+" = "+str(thing[1])+"\n"
			text += "\tgiveBodypartUnlessSame("+str(bodypartSlot)+")\n"
		
	outputText.text = text


func _on_Thickness_value_changed(_categoryID, _id, newvalue):
	pickedThickness = newvalue
	updateDoll()
	generateText()


func _on_Feminity_value_changed(_categoryID, _id, newvalue):
	pickedFemininity = newvalue
	updateDoll()
	generateText()
