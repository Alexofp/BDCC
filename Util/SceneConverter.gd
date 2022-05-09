extends Control

# Can be used to quickly convert a scene from a google docs document into code

onready var inputTextEdit = $VBoxContainer/TextEdit
onready var outputTextEdit = $VBoxContainer/TextEdit2

func _ready():
	$VBoxContainer/TextEdit2.add_color_region('#', '', Color.cadetblue)

func _on_Button_pressed():
	var result = ""
	var text = inputTextEdit.text
	var usedKeys = {}
	
	var lines = text.split("\n")
	
	result += "\t" + "if(state == \"\"):\n"
	
	for line in lines:
		var textline: String = line
		textline = textline.trim_prefix(" ").trim_suffix(" ")
		if(textline == ""):
			continue
		
		if(textline.begins_with(">")):
			textline = textline.substr(1).trim_prefix(" ")
						
			var firstComma = textline.find(",")
			var buttonText = ""
			var buttonDesc = ""
			if firstComma >= 0:
				buttonText = textline.substr(0, firstComma).trim_prefix(" ").trim_suffix(" ")
				buttonDesc = textline.substr(firstComma+1).trim_prefix(" ").trim_suffix(" ")
			else:
				buttonText = textline
			
			var keyOrig = buttonText.to_lower().replace(" ", "_")
			var key = keyOrig
			var i = 1
			while(usedKeys.has(key)):
				key = keyOrig + str(i)
				i += 1
			usedKeys[key] = true
			
			result += "\t\t" + "addButton(\""+buttonText+"\", \""+buttonDesc+"\", \""+key+"\")\n\n"
			
			result += "\t" + "if(state == \""+key+"\"):\n"
		else:
			var trimmedLine = textline.trim_prefix(" ").trim_suffix(" ")
			
			if(trimmedLine.length() > 0 && trimmedLine[0] == "("):
				result += "\t\t" + "# "+trimmedLine+"\n\n"
			else:
				result += "\t\t" + "saynn(\""+trimmedLine+"\")\n\n"
	
	outputTextEdit.text = result
