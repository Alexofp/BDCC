tool
extends EditorPlugin

const version:String = "1.0"
var dock
var file:File = File.new()
const savePath:String = "res://addons/godot-notes/notes.txt"

func _enter_tree() -> void:
	dock = preload("res://addons/godot-notes/notes.tscn").instance()
	add_control_to_dock(DOCK_SLOT_RIGHT_UL, dock)
	
	dock.get_node("hBoxContainer/btn_save").connect("pressed", self, "_btn_save_click")
	dock.get_node("hBoxContainer/btn_refresh").connect("pressed", self, "_btn_reload_click")
	dock.get_node("hBoxContainer/btn_infos").connect("pressed", self, "_btn_infos_click")
	dock.get_node("infos_dialog/btn_close").connect("pressed", self, "_btn_infos_close_click")
	dock.get_node("textEdit").connect("text_changed", self, "_text_change")

	dock.get_node("infos_dialog/version").text = "Notes "+version+" by Roboweb"

	load_game()

func _exit_tree() -> void:
	remove_control_from_docks(dock)
	dock.queue_free()

func _btn_save_click() -> void:
	file.open(savePath, File.WRITE)
	file.store_string(dock.get_node("textEdit").text)
	file.close()
	dock.get_node("hBoxContainer/label").text = "All is ok..."

func _btn_reload_click() -> void:
	load_game()

func load_game() -> void:
	if file.file_exists(savePath):
		file.open(savePath, File.READ)
		dock.get_node("textEdit").text = file.get_as_text()
		dock.get_node("hBoxContainer/label").text = "All is ok..."

func _btn_infos_click() -> void:
	dock.get_node("infos_dialog").popup_centered()

func _btn_infos_close_click() -> void:
	dock.get_node("infos_dialog").hide()

func _text_change() -> void:
	dock.get_node("hBoxContainer/label").text = "Save changes!"



