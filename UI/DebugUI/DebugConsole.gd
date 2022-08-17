extends PanelContainer

onready var consoleLabel = $PanelContainer/ConsoleRichLabel
signal consoleClosed

func printLine(text : String):
	if (!consoleLabel):
		return
	consoleLabel.bbcode_text += text+"\n"

func _on_ConsoleInput_text_entered(new_text):
	#print(new_text)
	Console.doTextCommand(new_text)
	$PanelContainer/ConsoleInput.text = ""

func _on_ClearButton_pressed():
	consoleLabel.bbcode_text = ""

func _on_CloseButton_pressed():
	emit_signal("consoleClosed")


func _on_DebugConsole_visibility_changed():
	if(visible):
		$PanelContainer/ConsoleInput.grab_focus()
		$PanelContainer/HelpLabel.bbcode_text = "Console commands:\n"+Console.getCommandsHelp()
