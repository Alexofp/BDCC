extends SubGameWorld

func _on_ScriptedRoom_onEnter(room: GameRoom):
	#room.clearScreen()
	room.say("Meow")
	room.addButton("Do mew", "Talk to mew", "wut")
	#room.runSceneAndResume("TestScene")


func _on_ScriptedRoom_onReact(room, key):
	if(key == "wut"):
		room.say("yap")
		room.addButton("Do more mew", "Talk to mew", "wut")
		room.addButton("Return", "Talk to mew", "wut2")
		room.addButton("start a scene", "Talk to mew", "wut3")
	if(key == "wut2"):
		#GM.pc.breasts.size = BodypartBreasts.BreastsSize.A
		#GM.pc.updateAppearance()
		GM.main.resume()
	if(key == "wut3"):
		room.runSceneAndResume("TestScene")
