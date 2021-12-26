extends "res://Scenes/SceneBase.gd"

func _scene(_args):
	say("Hello world!\n")
	say("nya [b]bold nya[/b], also [i]\"MEOW\"[/i]")
	addButton("meow meow", "1", "option1")
	addButton("mew!", "2", "option2")
	addDisabledButton("bark", "no awo")
	
#	var ans = yield(wait(), "completed")
#
#	if(ans == "1"):
#		say("You selected 1")
#		addNextButton()
#		yield(wait(), "completed")
#	if(ans == "2"):
#		say("You selected TWOOO")
#		addNextButton()
#		yield(wait(), "completed")
#
#	say("Yes this is dog")
#	addNextButton()
#	print(yield(wait(), "completed"))
#
#	say("fuck")

func option1(_args):
	say("You selected 1")
	addNextButton("endstuff")
	
func option2(_args):
	say("You selected TWOOO")
	addNextButton("addscenetest")

func endstuff(_args):
	say("Yes this is dog")
	addNextButton("endthescene")
	
func addscenetest(_args):
	runScene("TestScene", "meowmeow")
	
func meowmeow(_args):
	#print(_args)
	say("WELCOME BACK, WANNA START AGAIN?")
	addNextButton("endthescene")
	addButton("sure", "you agree to everything", "_scene")
	
func endthescene(_args):
	endScene()


#func whatever():
#	say lala
#   addbutton fuck fuck()
#   addbutton no no()

#func fuck
#	runScene('Fuck', 'callback')

#func callback(result: Array):
#	if(result[0] == 'good'):
#		say good job

#func no
#	endScene(['good'])


