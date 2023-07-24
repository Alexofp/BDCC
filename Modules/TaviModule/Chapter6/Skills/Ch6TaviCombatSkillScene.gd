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
			addButton("Lesson 2", "Try to make Tavi be able to fight again", "les2")
		if (combat >= 2):
			addButton("Lesson 3", "Train Tavi's fighting skills", "les3")
		if (combat >= 3):
			addButton("Lesson 4", "Train Tavi's fighting skills further", "les4")
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
	if(state == "les2"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You can't expect Tavi to be able to fight after what happened to her. But she must be able to stand for herself, she is a red after all.")

		saynn("[say=pc]Let's do another sparring.[/say]")

		saynn("[say=tavi]You saw it already. I can't fight anymore..[/say]")

		saynn("You sigh and help Tavi get into a fighting stance, lowering her torso a little and making her hover her paws near her muzzle.")

		saynn("[say=pc]You might have given up Tavi. But I didn't.[/say]")

		saynn("Maybe if you make her experience stress, her natural instincts will kick in and protect her? Who knows.")

		saynn("You and Tavi stand face to face. Tall kitty's posture still looks quite unsure. Seems she is letting you do the first move, holding her paws up to protect herself against your attack.")

		addButton("Light punch", "Test Tavi's defense", "les2_punch")
	if(state == "les2_punch"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="defeat"})
		saynn("As soon as you wind up your punch, Tavi's eyes widen with a mix of fear and uncertainty. You didn't even touch her yet and she suddenly just flops to her knees before you, seemingly already defeated.")

		saynn("You sigh and lower your guard.")

		saynn("[say=tavi]Ow..[/say]")

		saynn("[say=pc]I didn't even touch you yet..[/say]")

		saynn("Tavi shrugs and looks up at you with her adorable eyes, her ears slightly twitching, her arms crossed under her {tavi.breasts}, emphasizing them. She is looking so.. cute.. Making it painful for you to even just scold her, never mind fight. Wait..")

		saynn("[say=tavi]I'm not a violent person anymore.. Hurting anyone pains me as well.[/say]")

		saynn("A realization slowly down upon you as you smile and reach your hand out to pat Tavi.")

		saynn("[say=pc]What if.. You don't fight physically.[/say]")

		saynn("Tavi raises a brow while softly purring from the pats.")

		saynn("[say=pc]What if you use.. charm and allure as your weapons. Making people bad for hurting you while also gradually dominating them.. using your words.. or your body.[/say]")

		saynn("Tavi looks up at you, her innocent sorry eyes slowly becoming.. less innocent. Her lips are forming into a little cute smile.")

		saynn("[say=tavi]I mean.. I can try that. I still know a thing or two about dominating.[/say]")

		saynn("Tavi quickly springs up to her feet and waits for you to take your spot.")

		addButton("Fight", "See what Tavi will do", "les2_lewdfight")
	if(state == "les2_lewdfight"):
		playAnimation(StageScene.Duo, "punch", {npc="tavi", npcAction="dodge"})
		saynn("You and Tavi face each other again in her cell, both seemingly ready. You assume a combat stance while Tavi.. Just stands normally, her eyes looking a bit more confident than before.")

		saynn("As you take the first swing, Tavi suddenly evades it, masterfully stepping back while subtly swaying her hips. Her feline grace is helping her quite a bit, you found yourself momentarily distracted by the fluidity of that motion.")

		saynn("But instead of attacking, Tavi takes a step closer, swaying her hips yet again and even letting you see her breasts bouncing ever so slightly with each step. Her voice is soft and kind.")

		saynn("[say=tavi]After all.. I did make you submit to me once already.[/say]")

		saynn("She spreads her arms, inviting you to hug her.. or attack her. But as you try to punch her, Tavi dodges out of the way and only closes the distance yet again, her paws grabbing your arm at the peak of your swing.")

		saynn("[say=tavi]I'm sure I can make you submit again~.[/say]")

		saynn("She is holding your hand now.. Making your heartbeat skyrocket for some reason. But you still have free limbs.")

		addButton("Kick her", "Let's see how she will protect herself against this one", "les2_kick")
	if(state == "les2_kick"):
		playAnimation(StageScene.Duo, "kick", {npc="tavi", npcAction="hurt"})
		saynn("You squeeze her paw even more tightly to make sure she can't dodge anymore.. But doing so also made you so.. lusty.. for some reason.")

		saynn("And as you wind up a kick, Tavi braces, finally realizing her mistake.")

		saynn("Your kick connects, sending all the air out of Tavi. She hisses painfully and then coughs.")

		saynn("[say=tavi]Ow..[/say]")

		saynn("Tavi stops smiling as she loses her.. mindset.. so you decide to stop there, just holding that paw.")

		saynn("[say=pc]Nicely done. You almost won.[/say]")

		saynn("Gradually, Tavi calms down her breathing.")

		saynn("[say=tavi]I wasn't even close.[/say]")

		saynn("You shrug and smile.")

		saynn("[say=pc]Try to see the fights as a.. puzzle. You can't fight physically so there will be a lot of problems that you will have to solve, right in the middle of a brawl. While not having a lot of time.[/say]")

		saynn("Tavi hums as she extends the claws on her paw and gently prods your hand with them.")

		saynn("[say=tavi]I will think about it. Thank you.[/say]")

		addButton("Continue", "That was a nice lesson", "endthescene")
	if(state == "les3"):
		saynn("It's that time again. Time to train Tavi's newly found alternative fighting skills.")

		saynn("[say=pc]Let's do a quick sparring match.[/say]")

		saynn("Tavi's ears perk. She takes her spot near the middle of her cell and awaits when you take yours.")

		saynn("[say=tavi]Sure. Let's do this.[/say]")

		saynn("You assume your normal combat stance, while Tavi keeps her posture straight, her mood seems to be quite playful.")

		saynn("Might as well not go too hard on Tavi.")

		addButton("Strike", "Try to hit her", "les3_thefight")
	if(state == "les3_thefight"):
		playAnimation(StageScene.Hug, "hug", {npc="tavi"})
		saynn("As you take your first swing, Tavi gracefully evades the attack with a subtle sway of her hips, her feline grace captivating. She did the same thing last time but this time she seems to be much more.. confident.")

		saynn("With a cute little smile, Tavi locks eyes with you, her voice alluring and somewhat commanding.")

		saynn("[say=tavi]I like playing~. And right now you're mine to play with.[/say]")

		saynn("Her words send a little thrilling shiver down your spine, it's like she became her old Tavi for a second there.")

		saynn("As she tries to close the distance, you throw another weak punch which gets caught by her paw. You try to punch her with your free hand but that one gets caught too. Tavi is standing in front of you, her warm breathing can be felt on your face.")

		saynn("[say=tavi]Why fight, cutie~? Just let me do what I want with you~. It will be fun.[/say]")

		saynn("Both of your hands are being held by her paws.. So you try to step back and wind up a kick.. But Tavi reads your mind and just makes 2 steps forward before turning this weird tango dance into a tight hug. Her breasts brushing against your {pc.masc} chest.. are those her nipples poking you? Lewd..")

		saynn("Tavi purrs softly into your ear while rubbing against you, making your attempts to fight her properly.. weak and easily counterable..")

		saynn("[say=tavi]It's okay to surrender.. Sometimes losing can be more fun than winning.. Trust me~..[/say]")

		saynn("She holds you tightly.. Which feels very nice. But you won't go down that easy..")

		addButton("Struggle", "Try to push Tavi away", "les3_struggle")
	if(state == "les3_struggle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="tavi", npc="pc"})
		saynn("You try to pry her paws off of you and push her away. Seeing that she doesn't use her claws or bites makes resisting her grab quite easy.")

		saynn("But as soon as you free yourself, Tavi just quickly circles you and ends up behind, wrapping her paws around you yet again.")

		saynn("[say=tavi]Not so fast~.[/say]")

		saynn("Tavi gently gropes your body.. your {pc.breasts}.. while rubbing against you and nuzzling your neck. It feels so nice.. The obvious solution would be to stomp on her feet.. but why would you do that to this lovely kitty that makes you feel so good..")

		saynn("The feline uses your uncertainty to her full advantage, gently nibbling on your ear and breathing warmly into it, making you feel so.. weak.")

		saynn("[say=tavi]If you're gonna be a good {pc.boy}.. I will cuddle you. Just don't try to hurt me~.[/say]")

		saynn("You.. give up any resistance. Tavi feels that and slowly pulls you down onto the floor, her paws still groping you.")

		saynn("You both settle on the floor and begin cuddling. Tavi still purrs into your ear. You lost but you don't mind it..")

		saynn("[say=tavi]There we go.. Good~.. I know you were holding back. You practically let me win. Next time.. don't pull back your punches.. mhm?[/say]")

		saynn("You nod and rest in her arms. It seems Tavi doesn't even need her claws or teeth.. Makes you wonder if this would work on others too.")

		saynn("You spend some time together, enjoying the company of each other.. while you are incredibly horny..")

		addButton("Continue", "That was a nice lesson", "endthescene")
	if(state == "les4"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("Tavi won last time. But that was because she used your past experiences with her against you. To truly test her you must stay focussed this time and not let her teasing get to you. She can't hurt you anyway.")

		saynn("[say=pc]Let's fight, Tavi.[/say]")

		saynn("You take your spot. She takes hers. You lower your head a little and frown, she smiles kindly and puts her paws on her waist, looking quite relaxed.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "les1"):
		getModule("TaviModule").advanceSkill("taviSkillCombat", 1)

	if(_action == "les2"):
		getModule("TaviModule").advanceSkill("taviSkillCombat", 2)

	if(_action == "les3"):
		getModule("TaviModule").advanceSkill("taviSkillCombat", 3)

	if(_action == "les4"):
		getModule("TaviModule").advanceSkill("taviSkillCombat", 4)

	if(_action == "cancel_lesson"):
		increaseFlag("TaviModule.Ch6Tiredness", -1)
		endScene()
		return

	if(_action == "les1_oops"):
		processTime(3*60)

	if(_action == "les1_ow"):
		GM.pc.addPain(1)

	if(_action == "les2_punch"):
		processTime(3*60)

	if(_action == "les2_lewdfight"):
		processTime(10*60)

	if(_action == "les2_kick"):
		processTime(2*60)
		GM.pc.addLust(30)

	if(_action == "les3_thefight"):
		processTime(10*60)
		GM.pc.addLust(50)

	if(_action == "les3_struggle"):
		processTime(3*60)
		GM.pc.addLust(50)

	setState(_action)
