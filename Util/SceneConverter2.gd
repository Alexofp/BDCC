extends Control

# Can be used to quickly convert a scene from a google docs document into code
var lines = []
var _i = 0
var runs = {}
var currentRun = ""
var tabAmount = 0
var reacts = {}
var sceneID = "TestScene"

func reset():
	lines = []
	reacts = {}
	_i = 0
	runs = {}
	currentRun = ""
	tabAmount = 0
	sceneID = "TestScene"

func setCurrentRun(newcur):
	currentRun = newcur

func addToRun(thetext):
	for _j in range(tabAmount+2):
		thetext = "\t"+thetext
		
	addToRunNoTabs(thetext)

func addToRunNoTabs(thetext):
	if(!runs.has(currentRun)):
		runs[currentRun] = []
		
	runs[currentRun].append(thetext)

onready var inputTextEdit = $VBoxContainer/TextEdit
onready var outputTextEdit = $VBoxContainer/TextEdit2

func _ready():
	$VBoxContainer/TextEdit2.add_color_region('#', '', Color.cadetblue)

func _on_Button_pressed():
	reset()
	var result = []
	var text:String = inputTextEdit.text
	text = text.replace("“", '"')
	text = text.replace("”", '"')
	text = text.replace("‘", "'")
	text = text.replace("’", "'")
	
	lines = text.split("\n")
	_i = 0
	var linesSize = lines.size()
	while(_i < linesSize):
		var lineA = lines[_i]
		var line: String = lineA.strip_edges()
		
		# Empty line
		if(line == ""):
			_i += 1
			continue
		
		if(line.begins_with("sceneID=")):
			sceneID = line.substr(8).strip_edges()
			_i += 1
			continue
		
		# Comments
		if(line.begins_with("((")):
			addToRun("# "+ line)
			_i += 1
			continue
		
		# Code
		if(line.begins_with("! ")):
			var condition = line.substr(2)
			addToRun(condition)
			_i += 1
			continue
		
		# IFs
		if(line.begins_with("? ")):
			var condition = line.substr(2)
			addToRun('if ('+condition+'):')
			tabAmount += 1
			_i += 1
			continue
		if(line.begins_with("?else")):
			tabAmount -= 1
			addToRun('else:')
			tabAmount += 1
			_i += 1
			continue
		if(line.begins_with("?elif ")):
			var condition = line.substr(6)
			tabAmount -= 1
			addToRun('elif ('+condition+'):')
			tabAmount += 1
			_i += 1
			continue
		if(line.begins_with("?!") || line.begins_with("?end")):
			tabAmount -= 1
			#addToRun('')
			_i += 1
			continue
		
		if(line.begins_with("=")):
			var content = line.substr(1)
			var splittedContent = content.split(":")
			
			var charID = splittedContent[0].strip_edges()
			splittedContent.remove(0)
			var whatSaid = Util.join(splittedContent, ":").strip_edges()
			
			addToRun('saynn("[say='+charID+']'+whatSaid+'[/say]")\n')
			_i += 1
			continue
		
		# actions
		if(line.begins_with("[[")):
			var stuff = line.substr(2).strip_edges()
			if(stuff.ends_with("]]")):
				var splittedStuff = stuff.trim_suffix("]]").split(",")
				
				var theid = splittedStuff[splittedStuff.size()-1].strip_edges()
				var thename = splittedStuff[0].strip_edges()
				splittedStuff.remove(0)
				splittedStuff.remove(splittedStuff.size()-1)
				var thedesc = Util.join(splittedStuff, ",").strip_edges()
				addToRun('addButton("'+thename+'", "'+thedesc+'", "'+theid+'")')
				_i += 1
				continue
			else:
				var splittedStuff = stuff.split(",")
				
				var theid = splittedStuff[splittedStuff.size()-1].strip_edges()
				var thename = splittedStuff[0].strip_edges()
				splittedStuff.remove(0)
				splittedStuff.remove(splittedStuff.size()-1)
				var thedesc = Util.join(splittedStuff, ",").strip_edges()
				addToRun('addButton("'+thename+'", "'+thedesc+'", "'+theid+'")')
				_i += 1
				
				reacts[theid] = []
				while(true):
					var reactlineA = lines[_i]
					var reactline: String = reactlineA#.strip_edges()
					
					if(reactline == "]]"):
						_i += 1
						break
						
					reacts[theid].append(reactline)
					_i += 1
				continue
					
				
		
		# new states
		if(line.begins_with(">")):
			var stuff = line.substr(1).strip_edges()
			var splittedStuff = stuff.split(",")
			var newid = ""
			if(splittedStuff.size() > 1):
				newid = splittedStuff[splittedStuff.size() - 1].strip_edges()
			else:
				newid = splittedStuff[0].strip_edges()
				
			# Check if we used such id already?
			setCurrentRun(newid)
			tabAmount = 0
			_i += 1
			continue
		
		line = line.replace("{{", '"+str(')
		line = line.replace("}}", ')+"')
		addToRun('saynn("'+line+'")\n')
		_i += 1
	
	
	result.append("extends SceneBase")
	result.append("")
	result.append("func _init():")
	result.append('\tsceneID = "'+sceneID+'"')
	result.append("")
	
	result.append("func _run():")
	for runID in runs:
		if(runs[runID].size() > 0):
			result.append('\tif(state == "'+runID+'"):')
			
			#var toAdd = []
			result.append(Util.join(runs[runID], "\n"))
	
	result.append("")
	
	result.append("func _react(_action: String, _args):")
	result.append('\tif(_action == "endthescene"):')
	result.append('\t\tendScene()')
	result.append('\t\treturn')
	result.append("")
	
	for reactID in reacts:
		if(reacts[reactID].size() > 0):
			result.append('\tif(_action == "'+reactID+'"):')
			
			for reactLine in reacts[reactID]:
				result.append('\t\t'+reactLine)
			result.append('')
	
	result.append("\tsetState(_action)")
	
	outputTextEdit.text = Util.join(result, "\n")
