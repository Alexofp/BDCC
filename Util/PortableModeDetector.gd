extends Node

# Seperate class so we can add it as an autoload node and set it to be first

func _init():
	var exe_dir = OS.get_executable_path().get_base_dir()
	var portable_dir = exe_dir.plus_file("BDCCData/")

	if Directory.new().dir_exists(portable_dir):
		call_deferred("delayedLogPrint", "Using portable save directory: " + portable_dir)

		if !Directory.new().dir_exists(portable_dir.plus_file("/Godot/app_userdata/BDCC")):
			Directory.new().make_dir_recursive(portable_dir.plus_file("/Godot/app_userdata/BDCC"))
		
		if OS.has_environment("APPDATA"):
			OS.set_environment("APPDATA", portable_dir)  # Windows
		if OS.has_environment("HOME"):
			OS.set_environment("HOME", portable_dir)  # Linux & Mac

func _ready():
	queue_free() # Not needed anymore

# Console doesn't exist when this object is doing its thing
func delayedLogPrint(theText:String):
	Log.print(theText)
