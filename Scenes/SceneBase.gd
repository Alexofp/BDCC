extends Node
class_name SceneBase

#signal sayText(text)
#signal clearText
#signal answered
#signal clearButtons
#signal addButton(text, method, tooltip)
#signal addDisabledButton(text, tooltip)
signal sceneEnded(result)
var state: String = ""
var sceneID: String = "UNREGISTERED_SCENE"

func _ready():
	pass # Replace with function body.

func initScene():
	pass

func run(args = []):
	_scene(args)
	#var result = yield(_scene(args), "completed") 
	#return result

func _scene(_args):
	pass

func say(_text: String):
	if(GM.ui):
		GM.ui.say(_text)
	#emit_signal("sayText", _text)

func wait():
	var ans = yield(self, "answered")
	if(GM.ui):
		GM.ui.clearText()
		GM.ui.clearButtons()
	#emit_signal("clearText")
	#emit_signal("clearButtons")
	return ans

func react(method: String, _args):
	#emit_signal("answered", method)
	if(has_method(method)):
		GM.ui.clearText()
		GM.ui.clearButtons()
		
		callv(method, [_args])
	else:
		print("Error: method with the name '"+method+"' is not found in "+name + " ("+sceneID+")")

func endScene(result = []):
	GM.main.removeScene(self)
	emit_signal("sceneEnded", result)
	print("removing self")
	
	queue_free()

func runScene(id: String, callback: String = ""):
	runSceneArgs(id, [], callback)

func runSceneArgs(id: String, args = [], callback: String = ""):
	var newscene = GM.main.prepareScene(id)
	if(callback != ""):
		var _a = newscene.connect("sceneEnded", self, "on_child_scene_ended", [callback]) #, [callback]
		#newscene.emit_signal("sceneEnded", [])
		print("yep")
		
	GM.main.runScene(newscene, args)
	#newscene.run(args)

func on_child_scene_ended(_result, _callback):#, _callback):
	if(has_method(_callback)):
		callv(_callback, [_result])

func addNextButton(method: String, args = []):
	if(GM.ui):
		GM.ui.addButton("Next", "", method, args)
	#addButton("Next")

func addButton(text: String, tooltip: String = "", method: String = "", args = []):
	GM.ui.addButton(text, tooltip, method, args)
	#emit_signal("addButton", text, method, tooltip)
	
func addDisabledButton(text: String, tooltip: String = ""):
	GM.ui.addDisabledButton(text, tooltip)
	#emit_signal("addDisabledButton", text, tooltip)

func addButtonAt(index:int, text: String, tooltip: String = "", method: String = "", args = []):
	GM.ui.addButtonAt(index, text, tooltip, method, args)
	
func addDisabledButtonAt(index:int, text: String, tooltip: String = ""):
	GM.ui.addDisabledButtonAt(index, text, tooltip)

func _resume():
	pass
