extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RahiAvyCanteenScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		
	if(state == ""):
		saynn("The food isn’t great but it’s still better than nothing. You begin chewing on the paste and thinking about today when you suddenly hear a familiar voice.")

		saynn("[say=rahi]Can kitty sit near?..[/say]")

		saynn("You turn your head and see the kitten, a brown feline that is from a general block. She looks a bit nervous, avoiding eye contact after asking the question.")

		saynn("[say=rahi]Most spots are taken and she doesn’t wanna sit near the reds..[/say]")

		# (if red)
		if(GM.pc.getInmateType() == InmateType.HighSec):
			saynn("[say=pc]Well I’m a red as well.[/say]")

			saynn("[say=rahi]You seem better than most reds.. Can she?..[/say]")

			saynn("[say=pc]I don’t mind.[/say]")

		# (else)
		else:
			saynn("[say=pc]Oh, sure.[/say]")

		saynn("The canteen wasn’t too busy at this time but there weren't any empty tables either, kitty places her tray and sits behind your table, on the same side as you. She grabs the spoon and starts consuming her dish, the same one as what you have. You decide to start a little chat.")

		saynn("[say=pc]What do you do every day?[/say]")

		saynn("[say=rahi]The same as everyone else.. Working in the mines, wandering around.. She likes doing yoga.[/say]")

		saynn("[say=pc]Yoga, huh[/say]")

		saynn("Kitty looks at you and smiles.")

		saynn("[say=rahi]She wants to stay agile.[/say]")

		saynn("[say=pc]You do look like quite an agile kitty, good job.[/say]")

		saynn("[say=rahi]Thank you..[/say]")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		addCharacter("avy")
		# (Avy, Red inmate, medium-height fox with a black fur and a feminine look)

		saynn("Some red enters the canteen, this one is special because she immediately starts looking for someone instead of grabbing food. Her gaze meets kitty's. The brown feline quickly lowers her head as the red approaches.")

		saynn("This red looks like a fox with a black fur, medium height, about 1.7 meters. She looks feminine and pretty fit, about what you would expect a bully to look like.")

		saynn("[say=avy]Hey there, cat.[/say]")

		saynn("[say=rahi]Hello..[/say]")

		saynn("Red grabs the feline by the ponytail and yanks her head back, kitty hisses from pain.")

		saynn("[say=avy]Hello, who? Did my slut forget how to call me? You wanna be choking on my cock again?[/say]")

		saynn("[say=rahi]H-hello, mistress..[/say]")

		saynn("The fox gives the kitten a slap on the face, causing more hissing, before sitting near. You decide not to intervene for now, who knows what that fox can do to you. You do observe carefully though.")

		saynn("[say=avy]That’s better. How much did you earn, your debt’s deadline is today.[/say]")

		saynn("[say=rahi]Kitty only has 4 credits.. Her cough got worse, she can’t work as much..[/say]")

		saynn("[say=avy]You think I give a fuck? I need 10. Remember what I said?[/say]")

		saynn("[say=rahi]Each e-extra day is one broken bone..[/say]")

		saynn("Red holds the poor feline by the collar, her other hand is turned into a fist. She catches your concerned gaze.")

		saynn("[say=avy]The fuck are you looking at?[/say]")

		# (ask to stop or intimidate)

		addButton("Ask to stop", "Maybe she will understand a kind approach", "ask_to_stop")
		addButton("Intimidate", "What the heck that fox thinks she is doing", "intimidate")

	if(state == "ask_to_stop"):
		saynn("[say=pc]Don’t hurt her.[/say]")

		saynn("Kitty looks at you with scared eyes.")

		saynn("[say=rahi]D-don’t..[/say]")

		saynn("The fox lets go of the feline’s collar and instead approaches you, she stands right behind you.")

		# (if red)
		if(GM.pc.getInmateType() == InmateType.HighSec):
			saynn("[say=avy]Is she your slut? Look at her, that little bitch has already found a new owner while I wasn’t looking. Wow.[/say]")

		# (if general)
		if(GM.pc.getInmateType() == InmateType.General):
			saynn("[say=avy]Oh yeah? And what are you gonna do?[/say]")

		# (if pink)
		if(GM.pc.getInmateType() == InmateType.SexDeviant):
			saynn("[say=avy]A lilac toy is trying to tell me something? Shouldn’t your mouth be busy with staff cocks 24/7[/say]")

		saynn("[say=pc]I’m asking you.[/say]")

		saynn("She chuckles.")

		saynn("[say=avy]Why don’t you beg instead. Get on your knees first.[/say]")

		saynn("Kitty stands up and takes a few steps back but the fox barks at her.")

		saynn("[say=avy]Don’t you dare. If you call someone you will get a free trip to the medical.[/say]")

		saynn("Red directs her attention back at you.")

		saynn("[say=avy]I. Said. Beg.[/say]")

		# (beg or attack?)

		addButton("Beg", "You really don’t wanna fight", "beg")
		addButton("Attack", "Show that bully what a real pain is", "attack")

	if(state == "beg"):
		playAnimation(StageScene.Solo, "kneel")
		
		saynn("You do as she orders, getting on your knees before the red and tilting your head down.")

		saynn("[say=pc]Please don’t hurt her..[/say]")

		saynn("The foxy seems quite entertained by the display, she chuckles and grabs your chin. You let her do it.")

		saynn("[say=avy]I totally didn’t expect this~. Why shouldn’t I hurt that slut, tell me?[/say]")

		saynn("[say=pc]Because..[/say]")

		saynn("[say=avy]Here is a better question. Who should I hurt instead?[/say]")

		saynn("Some inmates do watch the scene but nobody dares to interrupt it, everyone is just minding their own stuff, leaving you and kitty against the fox. Kitty looks at you with very sorry eyes.")

		saynn("[say=pc]You can hurt me..[/say]")

		saynn("Foxy leans down and slaps your face, causing you to recoil back. She yanks you closer.")

		saynn("[say=avy]That was way too weak for begging. Try again, whore.[/say]")

		saynn("[say=pc]Please, hurt me instead..[/say]")

		saynn("[say=avy]Yeah? You wanna be my painslut?[/say]")

		saynn("[say=pc]Yes, please.. your painslut..[/say]")

		saynn("[say=avy]Well, if you so insist~[/say]")

		saynn("The red pushes you down and starts kicking and scratching you, she seems to enjoy violence. You try to protect yourself but the hits are quite painful, you get the wind kicked out of you.")

		saynn("When the fox is done with you, she sits on you and giggles.")

		saynn("[say=avy]Such an obedient punching bag. Hey cat, get over here.[/say]")

		saynn("Kitty really doubts if she should but she does walk closer to the fox.")

		saynn("[say=avy]I don’t need you anymore, I have this toy now. Happy?[/say]")

		saynn("The feline tilts her head down, her ears droop. Foxy chuckles and then leaves you two alone.")

		# (Also happens when you lose a fight)

		addButton("Continue", "Ow", "aftermatch")

	if(state == "aftermatch"):
		removeCharacter("avy")
		playAnimation(StageScene.Hug, "hug", {npc="rahi"})
		
		saynn("Kitty helps you to sit on the bench and swipes the dust off.")

		saynn("[say=rahi]You shouldn’t have..[/say]")

		saynn("[say=pc]Shush. It’s okay. It hurts but I’m okay..[/say]")

		saynn("The feline hugs you lightly and kneads your back and shoulders. You hug her back.")

		saynn("[say=rahi]She is very sorry.. That red was beating her up for at least a week now..[/say]")

		saynn("[say=pc]Why though? What’s that debt about?[/say]")

		saynn("[say=rahi]Gambling..[/say]")

		saynn("[say=pc]You lost against her?[/say]")

		saynn("[say=rahi]Kitty won but then she turned it into a best of three.. she cheated.. Is there something she can do for you?..[/say]")

		saynn("[say=pc]I will be fine.[/say]")

		saynn("[say=rahi]Thank you..[/say]")

		saynn("She holds onto you and starts to lick your bruises. Her tongue is rough so it feels like tickling. But it also soothes your pain, strangely enough. You offer the kitty a head pat. You both don’t seem to have the appetite anymore so you just sit together for a while.")

		saynn("[say=pc]Gotta go.[/say]")

		saynn("[say=rahi]You take care now..[/say]")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")
		

	if(state == "attack"):
		playAnimation(StageScene.Solo, "shove")
		
		saynn("You shove your elbow into her chest, causing the foxy to stumble back. She growls at you, showing off her bare fangs.")

		saynn("[say=avy]Is that how you wanna play? I will enjoy snapping your bones one by one.[/say]")

		saynn("Seems like it’s a fight.")

		addButton("Continue", "Fight!", "startfight")
		

	if(state == "intimidate"):
		playAnimation(StageScene.Solo, "stand")
		
		saynn("[say=pc]I’m looking at a huge mistake you’re making.[/say]")

		saynn("The foxy reacts by smiling, she firmly pats the brown feline a few times and then steps closer to you instead. You stand up and look her into the cunning eyes.")

		saynn("[say=avy]So noble. Didn’t know this cat has a white knight protecting her now. Did you two fuck already?[/say]")

		saynn("Kitty tilts her head down and looks away.")

		saynn("[say=avy]What? You think she is a virgin innocent flower? That slut loves being degraded down to a cat level, crawling around, eating cum from a pet bowl. You’re protecting a whore.[/say]")

		saynn("The feline is so embarrassed she covers her face, her ears droop and her tail hides under her butt.")

		saynn("[say=pc]I think you should shut your mouth.[/say]")

		saynn("[say=avy]Why don’t you show me.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Continue", "Fight!", "startfight")

	if(state == "won_battle"):
		saynn("Defeated Avy pants heavily, she is still as angry as she was but she is too exhausted to continue. She points at the brown kitty and snarls at her.")

		saynn("[say=avy]Enjoy your sad little victory, cat.[/say]")

		saynn("[say=pc]If you touch her again - you’re gonna have to deal with me. Understand?[/say]")

		saynn("[say=avy]As for you, you should know that this is only the beginning of our relationship.[/say]")

		saynn("Foxy holds onto her stomach as she hobbles away.")

		addButton("Continue", "What now", "aftermatch")

	if(state == "lost_battle"):
		saynn("Beaten up, you sit on the ground and hold onto your bruises. It hurts. The foxy looms over you, a bright smile shines on her face, she seems to be enjoying seeing you suffer.")

		saynn("[say=avy]Very brave. And very stupid.[/say]")

		saynn("The foxy runs her claws over your cheek, applying enough pressure to make it uncomfortable. Then she glances at the scared brown feline.")

		saynn("[say=avy]You’re lucky I got my fix by beating this silly thing up. Don’t forget about me~[/say]")

		saynn("Red chuckles and leaves you two alone.")

		addButton("Continue", "What now", "aftermatch")
		

