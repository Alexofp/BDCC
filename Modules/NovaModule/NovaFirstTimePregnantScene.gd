extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "NovaFirstTimePregnantScene"

func _run():
	if(state == ""):
		addCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {npc="nova", npcAction="stand"})
		
	if(state == ""):
		saynn("You wake up in your cell hearing a loud voice closing in on your cell.")

		saynn("[say=nova]{pc.name}!![/say]")

		saynn("You rub your sleepy eyes and shake your head, trying to wake up faster. Nova rushes into your room, almost screaming.")

		saynn("[say=nova]Fucker! Do you know what you did? You knocked me up![/say]")

		saynn("Enraged husky reaches for your face, trying to scratch it. You hold her away.")

		saynn("[say=pc]Calm down![/say]")

		saynn("[say=nova]Bitch, why would I calm down, you fucking bred me![/say]")

		saynn("Seems like she is being really angry about it.")

		addButton("Talk it out", "Try to calm Nova down without using force", "talk_it_out")
		addButton("Force", "Force Nova to calm down", "force")

	if(state == "force"):
		playAnimation(StageScene.Cuddling, "idle", {npc="nova"})
		
		saynn("She keeps trying to hurt you, the tantrum she threw won’t end on its own so you decide to help her. You catch her arms and forcibly wrench them behind her back, making her yelp. Then you steal the handcuffs off of her armor and cuff her hands behind her back before forcibly putting her onto your lap.")

		saynn("She growls and starts to struggle but you hold her still. You growl into her ear which makes her snap out of it a bit.")

		saynn("[say=pc]Yes, I bred you. And I will happily do it again and again. And you’re gonna be a good girl and carry my litter, you understand?[/say]")

		saynn("[say=nova]B-But.. No.. That’s not how it should be! Not in this place! Who is gonna take care of the kids![/say]")

		saynn("She tries to kick your leg and escape your grasp but you only tighten it, you put your hand on her neck and apply enough pressure to make her switch from growling to whining.")

		saynn("[say=pc]They have a daycare here, you’re gonna be fine. I can’t visit my kids but you can, you will make a great mother, Nova. And I’m gonna keep breeding you.[/say]")

		saynn("Her eyes jump all over the room but she seems to be calming down somewhat. You’re still holding her but now it’s more of an embrace rather than keeping her hostage. You nuzzle her exposed neck and nibble on it.")

		saynn("About 30 seconds of silence pass.")

		saynn("[say=nova]My parents.. they.. I don’t know them much.. They wanted a male heir to their company. So much that they gave me away.. to AlphaCorp.. I don’t wanna be like them, I don’t wanna abandon my children..[/say]")

		saynn("[say=pc]You won’t repeat the mistakes of your parents, Nova. You will care about your children, you seem like you will make a great mommy.[/say]")

		saynn("[say=nova]I.. I guess..[/say]")

		saynn("Nova looks at you with hope in her eyes.")

		saynn("[say=nova]Will you help me?[/say]")

		saynn("[say=pc]I’m a convict, I can’t do much, my life is ruined. But sure, I won’t forget about you.[/say]")

		saynn("You hug her tighter and put your hands on her belly, gently caressing it through her bodysuit. You leave a little kiss on her cheek.")

		saynn("[say=nova]I guess I will go.. See you around. Oh, right.[/say]")

		saynn("She chuckles softly, not realizing that she is still handcuffed. She rattles her chain.")

		saynn("[say=nova]Can you?[/say]")

		addButton("Uncuff her", "Let her go", "uncuff_her")

	if(state == "uncuff_her"):
		saynn("You remove cuffs from her hands and let her get up. She looks around the cell and hugs herself. Then she gives you one last look.")

		saynn("[say=nova]See you.[/say]")

		saynn("Before leaving your cell.")

		# (scene ends)
		addButton("Continue", "Continue on your way", "endthescene")

	if(state == "talk_it_out"):
		playAnimation(StageScene.Cuddling, "idle", {npc="nova"})
		
		saynn("You try to keep her claws away from your face without too much extra force.")

		saynn("[say=pc]Okay, okay. Let’s talk it out.[/say]")

		saynn("She manages to free one of her hands and scratch your cheek. Ow. Nova is panting heavily and still growling.")

		saynn("[say=nova]I never wanted to be a mother. And not in a fucking prison, that’s for sure.[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("[say=nova]Because.. Who is gonna take care of them..[/say]")

		saynn("Nova doesn’t seem to be in the rageful state anymore but you hold her hands just in case. It’s kinda cute actually.")

		saynn("[say=pc]You and me. I understand your concerns but this place seems to have everything needed, children will receive the treatment they need in the daycare and you can visit them.[/say]")

		saynn("She joins you on the bed while you keep holding hands with her. You can feel how warm her body is.")

		saynn("[say=nova]I guess you’re right.. It’s just that.. My parents abandoned me. They wanted a male hair for their company. So much that they gave me away to AlphaCorp.. I don’t wanna follow my parent’s steps, I don’t wanna abandon my children..[/say]")

		saynn("You stop holding her hand and instead wrap it around her waist, the second one lands on her belly and softly caresses it.")

		saynn("[say=pc]You won’t repeat the mistakes of your parents, Nova. You will care about your children, you seem like you will make a great mommy.[/say]")

		saynn("[say=nova]I.. Yeah..[/say]")

		saynn("Nova looks at you with hope in her eyes. Then she leans into you and rests her head on your shoulder. She seems to not be afraid to show some weakness.")

		saynn("You rest like that for a few minutes, hugging each other. Nova even begins to smile even if just slightly, it seems she starts to grow on the idea of being a mommy.")

		saynn("[say=nova]You will care for our pups too, right?[/say]")

		saynn("[say=pc]As much as I can. You know, I’m still a convict.[/say]")

		saynn("[say=nova]Yeah. Guess I will go. See you around.[/say]")

		saynn("And with that, she stands up and prepares to leave. You leave her a quick kiss on the lips before she does that. She chuckles.")

		# (scene ends)

		addButton("Continue", "Continue on your way", "endthescene")
		

func _react(_action: String, _args):
	if(_action in ["talk_it_out", "force"]):
		processTime(RNG.randi_range(10, 40)*60)

	if(_action == "talk_it_out"):
		GM.pc.addPain(20)
		addMessage("Ow, that was slightly painful")

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
