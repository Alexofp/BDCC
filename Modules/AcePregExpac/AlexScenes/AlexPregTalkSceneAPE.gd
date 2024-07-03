extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AlexPregTalk"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		
		saynn("What do you want to tell Alex?")
		
		
		if(GM.pc.isVisiblyPregnant() && (getModuleFlag("AcePregExpac", "Alex_ToldIsFather", 1))):
			addButton("Gonna Be Father", "Tell Alex he is gonna be a father", "alexfatherreveal")
		elif(!GM.pc.isVisiblyPregnant()):
			addDisabledButton("Tell him", "You aren't pregnant")
#less clutter on the button screen
#		elif(!getModuleFlag("AcePregExpac", "Alex_ToldIsFather", 0)):
#			addDisabledButton("Tell him", "You told him already") 
		
		if(GM.pc.isVisiblyPregnant() && (!getModuleFlag("AcePregExpac", "Alex_ToldIsFather", 1))):
			addButton("Cuddle", "Get some emotional support from Alex", "alexpregcuddle")
		elif(!GM.pc.isVisiblyPregnant()):
			addDisabledButton("Tell him", "You aren't pregnant")
		
		#none of these are done
		if((!getModuleFlag("AcePregExpac", "Alex_ToldIsFather", 1))):
			addButton("Snacks?", "Alex is staff, surely he has something you can eat. However Small it may be.", "AlexSnackStart")
		elif(getModuleFlag("AcePregExpac", "Alex_ToldIsFather", 1)):
			addDisabledButton("Snacks", "You haven't told Alex he is a father yet.")
			
		addDisabledButton("Bondage", "Soon, Maybe. -Ace")
		addDisabledButton("Milk", "Soon.")
		addDisabledButton("Birth", "Soon. -Ace")
		
		#RNG.pick(["AlexSnack1", "AlexSnack2", "AlexSnack3, AlexSnack4"]
		addButton("Leave", "You didn't have anything", "endthescene")

