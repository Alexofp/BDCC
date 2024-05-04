extends Node
# heavily modified from https://github.com/jitspoe/godot-console

onready var control := Control.new()
var consoleScene = preload("res://UI/DebugUI/DebugConsole.tscn")

var commands = {}

signal onConsoleOutput(text)

func _ready():
	var canvas_layer := CanvasLayer.new()
	canvas_layer.layer = 3
	add_child(canvas_layer)
	control.anchor_bottom = 0.9
	control.anchor_right = 1.0
	canvas_layer.add_child(control)
	control.visible = false
	
	var console = consoleScene.instance()
	control.add_child(console)
	var _ok = connect("onConsoleOutput", console, "printLine")
	var _ok2 = console.connect("consoleClosed", self, "toggleConsole")

	pause_mode = PAUSE_MODE_PROCESS

	printLine("This is a development console")
	addCommand("quit", self, "quit")
	addCommand("help", self, "help")

func quit():
	get_tree().quit()

func help():
	printLine(getCommandsHelp())

func _input(event : InputEvent):
	if (event is InputEventKey):
		if (event.pressed && event.physical_scancode == 96):
			if (event.pressed):
				toggleConsole()
				get_tree().set_input_as_handled()
		elif (event.pressed && event.physical_scancode == KEY_ESCAPE && control.visible):
			if (event.pressed):
				toggleConsole()
				get_tree().set_input_as_handled()
				
func toggleConsole():
	control.visible = !control.visible

func addCommand(command_name : String, object : Object, function_name : String, params : Array = [], description : String = "No description provided"):
	commands[command_name] = {
		"function": funcref(object, function_name),
		"object": weakref(object),
		"params": params,
		"description": description,
	}

func removeCommand(command_name : String):
	commands.erase(command_name)

func doTextCommand(command):
	printLine(command)
	var split_text:Array = command.split(" ", true)
	if (split_text.size() > 0):
		var command_string = split_text[0]
		if (commands.has(command_string)):
			var command_entry = commands[command_string]
			
			var ref = command_entry["object"]
			if(ref.get_ref() == null):
				printLine("Object was destroyed, command is invalid.")
				return
			
			split_text.pop_front()
			if(split_text.size() != command_entry["params"].size()):
				printLine("Wrong amount of arguments, expected: "+str(command_entry["params"].size()))
				return
			command_entry["function"].call_funcv(split_text)

		else:
			printLine("Command not found.")

func printLine(text: String):
	emit_signal("onConsoleOutput", text)

func getCommandsHelp():
	var result = ""
	for command_name in commands:
		var command = commands[command_name]
		result += command_name + " - args=" + str(command["params"])+" - " + str(command["description"])+"\n"
		
	return result
