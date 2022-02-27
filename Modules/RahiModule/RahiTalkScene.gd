extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RahiTalkScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		
	if(state == ""):
		if(!GM.main.getFlag(RahiModule.Rahi_Introduced)):
			GM.main.setFlag(RahiModule.Rahi_Introduced, true)
			
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

			saynn("[say=rahi]It’s a quiet day today, isn’t it? It was for her..[/say]")

		addButton("Talk", "Show a list of topics to talk about", "talk")
		addButton("Appearance", "Take a closer look at the catgirl", "appearance")
		addDisabledButton("Sex", "Not implemeted yet")
		addDisabledButton("Offer apple", "Not done :(")
		addButton("Leave", "Do something else", "endthescene")
		
	if(state == "appearance"):
		saynn("You see a 1.6m feline girl with a ponytail and a pair of cute cat ears on top of her head. Brown-colored fur covers her body with her belly and maw being of a slightly lighter color. She has long white whiskers and blue eyes that she uses to mostly look down. Behind her is a feline tail that seems to have a mind of its own. Her uniform spots an orange trim and has a number P-12406 attached to it. Wrists and ankles are weighted down by the bulky cuffs and her neck has an inmate collar, the same one that you are wearing. She doesn’t seem particularly strong, the curves of her body are feminine and her body proportions seem of a pretty average housecat, not too slim and not too thick.")

		saynn("Behind her uniform you can guess her breasts size to be somewhere around C-cup, each one with a perky pink nipple, nothing too spectacular but still nice to have.")

		saynn("You can guess that she has a cute pink pussy slit hidden by the shorts with a little nicely-trimmed bush above.")
		
		addButton("Back", "Go back", "")
		
	if(state == "talk"):
		saynn("You take a seat nearby and try to relax, though the metal bench isn’t exactly best for that. Feline’s tail begins to wag nervously but she strokes and calms it down.")

		saynn("[say=rahi]You wanna talk about something? Meow..[/say]")
		
		addButton("Who are you", "Ask the feline’s name", "who_are_you")
		if(!GM.main.getFlag(RahiModule.Rahi_AskedName)):
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

func _react(_action: String, _args):
	if(_action == "who_are_you"):
		GM.main.setFlag(RahiModule.Rahi_AskedName, true)
	
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
