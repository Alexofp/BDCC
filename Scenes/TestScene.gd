extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "TestScene"

func _run():
	if(state == ""):
		say("Hello world!\n")
		say("nya [b]bold nya[/b], also [i]\"MEOW\"[/i]\n")
		say(GM.pc.getName() + " grabbed " + GM.pc.hisHer() + " something and headpatted "+ GM.pc.himselfHerself() + " before saying "+Util.sayPlayer("Hello world"))
		addButton("stop", "1", "option1")
		addButton("run same scene", "2", "option2")
		addDisabledButton("bark", "no awo")
		addButton("replace scene!", "2", "startfight")
		addButton("pick gender", "2", "pickgender")
		addButton("pick pronouns", "2", "pickpronouns")
		addButton("change name", "2", "pickname")
		
	if(state == "pickgender"):
		say("Pick")
		addButton("Male", "2", "setgender", [Gender.Male])
		addButton("Female", "2", "setgender", [Gender.Female])
		addButton("Androgynous", "2", "setgender", [Gender.Androgynous])
		addButton("Other", "2", "setgender", [Gender.Other])
		addButton("back", "2", "")
		
	if(state == "pickpronouns"):
		say("Pick")
		addButton("Male", "2", "setpronouns", [Gender.Male])
		addButton("Female", "2", "setpronouns", [Gender.Female])
		addButton("Androgynous", "2", "setpronouns", [Gender.Androgynous])
		addButton("Other", "2", "setpronouns", [Gender.Other])
		addButton("Same as gender", "2", "setpronouns", [null])
		addButton("back", "2", "")
		
	if(state == "pickname"):
		say("Type in your name here:")
		addTextbox("player_name")
		addButton("Confirm", "2", "setname")
		addButton("back", "2", "")
		
	if(state == "option1"):
		say("You selected 1")
		setCharacter("testchar")
		addNextButton("endstuff")
		
	if(state == "option2"):
		say("You selected TWOOO")
		addNextButton("addscenetest")
		
	if(state == "endstuff"):
		say("Yes this is dog")
		setCharacter("")
		addNextButton("endthescene")
		
	if(state == "meowmeow"):
		say("WELCOME BACK, WANNA START AGAIN?")
		addNextButton("endthescene")
		addButton("sure", "you agree to everything", "_scene")


func _react(_action: String, _args):
	if(_action == "addscenetest"):
		runScene("TestScene", "meowmeow", "mytag")
		return
	if(_action == "endthescene"):
		endScene("test arg")
		return
	if(_action == "startfight"):
		runScene("FightScene", ["testchar"])
		endScene("test arg")
		return
	if(_action == "setgender"):
		GM.pc.setGender(_args[0])
		setState("")
		return
	if(_action == "setpronouns"):
		GM.pc.setPronounGender(_args[0])
		setState("")
		return
	if(_action == "setname"):
		GM.pc.setName(getTextboxData("player_name"))
		setState("")
		return
	
	setState(_action)

func _react_scene_end(_tag, _result):
	print("I got result: "+str(_result)+" and tag '"+_tag+"'")
	setState("")