func _react(_action: String, _args):
	if(_action == "startfight"):
		runScene("FightScene", ["avy"], "avyfight")

	if(_action == "beg"):
		GM.pc.addPain(50)
		addMessage("Ow, that was a painful lesson")
		addExperienceToPlayer(50)
		
	if(_action == "aftermatch"):
		GM.pc.addPain(-30)

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "avyfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("won_battle")
			addExperienceToPlayer(80)
			setModuleFlag("RahiModule", "Avy_WonCanteenFight", true)
		else:
			setState("lost_battle")
			addExperienceToPlayer(50)

func getDevCommentary():
	return "I was.. very tired.. while writing this scene. That's why it's bad..\n\nIdeally you would be able to maybe humiliate Avy if you win. Or something lewd should happen if you lose. But you know.. my motivation to write anything just plummets hard when I'm out of it. So why write then? I dunno.. Should I not write when I'm not in a perfect mood? What if I'm sick? What if I'm feeling only slightly unwell?.. Yeah.. ideally I should write when I know that I can write a good scene, right? x3 How do you even know that without writing something first x3 Should I just throw out bad scenes? Eh, its not disgustingly bad though x3 Just weak.\n\nYou know how I see it? Good scenes will feel even better if sometimes you have to sit through bad ones too x3. I'm not saying almost every scene needs to be awful but.. you know.. if I balance it out well, your experience will be better ^^"

func hasDevCommentary():
	return true
