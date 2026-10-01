extends SceneBase

func _init():
	sceneID = "DomM4s3Tavi"

func _run():
	if(state == ""):
		addCharacter("tavi")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="tavi", pc="avy"})
		saynn("During your search, you suddenly ran into someone.. someone who isn't a nurse or a doctor.")

		saynn("A tall high-sec inmate gets in your way. Purple fur.. with glowy green accents everywhere. She is staying in the shadow.. but the soft green light is betraying her.")

		saynn("You are pretty sure you saw her before.")

		saynn("[say=avy]Hey, you. What the fuck are you doing here?[/say]")

		saynn("She doesn't seem.. hostile. But something about her is making you nervous. She steps out of her hiding place and observes you, keeping distance.")

		saynn("[say=tavi]I can ask the same question about you two. Me? I'm just looking for something.[/say]")

		saynn("[say=avy]And what would that be?[/say]")

		saynn("A little sly smile spreads across her lips.")

		saynn("[say=tavi]You're a curious one, aren't you. Only my friends get to know. Do you wanna be friends, perhaps?[/say]")

		saynn("[say=avy]Only if you choke on my dick first.[/say]")

		saynn("The purple feline tilts her head slightly, her paws go behind her back, her back arching a bit, pushing her chest forward.")

		saynn("[say=tavi]I see how it is. If we can't be friends, perhaps at least we can avoid being the enemies?[/say]")

		saynn("[say=avy]I still don't know what the fuck are you doing here, creepy cat.[/say]")

		saynn("You can keep asking that question forever.. might as well see if she knows something.")

		saynn("[say=pc]We're looking for a snow leopard named Kait, a lilac.[/say]")

		saynn("[say=tavi]I see. If Quinn got her paws on her, then she is probably in the mental ward.[/say]")

		saynn("That's something.")

		saynn("[say=pc]Okay. Now tell us what you are looking for.[/say]")

		saynn("[say=tavi]That's a secret, I'm afraid. Don't worry, I had nothing to do with your friend's disappearance.[/say]")

		saynn("Avy looks at you and whispers.")

		saynn("[say=avy]..something makes me feel weird about her. We could beat this bitch up, you and me..[/say]")

		saynn("[say=tavi]I think it's time for us to go our separate ways. Before we get spotted.[/say]")

		addButton("Leave", "Just let her be", "let_tavi_be")
		addButton("Escalate", "Taunt the purple cat to see if she knows something", "try_fight_tavi")
	if(state == "let_tavi_be"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You decide to not block the path for her.")

		saynn("[say=pc]We gotta find someone, you gotta find something else, let's not slow each other down.[/say]")

		saynn("[say=avy]Really?[/say]")

		saynn("The feline walks past you, offering you a kind smile. You hold the angry Avy away from doing anything silly.")

		saynn("[say=tavi]You know.. If things were different, maybe you'd be helping me~.[/say]")

		saynn("[say=avy]Helping you? You're the most weird ass cat I've ever seen.[/say]")

		saynn("The feline stops to lean closer to the foxy.")

		saynn("[say=tavi]We're all a little weird, aren't we?[/say]")

		saynn("[say=avy]I'm very much normal.[/say]")

		saynn("[say=tavi]And yet, you're here, in this prison.[/say]")

		saynn("[say=avy]Oh, fuck you.[/say]")

		saynn("The feline just chuckles.. and then runs away.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "try_fight_tavi"):
		removeCharacter("tavi")
		playAnimation(StageScene.Solo, "hurt")
		saynn("You keep blocking the path.")

		saynn("[say=pc]You're not telling the whole truth I feel like.[/say]")

		saynn("You and Avy start walking towards her, slowly.")

		saynn("[say=avy]Tell us everything, cat.[/say]")

		saynn("The feline sighs.")

		saynn("[say=tavi]I really have no time for this.[/say]")

		saynn("Suddenly, the purple cat throws something in front of her.. which causes an instant reaction in the form of a small bright explosion.. followed by a dark smoke cloud.")

		saynn("When the smoke goes away, the cat is nowhere to be seen.")

		saynn("[say=avy]Bitch![/say]")

		saynn("[say=pc]Whatever. We might run into her again sometime. Right now we gotta find Kait.[/say]")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
