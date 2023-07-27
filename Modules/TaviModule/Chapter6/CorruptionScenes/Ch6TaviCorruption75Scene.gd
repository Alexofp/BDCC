extends SceneBase

func _init():
	sceneID = "Ch6TaviCorruption75Scene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="struggle"})
		saynn("As you walk into Tavi's cell, you find her leaning against one of her cell's walls. Her head is directed up, her eyes closed. It's like she is meditating. Or.. trying to at least.")

		saynn("[say=pc]Hey there, Tavi.[/say]")

		saynn("She nods softly. Her paws shiver a little. You find it strange that she isn't.. horny.")

		saynn("[say=pc]You're doing alright?[/say]")

		saynn("[say=tavi]Mhm.. Just trying to.. push the stupid thoughts away.[/say]")

		saynn("While talking, her paws start wandering around the curves of her body. But Tavi quickly catches herself and puts her paws back by her sides. She growls softly.")

		saynn("[say=tavi]It's so hard.. You might think that getting numb to something means it would be easy to let go.. But no, I crave orgasms.. I need them.. They don't even make me feel good anymore.. I just.. need them..[/say]")

		saynn("Talking about orgasms makes her start squirming and huffing. Her paws sneak back under her shorts as she starts pleasuring herself in front of you. Her cheeks blush green.")

		saynn("[say=tavi]I don't wanna be a slut..[/say]")

		saynn("Hmm. Seems like Tavi needs some help.")

		addButton("Tie her up", "If she can't touch herself.. She can't orgasm", "tie_tavi_up")
	if(state == "tie_tavi_up"):
		playAnimation(StageScene.Hogtied, "idle", {pc="tavi"})
		saynn("You produce some ropes and show them to Tavi. She sees them and furrows her brows.")

		saynn("[say=tavi]You are not tying me up..[/say]")

		saynn("You step closer and assume a firm posture.")

		saynn("[say=pc]Hands out of your shorts, Miss Tavi.[/say]")

		saynn("She grumbles, her expression goes from lusty to upset to desperate to sorry. Eventually, she does as told, pulling her paws away from her wet pussy the scent of which is making both of you aroused.")

		saynn("You step behind her and begin wrapping the long rope around her chest, creating knots where needed. Then you wrench her paws behind her back and tie them with the same rope too.")

		saynn("[say=pc]Now lie down.[/say]")

		saynn("[say=tavi]Just hands are enough..[/say]")

		saynn("You stand in front of her and put on the meanest eyes that you have. They make Tavi melt. She lies down on her bed, allowing you to tie her hind paws too and even tie them with the other ones, hogtying the tall feline.")

		saynn("[say=tavi]..thanks..[/say]")

		saynn("[say=pc]Hm?[/say]")

		saynn("You sit nearby and watch Tavi wiggle helplessly. No matter what, she can't reach her sensitive spots, forced to endure the heat instead.")

		saynn("[say=tavi]Thank you for doing this, okay? That's all..[/say]")

		saynn("[say=pc]Hah. You're welcome. I don't want you to be a slut too.[/say]")

		saynn("She baps you with her tail.")

		saynn("[say=tavi]I'm not. That doctor really screwed with me..[/say]")

		saynn("[say=pc]What did she do to you?[/say]")

		saynn("The feline sighs.")

		saynn("[say=tavi]Exactly what you saw. She strapped me into that machine and just.. watched. Watched me slowly lose my mind..[/say]")

		saynn("Your hand lands on her back and strokes it. Her tail wraps around your wrist and tries to pull it lower. But you fight it.")

		saynn("[say=tavi]If a million voices tell you that you're a slut.. You start swallowing..[/say]")

		saynn("Her mind is still all over the place, huh.")

		addButton("Continue", "Spend some time together", "spend_time_together")
	if(state == "spend_time_together"):
		saynn("You spend some time together like that.")

		saynn("The feline is squirming a lot, causing some of the ropes to dig into her sensitive spots. When you see that, your hand slaps her ass, cooling her down.")

		saynn("[say=tavi]Ow..[/say]")

		saynn("Slowly, Tavi's heat goes away.. for today.")

		addButton("Continue", "See what happens next", "start_talking")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "tie_tavi_up"):
		processTime(2*60)
		getCharacter("tavi").getInventory().equipItem(GlobalRegistry.createItem("ropeharness"))

	if(_action == "spend_time_together"):
		processTime(30*60)

	if(_action == "start_talking"):
		getCharacter("tavi").resetEquipment()
		runScene("Ch6TaviTalkScene")
		endScene()
		return

	setState(_action)
