extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RahiYogaScene"

func _run():
	if(state == ""):
		addCharacter("rahi")

	if(state == ""):
		saynn("You decide to instead sit down on the nearest bench and watch the kitty for a bit, she seems completely unaware of you, her back is turned towards you. Kitty is wearing her general inmate uniform, she is standing still on one of the mats, her whole body motion-less, even the tail.")

		saynn("Kitty closes her eyes and raises one of legs above the mat. She then bends it in the knee and presses against the second one, her footpads are brushing against her fur as she now has to keep careful balance. She connects her palms in a way that looks like she is praying. She assumes this pose and her body becomes motionless, again, for a while. Only her tail slightly tilts left and right to help counteract the gravity. You can hear kitty inhaling and exhaling, her breathing is slow and steady, with huge pauses in-between.")

		saynn("Then kitty assumes another position, she slowly lowers herself to her knees and places her arms on her thighs. Now, kneeling, she lowers her butt towards her feet even more as she stretches her upper body forward and down with her arms extended, her stomach seems to be comfortable resting on her girly thighs with her feline muzzle touching the mat. In that position she kinda looks like a girl showing off her submission to somebody. She inhales and exhales deeply..")

		saynn("After that pose, kitty raises her upper body again until she is standing but on all fours this time, it looks like she is doing a cat/cow pose. She inhales and rounds up her spine towards the ceiling while also lowering her chin as much as her bulky collar allows her. On the next inhale she instead arches her back the other way and lifts her butt and her head upwards. Oh wow, she is sticking out her covered up butt so much. If not for the shorts, it would look like she is presenting you her butt for something very lewd. As she is bending her back and stretching, you can hear noises coming from her maw. Is she.. moaning? That’s kinda cute.")

		saynn("Kitty then raises her body even more, now standing on her palms and feet, creating a round arch. Though she then lifts her hips higher until her body starts to resemble a V-shape instead, her legs are 90 degrees to her waist, giving you a great view of her crotch as she begins to stretch and make cute noises again, even her ears and her tail shake slightly as she produces a quiet moan.")

		addButton("Grab her attention", "Announce your presence", "grab_her_attention")

	if(state == "grab_her_attention"):
		saynn("[say=pc]Hi there, kitty.[/say]")

		saynn("[say=rahi]Oh? Meow..[/say]")

		saynn("Kitty, still holding the downward-facing dog pose, spreads her legs more and finally notices you. Deep red blush shows up on her cheeks as she realizes what happened. Her stance becomes wobbly as she struggles to keep balance.")

		saynn("[say=pc]You’re doing great, kitty.[/say]")

		saynn("[say=rahi]T-thanks.[/say]")

		addButton("Leave", "Enough starring", "leave")

	if(state == "leave"):
		saynn("You decide not to make the poor kitty look even more embarrassed and stand up from the bench.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


func _react(_action: String, _args):
	
	if(_action == "endthescene"):
		processTime(60*60*1)
		
		endScene()
		return

	setState(_action)

