extends "res://Scenes/SceneBase.gd"
#ACEPREGEXPAC- Add this custom scene
func _init():
	sceneID = "TellAlexHeIsFatherScene"

func _run():
	var isPregFromAlex:bool = GM.pc.isPregnantFrom("alexrynard")
	
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Hug, "idle", {pc="pc", npc="alexrynard"})
		
	if(state == ""):
		saynn("As you approach Alex for a chat he comes over to you, looking a bit concerned.")
		
		saynn("[say=alexrynard]Hey {pc.name}, Can I ask you something?[/say]")
		
		saynn("[say=pc]What is it?[/say]")
		
		saynn("He looks down at your noticbly pregnant belly, mulling over his words...")
		
		saynn("He sighs.")
		
		saynn("[say=alexrynard]You're pregnant, clearly... and well...[/say]")
		
		saynn("Alex leans in and almost whispers.")
		
		saynn("[say=alexrynard]...Would I happen to be the father?[/say]")
		
		saynn("[say=alexrynard]I've noticed it, and while I don't keep track of everything you do, I just, had to ask. Because I don't know for sure...[/say]")
		
		saynn("What do you tell him?")
		
		addButton("Yes", ("(Lie) " if !isPregFromAlex else "")+"Say that he is the father", "AlexYesFather")
		addButton("No", ("(Lie) " if isPregFromAlex else "")+"Say that he is not the father", "AlexNotFather")
		
		
	if(state == "AlexYesFather"):
		playAnimation(StageScene.Hug, "hug", {pc="alexrynard", npc="pc"})
		
		if(isPregFromAlex):
			saynn("Well, might as well tell Alex now.")
		else:
			saynn("He is not the father.. But you're curious how he would react..")
		
		saynn("[say=pc]Yes, You are gonna be a father...[/say]")
		
		saynn("Alex leans over on his workshop table when he hears what you told him, sighing")
		
		saynn("For a few but very slow minutes, Alex just stands there, seemingly lost in thought.")
		
		saynn("Unsure of what to do with yourself, you walk over next to him and put a hand on his shoulder.")
		
		saynn("[say=pc]You gonna be alright?[/say]")
		
		saynn("[say=alexrynard]Yeah, I just...[/say]")
		
		saynn("[say=alexrynard]Having kids in a nowhere space prison is incredibly reckless...[/say]")
		
		saynn("[say=alexrynard]It's already too late to prevent it but...[/say]")
		
		saynn("Fidgeting, Alex shakes his head with a sigh.")
		
		saynn("[say=alexrynard]No, No. Shouldn't think like that. But still, I'd be a terrible father.[/say]")
		
		saynn("[say=pc]I won't even be able to see my kids...[/say]")
		
		saynn("[say=alexrynard]I won't either. I have a criminal record remember? The nurses never let me into the nursery.[/say]")
		
		saynn("[say=pc]So I guess that makes both of us.[/say]")
		
		saynn("The two of you just sit in silence for a while. Alex holding his head in his hands as he thinks.")
		
		saynn("[say=alexrynard]...I'd hate having to just give my kids away to the nursery... and then who knows where after that...[/say]")
		
		saynn("Not quite sure to say, you just step over and hug the fox. Which he returns in kind.")
		
		saynn("[say=alexrynard]Y'know, maybe it won't be the worst.[/say]")
		
		saynn("[say=alexrynard]While I won't be able to do much, I can still help you out. If you need support, you can come to me. How does that sound?[/say]")
		
		saynn("[say=pc]I can work with that...[/say]")
		
		saynn("The two of you just embrace each other as the mood settles back down.")
		
		saynn("Eventually though, Alex breaks away back to his workshop, the offer to support you still in your mind...")
		
		addButton("Continue", "Continue on your way", "endthescene")
		
	
	if(state == "AlexNotFather"):
		if(isPregFromAlex):
			saynn("He is the father for sure.. but you decide to go easy on the poor foxy.")
		else:
			saynn("You decide to tell Alex the truth.")
		
		saynn("[say=pc]No, you're not.[/say]")
		
		saynn("The fox looks instantly relieved.")
		
		saynn("[say=alexrynard]Oh that's good to hear. I don't know about you, but me, personally, having children while in prison just seems reckless. I've had that arguement enough times already...[/say]")
		
		saynn("[say=alexrynard]Not like the nursery would let me in anyway with my criminal record...[/say]")
		
		saynn("Alex lets out a long sigh.")
		
		saynn("[say=alexrynard]Who is the father anyway... actually, no, don't answer that. How are you holding up?[/say]")
		
		saynn("Giving your own gravid body a look, you put your hands over top of it before looking back up at Alex.")
		
		saynn("[say=pc]I could be better.[/say]")
		
		saynn("[say=alexrynard]Yeah... I imagine carrying that around isnt fun.[/say]")
		
		saynn("[say=alexrynard]Actually...[/say]")
		
		saynn("[say=alexrynard]I wasn't going to bring it up, but ever since I saw you start showing, I've been bracing myself for this moment just incase I was the father.[/say]")
		
		saynn("[say=alexrynard]And well, since we are at least friends, I wouldn't mind supporting you anyway I can... If you want it, though.[/say]")
		
		saynn("Well, better to have the option at least. Could mean more cuddles with Alex. That's always a good thing.")
		
		saynn("[say=pc]I'll see.[/say]")
		
		saynn("Alex nods and heads back to his workshop...")
		
		saynn("Something to think about.")

		addButton("Continue", "Continue on your way", "endthescene")



#scrapped
#
#	if(state == "AlexFatherCantBe_disclaimer"):
#		saynn("[This option is here because there are no scene checks for what character is the father of a child, only for if someone is pregnant or pregnant from the player]")
#
#		saynn("[Since I've had to work around this, it can lead to some weirdness, like Alex asking if he is the father when you have never had fertile sex with him]")
#
#		saynn("[By picking this option, It'll disable Alex's expanded pregnancy content for your current character's pregnancy and any future ones they might have.]")
#
#		addButton("Go back", "Back to the yes or no", "")
#		addButton("Can't be", "Commit", "AlexCantBeFather")
		
#
#		saynn("Oh sorry, I just saw you were and had a panic, what did you want to talk about")
#
#		addButton("Continue", "Continue on your way", "endthescene")

func _react(_action: String, _args):

	if(_action in ["AlexYesFather", "AlexNotFather"]):
#		processTime(RNG.randi_range(3, 5)*30)
		setModuleFlag("AcePregExpac", "Alex_ToldIsFather", 0)

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func getDevCommentary():
	return "Well, It's technically my first scene. So this counts as my first dev commentary. I'll cut the massive rant I had and instead just leave it at 'this scene took fucking way too long to code' I feel like the hell of trying to figure out flags and events impacted the writing with how absolutely shitty the writing is here. But I did want Alex to call the player out if they didn't tell him he was gonna be a father, and this is at least functional. Maybe i'll come back to it. Who knows. Also fun fact there's no scene code check for who is the father of a pregnancy. Just if a character is pregnant, heavily pregnant, and if the player is the one who did the breeding. So that was fun to work around. Probably broke the immersion of a few people who never had sex with alex in his route but whatever. Be sure to join the BDCC discord and tell me how incredibly shitty my writing is."