#ACEPREGEXPAC
#if someone has breedable Alex mod I added a little thing
#maybe like 7 people will find it but if it gets them by surprise then it was worth it.
#Fucking *with* people can be just as fun as fucking them regularly
#I wanna do a thing with worldbuilding where if you do alex's storyline changes the talk scenes and that'll conflict with this, but we'll get to that when we do
		if(getCharacter("alexrynard").isVisiblyPregnant()):
				addButton("He's pregnant?", "You're pretty sure thats new", "pregnancysecret")
	
	if(state == "alexfatherreveal"):
		playAnimation(StageScene.Hug, "hug", {pc="alexrynard", npc="pc"})
		
		saynn("Well, might as well tell him now.")
		
		saynn("[say=pc]Hey, Alex?[/say]")
		
		saynn("Alex 'hmm's and turns to look at you.")
		
		saynn("[say=pc]You should know, You're gonna be a father...[/say]")
		
		saynn("Alex's eyes go wide.")
		
		saynn("[say=alexrynard]Wait, Really?![/say]")
		
		saynn("You nod as you show him your belly.")
		
		saynn("Alex just stands there, looking partially shocked and mouth half open. Looking you over with frantic eyes for any sign you could be lying. He doesn't find one.")
		
		saynn("Unsure of what to do with yourself in the silence, you slide up next to him and put a hand on his shoulder.")
		
		saynn("[say=pc]You gonna be alright?[/say]")
		
		saynn("[say=alexrynard]Yeah, I just...[/say]")
		
		saynn("[say=alexrynard]Having kids in a nowhere space prison is incredibly reckless...[/say]")
		
		saynn("[say=alexrynard]I just never thought...[/say]")
		
		saynn("Fidgeting, Alex shakes his head with a sigh.")
		
		saynn("[say=alexrynard]I'd be a terrible father.[/say]")
		
		saynn("[say=pc]and I can't even see my kids...[/say]")
		
		saynn("[say=alexrynard]I won't either. I have a criminal record. I walk without a collar but the nurses have never let me into the nursery.[/say]")
		
		saynn("[say=pc]So I guess that makes both of us.[/say]")
		
		saynn("The two of you just sit in silence for a while. Alex holding his head in his hands as he thinks.")
		
		saynn("[say=alexrynard]...I'd hate having to just give my kids away to the nursery... and then who knows where after that...[/say]")
		
		saynn("Not quite sure to say, you just step over and hug the fox. Which he returns in kind.")
		
		saynn("[say=alexrynard]...Thanks...[/say]")
		
		saynn("Resting his head on your shoulder, not much is said. You pull away from his arms.")
		
		saynn("[say=pc]What will you do now?[/say]")
		
		saynn("[say=alexrynard]Not a whole lot I can do. But... I'm not just gonna leave you with nothing. I can support you while you're still pregnant but after that... I don't know... I'll look into it though...[/say]")
		
		saynn("[say=pc]I can work with that...[/say]")
		
		saynn("The two of you just embrace each other as the mood settles back down.")
		
		saynn("Eventually though, Alex breaks away back to his workshop, the offer to support you still in your mind...")
		
		
		setModuleFlag("AcePregExpac", "Alex_ToldIsFather", 0)
		
		addButton("Continue", "Well, it could've gone worse...", "endthescene")

	if(state == "pregnancysecret"):
		saynn("[say=pc]So, Uh... Are you... pregnant?[/say]")
		
		saynn("[say=alexrynard]You mean the growing weight on both my mind and my spine? The one im trying to ignore so I don't lose my mind? The one you probably gave to me because I certainly don't remember having this wonderful ability a few years ago...[/say]")
		
		saynn("...")
		
		saynn("[say=alexrynard]Nope.[/say]")
		
		addButton("Continue", ":)", "")

	if(state == "alexpregcuddle"):
		saynn("You walk up to Alex and wait for a good moment to ask.")

		saynn("[say=pc]Can we cuddle up for a moment?[/say]")
		
		if (GM.pc.hasEffect(StatusEffect.CoveredInCum)):
			saynn("Alex notices how messy you are and sighs.")

			saynn("[say=alexrynard]Please clean yourself first. You're way too messy.[/say]")

			saynn("Huff, what a buzzkill. Looks like you will have to take a shower first.")

			addButton("Oh well", "Was worth a try", "endthescene")
		else:
			saynn("Alex quickly checks you and your outfit out before nodding.")

			saynn("[say=alexrynard]Sure. Let's go have some fun.[/say]")
		
		addButton("Follow", "See where he brings you", "cuddlestart")
		
		
