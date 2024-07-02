extends Control

var isPickVersion = true
var id = "base"
var codeBlock
onready var template_vertical_list = $HBoxContainer/TemplateVerticalList

func get_drag_data(_position):
	#if(!isPickVersion):
	#	return null
	var mydata = {
		id = id,
		ref = self,
	}
	#set_drag_preview(make_preview(mydata))
	print("BEGAN DRAG!")
	return mydata

func setIsSpawned():
	isPickVersion = false

func setCodeBlock(newCodeBlock):
	codeBlock = newCodeBlock
	constructTemplate()

func constructTemplate():
	Util.delete_children(template_vertical_list)
	
	var theTemplate = codeBlock.template
	var currentHBox:HBoxContainer = null
	
	for templateLine in theTemplate:
		var templateType = templateLine[0]
		
		if(currentHBox == null):
			currentHBox = HBoxContainer.new()
			template_vertical_list.add_child(currentHBox)
		
		if(templateType == "label"):
			var newLabel = Label.new()
			currentHBox.add_child(newLabel)
			newLabel.text = templateLine[1]
		if(templateType == "slot"):
			#var curVal = codeBlock.data[templateLine[1]]
			#if(curVal is CrotchBlock):
			#	var newScene = curVal.createVisualScene()
				
			
			var newEdit = LineEdit.new()
			currentHBox.add_child(newEdit)
			newEdit.text = templateLine[3]
