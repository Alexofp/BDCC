extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "Ch1s1ApproachingTavi"


func _run():
	if(state == ""):
		addCharacter("tavi")
		
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		
		# (you approach Tavi, she is walking around in circles and kicks stuff, clearly mad)

		# (You talk to her, say that it went better than expected, at least not dead)

		# (She says the guy will pay, this whole station will pay)

		# (You tell her to calm down, she says you’re right and explains about alphacorp a little bit, reasons to be mad)

		saynn("After such a setback, it only makes sense for you to go check on Tavi. As you approach her little secluded corner, you hear some noise.")

		saynn("Tavi is walking in circles around some boxes. You can feel rage building up in her until she lets it all out by growling while kicking one.")

		saynn("She is clearly angry so you announce your presence rather quietly.")

		saynn("[say=pc]Hey..[/say]")

		saynn("Though it was enough to make Tavi perk her feline ears. She looks at you and huffs audibly, her claws are out and digits are spread.")

		saynn("[say=tavi]What?[/say]")

		saynn("[say=pc]Why are you destroying your spot?[/say]")

		saynn("[say=tavi]None of this is mine.[/say]")

		saynn("She kicks the box again, toppling it over.")

		saynn("[say=tavi]These fuckers humiliated me.[/say]")

		saynn("Yeah, she has a reason. But it still makes her look off-putting.")

		addButton("Calm her down", "She should really calm down", "calm_her_down")

	if(state == "calm_her_down"):
		saynn("[say=pc]You should calm down, Tavi. It didn’t went too bad, at least we’re alive.[/say]")

		saynn("She gives you a cold stare. You try to make a few steps towards her.")

		saynn("[say=tavi]Yeah. And I didn’t get any closer to getting out of this shithole.[/say]")

		saynn("She looks mean, evil. Her cat eyes and green spots on her fur shine brightly in the dim space. Her gaze drills you so much that you have to look away, feeling embarrassed for some reason.")

		saynn("[say=pc]I will leave you to it then, you clearly want to be left alone..[/say]")

		saynn("You turned around and are about to leave, she is clearly busy being angry. Though you suddenly hear her strict voice.")

		saynn("[say=tavi]Wait, pet.[/say]")

		addButton("Stop", "Obey Tavi", "stop")

	if(state == "stop"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="sit"})
		
		saynn("You hear her command and seize any movement. Her voice doesn’t sound intimidating anymore but the tone is still quite cold.")

		saynn("[say=tavi]You’re right.[/say]")

		saynn("You hear Tavi walking up to you from behind before resting her chin on your shoulder. Her paws land on your belly and give you some rubs.")

		saynn("[say=tavi]We need to calm down.[/say]")

		saynn("Tavi straightens her posture and turns you around. You obey her touch and glance down at the floor before she catches your chin and raises it.")

		saynn("[say=tavi]I was always alone. I don’t wanna be alone now.[/say]")

		saynn("She approaches the crate that she kicked and tries to put it back into its old spot before sitting on it.")

		addButton("Kneel", "Kneel before her", "kneel")
		addButton("Sit nearby", "Take a seat on the same box", "sit_nearby")


	if(state == "kneel"):
		playAnimation(StageScene.Duo, "kneel", {npc="tavi", npcAction="sit"})
		
		saynn("You walk up closer but then kneel before Tavi instead of sitting nearby. A little smile returns to her face before she offers you a pat on the head.")

		saynn("[say=tavi]Such a good pet. Anger only uncovers the worst in us.[/say]")

		saynn("You rest your head on her legs while she just idly scrtiches you behind the ear, passing the time.")


	if(state == "sit_nearby"):
		playAnimation(StageScene.Duo, "sit", {npc="tavi", npcAction="sit"})
		
		saynn("You walk up closer and sit nearby. Tavi pulls you closer and wraps her paw around your waist possessively.")

		saynn("[say=tavi]Such a good pet. Anger only uncovers the worst in us.[/say]")

		saynn("You rest your head on her shoulder while she just idly scrtiches you behind the ear, passing the time.")

	if(state == "syndicate"):
		saynn("[say=pc]Captain knew about your plan to call the Syndicate.[/say]")

		saynn("Tavi looks away for a second, thinking.")

		saynn("[say=tavi]It’s the only realistic way out of here.[/say]")

		saynn("[say=pc]He said the Syndicate would enslave everyone.[/say]")

		saynn("[say=tavi]Look at your collar, cutie. Aren’t we slaves already.[/say]")

		saynn("Tavi strokes your hair.")

		saynn("[say=tavi]AlphaCorp and Syndicate are both just empires, no matter what they say. Empires can’t stop capturing and enslaving worlds because that would lead to them being enslaved instead. If they are not growing - they are becoming weaker.[/say]")

		saynn("She sighs and looks at her unique purple fur with bright green spots everywhere.")

		saynn("[say=tavi]I don’t care about politics. I just wanna make people who turned me into this monster pay.[/say]")

		saynn("Normal life huh. Makes you wonder if she considers all that murdering to be normal..")


	if(state == "tavi"):
		saynn("[say=pc]The guy said a lot of things about you..[/say]")

		saynn("She looks at you, frowning. Her eyes are reading yours.")

		saynn("[say=tavi]Think I’m evil? It's not that easy.[/say]")

		saynn("[say=pc]Tell me.[/say]")

		saynn("[say=tavi]Tell you what? That I’m a killer? Yes, everything he said is true. I killed people who created me.[/say]")

		saynn("[say=pc]But why did you do that?[/say]")

		saynn("[say=tavi]Because I need to. I'm an empty husk. But ruining their lives made me feel something inside. I can’t explain it. I’m only making this world better. You will have to trust me.[/say]")

		saynn("[say=pc]Will you kill me if I don't?[/say]")

		saynn("That question makes Tavi chuckle for some reason. You can see her intimidating sharp fangs.")

		saynn("[say=tavi]You’re safe as long as you’re obeying, cutie~.[/say]")

		saynn("Monster that kills monsters, huh.")


	if(state == "captain"):
		saynn("[say=pc]The captain is quite a guy.[/say]")

		saynn("[say=tavi]He made a big mistake messing with me.[/say]")

		saynn("Tavi grinds her teeth.")

		saynn("[say=pc]Well, we broke into his office and beat up the guards, didn’t we?[/say]")

		saynn("Tavi tilts her head slightly and calms down, she can manage her anger pretty well when she wants to.")

		saynn("[say=tavi]I guess you’re right. He did humiliate me. But whatever, the guy clearly loves exploiting his power over the others.[/say]")

		saynn("[say=pc]You are similar like that.[/say]")

		saynn("You smile and make Tavi smile too. Hers is way more cunning though.")

		saynn("[say=tavi]Next time you’re getting gagged and spanked~.[/say]")

		saynn("[say=pc]Sure, Miss Tavi..[/say]")

	if(state in ["kneel", "sit_nearby", "syndicate", "captain", "tavi"]):
		addButton("Syndicate", "Ask about syndicate", "syndicate")
		addButton("Captain", "Talk about the captain", "captain")
		addButton("Tavi", "Ask about her crimes", "tavi")
		addButton("Rest", "Just rest", "rest")

	if(state == "rest"):
		saynn("You get a chance to rest. But only for a few minutes.")

		saynn("You hear someone’s heavy steps approaching.")
		
		addButton("Continue", "See what happens next", "endthescene")


func _react(_action: String, _args):
	if(_action == "rest"):
		processTime(5*60)
	
	if(_action == "endthescene"):
		endScene()
		runScene("Ch1s2Risha")
		return

	setState(_action)

