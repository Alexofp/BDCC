extends SceneBase

func _init():
	sceneID = "Eliza4MomScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("[say=eliza]Really?![/say]")

		saynn("Your current journey is interrupted by Quinn's loud voice. Something is happening here, in the lobby..")

		addButton("Take a look", "See what's up", "mom_intro")
	if(state == "mom_intro"):
		addCharacter("elizaMom")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="eliza", npc="elizaMom"})
		aimCameraAndSetLocName("med_lobbymain")
		saynn("Eliza is standing behind the counter, talking with another woman.")

		saynn("[say=elizaMom]I'm starting to think that this was a mistake on my part.[/say]")

		saynn("[say=eliza]But Mom![/say]")

		saynn("Oh.. It makes sense now, why the second woman reminds you a lot of Eliza. She is a feline.. clearly in her fifties.. which is evident by the occasional prestigious gray stripes in her hair.")

		saynn("[say=elizaMom]I didn't send you here to make drugs, sweetie.[/say]")

		saynn("There is a hint of a very strong but suppressed feeling in Eliza's mother's gaze. It slowly becomes more obvious as she looks around.")

		saynn("[say=eliza]But that is part of.. part of everything that we do. That's what I wanna do! Not drugs, I mean.. but you know.. Why can't you be like dad?[/say]")

		saynn("[say=elizaMom]Your father is a fool. He would happily waste money on new equipment. Equipment that would become ash in mere weeks, as you and I learned by now.[/say]")

		saynn("[say=eliza]At least he cares more about me rather than some lab..[/say]")

		saynn("[say=elizaMom]You're saying I don't care about you? You might be a bigger fool then. You almost died last time, you realize that? And without you.. what reason would I have?[/say]")

		saynn("Eliza pulls her gaze away.. and just stands, with her arms crossed. She doesn't have much against such a strong argument.")

		saynn("[say=elizaMom]You think that science is all fun and games? It's not. It's dangerous.. but also boring.. which makes it extra dangerous for young minds like yours.[/say]")

		saynn("[say=eliza]I'm not a young girl already, mom.. You can't kill the love for science in me..[/say]")

		saynn("[say=elizaMom]I know I can't. But I also can't let science kill you. So you will do as I say.[/say]")

		saynn("The older woman furrows her brows when noticing the mag on the counter.")

		saynn("Eliza sighs, her paws reach for that mag and bring it up to her lips, the words 'Best mom' that are written on it are clearly visible. Hm..")

		saynn("[say=eliza]Is that why you came here.. That's the first time I see you in a while..[/say]")

		saynn("[say=elizaMom]I had some business with the captain. Thought I might as well see how you are doing.[/say]")

		saynn("She looks around and shakes her head subtly, seeing.. the state of things.")

		saynn("[say=elizaMom]But now I'm thinking about taking you with me.[/say]")

		saynn("Eliza's eyes brighten up, her feline ears perk.")

		saynn("[say=eliza]Oh? You're taking me back into the big lab?[/say]")

		saynn("There is a lot of hope in that question.. But you can already hear the dreams crashing and smashing..")

		saynn("[say=elizaMom]What? No. Sweetheart, we just talked about it. Your science days are over, I will find you a different workplace.. One.. that's not so.. dirty.[/say]")

		saynn("Dirty? What is she talking about? Compared to the cellblock, this lobby is sterile.. pristine.")

		saynn("[say=eliza]But mom! I didn't blow up the lab even once here! We've been making a lot of progress! Look.[/say]")

		saynn("She opens the laptop.. and shows her mother something on it.")

		saynn("[say=eliza]See? We've been slowly filling up this database. This prison is turning out to be an invaluable source of unique.. science discoveries. I can tell you about each one, they all seem to possess some kind of transformative properties.. isn't that cool?[/say]")

		saynn("[say=elizaMom]This is dangerous, Eliza.. How can you not see that?[/say]")

		saynn("[say=eliza]But I love doing it. I wanna keep doing it. You should see what shitty equipment we have here.. but we're making it work! We're doing science! Any other job would.. I don't know.. any other job would make me feel miserable.[/say]")

		saynn("Her raw passion is making you feel something fuzzy inside. And you're probably not alone in this.")

		saynn("[say=elizaMom]Alright.. alright. Don't make me seem like a monster. Who am I to rob you of all this?[/say]")

		saynn("[say=eliza]You're my mom.. mom.. I'm gonna be the best chemist, I'm gonna make you proud![/say]")

		saynn("Eliza's mother puts on a polite smile.")

		saynn("[say=elizaMom]Hm. I have a question for you, sweetheart.[/say]")

		saynn("[say=eliza]Yes?[/say]")

		saynn("[say=elizaMom]You said.. we.. a few times. You're not working alone?[/say]")

		saynn("[say=eliza]Oh yeah![/say]")

		saynn("Eliza hastily looks around.. and notices you.")

		saynn("[say=eliza]There you are! Come here![/say]")

		saynn("Time to introduce yourself..")

		addButton("Introduction", "See what Eliza's mother thinks about you", "intro_you")
	if(state == "intro_you"):
		playAnimation(StageScene.Duo, "stand", {npc="elizaMom"})
		saynn("As you approach the pair, you are met by a sharp, judging gaze.")

		saynn("[say=eliza]This is {pc.name}, my assistant.[/say]")

		saynn("You straighten your back, trying to look.. presentable. But you can just hear the silent 'Ew' coming from Eliza's mother.")

		saynn("[say=eliza]And this is my mom, Scarlet Quinn![/say]")

		saynn("[say=pc]Uh. Pleased to meet you, Miss Quinn.[/say]")

		saynn("[say=elizaMom]Missus Quinn.[/say]")

		saynn("Right.. is that even a word.")

		saynn("[say=pc]My bad.[/say]")

		saynn("Scarlet turns her head back to her daughter.")

		saynn("[say=elizaMom]Can't help but notice.. you're working with an inmate.[/say]")

		saynn("[say=eliza]Yeah? {pc.He} {pc.has} been a huge help![/say]")

		saynn("[say=elizaMom]They have a collar around their neck.[/say]")

		saynn("[say=eliza]Yeah, inmates have those here, very handy~.[/say]")

		saynn("[say=elizaMom]I begin.. to regret my decision, yet again.[/say]")

		saynn("[say=eliza]Mo-o-om.[/say]")

		saynn("[say=elizaMom]How can you.. lower yourself.. to their level. I gotta get you out of here, back into civilization, away from all this..[/say]")

		saynn("[say=eliza]Nope! Too late! You already agreed to let me stay.[/say]")

		saynn("[say=elizaMom]Khm..[/say]")

		saynn("[say=eliza]But if you wanna offer me to work in the big lab again.. I might even agree~.[/say]")

		saynn("[say=elizaMom]Fine, stay. I'm a woman of my word. I advise you to be careful. Especially.. yeah.[/say]")

		saynn("[say=eliza]I won't blow up this lab, I promise![/say]")

		saynn("[say=elizaMom]That's not the only thing I'm worrying about. Don't lose yourself, Eliza. Remember who you are. Now, if you excuse me, I gotta exchange a few more words with the captain.[/say]")

		saynn("[say=eliza]Be well, mom![/say]")

		saynn("[say=elizaMom]You too.[/say]")

		saynn("And just like that, Scarlet Quinn steps out from behind the counter.. and enters the elevator. Following her.. are a few guards.")

		addButton("Continue", "See what happens next", "after_mom")
	if(state == "after_mom"):
		removeCharacter("elizaMom")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("[say=pc]Your mother doesn't like me much.[/say]")

		saynn("[say=eliza]Well, you're nothing but dirty criminal scum in her eyes. I had the same feeling when I first arrived here.[/say]")

		saynn("[say=pc]But that changed?[/say]")

		saynn("[say=eliza]Something changed. And also, my mom doesn't realize that inmates make for great test subjects~.[/say]")

		saynn("Right..")

		saynn("[say=eliza]Maybe you helping me discover more drugs will make her change her mind about you.[/say]")

		saynn("[say=pc]Somehow I doubt it. We're on different levels.. or whatever she said.[/say]")

		saynn("Eliza shrugs.")

		saynn("[say=eliza]There are ways to get down to the same levels~. Like kneeling.[/say]")

		saynn("She chuckles.")

		saynn("[say=eliza]I know that finding new drugs is gonna be harder now, since you found so many already.. I have a lead on something interesting that might help with this. I will tell you when I get more information~. Keep it up.[/say]")

		saynn("You nod.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "mom_intro"):
		processTime(3*60)

	if(_action == "intro_you"):
		processTime(5*60)

	if(_action == "after_mom"):
		processTime(5*60)

	setState(_action)
