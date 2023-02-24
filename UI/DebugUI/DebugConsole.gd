extends PanelContainer

onready var consoleLabel = $PanelContainer/ConsoleRichLabel
signal consoleClosed

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
