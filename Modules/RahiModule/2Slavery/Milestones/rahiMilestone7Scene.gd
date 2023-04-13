extends SceneBase

func _init():
	sceneID = "rahiMilestone7Scene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand"})
		saynn("The more you think about it, the more you realize it. You gotta tell kitty what you want to tell her..")

		saynn("Rahi sees your puzzled face and approaches you, her paw gently caresses your cheek.")

		saynn("[say=rahi]Hey, {rahiMaster}.. How are you today?[/say]")

		saynn("[say=pc]I wanna tell you something, kitty.[/say]")

		saynn("She tilts her head slightly and listens to your words carefully.")

		saynn("[say=rahi]Meow?..[/say]")

		saynn("It's a pretty big decision for you. But for Rahi.. it's probably the decision of her life. Gotta make sure to use the right words.")

		saynn("What do you want Rahi to be to you? Your lover.. or your eternal slave? Time to choose.")

		addButton("Lover", "You love that kitty more than anything", "tell_lover")
		addButton("Slave", "You want that kitty to be yours. Forever and ever", "tell_slave")
	if(state == "tell_lover"):
		setFlag("RahiModule.rahiMile7Proposed", true)
		setFlag("RahiModule.rahiMile7Enslaved", false)
		playAnimation(StageScene.Duo, "kneel", {npc="rahi"})
		saynn("Sometimes actions speak louder than words. You begin to slowly lower yourself to your knee before Rahi before pulling out a little crude box and opening it, showing.. rings. Kitty gasps and puts her paws on her cheeks.")

		saynn("[say=rahi]Oh?..[/say]")

		saynn("[say=pc]This world is pointless without you by my side. Will you marry me, kitty?..[/say]")

		saynn("Rahi's eyes are opened wide, her paws shaking slightly, she is shocked.")

		saynn("[say=rahi]Y-yes.. Of course she will..[/say]")

		saynn("Rahi grabs one of the rings and puts it on her finger. Tears begin streaming down her cheeks.")

		saynn("[say=rahi]There is nothing more in life that she.. wants..[/say]")

		saynn("She looks at the simple ring. Then she looks at you, her paws landing on your cheeks and caressing them before she leans down to your level and smooches you on the chin.")

		saynn("[say=rahi]It's beautiful.. She.. Not she.. I.. I love you, {pc.name}.. I wanted to say that.. for a long time.. Didn't know how you would react..[/say]")

		saynn("[say=pc]I love you too, kitty..[/say]")

		saynn("She slowly pulls you up from your position and hugs you.")

		saynn("[say=rahi]Call me Rahi.. if you want..[/say]")

		saynn("You kiss her on the lips.")

		saynn("[say=pc]Okay, Rahi..[/say]")

		saynn("She closes her eyes and kisses you back. Her kiss is much more deep and passionate.")

		addButton("Continue", "See what happens next", "rahi_after_kiss")
	if(state == "rahi_after_kiss"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("You lose any track of time. How long have you been kissing? Who knows. And who cares, you can't get enough of this feeling.")

		saynn("After what feels like a single moment, you reluctantly break the kiss. Rahi slowly opens her eyes and just watches your face.")

		saynn("[say=rahi]What.. now..[/say]")

		saynn("[say=pc]I'm gonna go let doctor Quinn know. She said that she can help set everything up.[/say]")

		saynn("Rahi nods softly.")

		saynn("[say=rahi]She is not as bad as she.. I.. thought. It's a habit by this point, meow..[/say]")

		saynn("[say=pc]You speak the way that's comfortable for you, okay kitty?[/say]")

		saynn("Force of habit. Rahi smiles and lets you go.")

		addButton("Eliza", "Go visit doctor Quinn and let her know", "tell_eliza_marriage")
	if(state == "tell_eliza_marriage"):
		removeCharacter("rahi")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="sit"})
		aimCameraAndSetLocName("med_lobbymain")
		GM.pc.setLocation("med_lobbymain")
		saynn("Butterflies must have infested your belly. Because you feel so.. light. You go down to the medical wing and approach the counter behind which Eliza sits. She raises her brow and puts her cup away when she sees you.")

		saynn("[say=eliza]What's up?[/say]")

		saynn("[say=pc]I proposed to Rahi.[/say]")

		saynn("Eliza blinks a few times. Then leans closer to you.")

		saynn("[say=eliza]And? What did she say?[/say]")

		saynn("[say=pc]She said yes..[/say]")

		saynn("Doctor chuckles and reaches her hand out to pat your shoulder.")

		saynn("[say=eliza]Of course she would. That kitty can't live without you.[/say]")

		saynn("Eliza scratches her nose.")

		saynn("[say=eliza]Right. The wedding. I can set it up for you. Nothing fancy. But I even know someone who I can ask to be an officiant.[/say]")

		saynn("[say=pc]Just like that? Why would you help us after everything?[/say]")

		saynn("Eliza stays quiet for a bit, just sipping some coffee out of her personal mug.")

		saynn("[say=eliza]If you wanna be my test subject for a bit, I can accept that as a payment.[/say]")

		saynn("She chuckles.")

		saynn("[say=eliza]Relax, I'm not serious. I wanted to help Rahi. But for some reason I felt like I'm a villain, you know? And the world has enough of those, might as well be the good girl for once.[/say]")

		saynn("You listen to her words and nod.")

		saynn("[say=pc]Well, thank you. I think Rahi understands your intentions.[/say]")

		saynn("She grabs her datapad and presses a few buttons.")

		saynn("[say=eliza]I will let you know when everything is ready.[/say]")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "tell_slave"):
		setFlag("RahiModule.rahiMile7Proposed", false)
		setFlag("RahiModule.rahiMile7Enslaved", true)
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="kneel"})
		saynn("Sometimes actions speak louder than words. You reach out for Rahi's collar and sneak a few digits under it before pulling the kitty incredibly close, so much that she can feel your breath on her ears.")

		saynn("[say=pc]I want you to be mine, kitty. That's why I'm gonna get you branded. To help you remember that. And to make sure people around know it from now on.[/say]")

		saynn("Rahi listens to you, silently. She tilts her head down and stays quiet for some time before finally committing.")

		saynn("[say=rahi]She would love that..[/say]")

		saynn("Your kitty slowly gets on her knees before you and places her paws on her legs, giving off a very submissive look.")

		saynn("[say=rahi]You helped her.. during her worst times.. And she.. not she.. And I.. I'm forever grateful..[/say]")

		saynn("Kitty looks up at you, her eyes show devotion. Your hand lands on her head and pats her.")

		saynn("[say=pc]I don't want you to obey me because you feel obliged to do so.[/say]")

		saynn("[say=rahi]That's not why she.. I.. said that.. Being your kitty.. your Rahi.. nothing else makes me happier.. Please, brand your kitty.. your slave.. property..[/say]")

		saynn("Rahi purrs while you scritch her behind the ears. She rubs her cheek against your palm and licks it like a playful kitty would.")

		saynn("[say=pc]I will, kitty. Personally. The first moment I can.[/say]")

		saynn("Kitty nods.")

		saynn("[say=rahi]Feel free to call her.. Rahi. If you want, {rahiMaster}..[/say]")

		saynn("The power of habits is too strong.")

		saynn("[say=pc]I will call you what I want to call you, Rahi. Mhm?[/say]")

		saynn("[say=rahi]Of course! Meow meow..[/say]")

		saynn("Your hand grabs Rahi's ponytail and pulls her head to rub into your leg. Kitty eagerly does that.")

		saynn("[say=pc]I will go ask doctor Quinn, she said she can help with that.[/say]")

		saynn("[say=rahi]Okay.. Doctor Quinn is kinder than she thought at first..[/say]")

		saynn("Kitty is finding it hard to stick to one of the perspectives while talking still. But the effort is commendable.")

		saynn("You leave your kitty in her cell and head to Eliza.")

		addButton("Eliza", "Go tell the doctor about your decision", "slave_tell_eliza")
	if(state == "slave_tell_eliza"):
		removeCharacter("rahi")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="sit"})
		aimCameraAndSetLocName("med_lobbymain")
		GM.pc.setLocation("med_lobbymain")
		saynn("You enter the medical wing lobby. And it's just like you remember it, a big white sterile room. Doctor Quinn is sitting behind the counter. As you approach her, she notices your presence.")

		saynn("[say=eliza]What's up?[/say]")

		saynn("[say=pc]I want to brand my kitty.[/say]")

		saynn("She raises her brow.")

		saynn("[say=eliza]Oh, really? And what does Rahi think about that?[/say]")

		saynn("[say=pc]She loved the idea.[/say]")

		saynn("Eliza chuckles.")

		saynn("[say=eliza]She is one cute kitty, isn't she. You really need my help by the way, doing something like this on a whim is a bad idea.[/say]")

		saynn("She pulls out a datapad and presses some buttons.")

		saynn("[say=eliza]I will need some time to prepare everything. You will need tools, a space to do it in and my eyes to superwise everything.[/say]")

		saynn("[say=pc]Why are you helping me?[/say]")

		saynn("[say=eliza]If you wanna be my test subject for a bit, I can accept that as a payment.[/say]")

		saynn("She chuckles.")

		saynn("[say=eliza]Kidding. I wanted to help Rahi. But for some reason I felt like I'm a villain, you know? And the world has enough of those, might as well be the good girl for once.[/say]")

		saynn("You listen to her words and nod.")

		saynn("[say=pc]I appreciate it. I think Rahi understands your intentions.[/say]")

		saynn("She grabs her datapad and presses a few buttons.")

		saynn("[say=eliza]I will let you know when everything is ready.[/say]")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "rahi_after_kiss"):
		processTime(10*60)

	if(_action == "tell_eliza_marriage"):
		processTime(5*60)

	if(_action == "slave_tell_eliza"):
		processTime(5*60)

	setState(_action)
