extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RahiTalkScene"

func _reactInit():
	if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["rahi"])):
		endScene()
		return

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		
	if(state == ""):
		if(!GM.main.getModuleFlag("RahiModule", "Rahi_Introduced")):
			GM.main.setModuleFlag("RahiModule", "Rahi_Introduced", true)
			
			saynn("While wandering around the cellblock you stumble upon a feline, a new face. She is sitting on a metal bench, legs tucked under her with her fluffy tail on top that she idly strokes from time to time. Her orange uniform and collar show that she is from a general block, she doesn’t look very intimidating.")

			saynn("You decide to approach her and get her attention by waving, she immediately shifts to the side, her tail straightens.")

			saynn("[say=rahi]She is just resting here. You need her to get off the bench?[/say]")

			saynn("You raise a brow at her manner of speech and shake your head a second later.")

			saynn("[say=pc]You don’t have to, I’m just looking around.[/say]")

			saynn("She seems to calm down after your words, her paws return to gently stroking her tail.")

			saynn("[say=rahi]You must be one of the new ones, she has never seen you. Meow..[/say]")

			saynn("The random cat noise does entertain you a bit. Every time you try to look into her eyes she quickly avoids it.")
		else:
			saynn("You approach the friendly-looking feline that sits on the bench and idles, like she always does. She offers you a little smile and gives you room to sit nearby in case you want to.")

			if(getCharacter("rahi").isHeavilyPregnant()):
				saynn("[say=rahi]"+RNG.pick([
					"Her belly has become so big..",
					"Her breasts.. They keep itching..",
					"Can you.. Maybe.. no..",
					"Hi.. Does she look fat..",
					"She can’t stop making milk..",
					"She can feel it.. Not too long left..",
				])+"[/say]")
			elif(getCharacter("rahi").isVisiblyPregnant()):
				saynn("[say=rahi]"+RNG.pick([
					"Her breasts are getting bigger..",
					"Pregnant.. kitty.. Meow..",
					"Look at her belly.. It’s ours..",
					"Meow.. You want kittens?.. She does..",
					"You think she would be a good mommy?..",
				])+"[/say]")
			else:
				saynn("[say=rahi]"+RNG.pick([
					"It’s a quiet day today, isn’t it? It was for her..",
					"Hey there.. meow..",
					"Kitty is happy to see you around.",
					"Meow meow meow..",
					"Do you think they can give her some tuna?",
				])+"[/say]")

		if(getFlag("RahiModule.Rahi_ChillHappened") && !getFlag("RahiModule.rahi1ElizaSceneHappened")):
			saynn("(To continue Rahi's content find her in the showers and then sleep)")

		addButton("Talk", "Show a list of topics to talk about", "talk")
		addButton("Appearance", "Take a closer look at the catgirl", "appearance")
		
		if(RahiModule.trustsPC()):
			addButtonWithChecks("Embrace kitty", "Be real close and intimate with kitty", "embrace", [], [ButtonChecks.NotArmsRestrained, ButtonChecks.NotHandsBlocked])
		else:
			addDisabledButton("Embrace kitty", "She doesn't trust you enough")
		
		if(!getModuleFlag("RahiModule", "Rahi_GaveApple")):
			if(GM.pc.getInventory().hasItemID("appleitem")):
				addButton("Offer apple", "Maybe she would like one", "giveapple")
			else:
				addDisabledButton("Offer apple", "You need an apple for this")
		addButton("Leave", "Do something else", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["rahi"])
		
	if(state == "appearance"):
		saynn("You see a 1.6m feline girl with a ponytail and a pair of cute cat ears on top of her head. Brown-colored fur covers her body with her belly and maw being of a slightly lighter color. She has long white whiskers and blue eyes that she uses to mostly look down. Behind her is a feline tail that seems to have a mind of its own. Her uniform spots an orange trim and has a number P-12406 attached to it. Wrists and ankles are weighted down by the bulky cuffs and her neck has an inmate collar, the same one that you are wearing. She doesn’t seem particularly strong, the curves of her body are feminine and her body proportions seem of a pretty average housecat, not too slim and not too thick.")

		if(getCharacter("rahi").isVisiblyPregnant()):
			saynn("The only thing that’s not slim is her belly, it looks quite huge for such a modest kitty. With so much extra weight kitty has to move slowly, her feline agility can’t shine anymore.")
			
			saynn("Her breasts look obviously bigger than they usually are, at least a D-cup for sure. Nipples have a darker tone to them. You can guess that she is lactating.")
		else:
			saynn("Behind her uniform you can guess her breasts size to be somewhere around C-cup, each one with a perky pink nipple, nothing too spectacular but still nice to have.")

		saynn("You can guess that she has a cute pink pussy slit hidden by the shorts with a little nicely-trimmed bush above.")
		
		addButton("Back", "Go back", "")
		
	if(state == "talk"):
		saynn("You take a seat nearby and try to relax, though the metal bench isn’t exactly best for that. The feline’s tail begins to wag nervously but she strokes and calms it down.")

		saynn("[say=rahi]You wanna talk about something? Meow..[/say]")
		
		addButton("Who are you", "Ask the feline’s name", "who_are_you")
		if(!GM.main.getModuleFlag("RahiModule", "Rahi_AskedName")):
			addDisabledButton("Speech", "She doesn't know you yet")
			addDisabledButton("Why are you here", "She doesn't know you yet")
			addDisabledButton("What is this place", "She doesn't know you yet")
		else:
			addButton("Speech", "Ask why she talks so strangely", "speech")
			addButton("Why are you here", "Ask how she got imprisoned", "why_are_you_here")
			addButton("What is this place", "Ask what this platform is for", "what_is_this_place")
		addButton("Back", "Go back", "")


	if(state == "who_are_you"):
		saynn("[say=pc]Soo.. What’s your name?[/say]")

		saynn("The question makes the feline think for a few seconds.")

		saynn("[say=rahi]It’s.. inmate number one two four o’ six..[/say]")

		saynn("You give the girl a slightly confused look, she reacts by avoiding it. The awkward silence is then broken by her.")

		saynn("[say=rahi]Inmates are stripped of their names.. They are replaced with a number. She got used to the number..[/say]")

		saynn("[say=pc]And what if I don’t like the number?[/say]")

		saynn("The feline shrugs and then points at the middle of the platform where all the pillories and chain posts are.")

		saynn("[say=rahi]You get punished.. meow..[/say]")

		saynn("[say=pc]But.. uh. What about when talking with other inmates. You don’t have to use the number with them[/say]")

		saynn("[say=rahi]Well.. They usually call her kitty or kitten. She likes kitty. Meow..[/say]")

		saynn("Kitty offers you a shy smile before directing attention back to her tail again. And you’re left with a strange feeling in your head.")

		addButton("Continue", "Continue talking", "talk")

	if(state == "speech"):
		saynn("[say=pc]Why do you talk like that, kitty?[/say]")

		saynn("She looks at you and tilts her head a bit, a quiet meow escapes from her maw.")

		saynn("[say=rahi]Like what?..[/say]")

		saynn("[say=pc]You know, in third person. Haven’t seen other felines do that.[/say]")

		saynn("[say=rahi]Ohhh.. Kitty doesn’t know, it just happens.. She is used to it.[/say]")

		saynn("[say=pc]Was it always like that?[/say]")

		saynn("Kitty shrugs at your question and rubs her nose for a bit.")

		saynn("[say=rahi]A long time.. meow. Since before she ended up here. Kitty has been here for a long time already.. she kinda lost track of it..[/say]")

		saynn("You nod and try to process the information. Is that some kind of mental disorder? You decide that it would be too rude to ask.")

		addButton("Continue", "Continue talking", "talk")

	if(state == "why_are_you_here"):
		saynn("[say=pc]How did you end up here? This prison seems to be full of really bad convicts and you don’t seem like a bad person, did someone set you up?[/say]")

		saynn("You can notice kitty’s face expression change to a more neutral one, you can see a subtle frown.")

		saynn("[say=rahi]People end up here for different reasons.. Kitty.. got caught when trying to rob a person..[/say]")

		saynn("The kitty focuses on a single floor tile, her hands just hold her tail.")

		saynn("[say=rahi]The guy looked rich.. Too rich.. Turns out rich guys also like having guns..[/say]")

		saynn("She tugs on her collar and raises her chin up to show you a badly healed burn mark with fur missing around on her neck.")

		addButton("Continue", "Continue talking", "talk")

	if(state == "what_is_this_place"):
		saynn("[say=pc]What is this platform for?[/say]")

		saynn("Kitty fixes her loose hair strand and rubs her nose. You both sit on a bench that’s on a raised platform. In the middle of it are quite a few bdsm contraptions.")

		saynn("[say=rahi]Punishments. If you misbehave too much you will end up there.. It’s the main hall so a lot of inmates and staff will see you.. Everyone is free to do as they want with inmates stuck in there..[/say]")

		saynn("[say=pc]Were you stuck in one?[/say]")

		saynn("[say=rahi]A few times..[/say]")

		saynn("You nod understandable.")

		saynn("[say=rahi]They don’t require staff access to use so even inmates can put you into one.. Or get you out.. But that doesn’t happen very often.. you know.. Meow..[/say]")

		addButton("Continue", "Continue talking", "talk")

	if(state == "giveapple"):
		saynn("You pull out a fresh apple and offer it to the feline. Rahi gives you a confused look, her arms rest on her calm tail.")

		saynn("[say=rahi]That’s a nice apple..[/say]")

		saynn("[say=pc]Take it, it’s for you.[/say]")

		saynn("The kitten mewls, surprised. She carefully grabs the apple from you and sniffs it.")

		saynn("[say=pc]It’s not poisoned, don’t worry, silly.[/say]")

		saynn("[say=rahi]Thank you! Kitty knows.. She usually just eats in the canteen.[/say]")

		saynn("She takes a bite, her eyes show happiness.")

		saynn("[say=pc]Well, at least this is something different. Something actually edible.[/say]")

		saynn("[say=rahi]Yes, it’s very good! Thank you again![/say]")

		saynn("[say=pc]Don’t mention it.[/say]")

		saynn("She smiles and shifts closer to you, her tail playfully prods your leg. She keeps leaving fang-marks on the apple.")

		saynn("[say=rahi]This reminds her of her past..[/say]")

		saynn("[say=pc]Life before prison?[/say]")

		saynn("[say=rahi]No.. That kind of past was so long ago it feels like another life.. Meow..[/say]")

		saynn("[say=rahi]She had a few owners.. here..[/say]")

		saynn("[say=pc]Is that allowed?[/say]")

		saynn("[say=rahi]It’s not disallowed.. If you’re stronger than someone then you can do whatever you want with them.. That’s kinda how life works here..[/say]")

		saynn("You put your hand on kitty’s far shoulder, she snugs up close to you. You can hear her faint purring as she crunches on the apple.")

		saynn("[say=pc]Shouldn’t staff protect the weaker ones.[/say]")

		saynn("[say=rahi]Staff are doing it too.. But kitty liked it.. Having someone you belong to makes life easier.. Less problems to solve, meow. Free food and bed.. as long as you do what they want..[/say]")

		saynn("[say=pc]I see how it is.[/say]")

		saynn("[say=rahi]Yeah..[/say]")

		saynn("Kitty rests on your chest, her gaze is directed up at the very high ceiling. You both stay silent for a few minutes. Seems like this kitty has a long history of being owned.")

		saynn("[say=pc]Thanks for sharing, kitty.[/say]")

		saynn("The feline mewls and goes back to her normal sitting position, letting you stand up if you want.")

		saynn("[say=rahi]No problem.. Thanks for the apple..[/say]")
		
		addButton("Continue", "Life is tough", "")

