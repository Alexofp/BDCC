extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "DegradeTaviScene"


func _run():
	if(state == ""):
		addCharacter("tavi")
		
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="allfours"})
		
		saynn("You pin the rebellious feline to the floor face-down and hold her by the collar. She hisses at you but lays still, seems like your lessons taught her at least something.")

		saynn("[say=tavi]Can you get off? I will do whatever the fuck you want, just let me get up[/say]")

		saynn("You force her face into the cold floor harder and chuckle.")

		saynn("[say=pc]You won’t need to stand[/say]")

		saynn("Tavi tries to struggle and manages to free her arm but you shove a knee into her back. The pain forces the grunt out of her and makes her give up.")

		saynn("[say=tavi]I will shatter that kneecap, gh-h[/say]")

		saynn("[say=pc]I think I will make you into a good puppy. And pups don’t talk, as you are aware. So shut up. Each word will make it more painful for you. And more fun for me[/say]")

		saynn("[say=tavi]Oh yeah? Think you can handle me?[/say]")

		saynn("You grab her arm and wrench it behind her back, applying extra pressure to make it sting. Tavi grunts and growls at you but you keep wrenching it, causing more and more discomfort until Tavi finally gives up. Her tail wags a lot, she is not happy about this.")

		saynn("[say=tavi]..Fine-fine. Fucking stop. I still need my arm[/say]")

		saynn("You let go of the arm and give her ass a firm slap, causing her to yelp.")

		saynn("[say=pc]Pups don’t talk, silly. Mhm?[/say]")

		saynn("A few seconds pass.")

		saynn("[say=tavi]..mhm..[/say]")

		saynn("You stop pinning her and stand up. Tavi tries to do the same but you stop her with your leg when she was on all fours. She growls and shows you her capped-off fangs but doesn’t drop a word.")

		saynn("[say=pc]Stay like that. On all fours. I won’t stop until I see a good puppy.[/say]")

		saynn("Tavi glares up at you. You take your foot off of her and watch her. Tavi considers her options and decides to stay still, her feline tail wags slowly in the air, with snake-like movement. You crouch in front of her and watch her angry eyes.")

		saynn("[say=pc]Sit[/say]")

		saynn("She frowns but obeys, lowering her butt and sitting on her ankles. She tilts her head down for a second, feeling humiliated.")

		saynn("[say=pc]Up[/say]")

		saynn("Tavi takes her time but she stands on all fours again. You reach your hands out and give the feline-pup a few good headpats, your digits reach behind her ears and scratch there. Tavi’s glare softens as the soft blush appears on her face.")

		saynn("[say=pc]Voice[/say]")

		saynn("[say=tavi]What?[/say]")

		saynn("Your digits stop where they were, near her ears, you hold her head still as you give her a strict look.")

		saynn("[say=pc]Bark[/say]")

		saynn("[say=tavi]I’m not gonna bark, fuck off[/say]")

		saynn("Suddenly you grab her by the hair and pull her head down. She grumbles as she is forced to lay on the floor.")

		saynn("[say=pc]You’re gonna bark like a good pup or I’m gonna break you. And then you’re gonna bark[/say]")

		saynn("You don’t hear an answer from her. But you also don’t feel her resistance. You let go of her hair and she stays where she was.")

		saynn("[say=pc]Up.[/say]")

		saynn("The feline gets up to all fours again, this time without hesitating. You give her a strict look. Fear and strictness seem to work great against this red.")

		saynn("[say=pc]Voice[/say]")

		saynn("Tavi stays quiet for about five seconds and then lets out a quiet bark. You give her a few scritches under the chin.")

		saynn("[say=pc]Louder[/say]")

		saynn("[say=tavi]Woof..[/say]")

		saynn("The unwilling puppy tilts her head down and leans into the scritches. You stroke her back, she doesn’t resist.")

		saynn("[say=pc]Good girl. Show me a happy pup.[/say]")

		saynn("Tavi subtly wiggles her butt for you. You stop crouching and watch the girl. A tall red feline that was quite hostile a few minutes ago is now swaying her hips for you and stays on all fours, pretending to be a puppy. You take a few steps back.")

		saynn("[say=pc]Come.[/say]")

		saynn("Puppy tilts her head down and starts crawling towards you, her tail is constantly in the air. She approaches you and stops, her head looking up, face showing a mix of anger and embarrassment.")

		saynn("You lean down and give her belly rubs, your palm travels along her curves back and forth and jumps to land a spank on her ass, making the pup squeak.")

		saynn("[say=pc]Next time don’t be so stubborn and I won’t have to hurt you[/say]")

		saynn("[say=tavi]woof..[/say]")

		saynn("[say=pc]Now stay, pup[/say]")

		saynn("You smile and headpat the pup a few times before leaving her alone. Tavi tilts her head, probably wondering when she is allowed to stand up.")

		addButton("Leave", "What a cute puppy", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		processTime(30*5)
		
		GM.main.increaseModuleFlag("TaviModule", "Tavi_Submissiveness")
		return

	setState(_action)

