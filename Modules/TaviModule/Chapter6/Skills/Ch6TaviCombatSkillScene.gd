extends SceneBase

func _init():
	sceneID = "Ch6TaviCombatSkillScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You tell Tavi that you want to train her combat skills because they will be important for the future.")

		saynn("Tavi nods and listens to you.")

		var combat = getModule("TaviModule").getSkillScore("taviSkillCombat")
		addButton("Lesson 1", "Test Tavi's skills", "les1")
		if (combat >= 1):
			pass
		addButton("Cancel", "You changed your mind", "cancel_lesson")
	if(state == "les1"):
		saynn("Since Tavi has.. changed a bit after that last failed attempt to escape, it might be worth checking if she is still a capable fighter.")

		saynn("[say=pc]Alright, Tavi. Let's do a little sparring match.[/say]")

		saynn("Tavi stands before you, her feline ears twitching with uncertainty. She lowers her head a bit, making her overall profile smaller.. but that's about it. You don't even notice her claws being out. Huh.")

		saynn("[say=pc]Come on, Tavi. You can do this.[/say]")

		saynn("Well, might as well try to hit her and see what happens..")

		addButton("Strike first", "Attack Tavi", "les1_oops")
	if(state == "les1_oops"):
		playAnimation(StageScene.Duo, "shove", {npc="tavi", npcAction="defeat"})
		saynn("You try to push Tavi and she just.. collapses instantly. No resistance, no attempts to dodge or block, Tavi just huffs softly while rubbing her scratched knees.")

		saynn("[say=pc]Tavi..[/say]")

		saynn("[say=tavi]I'm sorry.. I can't fight.. Not anymore..[/say]")

		saynn("Huh. You leave your combat stance and approach the tall kitty, your hand lands on her head and gently pats her.")

		saynn("[say=pc]Why not? You were fighting incredibly well before.. Mostly because you were using dirty moves but still.[/say]")

		saynn("[say=tavi]Any time I think about resisting.. or violence.. I get a vision.. a flashback of me.. orgasming non-stop.. so much that it felt like torture.. while listening to Eliza's words..[/say]")

		saynn("There is no way that's possible.. And if it is.. It can't be permanent, can it? Surely not.")

		saynn("You help Tavi get up.")

		saynn("[say=pc]Punch me. Slap me. Throw your arm forward. Anything. Let's start small, Tavi.[/say]")

		addButton("Continue", "See what happens next", "les1_ow")
	if(state == "les1_ow"):
		saynn("Tavi slowly gets up and assumes the fighting stance yet again. She starts slowly strafing around you, trying to focus. But you can see in her eyes that she wants to avoid hurting you at all cost.")

		saynn("Finally, Tavi closes the distance and gently slaps your wrist.. Ow!")

		if (GM.pc.getPainLevel() >= 1.0):
			playAnimation(StageScene.Duo, "defeat", {npc="tavi", npcAction="shove"})
			saynn("You grunt as you drop to your knees, unable to continue fighting. That attack was enough to bring you down to your knees before her! You got defeated!")

			saynn("Tavi sees that and gasps, instantly trying to help you.")

			saynn("[say=tavi]Sorry!.. sorry-sorry-sorry..[/say]")

			saynn("[say=pc]It's okay, I'm okay. That's how fights go, Tavi. Someone has to lose. You won. Didn't that feel good?[/say]")

		else:
			playAnimation(StageScene.Duo, "hurt", {npc="tavi", npcAction="shove"})
			saynn("It didn't hurt that much actually but you try to amplify the effect to make Tavi seem more powerful. You grunt audibly.")

			saynn("Tavi sees that and gasps, instantly trying to help you.")

			saynn("[say=tavi]Sorry!.. sorry-sorry-sorry..[/say]")

			saynn("[say=pc]It's okay, I'm okay. That's how fights go, Tavi. Someone has to beat the other person. Didn't that feel good though?[/say]")

		saynn("Tavi's sorry eyes look into yours. It feels like she is about to start crying.")

		saynn("[say=tavi]I just.. don't wanna fight anymore.. sorry..[/say]")

		saynn("That's.. kinda sad. You nod and decide to end the first lesson here.")

		saynn("Maybe you just need to give her some time and try again later?")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "les1"):
		getModule("TaviModule").advanceSkill("taviSkillCombat", 1)

	if(_action == "cancel_lesson"):
		increaseFlag("TaviModule.Ch6Tiredness", -1)
		endScene()
		return

	if(_action == "les1_oops"):
		processTime(3*60)

	if(_action == "les1_ow"):
		GM.pc.addPain(1)

	setState(_action)