#cuddle scene feels stoopid. idk how to put it but it do.
#I believe all the scenes I wrote are trash
#hopefully it's just the curse instead of actually just being terrible
	if(state == "cuddlestart"):
		aimCameraAndSetLocName("eng_breakroom")
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc",bodyState={underwear=true}, npcBodyState={underwear=true}})
		saynn("The familiar staff break room. So many things happened here.")
		
		saynn("[say=alexrynard]Shouldn't be too busy today. Have the room to ourselves...[/say]")
		
		saynn("Alex leans back stretched across the sofa, inviting you to sit between his legs.")
		
		saynn("Sitting down Alex pulls you back onto himself.")
		
		saynn("Laying back against Alex, his arms find their way to wrap around you, one over your hip and another going under your {pc.breasts}")
		
		saynn("Feels like you can let loose and really relax... You close your eyes and stretch your back.")
		
		saynn("[say=alexrynard]Hey, don't forget I'm back here...[/say]")
		
		saynn("You just chuckle and reach behind yourself to boop the fox.")
		
		saynn("You miss. Since Alex can just move you to make you miss. Unentirely unfair, but your also not really trying, so who cares?")
		
		saynn("[say=pc]Alright, fine...[/say]")
		
		saynn("You settle back down into the arms of Alex, bratty smile on your face, as Alex puts one of his hands on your belly.")
		
		saynn("With nothing to bother you and all relaxed like this... time passing, half-asleep already... would be a great time for a nap.")
		
		if(RNG.chance(50) && GM.pc.isHeavilyPregnant()):
			saynn("[say=alexrynard]I think i just felt it move...[/say]")
		elif(GM.pc.isHeavilyPregnant()):
			saynn("[say=alexrynard]I don't know how you carry that all day...[/say]")
		else:
			saynn("[say=alexrynard]How are you holding up?[/say]")
		
		saynn("You say nothing in response, just wriggle your way into Alex's body a bit more hoping he gets the hint...")
		
		saynn("...")
		
		saynn("...")
		
		addButton("Nap", "Zzz...", "WakeUpScene")
		
	if(state == "WakeUpScene"):
		playAnimation(StageScene.Sleeping, "sleep", {pc="alexrynard", npc="pc", bodyState={underwear=true}, npcBodyState={underwear=true}})
		saynn("...?")
		
		saynn("When you wake back up, Alex's arms are still lazily draped over you... looks like he followed you into your nap...")
		
		saynn("Letting your eyes focus, you eventually are able to check the clock on the wall. It's been about 4 hours...")
		
		saynn("Well... Shit... You're already up now... but Alex is warm and comfy... you don't wanna get up...")
		
		saynn("You try to shut your eyes and go back to sleep but all the little annoying realities of life weigh on your mind. Like the complete lack of a blanket, and the awkwardness of your prisoner collar pressing into your neck like this...")
		
		saynn("...")
		
		saynn("Damnit.")
		
		saynn("You regretfully pull yourself out of the lazy grasp of the slumbering Alex. Alex, in turn, just rolls over in his sleep on the couch once his vigilant cuddle duty is over.")
		
		saynn("Giving yourself a good stretch, you head back to Alex's workshop area...")
		
		addButton("Continue", "That was nice.", "endcuddle")
		
	
	if(state == "AlexSnackStart"):
		saynn("[say=pc]Would you happen to have anything to eat? I'm sick of the grey slop in the canteen.[/say]")
		
		saynn("[say=alexrynard]Only stuff from the vending machine... Wait, why?[/say]")
		
		saynn("[say=pc]Kids want better food...[/say]")
		
		if(!GM.pc.isVisiblyPregnant()):
			saynn("Alex drags his eyes over your body.")
			saynn("[say=alexrynard]You're not even pregnant.[/say]")
			saynn("[say=pc]...Please?[/say]")
			saynn("With a sigh Alex just opens the door wordlessly and motions you to follow.")
			saynn("He is getting too used to you...")
			saynn("You didn't even have to make something up...")
		else:
			saynn("[say=alexrynard]I think I can do that. Come on.[/say]")
			saynn("The door to the familiar break room opens and you and follow with a smile just a bit too big for something so simple.")
			
		addButton("Continue", "Finally, some good food.", "AlexSnacks")
	
	if(state == "AlexSnacks"):
		RNG.pick([saynn("1"),
		saynn("2"), 
		saynn("3")
		
		])
		
		addButton("Continue", "That was good.", "endthescene")
	
	
	
func _react(_action: String, _args):
	
	if(_action == "endthescene"):
		endScene()
#		processTime(60*5)
		return

	if(_action == "endcuddle"):
		processTime(60*60*4)
		endScene()
		return
		
	setState(_action)

func getDevCommentary():
	return "Hello fuckers. This isn't my first devlog but its the one most people are gonna see. Unfortunately I have forgotten most of my past rantings so you're gonna have to find the other dev commentary for them. So instead I will just leave it at 1. Alex is good boy and needs more love and 2. I am aware most of the content he isnt done. Give it time. While you wait Join the BDCC discord and ping me to tell me how much my writing sucks. Or is great. I mean you've probably seen my mod descriptions I couldn't get more insane. BDCC Skibidi Toilet Species Mod confirmed 37th of Febtoberuary."
