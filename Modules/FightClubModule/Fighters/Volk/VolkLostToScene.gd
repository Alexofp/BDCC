extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "VolkLostToScene"

func _run():
	if(state == ""):
		addCharacter("volk")
		playAnimation(StageScene.Duo, "kneel", {npc="volk"})

	if(state == ""):
		saynn("Volk laughs seeing you collapse to the floor.")

		saynn("[say=volk]Finally![/say]")

		saynn("He jumps to you and catches before your head can hit the floor. He then positions you so you are sitting. You pant heavily, unable to shove him off.")

		saynn("[say=volk]What? Think I will hurt ya? I already did. So what are you afraid of?[/say]")

		saynn("He produces his shiv and holds it to your neck. You instinctively hold your chin high. The crowd is actually rather quiet, they seem to be fascinated by the guy’s actions.")

		saynn("[say=volk]You were right to be afraid though, suka..[/say]")

		addButton("Weapon play", "See what happens next", "weapon_play")
		GM.ES.triggerRun("ArenaFighterPCLost", ["volk"])

	if(state == "weapon_play"):
		playAnimation(StageScene.SexStart, "start", {pc="volk", npc="pc"})
		
		saynn("[say=pc]What do you want?[/say]")

		saynn("He looms over you, his muzzle dangerously close to yours, his hand fidgeting with the sharpened piece of glass near your neck.")

		saynn("[say=volk]I.. Look how close you are to your death.. I just wanna explain.. That there is more to life..[/say]")

		saynn("[say=pc]You can’t kill me.[/say]")

		saynn("He steps back and laughs while opening up to the crowd. The guy walks around you while you’re unable to do anything.")

		saynn("[say=volk]This suka here thinks inmates play by the rules.[/say]")

		saynn("Then he suddenly jumps closer to you and prods your chin with the shiv, making you look up at him unless you want an extra hole in you.")

		saynn("[say=volk]This is the wilderness. We are the animals. We speak the language.. of fear.[/say]")

		saynn("You try to look away but Volk applies extra pressure, making you hiss from the discomfort. He seems to be bathing in his power over you, his smug face shows it all.")

		saynn("[say=volk]Fear makes you act like a subby suka. Just like huge cocks. Funny, huh? Such a huge contrast to all the pleasure you had.[/say]")

		saynn("He starts to slowly drag his makeshift weapon down your chin and neck.. While putting just enough pressure to make it feel painful. You gasp as his shaky hand skips a bit of your skin and leaves a cut. Ow..")

		saynn("[say=volk]Hurts? Good.. I won’t kill you. But I can make it hurt.[/say]")

		# (if has clothing)
		if(!GM.pc.isFullyNaked()):
			saynn("His weapon jumps over your collar and goes for your clothing. He uses the sharp part to open up your chest, exposing your {pc.breasts}. You’re too afraid to cover yourself with that sharp thing nearby.")

		# (if naked)
		else:
			saynn("His weapon jumps over your collar and slides lower, closer to your chest. He uses the sharp path to draw an imaginary outline around your {pc.breasts}. You’re too afraid to cover yourself with that sharp thing nearby.")

		saynn("[say=volk]Don’t worry though. Just like you can enjoy a huge cock, you can also learn to enjoy the pain.[/say]")

		saynn("The tip of his weapon brushes over your nipple, making you feel strange sensations. Then he does the same to the other one. It tickles.. no.. You close your eyes.. it feels like a rough tongue going over your sensitive spots. You feel your nips hardening in response, it’s.. arousing.")

		saynn("The more he teases you the deeper your breathing becomes, the shiv prods one of your nipples with enough pressure to cause a little bleeding. When it does that, you arch your back and let out a muffled moan. What should have been pretty painful seems kinda pleasurable..")

		saynn("[say=volk]Such a good suka.[/say]")

		saynn("And with that, he puts his shiv away and taps on your cheek, trying to bring you out of the trance-like state. He then laughs and climbs over the fence, leaving you be.")

		saynn("What the fuck was that.")

		# (scene ends)

		addButton("Continue", "Time to run", "endthescene")


func _react(_action: String, _args):
	
	if(_action == "weapon_play"):
		GM.pc.addLust(30)
		GM.pc.addPain(5)
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

