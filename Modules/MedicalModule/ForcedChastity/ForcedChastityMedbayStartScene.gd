extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "ForcedChastityMedbayStartScene"

func _run():
	
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("You notice that there is a little booklet about some experiment that’s currently going on. You skim through it and realize that it proposes some new way to improve the behavior of inmates.")

		saynn("( Warning, This content is themed after forced chastity play )")

		saynn("( Your character will receive a semi-permanent chastity cage and will sometimes be visited by Eliza )")

		saynn("( Scenes include unavoidable anal sex, you have been warned ^^ )")

		addButton("Nevermind", "You’re rather not", "endthescene")
		addButton("Ask Eliza", "(Start content) You wonder what’s this about", "ask_eliza")

	if(state == "ask_eliza"):
		saynn("You tap at the booklet that’s on the counter.")

		saynn("[say=pc]What’s this thing about? I’m just curious.[/say]")

		saynn("Eliza looks at the thing.")

		saynn("[say=eliza]Oh, it’s about a little test study that I.. hmm.. Wait. You have a penis, right?[/say]")

		saynn("Doctor raises her brow while blatantly staring at your crotch.")

		saynn("[say=pc]Uh. What’s that has to do with anything?[/say]")

		saynn("[say=eliza]I’m pretty sure you do. Stay right there.[/say]")

		saynn("Eliza quickly springs up and hides behind the wall before appearing out of one of the staff-only doors.")

		saynn("[say=eliza]Follow me, patient. Now.[/say]")

		# (Options are Resist and Obey)

		addButton("Obey", "Do as she says", "obey")
		addButton("Resist", "You’re not gonna do what she tells you", "resist")

	if(state == "resist"):
		saynn("[say=pc]I won’t do anything until you explain what is happening.[/say]")

		saynn("Eliza rolls her eyes and produces a syringe filled with some drug. They do like using drugs in this place, huh.")

		saynn("[say=eliza]You won’t agree if I tell you. So let’s not waste my time? This will help you accept it.[/say]")

		saynn("She makes the syringe squirt out a bit of its fluid before proceeding to creep towards you. The lobby isn’t that big of a place so you quickly get cornered..")

		addButton("Shove!", "Don’t let her get close", "shove!")

	if(state == "shove!"):
		playAnimation(StageScene.Duo, "shove", {npc="eliza"})
		
		saynn("You wait for a good moment, gathering all your strength, before bringing your shoulder out and shoving the doctor away. The cat gasps as she staggers back and drops onto her ass, you hear a noise of cloth tearing.")

		saynn("[say=eliza]Ugh. My skirt! That’s it.[/say]")

		saynn("The kitty cat doctor is really mad now, she shows off her fangs as she gets up and creeps towards you, holding the shock remote in one of her paws and the syringe in another.")

		saynn("You prepare to fight her off again. But.. You seem to be.. getting weaker.. your muscles.. they don’t want to tense up anymore. You look at the syringe that Eliza is holding and realize.. that it’s empty. Oh no. Your expression immediately changes and the doc picks up on it.")

		saynn("[say=eliza]What happened? Don’t feel like fighting anymore? Body betraying you? What a shame.[/say]")

		saynn("She puts the spent syringe away and rushes towards you. One her paw pins you to the wall while another extends its claws and slips down to your crotch! You feel her sharp claws painfully poking against the sensitive skin of your balls as she has them in a tight grip.")

		saynn("[say=eliza]Do you need me to explain what will happen to them if I continue?[/say]")

		saynn("You look down at your crotch with a face full of fear. And you can’t even resist much, she easily overpowers your attempts while you have that drug in your bloodstream.")

		addButton("Shake head", "Enough torture", "shake_head")

	if(state == "shake_head"):
		saynn("You look at her and shake your head. Rage slowly fades from Eliza’s face. She pulls her paw away from your balls and fixes her lab coat and skirt, looking very professional again.")

		saynn("[say=eliza]Excuse my anger, patient. Don’t do silly stuff like that and we will do just fine, mhm? I will ask only once. Follow.[/say]")

		addButton("Obey", "Do as she says", "obey")

	if(state == "obey"):
		# (sets room to lab)
		aimCameraAndSetLocName("med_researchlab")
		GM.pc.setLocation("med_researchlab")
		
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={exposedCrotch=true}})

		saynn("You follow Eliza to some laboratory. Lots of expensive machines around, lockers with various drugs. Doctor brings you into the middle of that room.")

		saynn("[say=eliza]Don’t move.[/say]")

		saynn("She reaches her paws and exposes your {pc.cock}! She hums while intently staring at your member. Kinky.")

		saynn("[say=eliza]Yeah, that would be an interesting data point. A larger array of samples is always good, right?[/say]")

		saynn("That sounded very science-y but what does it have to do with your dick. You give the doctor a concerned look.")

		saynn("[say=eliza]I’m conducting many experiments on this prison’s grounds. And one of them is about testing correlation between perceived level of obedience and the lack of inmate’s ability to achieve penile-based releases.[/say]")

		saynn("That sounded even more strange. What is she talking about? Penile-based releases?")

		saynn("Eliza sees your confusion and offers you a playful smirk. She goes to one of the locked drawers that she has nearby and grabs a few things from it. Small things.")

		saynn("[say=eliza]And it so happened that you were selected as one of the candidates for that research. Lucky~. Now tell me which one would you prefer on you.[/say]")

		saynn("She turns around and presents you two objects, each one looking like a chastity cage of different design.")

		saynn("[say=pc]Uh..[/say]")

		saynn("They both seem to be roughly matching the size of your dick. One looks like it would encompass the form of your shaft very well and the second one is.. a completely flat one.")

		saynn("[say=pc]Do I have a say in this?..[/say]")

		saynn("[say=eliza]Of course. You can choose one or the other~.[/say]")

		saynn("That’s not what you asked. But Eliza seems to be bathing in the sea of your embarrassment, her cunning smile shines brightly. And running away or fighting doesn’t seem to be plausible options in this situation.")

		saynn("[say=eliza]So, which one? Don’t make me choose. Cause I will.[/say]")

		addButton("Regular one", "Pick the one that looks more comfy", "regular_one")
		addButton("Flat one", "Pick the one that would put more pressure on your dick", "flat_one")
		addButton("Neither", "You’re not gonna make this choice", "neither")


	if(state == "regular_one"):
		saynn("[say=pc]The regular one..[/say]")

		saynn("Eliza tilts her head to the side slightly while admiring your red face.")

		saynn("[say=eliza]Not the one that I would pick. But I respect your choice~.[/say]")

		saynn("The kitty cat puts the other cage away and returns you. She carefully lowers herself before your {pc.dick} and proceeds to push your balls through the first part of the cage, the cock ring. Cold metal touches your skin and makes you squirm slightly. Doctor’s touch is soft though, her fingers working on your dick and balls cause you to get a slight erection, something that makes you blush even more.")

		saynn("[say=eliza]Huh~. I’d offer a cock pump to help but for the sake of the experiment I can’t allow that~.[/say]")

		saynn("Your cock is hard as a rock when Eliza moves on to the second part. The cold metal cage gets pressed against the tip of your shaft followed by Eliza trying to battle your erection and bring the two parts together. You let out a little noise but the doc just about manages to do it. Without even pinching your skin too, what a pro. She then quickly grabs a little key from her pocket and slips it into the keyhole before locking your cage for good.")

		saynn("[say=eliza]There we go~. Sits very snuggly.[/say]")

		saynn("You’re still kinda hard, Eliza plays with your balls a bit more and you feel your member trying to escape its new personal cage. But alas, the metal doesn’t give. You’re leaking pre quite a bit though.")

		saynn("[say=pc]How long..[/say]")

		saynn("[say=eliza]Oh? For all intents and purposes it’s very much permanent~. The metal is a special alloy of titanium to make wearing it long-term safe and marine grade stainless steel for that weight and sturdy look~. And the lock.. well.. let’s say you’re not taking it off any time soon~. Not with me.[/say]")

		addButton("Continue", "See what happens next", "continue")

	if(state == "flat_one"):
		saynn("[say=pc]The flat one..[/say]")

		saynn("Eliza giggles and then bites her lip.")

		saynn("[say=eliza]Great choice~. That one makes any kind of cheating impossible.[/say]")

	if(state == "neither"):
		saynn("[say=pc]I choose nothing. I don’t need one.[/say]")

		saynn("Eliza giggles softly.")

		saynn("[say=eliza]You’ve been picked. By me~. So you can’t say no.[/say]")

		saynn("[say=pc]Are you serious?[/say]")

		saynn("[say=eliza]Dead serious. You’ve given a chance to help push global science forward. Many would have killed for that chance. I would be grateful if I were you. And since you picked nothing.. flat one is closer to nothing. Good choice~[/say]")

		# (same from here)
	if(state in ["flat_one", "neither"]):
		saynn("The kitty cat puts the other cage away and returns you. She carefully lowers herself before your {pc.dick} and proceeds to push your balls through the first part of the cage, the cock ring. Cold metal touches your skin and makes you squirm slightly. Doctor’s touch is soft though, her fingers working on your dick and balls cause you to get a slight erection, something that makes you blush even more.")

		saynn("[say=eliza]Huh~. I’d offer a cock pump to help but for the sake of the experiment I can’t allow that~.[/say]")

		saynn("Eliza presents you the second part of the cage that looks like a round flat panel with a few holes and a.. a short metal tube in the middle that seems to be designed to go down the urethra..")

		saynn("[say=pc]Are you..[/say]")

		saynn("[say=eliza]Yes. That’s the special sauce. With it your penis will be completely secured in the cage with zero chance of you pulling it out even if you really wanted it.[/say]")

		saynn("Eliza produces a little tube of water-based lube and generously uses it on that tube while you await your fate. She then gets you slightly hard by squeezing your balls, enough for her to align the tube with your urethra and very carefully push it in, stretching the hole that you pee from. It feels.. strange. You let out a little moan as the doctor pushes the tube further, every bump on it creates more sensations.. arousing sensations.")

		saynn("But that’s not it. Not even close. Eventually Eliza inserts the whole tube in and you feel the cold metal of the flat panel itself kissing the tip of your shaft. She proceeds to put more and more pressure on it, battling your erection while she tries to bring the two parts together. You let out a passionate moan, your shaft throbs while getting squished a lot. It takes up less and less volume.. Until eventually.. Eliza does it. The two metal parts get aligned correctly. The cat quickly grabs a small key from her pocket before slipping it into the keyhole and locking your cage for good.")

		saynn("[say=eliza]The-e-ere we go~. It sits very snuggly. And with absolutely zero bulge~.[/say]")

		saynn("Fuck. You’re still very aroused. But your cock just can’t get any harder. So much pressure, feels like you can cum just from that.. but you can’t.. Eliza plays with your cage a bit more and you feel your member leaking pre through the little tube in your urethra onto your balls.")

		saynn("[say=pc]How long..[/say]")

		saynn("[say=eliza]Oh? For all intents and purposes it’s very much permanent~. The metal is a special alloy of titanium to make wearing it long-term safe and marine grade stainless steel for that weight and sturdy look~. And the lock.. well.. let’s say you’re not taking it off any time soon~. Not with me.[/say]")

		# (same from here)

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		aimCameraAndSetLocName("med_nearlab")
		GM.pc.setLocation("med_nearlab")
		
		saynn("Eliza gets up and takes a good look at your new shiny cage.")

		saynn("The doctor then takes a hold of her amulet that she is wearing around her neck. She opens it up and there appears to be a deepening in the shape of a key. And after placing the key to your cage there, Eliza closes the amulet and leaves it hanging around her neck.")

		saynn("[say=eliza]That’s it. I will be checking on the progress of this experiment every so often~[/say]")

		saynn("Well that was very quick. Eliza lets you out of the lab and returns to the counter. While you’re left wondering what are you gonna do about this now..")

		# (scene ends)

		addButton("Continue", "That wasn't nice", "endthescene")
		


func _react(_action: String, _args):
	processTime(RNG.randi_range(3, 5)*60)
	
	if(_action == "obey"):
		runScene("ParadedOnALeashScene", ["eliza", GM.pc.getLocation(), "med_researchlab", [
			"Almost there, inmate",
			"Oh, I'm so excited",
			"We have a zero accidents reported policy, you should be fine",
			"The leash is for your own safety, really~",
			"This experiment will open up so many opportunities",
		]])
	
	if(_action == "shove!"):
		GM.pc.addStamina(-200)
		
	if(_action == "regular_one"):
		setFlag("MedicalModule.PC_ReceivedPermanentCage", true)
		setFlag("MedicalModule.PC_PickedFlatPermanentCage", false)
		
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ChastityCagePermanentNormal"))
		
	if(_action in ["flat_one", "neither"]):
		setFlag("MedicalModule.PC_ReceivedPermanentCage", true)
		setFlag("MedicalModule.PC_PickedFlatPermanentCage", true)
		
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ChastityCagePermanent"))
		

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
