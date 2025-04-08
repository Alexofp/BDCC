extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AlexPregTalkSceneAPE"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		
		saynn("What do you want to tell Alex?")
		
		if(GM.pc.isVisiblyPregnant() && (getModuleFlag("AcePregExpac", "Alex_ToldIsFather", 1))):
			if(GM.pc.isPregnantFrom("alexrynard")):
				addButton("Gonna Be Father", "Tell Alex he is gonna be a father", "alexfatherreveal")
			else:
				addDisabledButton("Gonna Be Father", "You aren't pregnant from him")
#less clutter on the button screen
		
		if(GM.pc.isVisiblyPregnant() && (!getModuleFlag("AcePregExpac", "Alex_ToldIsFather", 1))):
			addButton("Cuddle", "Get some emotional support from Alex", "alexpregcuddle")
		elif(!GM.pc.isVisiblyPregnant()):
			addDisabledButton("Cuddle", "You aren't pregnant")
		
		if((!getModuleFlag("AcePregExpac", "Alex_ToldIsFather", 1))):
			addButton("Snacks?", "Alex is staff, surely he has something you can eat. However Small it may be.", "AlexSnackStart")
		
		if(GM.pc.isLactating() && (!getModuleFlag("AcePregExpac", "Alex_ToldIsFather", 0)) && !GM.pc.hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			addButton("Milk", "See if Alex can help milk your chest.", "AlexPCMilking")
		elif(GM.pc.hasEffect(StatusEffect.SoreNipplesAfterMilking)) && (!getModuleFlag("AcePregExpac", "Alex_ToldIsFather", 1)):
			addDisabledButton("Milk", "Your nipples are sore, give them some rest.")
		elif(!GM.pc.isLactating()) && (!getModuleFlag("AcePregExpac", "Alex_ToldIsFather", 1)):
			addDisabledButton("Milk", "You can't be milked")
#
#		if(GM.pc.isReadyToGiveBirth() && (!getModuleFlag("AcePregExpac", "Alex_ToldIsFather", 1))):
#			addButton("Birth", "Take Alex to help you give birth", "StartBirthAlex")
#		elif(!GM.pc.isReadyToGiveBirth() && (getModuleFlag("AcePregExpac", "Alex_ToldIsFather", 1))):
#			addDisabledButton("Birth", "You're not ready to give birth.")
#		else:
#			addDisabledButton("mod broke", "scripting broke")
#		addButton("Leave", "You didn't have anything", "endthescene")

		addButton("Nevermind", "Back to the main talk menu", "returntonormal")
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
			saynn("[say=alexrynard]I think I can do something like that. Come on.[/say]")
			saynn("The door to the familiar break room opens and you and follow with a smile just a bit too big for something so simple.")
			
		addButton("Continue", "Finally, some good fucking food.", "AlexSnacks")
	
	if(state == "AlexSnacks"):
		aimCameraAndSetLocName("eng_breakroom")
		playAnimation(StageScene.Duo, "sit", {pc="pc", npc="alexrynard",})
		saynn("It's the familar breakroom, again, you find a seat at one of the tables in a kitchen area while Alex walks over to snacks vending machine tucked into the corner.")
		
		saynn("[say=alexrynard]Anything specific you want?[/say]")
		
		saynn("Strange, since you've been in this isolated and glorifed tin can, you've wanted actual food instead of grey slime. But now that you are here, you don't know. There's just so many options...")
		
		saynn("[say=pc]Surprise me.[/say]")
		
		saynn("Alex nods and picks something for you, swiping his ID card against the machine.")
		
		saynn("[say=pc]Doesn't that machine take actual money and not prison credits?[/say]")
		
		saynn("[say=alexrynard]Oh it does, but we've hacked this thing ages ago. Now it just takes an ID.[/say]")
		
		saynn("Snack now in hand he walks over to you and gives it to you.")
		
		saynn("It's kinda sad how ecstatic you are at simple snack... Whatever. Free food.")
		
		addButton("Continue", "See what you got", "snacks_random")
		
	if(state == "snacks_random"):
		if(RNG.chance(25)):
			saynn("It's a candy bar. You don't believe it when you see it but it's true. It's there in front of you.")
			
			saynn("You look up at Alex if this is some kind of trick, but an awkward stare back confirms he is in fact giving it to you.")
			
			saynn("Taking the candy bar you start opening it without really caring for what type of candy it actually is. At this point in your life, you'll be fine if there some extra nuts in it.")
			
			saynn("To your status as a prisoner, the taste is divine. You try to take your time to savor it but your body moves on it's own to work through too fast for your liking.")
			
			saynn("Before you know it, it's gone. Despite the absolutely crushing sadness you rest your head on the table, smile beaming as the taste of sugar is such a rare luxury here.")
			
			saynn("[say=alexrynard]I see you enjoyed yourself.[/say]")
			
			saynn("[say=pc]That was the best thing I had all week.[/say]")
			
			saynn("Alex reaches over and pats your back a few times.")
			
			saynn("[say=alexrynard]Well, I gotta head back. You know the exit and where to find me.[/say]")
			
			saynn("The fox heads back out into the hallway while you kinda just lean back in your chair"+str(" holding your pregnant belly" if GM.pc.isVisiblyPregnant() else "")+" with an admittedly dumb smile on your face, the phantom taste of sugar still on your tongue.")
			
			saynn("You gotta do something good for that fox when you get the chance...")
			
		#I had an idea and then I lost it so fuck it this one sucks i guess
		elif(RNG.chance(50)):
			saynn("It's a bag of chips, not a brand you have seen before but you're sure its the same as all the others.")
			
			saynn("Alex sits beside you as you open the bag and take a bite.")
			
			saynn("Kinda tasty actually, you start on the next three as Alex sips a water.")
			
			saynn("[say=alexrynard]I take it you like it?[/say]")
			
			saynn("[say=pc]More than you know.[/say]")
			
			saynn("The fox scoots up against you while you work through the bag.")
			
			saynn("[say=alexrynard]We gotta have another movie night like this.[/say]")
			
			saynn("[say=pc]Agreed.[/say]")
			
			saynn("You finish off the bag of chips cuddled up against Alex.")
			
			saynn("Alex eventually heads back to his workshop, and you decide not to follow.")
			
		else:
			saynn("It's a simple nutrient bar. The kind someone would actually buy rather than the mass-produced bricks kept in a dusty box on ships if they run out of food.") 
			
			saynn("Fuck it you'll take it.")
			
			saynn("The fox sits beside you as you work at the packaging and take a bite.")
			
			saynn("The taste is bland but still miles better than the paste in the cafeteria. It's enough to stir memories from before your detainment")
			
			saynn("Most of it is the slow and mundane periods when you weren't doing anything.")
			
			saynn("They aren't much, but you were [b]free[/b].")
			
			saynn("So lost in your thoughts that you finish the little snack bar without realizing.")
			
			saynn("You feel Alex's arm on your back.")
			
			saynn("[say=alexrynard]You doing alright? I didnt think you'd space out from an energy bar...[/say]")
			
			saynn("[say=pc]Yeah... Just the things I miss being free. I guess.[/say]")
			
			saynn("[say=alexrynard]Simple pleasures... Anyway, I gotta get back to work. I'll leave you to reminisce. You know where the exit is.[/say]")
			
			saynn("The fox does as he says and steps through the open door back out to his workshop.")
		
		addButton("Continue", "That was good.", "snacks_ending")
	
#debating adding a partial stamina recharge like eating in the cafeteria
#I cant figure it out without the player just repeating it infinitely for free stamina
#Im a lazy programmer if I even program at all
	if(state == "snacks_ending"):
		removeCharacter("alexrynard")
		saynn("You are left to sit alone in the breakroom for a minute to collect yourself.")
		
		saynn("When you're ready you stand up from your place at breakroom table and stretch.")
		
		if(GM.pc.isHeavilyPregnant()):
			saynn("Something shifts inside your pregnant belly. And continues to move around as you work through stretching you back.")
			
			saynn("Holding your hands to your stomach you try to get your gravid self into a comfortable position as everything settles back down.")
			
			saynn("[say=pc]At least you enjoyed the snack...[/say]")
			
			saynn("Right then, back to the daily grind.")
		
		elif(GM.pc.isVisiblyPregnant()):
			saynn("Your hands drift to your rounded out midsection, adjusting it to a more comfortable position.")
			
			saynn("It looks like it didn't do much but you feel better at least")
			
			saynn("Right then, back to the daily grind.")
		
		else:
			saynn("A good back stretch sets your mind back to reality")
			
			saynn("Right then, back to the daily grind.")
	
		addButton("Continue", "Back to it.", "leavebreakroom")
	
	
	if(state == "AlexPCMilking"):
		if(getModuleFlag("AcePregExpac", "Alex_TimesMilkingPlayer", "0")):
			saynn("This one is gonna be tricky, Alex doesn't seem to like lactation all too much.")
			
			saynn("You're unsure how to approach him about this...")
			
			saynn("[say=pc]Hey Alex, do you think you could try and help me out?[/say]")
			
			saynn("The fox barely looks up from whatever he is working on.")
			
			saynn("[say=alexrynard]Uh... Sure what is it?[/say]")
			
			if(GM.pc.isVisiblyPregnant()):
				saynn("[say=pc]I've started lactating from this pregnancy, and my chest is rather sore from it. Do you think you could help me with it?[/say]")
			else:
				saynn("[say=pc]I've started lactating and I could use some help dealing with it.[/say]")
			
			saynn("This question catches the fox off guard, a screwdiver slips off its screw as the fox fumbles and drops it.")
			
			saynn("[say=alexrynard]OH, I uh...[/say]")
			
			saynn("Alex makes sure nothing broke and then turns to face you.")
			
			saynn("[say=alexrynard]Look, You'd be better off asking Eliza to do something like that for you.[/say]")
			
			saynn("[say=alexrynard]I'm not into lactation, so I'd have no idea what to do.[/say]")
			
			saynn("The look he gives tells you are not going to convince him, at least not yet.")
			
			addMessage("This content isn't done. Sorry about that -Ace")
			
			increaseModuleFlag("AcePregExpac", "Alex_TimesMilkingPlayer", 1)
			
			addButton("Aw man.", "Time to go", "endthescene")
#
# ACEPREGEXPAC - I want a slow build for this scene, but dont have the time to code it all down before I release the patch
# kinda like how you have to bother Alex to build a relationship with him, you have to bother Alex to get him to try lactation stuff
# once the flag hits 20 or something, you get the tiddy suck scene.
#
#		addButton("Hands", "have Alex use his hands to milk you", "AlexHandMilk")
#
#		if(getModuleFlag("AcePregExpac", "Alex_FirstTimeMilkingPlayer", true)):
#			addButton("Mouth", "have Alex suck your tits", "AlexTitSuck")
#		else:
#			addDisabledButton("Mouth", "Alex isnt sure about this, maybe do something else first.")
#		addButtonWithChecks("Pumps", "Use a breast pump.", "AlexPumpMilk", [], [ButtonChecks.HasBreastPump])

#	if(state == "AlexHandMilk"):
#		saynn("placeholder")
#
#		addButton("Debug","endthescene")
func _react(_action: String, _args):
	
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "returntonormal"):
		endScene()
		runScene("AlexRynardTalkScene")
		return

	if(_action == "endcuddle"):
		processTime(60*60*4)
		endScene()
		return
		
	if(_action == "leavebreakroom"):
		processTime(60*30)
		GM.pc.setLocation("eng_bay_nearbreakroom")
		endScene()
		return
		
	setState(_action)

func getDevCommentary():
	return "Hello fuckers. This isn't my first devlog but its the one most people are gonna see. Unfortunately I have forgotten most of my past rantings so you're gonna have to find the other dev commentary for them. So instead I will just leave it at 1. Alex is good boy and needs more love and 2. I am aware most of the content he isnt done. Give it time. While you wait Join the BDCC discord and ping me to tell me how much my writing sucks. Or is great. I mean you've probably seen my mod descriptions I couldn't get more insane. BDCC Skibidi Toilet Species Mod confirmed 37th of Febtoberuary."
