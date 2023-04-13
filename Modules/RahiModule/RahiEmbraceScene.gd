extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RahiEmbraceScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Cuddling, "idle", {npc="rahi"})
		
	if(state == ""):
		saynn("You put your hands on the shy feline’s waist.")

		saynn("[say=pc]Is it okay?[/say]")

		saynn("Kitty mewls and nods subtly. You get a better grasp on her body and raise her a bit before swiftly sliding under her and putting her back down to rest between your legs. You wrap your hands around the cat and rest your chin on her shoulder. Having you nearby causes her to start purring softly.")

		# (if very pregnant)
		if(getCharacter("rahi").isHeavilyPregnant()):
			saynn("The feline’s belly is sticking out a lot, kitty seems to be pretty far into her pregnancy. Her breasts look way bigger too, up to D-cup from her usual C-cup.")

		# (if visible pregnant)
		elif(getCharacter("rahi").isVisiblyPregnant()):
			saynn("The feline looks down at her belly. At this stage it’s hard to tell that she is pregnant under her uniform.")

		# (else)
		else:
			saynn("The feline just keeps stroking her tail like she usually does.")

		addButton("Kiss her", "Just a simple kiss won’t hurt", "kiss_her")
		if(getCharacter("rahi").canBeMilked()):
			addButton("Milk her", "Help her with the itching nipples", "milk_her")
		else:
			addDisabledButton("Milk her", "Kitty is not lactating")

	if(state == "kiss_her"):
		saynn("You land a little kiss on kitty’s cheek. She mewls and kisses you back. You catch that one and drag it on, turning it into a long passionate one.. All the while your hands undo the first few buttons on her shirt and expose more of her shoulder area. Then you pull away from the kiss and move your head to her neck.")

		saynn("You breathe in her feline scent and proceeds to cover her neck and shoulders with lots of little kisses. She tilts her away slightly, giving you more access to her fur.")

		# (if heavily pregnant)
		if(getCharacter("rahi").canBeMilked()):
			saynn("Your hands shift down to her D-cup breasts and cup them. A gentle squeeze is enough to make the kitty moan in your hands, her dark nipples squirt a bit of her milk.")

		# (if not pregnant)
		else:
			saynn("Your hands shift down to her modest breasts and cup them. A gentle squeeze is enough to make the kitty moan in your hands. All the while you keep kissing her.")

		saynn("[say=rahi]You’re so nice..[/say]")

		saynn("[say=pc]Can’t always be rough. Some contrast is nice, isn’t it.[/say]")

		saynn("Kitty nods. You keep doing this for a while, who cares what looks you get from staff and other inmates. Eventually you stop and give kitty the last little goodbye kiss before leaving her to herself.")

		addButton("Continue", "Continue on your way", "endthescene")


	if(state == "milk_her"):
		saynn("You gently bite kitty's ear and then whisper to her.")

		saynn("[say=pc]Let me help you..[/say]")

		saynn("Your hands reach to her shirt and begin to unbutton it, slowly exposing more of her fur. She mewls concerned but you nuzzle her cheek to make her feel better. Now that her shirt is more loose, you stop and instead just sneak your hands under it, slightly lifting it.")

		saynn("Your palms brush over her round pregnant belly and reach her D-cup breasts. They look and feel big for such a small kitty. Your digits trace a few circles around the nipples, following the outline of the dark areolas. Kitty watches your hands doing things under the skirt and moans softly. She knows she can’t be too loud, you are still in a public area.")

		saynn("[say=pc]Like it?[/say]")

		saynn("[say=rahi]..yes[/say]")

		saynn("You begin gently groping them. And wow they feel heavy, kitty must be lactating so much already. And sure enough, you give them a little squeeze and a short burst of milk squirts from her nips only stopped by the shirt. Kitty lets out a passionate moan and arches her back, so sensitive.")

		saynn("You continue, your digits begin rubbing the perky nips, little circular motions over the sensitive spots. Then you gently pinch them and the milk starts to flow again, coating your fingers. You wait until that calms down and switch to kneading her breasts, just like small kittens do with their moms. This kitten is blushing red, little moans keep escaping from her. As long as you’re milking her, her breasts keep lactating, producing a steady flow of her feline milk.")

		saynn("[say=rahi]T-this feels so good..[/say]")

		saynn("You kiss her cheek and keep kneading her breasts, sometimes pinching and tugging on her nipples. Kitty is being a good girl and taking it like a champ. Though it’s obvious how stimulating this is for her, after some more milking she arches her back again and starts squirming in your hands, she even covers her own maw, the amount of pleasure is just too much, kitty seemingly cums just from being milked. But you don’t stop, you keep groping and kneading her breasts until the milk stream starts to finally die down.")

		saynn("You pull your hands out and lick the fingers.. her milk tastes so great. Then you nibble on her ear again.")

		saynn("[say=pc]Better?[/say]")

		saynn("[say=rahi]Yes.. thank you..[/say]")

		saynn("You leave a last kiss on her shoulder and let her rest.")

		# (scene ends)

		addButton("Continue", "Continue on your way", "endthescene")
		

func _react(_action: String, _args):
	if(_action in ["kiss_her", "milk_her"]):
		processTime(RNG.randi_range(5, 20)*60)
	
	if(_action == "milk_her"):
		GM.pc.addSkillExperience(Skill.Milking, 30, "rahi_handmilking")
		getCharacter("rahi").milk()

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