func _react(_action: String, _args):
	if(_action == "giveapple"):
		GM.main.setModuleFlag("RahiModule", "Rahi_GaveApple", true)
		GM.pc.getInventory().removeXOfOrDestroy("appleitem", 1)
	
	if(_action == "who_are_you"):
		GM.main.setModuleFlag("RahiModule", "Rahi_AskedName", true)
	
	if(_action == "embrace"):
		runScene("RahiEmbraceScene")
		endScene()
		return
	
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func getDevCommentary():
	return "This character's name is Rahi.. And the developer's name is Rahi.. hmmmm.. your first thought is probably.. damn self-inserts!\n\nYeah, Rahi is my fursona. Is Rahi -me- though? Not really, we share a loooot of differences. I don't talk in third person x3. Most of the time.. But that's not why people are usually upset at self-inserts.\n\nPeople usually don't like them because self-inserts tend to be the idealized copies of ourselves without any flaws or problems. Nothing ever bad happens to self-inserts, every challenge is easy for them, stuff like that.\n\nDid I deliberately tried to go against that? Nah. I just wanted to portray one of the variants of Rahi that could potentially exist.. This Rahi does have bad things happen to her but not because I wanted to prove that she isn't a self-insert. She is x3\n\nRahi does have a 'built-in' flaw that is the way she speaks. I will be honest, I made her do that because tajarans in space station 13 had to talk like that and Rahi is originally from ss13 x3. I tried to explain why she does that in her dedicated content though, hopefully its logical enough ^^\n\nI hope you get my idea. Rahi is just a shy kitty. But there are no just 'shy kitties' in one of the most secure prisons in the galaxy."

func hasDevCommentary():
	return true
