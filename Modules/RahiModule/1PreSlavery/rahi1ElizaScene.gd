extends SceneBase

func _init():
	sceneID = "rahi1ElizaScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="nurse"})
		addCharacter("nurse")
		saynn("You hear a female voice in your dreams. A soft, almost angelic, voice. It calls you closer. Closer.. Until it begins to grow louder and louder. Ow. Someone is shaking you.")

		saynn("You open your eyes and see one of the nurses. She is looming over you.")

		saynn("[say=nurse]Up, inmate.[/say]")

		saynn("Her voice is not so angelic, she sounds kinda annoyed actually.")

		saynn("[say=pc]Huh? What did I do?[/say]")

		saynn("You decide to listen though. Your hands push your head away from the pillow and help you sit down.")

		saynn("[say=nurse]Doctor Quinn wants you. Don't make her wait.[/say]")

		saynn("Your head is still a bit hazy.")

		saynn("[say=pc]Doctor Who?[/say]")

		saynn("[say=nurse]Oh quit it before I smacked your ass red.[/say]")

		saynn("You slowly get up and look around. This is still your cell, just with an extra person in it.")

		saynn("[say=pc]Did she mention why she needs me?[/say]")

		saynn("[say=nurse]Yeah. She is gonna do all the tests on you, try all the drugs that she has.[/say]")

		saynn("The cell becomes silent for a few seconds. Nurse stares at you while you stare back. She is trying to be dead-serious. But eventually a little cheeky smile does appear on her face, followed by an almost hysterical laugh.")

		saynn("[say=nurse]I'm kidding, inmate. I have no idea, she mentioned something about some kitten.[/say]")

		saynn("A kitten? You don't know that many kittens.")

		saynn("[say=pc]Sure, I can go?[/say]")

		saynn("You try to walk past her but she stops you, her paw masterfully clips a leash to your collar without you even realizing it.")

		saynn("[say=nurse]Nuh uh. You're gonna follow me, inmate.[/say]")

		saynn("Well. Might as well let her escort you.")

		addButton("Follow", "See where she will bring you", "follow_nurse")
	if(state == "follow_nurse"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		removeCharacter("nurse")
		aimCameraAndSetLocName("med_lobbymain")
		saynn("The nurse brings you into the medical wing lobby and reaches to remove your leash. But doctor Quinn stops her.")

		saynn("[say=eliza]Leave the leash. You're free for now, thank you.[/say]")

		saynn("The nurse nods once and just leaves you two alone. You look around. Sterile white walls. Clean gray floors and ceilings. Cold lights give the lobby a slightly blue tint. The doctor is sitting behind the counter, finishing her coffee.")

		saynn("[say=pc]So? What do you want, doctor.[/say]")

		saynn("[say=eliza]Call me Eliza. I heard that you're.. friends.. with one of the inmates. A brown cat that speaks in third-person. Ring any bells?[/say]")

		saynn("[say=pc]Yeah, I know her. Why are you asking me that?[/say]")

		saynn("Eliza looks away for a second.")

		saynn("[say=eliza]Well.. actually, let's go somewhere more private. These walls have too many ears.[/say]")

		saynn("Eliza steps from behind the counter and approaches you before grabbing your leash.")

		saynn("That's the second time you're being leashed today. Hopefully she is not trying to lure you into some trap.")

		addButton("Follow Eliza", "See where she brings you", "follow_eliza")
	if(state == "follow_eliza"):
		aimCameraAndSetLocName("medical_confessionary")
		playAnimation(StageScene.Duo, "sit", {npc="eliza", npcAction="sit"})
		saynn("Eliza brings you into a dark moody room. This one somehow manages to be both cozy and stress-inducing. There is a big carpet, a chair and a big sofa. But also racks that are clearly designed for.. rough stuff.")

		saynn("[say=pc]You're not gonna torture me, are you?[/say]")

		saynn("[say=eliza]No, it's not about you even, don't worry. Take a seat.[/say]")

		saynn("You plop your {pc.thick} butt onto the sofa while Eliza just takes the chair.")

		saynn("[say=eliza]I wanna talk about Rahi. That's her name, in case you didn't know. But I noticed that she calls herself kitten a lot.[/say]")

		saynn("[say=pc]Yeah, she likes that name for some reason.[/say]")

		saynn("[say=eliza]That's not the point. Well no, it might be connected.. but.. I wanna ask you something. Did you and Rahi ever drink any alcohol here, inside the prison's grounds? Or did you ever see her do that?[/say]")

		saynn("That's a tough question. You're not sure if you should answer it.")

		saynn("[say=pc]Why are you asking that?[/say]")

		saynn("[say=eliza]As you may or may not know, alcohol is forbidden for inmates. And that means that inmates shouldn't have access to it. Or they would get into a lot of trouble. There is only one way for Rahi to get her hands on it.[/say]")

		saynn("Doctor sounds somewhat intimidating, you really don't like her tone. You shift uncomfortably while looking around at all the BDSM torture devices.")

		saynn("[say=eliza]So-o.. I repeat. Have you ever seen Rahi drinking alcohol? Did you join her?[/say]")

		addButton("Yes", "Admit that you did in fact saw her drinking", "say_yes_drinking")
		addButton("No", "Lie to Eliza to try and keep Rahi from danger", "say_no_drinking")
	if(state == "say_no_drinking"):
		setFlag("RahiModule.rahi1ProtectedRahi", true)
		saynn("You tilt your head down, thinking. Rahi really doesn't deserve to be punished for it. So you must lie.")

		saynn("[say=pc]No, I never saw Rahi with alcohol. That kitten is one of the most well-behaving inmates around.[/say]")

		saynn("Eliza carefully listens to you. And then puts on a cunning smile, her voice softens up.")

		saynn("[say=eliza]So that means you weren't drinking whiskey near the waterfall in the yard area?[/say]")

		saynn("Ohh, that was a low one. You try to keep calm.")

		saynn("[say=pc]No?[/say]")

		saynn("Eliza leans closer to you, her feline eyes drilling you.")

		saynn("[say=eliza]So the cameras must be lying then~?[/say]")

		saynn("It's hard to stay calm when the doctor has evidence. Maybe you can try to lie yourself out of this.")

		saynn("[say=pc]Uhh.. it was just a.. a water bottle. Yes. We were just drinking water.[/say]")

		saynn("Eliza chuckles softly.")

		saynn("[say=eliza]Relax. I knew that Rahi steals alcohol for a long time. If she can somehow get her paws on it, I don't mind.[/say]")

		saynn("[say=pc]Uh. What's.. what is the problem then?[/say]")

		saynn("[say=eliza]Right.. Let me pull up some data.[/say]")

		saynn("Eliza fetches her trusty datapad.")

		addButton("Continue", "See what happens next", "eliza_explains_about_rahi")
	if(state == "say_yes_drinking"):
		setFlag("RahiModule.rahi1ProtectedRahi", false)
		saynn("Lying will only get you so far, might as well be honest with the doctor.")

		saynn("[say=pc]Rahi does drink sometimes. I have no idea where she gets it. I don't think she needs to be punished for it, just a drink that she likes.[/say]")

		saynn("Eliza listens to you carefully. Then she stays quiet for a second, observing you. At least you feel calm for not holding anything back.")

		saynn("Finally, she ends the quiet moment first.")

		saynn("[say=eliza]To be honest, I knew about it already. Rahi steals it from the guards. A very resourceful girl if you ask me.[/say]")

		saynn("[say=pc]Why are you asking me that, then?[/say]")

		saynn("Eliza scratches her nose.")

		saynn("[say=eliza]Yeah, about that.. Let me pull up some data.[/say]")

		saynn("Eliza fetches her trusty datapad.")

		addButton("Continue", "See what happens next", "eliza_explains_about_rahi")
	if(state == "eliza_explains_about_rahi"):
		saynn("Eliza presses a few buttons on her datapad before showing you the screen. It shows a rough outline of a feline, seemingly Rahi. Most of the outline is filled with healthy green but there are some areas that have orange, like around her stomach and her brain. Some bits are closer to red than orange already.")

		saynn("[say=eliza]See that? That's Rahi's last scan. Done about 2 weeks ago. So it's probably looking worse now.[/say]")

		saynn("[say=pc]Can't you help her? You're a doctor.[/say]")

		saynn("Eliza puts the datapad away.")

		saynn("[say=eliza]I'm a chemist. I can drug her up but that will bring all sorts of different problems. All while not solving the core issue.[/say]")

		saynn("[say=pc]What's the core issue then?[/say]")

		saynn("Eliza taps on her lap a few times before crossing her legs.")

		saynn("[say=eliza]Rahi has a drinking problem. And it's really taking a toll on her body and mind, especially lately.[/say]")

		saynn("[say=pc]Did you try talking with her?[/say]")

		saynn("Eliza sighs audibly.")

		saynn("[say=eliza]I did. But her state keeps getting worse. Might not look like it but it is. And instead of helping me help her, she began avoiding me.[/say]")

		saynn("Huh. The kitty does like her alcohol.")

		saynn("[say=pc]There is probably a reason why she drinks.[/say]")

		saynn("Eliza looks at you.")

		saynn("[say=eliza]And that's where you come in. I need you to try to figure out why. Not for me, for her. I heard that you're friends. I'm just asking you to talk with her. How does that sound?[/say]")

		addButton("Sure", "You can talk with Rahi", "agree_to_talk")
		addButton("Nah", "Rahi's problems are not your problems", "not_talk")
	if(state == "agree_to_talk"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="sit"})
		saynn("[say=pc]Sure, I can try to talk with her.[/say]")

		saynn("Eliza offers you a kind smile.")

		saynn("[say=eliza]Thank you. You probably know where to find her.[/say]")

		saynn("[say=pc]Why are you doing that though? She is just one of the inmates.[/say]")

		saynn("Eliza tilts her head down while you get up.")

		saynn("[say=eliza]Me and Rahi share something in common I think. I get that feeling sometimes.. Don't know why.[/say]")

		saynn("[say=pc]Alright, thank you for letting me know.[/say]")

		saynn("Eliza nods and then lets you out of the room.")

		addButton("Leave", "Time to go", "leave_confess")
	if(state == "not_talk"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="sit"})
		saynn("[say=pc]I feel like it's not my problem to solve. Sure, it's not good. But that cat needs professional help. I will only make things worse.[/say]")

		saynn("Eliza tilts her head to the side slightly, her gaze drilling you. Drilling you so much that you avoid it and swiftly get up.")

		saynn("[say=eliza]You're not gonna just leave her to suffer.[/say]")

		saynn("[say=pc]Like I said, it's not my problem.[/say]")

		saynn("Eliza produces a shock remote and points it at you.")

		saynn("[say=eliza]It is now. That kitty needs your help. I'm serious. Or she will die. And if that happens, you are next. Understand?[/say]")

		saynn("Well, it's hard to go against that logic. You raise your hands slightly.")

		saynn("[say=pc]Okay, fine. I will try to help her. But you're gonna pay me.[/say]")

		saynn("Eliza smiles and just shakes her head.")

		saynn("[say=eliza]You're not gonna do it for me. You're doing it for her.[/say]")

		saynn("Eliza lowers the remote and lets you out of the room.")

		addButton("Leave", "Time to go", "leave_confess")
	if(state == "leave_confess"):
		playAnimation(StageScene.Solo, "stand")
		removeCharacter("eliza")
		aimCameraAndSetLocName("medical_nearconfessionary")
		GM.pc.setLocation("medical_nearconfessionary")
		saynn("You step out of the dimly-lit room and look around. The contrast is high, the bright medical corridor makes you squint until your eyes adjust.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "follow_nurse"):
		runScene("ParadedOnALeashScene", ["nurse", GM.pc.getLocation(), "med_lobbymain"])

	if(_action == "follow_eliza"):
		runScene("ParadedOnALeashScene", ["eliza", "med_lobbymain", "medical_confessionary"])

	if(_action == "eliza_explains_about_rahi"):
		processTime(60*5)

	if(_action == "leave_confess"):
		processTime(6*60)
		addMessage("Task added")

	setState(_action)

func getDevCommentary():
	return "This scene just shows that Rahi has problems. Basically just exposition.. But I also hint at Eliza being interested in that."

func hasDevCommentary():
	return true
