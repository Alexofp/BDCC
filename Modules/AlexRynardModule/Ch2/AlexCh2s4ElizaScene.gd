extends SceneBase

func _init():
	sceneID = "AlexCh2s4ElizaScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		saynn("Some time has passed.. maybe Alex is better now?")

		saynn("[say=pc]How is Alex? Can I see him?[/say]")

		saynn("Eliza lowers her gaze for a second, her expression changes for a more sad one.")

		saynn("[say=eliza]He is okay. About as good as he can be in his situation.[/say]")

		saynn("Something isn't right.")

		saynn("[say=pc]Are you sure?[/say]")

		saynn("[say=eliza]Our surgeons are good but.. sadly, we don't exactly have prosthetic spines lying around.[/say]")

		saynn("[say=pc]So.. he is paralyzed?[/say]")

		saynn("Eliza nods subtly.")

		saynn("[say=eliza]Alex is also.. not talking much. Mostly stares at the same spot. He is not in a good mental space.[/say]")

		saynn("You both stay quiet for some time.")

		saynn("[say=eliza]We can go pay him a visit.. Maybe that will cheer him up.[/say]")

		addButton("Follow", "See where Eliza brings you", "captain_meet")
	if(state == "captain_meet"):
		addCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {npc="captain", pc="eliza"})
		aimCameraAndSetLocName("medical_firstcorridorcross")
		saynn("While following Eliza through the sterile white corridors, you run into the captain..")

		saynn("[say=eliza]Oh, hello captain. Feeling sick?[/say]")

		saynn("The captain puts on a subtle smile.")

		saynn("[say=captain]Hello, doctor Quinn. No, I was actually checking on our engineer. Awful things happened to him, it's a real tragedy. Everyone responsible is gonna be heavily punished, I will make sure of that.[/say]")

		saynn("He directs his gaze to you.")

		saynn("[say=captain]Thank you, inmate. You saved his life.[/say]")

		saynn("Eliza puts her paw on her mouth.")

		saynn("[say=eliza]Did he talk to you?[/say]")

		saynn("[say=captain]He said a few words, yeah. I thought it would be best not to bother him too much.[/say]")

		saynn("[say=eliza]What did he say?[/say]")

		saynn("[say=captain]Um.. Alex is not himself yet, he is still in shock, what he says is heavily influenced by that. Now, if you excuse me.[/say]")

		saynn("Captain turns away to leave.. but Eliza stops him, grabbing onto his shoulder.")

		saynn("[say=eliza]One last thing, cap. Is there a way the station can put up an order for a prosthetic spine? He needs it.[/say]")

		saynn("Captain lowers his gaze.")

		saynn("[say=captain]You gotta understand how pricey those things are. But I will see what I can do, trust me, I want him back on his feet as much as you. I think for now we all should focus on helping him recover.[/say]")

		saynn("Eliza tilts her head, looking slightly confused by his words.")

		saynn("[say=eliza]But.. captain..[/say]")

		saynn("[say=captain]I'm afraid I don't have any more time to chat, I need to work.[/say]")

		saynn("Eliza's paw slowly slides off the captain's shoulder as he turns away and leaves.")

		saynn("Eliza sighs.")

		saynn("[say=eliza]Let's go..[/say]")

		addButton("Continue", "See what happens next", "alex_first_meet")
	if(state == "alex_first_meet"):
		removeCharacter("captain")
		addCharacter("alexrynard", ["naked"])
		playAnimation(StageScene.Sleeping, "sleep", {pc="alexrynard", bodyState={naked=true}})
		aimCameraAndSetLocName("medical_hospitalwards")
		saynn("Hospital wards. Probably the only peaceful place on the whole station.")

		saynn("All the beds are separated by the long dividers, Eliza brings you to the one where Alex is resting at. He seems to be conscious.")

		saynn("[say=eliza]Hey, look who I brought.[/say]")

		saynn("Alex takes a second to look you in the eyes.. and then just sighs, his gaze cold.")

		saynn("[say=pc]How do you feel?[/say]")

		saynn("[say=alexrynard]Great.[/say]")

		saynn("Yeah, that probably wasn't the best question. But at least he is talking.")

		saynn("[say=eliza]We will do everything we can to help you, trust me.[/say]")

		saynn("[say=alexrynard]I hate that word so much now..[/say]")

		saynn("Eliza tilts her head slightly, confused by his words. Alex sees that.. and lowers his gaze.")

		saynn("[say=alexrynard]I'm sorry. I don't want anyone to see me like this.[/say]")

		saynn("[say=pc]You're still Alex, the same Alex that I know.[/say]")

		saynn("He shakes his head.")

		saynn("[say=alexrynard]I'm a broken man. Physically and mentally. And it's all my fault.[/say]")

		saynn("[say=eliza]What do you mean? You got jumped by three inmates, that's not your fault.[/say]")

		saynn("[say=alexrynard]Uh huh.[/say]")

		saynn("Alex looks you in the eyes.. trying to see something in them.. but then just gives up and frowns.")

		saynn("[say=alexrynard]I keep putting my trust into others. You'd think I would learn by now? Captain was right.[/say]")

		saynn("[say=pc]What did he tell you?[/say]")

		saynn("Ten seconds of silence.")

		saynn("[say=alexrynard]No one is your friend.[/say]")

		saynn("He probably said more than that.. The captain loves giving speeches.")

		saynn("Eliza lowers her gaze.. you notice her eyes watering up.")

		saynn("[say=eliza]I.. I will leave you two alone for now.. Sorry..[/say]")

		saynn("Eliza rubs her eyes as she swiftly leaves the room.")

		saynn("[say=alexrynard]Back then, many years ago, I thought I could at least trust myself. A logical thought, right? Nah.. my own creation broke me. Hah.. Can't even trust machines anymore.[/say]")

		saynn("He looks at you.")

		saynn("[say=alexrynard]History will keep repeating if we don't learn from our mistakes..[/say]")

		saynn("You can't shake off this feeling that he is trying to blame you too for what happened.")

		saynn("[say=pc]Listen, I never told anything to that inmate..[/say]")

		saynn("[say=alexrynard]None of this matters anymore, does it. I was a spineless beta before. Now I'm a spineless parasite.[/say]")

		addButton("I will help", "Tell Alex that you will help him", "alex_iwillhelp")
		addButton("Man up", "Tell Alex that he should stay strong no matter what", "alex_manup")
	if(state == "alex_manup"):
		removeCharacter("eliza")
		saynn("[say=pc]Man up, Alex. You gotta stay strong no matter what. Any difficulty can be overcomed as long as you don't give up.[/say]")

		saynn("Alex looks at his legs that don't move anymore.")

		saynn("[say=alexrynard]Uh huh. Thanks for the kind words, I will man up now.[/say]")

		saynn("He is being pretty sarcastic.. so not all hope is lost?")

		saynn("[say=alexrynard]I was trying to be strong. Ended up weak. I wanted to be tough.. but ended up broken. Maybe I'm just not made for this world.[/say]")

		saynn("Huh, looks like telling him to stay strong again won't be the best idea.. The guy is clearly depressed. Whatever the captain said to him, it's not helping.")

		saynn("[say=pc]You should stop listening to the captain.[/say]")

		saynn("[say=alexrynard]Do you think I want to? The problem is that.. he is right. We will betray each other as soon as the benefits outweigh the consequences. It's that simple.[/say]")

		saynn("You're pretty sure you didn't betray him..")

		saynn("[say=pc]I never betrayed our trust, okay? I don't know what the captain told you.. but he is either very wrong or lying.[/say]")

		saynn("Alex frowns.")

		saynn("[say=alexrynard]Swear.[/say]")

		saynn("[say=pc]What?[/say]")

		saynn("[say=alexrynard]Swear on it.[/say]")

		saynn("[say=pc]I swear? I swear I didn't betray you.[/say]")

		saynn("His gaze is drilling yours. Yours is unshakable.")

		saynn("[say=alexrynard]You could be telling the truth or lying straight to my face.. How can anyone trust anyone..[/say]")

		saynn("He is wrong. Words are pretty meaningless here. The actions will speak louder.")

		saynn("Alex sighs.")

		saynn("It's probably best to leave him alone now though. Nothing that you say will ever change his mind.")

		saynn("[say=pc]Take care..[/say]")

		addButton("Leave", "Time to go", "after_alex_eliza")
	if(state == "alex_iwillhelp"):
		removeCharacter("eliza")
		saynn("[say=pc]I will help you. We will find a way to put you back on your feet, trust me.[/say]")

		saynn("There is that word again.. It's kinda annoying you too now. So easy to promise something.")

		saynn("Alex sighs.")

		saynn("[say=alexrynard]The only way you can help now is by grabbing a pillow.[/say]")

		saynn("[say=pc]You should.. stop listening to the captain.[/say]")

		saynn("[say=alexrynard]Do you think I want to? The problem is that.. he is right. Trust is there as long as it is beneficial. Laws work as long as there is a punishment for not obeying them. It's that simple..[/say]")

		saynn("Carrot and a stick, huh.")

		saynn("[say=pc]I never betrayed our trust, okay? I don't know what the captain told you.. but he is either very wrong or lying.[/say]")

		saynn("Alex frowns.")

		saynn("[say=alexrynard]Swear.[/say]")

		saynn("[say=pc]What?[/say]")

		saynn("[say=alexrynard]Swear on it.[/say]")

		saynn("[say=pc]I swear? I swear I didn't betray you.[/say]")

		saynn("His gaze is drilling yours. Yours is unshakable.")

		saynn("[say=alexrynard]You could be telling the truth or lying straight to my face.. How can anyone trust anyone..[/say]")

		saynn("He is wrong. Words are pretty meaningless here. The actions will speak louder.")

		saynn("Alex sighs.")

		saynn("It's probably best to leave him alone now though. Nothing that you say will ever change his mind.")

		saynn("[say=pc]Take care..[/say]")

		addButton("Leave", "Time to go", "after_alex_eliza")
	if(state == "after_alex_eliza"):
		removeCharacter("alexrynard")
		addCharacter("eliza")
		aimCameraAndSetLocName("medical_firstcorridorcross")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		GM.pc.setLocation("med_lobbynw")
		saynn("You exit the wards and follow the white corridors back to the lobby.. Eliza is nowhere in sight but.. who cares by this point.")

		saynn("Nurses quickly take notice of a free inmate walking around the staff-only area.. but one look is enough to make them get out of the way.")

		saynn("Suddenly, Eliza runs up to you, using her paws to quickly wipe away her tears.")

		saynn("[say=eliza]I know what we can do![/say]")

		saynn("[say=pc]The station doesn't have funds for it, why bother?[/say]")

		saynn("[say=eliza]Screw the station, I talked with one of the surgeons. He seems to be brave enough to try to repair Alex's back. What he needs is.. parts.[/say]")

		saynn("You tilt your head slightly.")

		saynn("[say=pc]Parts?[/say]")

		saynn("[say=eliza]Yes![/say]")

		saynn("[say=pc]Where am I gonna get prosthetic spine parts?[/say]")

		saynn("Eliza smiles.")

		saynn("[say=eliza]A lot of the parts are the same in any machine. And you'd be surprised what engineers sometimes have in their pockets. People are stealing things left and right here.[/say]")

		saynn("[say=pc]And you're saying.. that I should steal from them?[/say]")

		saynn("Eliza scratches her neck.")

		saynn("[say=eliza]Yeah-h-h?.. Listen, it's not the best solution. But it is A solution.[/say]")

		saynn("Beating up other engineers so you could save Alex.. It might actually be worth it..")

		saynn("[say=eliza]Ple-e-e-ease? We need to help him, he can't stay glued to the bed forever, it's just not right.[/say]")

		saynn("[say=pc]I will think about it.[/say]")

		saynn("[say=eliza]Just get as many as you can, it will be easier for you two during the operation. While I will search for documentation about his prosthetic![/say]")

		saynn("Wait..")

		saynn("[say=pc]You're saying I will be operating too?[/say]")

		saynn("[say=eliza]Of course, you are Alex's apprentice, you know a lot about fixing stuff, don't you?[/say]")

		saynn("She is not wrong.. But it's way too early to celebrate.")

		saynn("[say=pc]Him having his spine back won't fix him.[/say]")

		saynn("Eliza sighs and lowers her eyes.")

		saynn("[say=eliza]But we can at least try..[/say]")

		saynn("You nod. Hope is a contagious feeling, isn't it..")

		saynn("Eliza nods back and swipes off her new tears.")

		saynn("[say=eliza]I will show you the way out..[/say]")

		addButton("Follow", "Time to go", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "captain_meet"):
		processTime(3*60)

	if(_action == "after_alex_eliza"):
		processTime(5*60)
		addMessage("New task added")

	setState(_action)
