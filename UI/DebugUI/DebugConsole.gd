extends PanelContainer

onready var profile_button:Button = $PanelContainer/HBoxContainer/ProfileButton
onready var consoleLabel = $PanelContainer/ConsoleRichLabel
signal consoleClosed
onready var mem_label:Label = $"%MemLabel"

var savedText = ""

func printLine(text : String):
	if (!consoleLabel):
		return
	savedText += text+"\n"
	if(savedText.length() > 20000):
		savedText = savedText.substr(savedText.length() - 10000)
	if(visible):
		consoleLabel.bbcode_text = savedText

func _on_ConsoleInput_text_entered(new_text):
	#print(new_text)
	Console.doTextCommand(new_text)
	$PanelContainer/ConsoleInput.text = ""

func _on_ClearButton_pressed():
	savedText = ""
	consoleLabel.bbcode_text = ""

func _on_CloseButton_pressed():
	emit_signal("consoleClosed")


func _on_DebugConsole_visibility_changed():
	if(visible):
		consoleLabel.bbcode_text = savedText
		$PanelContainer/ConsoleInput.grab_focus()
		$PanelContainer/HelpLabel.bbcode_text = "Console commands:\n"+Console.getCommandsHelp()
	set_process(true)

func _on_ProfileButton_pressed():
	OPTIONS.toggleShouldProfile()
	if(OPTIONS.shouldProfile()):
		printLine("Perfomance profiler enabled")
	else:
		printLine("Perfomance profiler disabled")

func _on_ConsoleInput_gui_input(event):
	if event is InputEventKey: # hacky but should work and allow toggling the console, and keep the typed character if need be
		Console._unhandled_key_input(event)

func _process(_delta:float):
	if(!is_visible_in_tree()):
		set_process(false)
	var theVideoMem:String = String.humanize_size(int(Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED)))
	var theStaticMem:String = String.humanize_size(int(Performance.get_monitor(Performance.MEMORY_STATIC)))
	var theStaticMemMax:String = String.humanize_size(int(Performance.get_monitor(Performance.MEMORY_STATIC_MAX)))
	var theDynMem:String = String.humanize_size(int(Performance.get_monitor(Performance.MEMORY_DYNAMIC)))
	var theDynMemMax:String = String.humanize_size(int(Performance.get_monitor(Performance.MEMORY_DYNAMIC_MAX)))
	var theString:String = "FPS: "+str(int(Performance.get_monitor(Performance.TIME_FPS)))+ "\t VRAM: "+theVideoMem+ "\t Static memory: "+theStaticMem+"/"+theStaticMemMax+"\t Dynamic memory: " + theDynMem+"/"+theDynMemMax+"\t Objects: "+str(int(Performance.get_monitor(Performance.OBJECT_COUNT)))+"\t Nodes: "+str(int(Performance.get_monitor(Performance.OBJECT_NODE_COUNT)))+"\t Resources: "+str(int(Performance.get_monitor(Performance.OBJECT_RESOURCE_COUNT)))+"\t Orphan nodes(leaked): "+str(int(Performance.get_monitor(Performance.OBJECT_ORPHAN_NODE_COUNT)))
	
	mem_label.text = theString
