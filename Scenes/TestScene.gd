extends "res://Scenes/SceneBase.gd"

func _run():
	if(state == ""):
		say("Hello world!\n")
		say("nya [b]bold nya[/b], also [i]\"MEOW\"[/i]")
		addButton("meow meow", "1", "option1")
		addButton("mew!", "2", "option2")
		addDisabledButton("bark", "no awo")
		
	if(state == "option1"):
		say("You selected 1")
		addNextButton("endstuff")
		
	if(state == "option2"):
		say("You selected TWOOO")
		addNextButton("addscenetest")
		
	if(state == "endstuff"):
		say("Yes this is dog")
		addNextButton("endthescene")
		
	if(state == "meowmeow"):
		say("WELCOME BACK, WANNA START AGAIN?")
		addNextButton("endthescene")
		addButton("sure", "you agree to everything", "_scene")


func _react(_action: String, _args):
	if(_action == "addscenetest"):
		runScene("TestScene", "meowmeow")
		return
	if(_action == "endthescene"):
		endScene("test arg")
		return
	
	setState(_action)

func _react_scene_end(_result):
	print("I got result: "+str(_result))
	setState("")
