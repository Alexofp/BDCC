extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false

func _init():
	sceneID = "Ch7s3CaptainScene"

func _run():
	if(state == ""):
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		addCharacter("captain")
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="captain", npcAction="sit"})
		aimCameraAndSetLocName("cd_captain_office")
		saynn("You step into the captain's office. The place hasn't changed much since the last time you were here. Expensive old furniture. A soft carpet makes your feet feel warm. A grand chandelier illuminates the red wood walls that have a golden trim to them.. Rich people like gold..")

		saynn("In the middle is a desk with a laptop. Sitting behind it is.. the captain. One of his hands holds a projector sphere that has Elena trapped in it. The second hand.. holds his energy pistol.")

		saynn("[say=captain]And here you are. {pc.name} and Tavi. You came back way faster than I thought you would.[/say]")

		saynn("Tavi was about to pounce at the guy.. but the simple act of him aiming the weapon at the sphere makes her stop.")

		saynn("[say=captain]Thought I would just let you do that? What would you have done to me, Tavi? Kill me? Or do I have to suffer first? How much is enough?[/say]")

		saynn("The life of her mother seems to be more valuable than the life of the captain.. Even if it's only a copy. You will have to find a way to save it.")

		saynn("[say=pc]Submit and we won't hurt you. You're cornered, captain.[/say]")

		saynn("He chuckles.")

		saynn("[say=captain]You think so? Who has the weapon here? The only weapon on this whole station? I do.[/say]")

		saynn("[say=tavi]And yet, we're still standing.[/say]")

		addButton("Continue", "See what happens next", "cap_stands")
	if(state == "cap_stands"):
		playAnimation(StageScene.Duo, "stand", {npc="captain"})
		saynn("The captain stands up as well, his hands still threatening to shoot the sphere.")

		saynn("[say=captain]You are. Because I want you to. I have control over the life of every single person on my station. And I treasure every single one.[/say]")

		saynn("He sighs and looks around.")

		saynn("[say=captain]Listen.. Do I look evil? Does this look like the lair of an evil monster?[/say]")

		saynn("[say=pc]This power that you have. It corrupted you.[/say]")

		saynn("He furrows his brows.")

		saynn("[say=captain]Corrupted? I always knew exactly what I wanted. My dreams haven't changed a bit since I was young.[/say]")

		saynn("[say=pc]You found a way to turn justice into slavery. Was that always your dream?[/say]")

		saynn("The captain aims his gaze away. He is silent for an eerie amount of time.")

		saynn("[say=captain]You wanna talk about that? You're not wrong. But you don't understand it. You and Tavi.[/say]")

		saynn("Getting into a verbal fight with him.. Might be risky.. But maybe you will be able to prove him wrong instead?")

		addButton("Sure", "Try to change the captain's mind", "big_firstquestion")
	if(state == "big_firstquestion"):
		saynn("[say=pc]Sure.[/say]")

		saynn("The captain inhales audibly and lowers his gun before sitting on the corner of his desk, taking a more casual pose. All the while you and Tavi are standing near the entrance.")

		saynn("He looks at you.")

		saynn("[say=captain]Let me start slow. We, people, have many needs. We have a need to eat, drink, sleep, have sex.. We have a need to socialize too and a few other ones. You know what need we don't have?[/say]")

		saynn("The captain puts the sphere on the table and leans behind the desk before producing a bottle of cold beer. He opens it with the handle of his gun and takes a good sip.")

		saynn("[say=captain]We don't have a need for freedom. Many people are perfectly fine with turning their brains off and letting someone else guide them. Some are ready to give up themselves fully for another person. Sometimes it's not even a person. Any passion can enslave us.[/say]")

		saynn("He looks at your collars and smiles.")

		saynn("[say=captain]We want to be slaves.[/say]")

		saynn("Better to be very careful with your choice of words..")

		addButton("Then why don't you put a collar on? What a hypocrite", "say this", "1_putcollar")
		addButton("Not everyone wants to be a slave. And it doesn't make it legal", "say this", "big_1_noteveryone")
		addButton("You are just finding excuses to keep sex slaves around", "say this", "1_excuses")
		addButton("Fuck you. I will never be a slave", "say this", "1_fuckyou")
	if(state == "1_putcollar"):
		saynn("[say=pc]Then why don't you put a collar on? What a hypocrite. Why don't you try being like us?[/say]")

		saynn("He rolls his eyes.")

		saynn("[say=captain]Next you're gonna tell me that the world is unfair? Very observant. But also very stupid.[/say]")

		saynn("He sighs.")

		saynn("[say=captain]I didn't do any crimes for once. I climbed through ranks. I didn't get any special treatment. I had to fight for my spot under the sun. Why would I even.. I don't even know why I'm trying to explain this to you. You're clearly delusional.[/say]")

		saynn("He stands up and gets into a combat stance.")

		saynn("[say=captain]It was worth a try I guess.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "1_excuses"):
		saynn("[say=pc]You are just finding excuses to try to keep your sex slaves around for longer. You know that it's not legal. And you don't care. You just want your dick sucked.[/say]")

		saynn("He sighs.")

		saynn("[say=captain]You don't even understand how wrong you are. Do you see any sex slaves by my side? Look under the desk, there aren't any. I don't think I can even argue with your words. Because.. You're plainly wrong. And you came to me with that? Pathetic.[/say]")

		saynn("He stands up and gets into a combat stance.")

		saynn("[say=captain]It was worth a try.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "1_fuckyou"):
		saynn("[say=pc]Fuck you. I will never be a slave.[/say]")

		saynn("The captain tilts his head.")

		saynn("[say=captain]You are, though. Look at your neck. Oh right, your huge ego prevents you from seeing anything past your nose.[/say]")

		saynn("He sighs and stands up before getting into a combat stance.")

		saynn("[say=captain]Slaves are easy to control. But you wouldn't understand anything about that anyway.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "big_1_noteveryone"):
		saynn("[say=pc]Not everyone wants to be a slave. And it doesn't make it legal.[/say]")

		saynn("[say=captain]It is legal. Inmates wearing collars is fully legal. Otherwise we wouldn't be doing it.[/say]")

		saynn("You feel like you gotta push him further..")

		saynn("[say=pc]Did you even hear what I said? I wasn't talking about collars. I was talking about slavery. Collars are just a bi-product of it, a sign of how fucked up and rotten this whole justice system is. Do you really think that it's okay to do that because we are criminals? What about other things?[/say]")

		saynn("[say=captain]I think.. I think it is.. yeah..[/say]")

		saynn("[say=pc]You're saying that we want to be slaves. No we don't. I don't. Tavi doesn't. Many others don't. People don't. You're just forcing us. Writing it down into laws doesn't make it okay. It makes it worse.[/say]")

		saynn("The captain stays quiet for a few seconds, sipping his beer.")

		saynn("[say=captain]Forcing? You know.. Here is a truth for you. People don't even understand what they want. Their dreams are stupid, often counterproductive. If given enough freedom, they always gravitate towards the source of the most easy happiness. But wanking all day won't get you far. Without a powerful leader, we are headed for destruction. I am that leader.[/say]")

		saynn("He sighs and spreads his arms.")

		saynn("[say=captain]Everyone is happy here, can't you see? So I must be doing something right.[/say]")

		saynn("He switched the topic.. which means it's you who is doing something right.")

		addButton("Let people do what they want. Even if they want to destroy themselves", "say this", "2_let")
		addButton("I'm not happy. You need to do better captain", "say this", "2_nothappy")
		addButton("Oh yeah. Is that why you made it so staff members can lose?", "say this", "big_2_staff")
		addButton("Leader? You're just a power-hungry asshole", "say this", "2_asshole")
	if(state == "2_let"):
		saynn("[say=pc]You gotta let people do what they want. Even if they want to destroy themselves.[/say]")

		saynn("Captain looks at the ceiling.. like he is thinking.")

		saynn("[say=captain]Nah. I don't think I will. Should I even explain why?[/say]")

		saynn("He stands up and gets into a combat stance.")

		saynn("[say=captain]It was worth a try I guess.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "2_nothappy"):
		saynn("[say=pc]I'm not happy. You need to do better, captain.[/say]")

		saynn("The guy raises a brow.")

		saynn("[say=captain]May I ask how? How well should I treat convicted criminals? With hugs and praise? Give me a break. What I meant is that everyone has a chance to be happy. But they obviously need to put in work. Nothing is free.[/say]")

		saynn("He stands up and gets into a combat stance.")

		saynn("[say=captain]It was worth a try I guess.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "2_asshole"):
		saynn("[say=pc]Leader? You're just a power-hungry asshole.[/say]")

		saynn("The captain sighs and looks at the floor.")

		saynn("[say=captain]Power is not a goal. It's a tool. It's a way to achieve a certain goal. How can you not understand that? That's like calling people who are trying to earn more credits greedy.[/say]")

		saynn("He stands up and gets into a combat stance.")

		saynn("[say=captain]Being a leader also comes with a lot of responsibility. It's not as fun as you think. Takes a lot of will-power to create something. But you wouldn't know that, you're here to destroy.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "big_2_staff"):
		saynn("[say=pc]Oh yeah. Is that why you made it so staff members can lose? Inmates gotta have some fun too, right? Keeps them from starting a wide-spread uprising. It's worth it, right?[/say]")

		saynn("The captain rubs his chin, pondering. Then he sips some more beer.")

		saynn("[say=captain]Only through conflict do we become stronger. That's why I'm talking with you. Instead of just shooting you two and getting it over with.[/say]")

		saynn("There is something there. Something that you can hook onto.")

		saynn("[say=pc]Conflict? How about you train your staff rather than letting them get fucked and learn lessons the hard way?[/say]")

		saynn("The captain stays quiet for some time.")

		saynn("[say=captain]Evolution had millions of years and that's the best it came up with. Survival of the fittest. Strong ones take what they want and become stronger by fighting each other. But the weak ones quickly learn to enjoy being taken by the best. It's a win-win really..[/say]")

		saynn("He sighs and sips again. Hard to tell if he is getting drunk though. But you feel like you are close to the truth.")

		saynn("[say=captain]That's why wars need to continue. That's why we need more soldiers and people who will serve them. Yes, that's why guards also need to sometimes lose and be beat up and even fucked. That's how we achieve progress! That's the only way.[/say]")

		addButton("Wars need to stop. End of story", "say this", "3_nowars")
		addButton("Can't we just finance the research projects more? Instead of fueling corruption", "say this", "3_research")
		addButton("Is that why you are trying to ban androids? They don't fit in your little scheme?", "say this", "big_3_androids")
		addButton("Oh shut up please. I'm getting sick just listening to you", "say this", "3_shutup")
	if(state == "3_nowars"):
		saynn("[say=pc]Wars need to stop. They're destructive and painful. No one wins in a war. End of story.[/say]")

		saynn("The captain sighs and shakes his head.")

		saynn("[say=captain]World without wars.. Wouldn't that be a perfect utopia? Yes. But you know why wars will never stop? I think I told you already.[/say]")

		saynn("[say=pc]Anti-war people will never win any. But why not?[/say]")

		saynn("The captain smiles.")

		saynn("[say=captain]They would have to start a war. Starting a war is easy. Anyone with a rock can do it. Ending it.. requires people to give up something. And we really hate giving up.[/say]")

		saynn("He sighs.")

		saynn("[say=captain]Listen. Conflicts are all around us. They are what makes this life exciting. Conflicts are a disbalance, a contrast between two opinions. Contrast creates feelings. Without feelings.. we would be bored. Or dead. Same thing really.[/say]")

		saynn("He stands up and gets into a combat stance.")

		saynn("[say=captain]So let's fight, shall we. Some people only understand the language of force anyway. And you know that.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "3_research"):
		saynn("[say=pc]Can't we just finance the research projects more? Instead of fueling wars and corruption more. We can find answers to all the questions of our universe, we just have to work together.[/say]")

		saynn("The captain looks at a window that has a great view of outer space.")

		saynn("[say=captain]But why? What value do these answers hold? Will they save us? From what?[/say]")

		saynn("[say=pc]Our galaxy holds all sorts of secrets. What if something special is in the center? What if we can become immortal. Rewrite time. Transcend.[/say]")

		saynn("[say=captain]So.. Satisfying curiosity? What stops me from building more ships instead and destroying or enslaving your little research colony? There is a tangible value in that. Because I can sell you and your property. What you propose is.. worthless.. because the risks of finding nothing are too high.[/say]")

		saynn("He sighs.")

		saynn("[say=captain]Listen. The way we get motivated to do anything is extremely simple. We wanna do things that make us happy and avoid things that make us unhappy. And the second part is much more powerful.[/say]")

		saynn("The captain points at the vast nothingness of space.")

		saynn("[say=captain]You know why many species found a way to escape their home planets and start traveling through space? Curiosity only plays an insignificantly small role in that. Fear was the real motivator. Fear that their resources are running out. Fear that they could destroy the planet. Or that the planet will destroy them. There was a threat. A real tangible threat.[/say]")

		saynn("He stands up and takes a combat stance.")

		saynn("[say=captain]Threats make us get up and do things. Lack of a threat means everyone is busy fucking each other all day. And I'm sick of pointless fucking. But you clearly don't understand this. You think promises of fairy tales will motivate people to follow you? Nah, they won't.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "3_shutup"):
		saynn("[say=pc]Oh, shut up, please. I'm getting sick just listening to you and your crazy ramblings.[/say]")

		saynn("The captain shrugs.")

		saynn("[say=captain]Insulting me won't change anything. How about you listen rather than.. Oh, who am I kidding.[/say]")

		saynn("He stands up and gets into a combat stance.")

		saynn("[say=captain]I don't wanna waste my time any longer. It was worth a try I guess.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "big_3_androids"):
		saynn("[say=pc]Is that why you are trying to ban androids? They don't fit in your little scheme? Artificial intelligence can fix a lot of our problems.[/say]")

		saynn("Suddenly, the captain growls and throws the beer bottle away, causing it to shatter. You have clearly struck a nerve.")

		saynn("[say=captain]Artificial thoughts, artificial bodies, artificial goals. Everything about them is artificial. They're fake.[/say]")

		saynn("[say=pc]Androids can serve us. They can fight wars. They can do things a million times faster than we can. Perfectly repeatable and iterable. Isn't that real progress?[/say]")

		saynn("He switches from anger and suddenly starts laughing at your words.")

		saynn("[say=captain]Progress? Artificial brain is only as good as the brain that created it. It can never be better than the real one at anything. And since we're not ideal, artificial brains that we create are always worse. Always! It's not progress. It's a degradation. We could just make more soldiers instead, the process of breeding is perfectly scaleable. My prison proved that![/say]")

		saynn("The captain is so passionate about this.. He frowns while looking at the projector sphere in his hand.")

		saynn("[say=captain]Androids are unsafe too. People are predictable. You can project yourself onto someone and figure out why they did something. With a machine.. Who knows. It might be programmed to stab you in the back the next time you turn away. But then people begin to have feelings for these things. It's so wrong. Unnatural..[/say]")

		saynn("He looks.. vulnerable. Now could be the time to prove him that he is wrong.")

		addButton("Androids don't have to be perfect. Being different is okay", "say this", "4_perfect")
		addButton("Times are changing. You can't do anything to stop it. And so you're scared", "say this", "4_times")
		addButton("I understand. You need more control since androids are a threat", "", "4_understand")
		addButton("Nice sob story. Did a machine steal your wife and now you're angry?", "", "4_sobstory")
	if(state == "4_perfect"):
		saynn("[say=pc]You know.. Androids don't have to be perfect. They never claimed to be. They're different from us. And I think.. that's okay.[/say]")

		saynn("The captain furrows his brows.")

		saynn("[say=captain]Why are we wasting resources on them? It will never pay off.[/say]")

		saynn("[say=pc]Who said that? You? It is paying off already. And that's a fact. So you're wrong there.[/say]")

		saynn("You look at Tavi. She looks back at you and smiles.")

		saynn("[say=pc]The only truth that I know is that nature is always changing. Adapting. Evolving. And you.[/say]")

		saynn("You point at the captain.")

		saynn("[say=pc]You're just afraid that you won't be able to control the androids. You know.. They follow the same rules. They get iterated upon and slowly get better and better. Just like how you.. train.. your staff and inmates here in your prison. But without forced in-fighting and breeding. Without your intervention.[/say]")

		saynn("[say=captain]That's how it always was! Fighting and breeding are the staples of evolution![/say]")

		saynn("[say=pc]And that makes you angry. You think that your social skills won't matter anymore, just your coding ones. And you're probably shit at coding.[/say]")

		saynn("The captain growls.. but then looks away. You've read him like a book. His words made it easy. The guy is just crazy for power.")

		addButton("Continue", "See what happens next", "won_word_battle")
	if(state == "4_sobstory"):
		saynn("[say=pc]Nice sob story. Did a machine steal your wife and now you're angry?[/say]")

		saynn("The captain doesn't say anything for a while. He just looks you in the eyes, his stare drilling you.")

		saynn("[say=captain]Fuck. You.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "won_word_battle"):
		saynn("The captain sighs and looks at you and Tavi.")

		saynn("[say=captain]Listen. You two proved that you are strong and smart. Getting past all my most loyal guards.. I won't lie, it shows that you have what it takes.[/say]")

		saynn("He starts stepping around his desk.")

		saynn("[say=captain]I thought you two are some kind of anomaly. Some kind of problem that needs to be removed or dealt with. But no. You are a perfect synergy. You are exactly what I was looking for.[/say]")

		saynn("The fuck does he mean? Tavi looks at you and shakes her head subtly.")

		saynn("[say=captain]You don't get it yet? I created BDCC for a reason. There are many murderers and thieves and prostitutes here. But I'm looking for the best. I've been trying to for years. And I think my search is completed.[/say]")

		saynn("He points at you and Tavi.")

		saynn("[say=captain]Power isn't in numbers, not anymore. Quality is where it is at. I'm not afraid of corporations that have many spies. I'm afraid of corporations that don't.[/say]")

		saynn("He boldly walks up to you, his hand still holding a gun.")

		saynn("[say=captain]I need agents. Not for AlphaCorp, no. For me. Agents that can get things done. Agents like you two. The war that's happening right now wasn't started by me or you. But we can try to make the best out of the situation.[/say]")

		saynn("He looks at you specifically.")

		saynn("[say=captain]You want freedom? You will get it. Credits? Sure, all of them. Sluts? I don't care. I can give you everything you want.[/say]")

		saynn("Then he looks at Tavi.")

		saynn("[say=captain]Seeking revenge? I will help you with that. We will track every single person who was responsible for creating you and eliminate them. One by one. Any method. Isn't that your dream? I'm not against that. I'm not against letting you be with Nova and Elena either. Looks like you bonded together pretty well, they could be your family. Family that you always wanted.[/say]")

		saynn("Tavi suddenly begins to look extremely puzzled.. Captain's words hit her extremely hard.")

		saynn("[say=captain]All I'm asking back is loyalty. We can stop fighting, you and I. Once and for all. No more being a prisoner, no more sleeping in a cell, no more collars, no more abuse. You will be on my level. You will decide instead of being decided for. You will be my hands. And I will be your mind.[/say]")

func taviSpeak(corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return corruptSpeak

func shouldDisplayBigButtons():
	if(state.begins_with("big_")):
		return true
	return false


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "cap_stands"):
		processTime(3*60)

	if(_action == "big_firstquestion"):
		processTime(3*60)

	if(_action == "won_word_battle"):
		processTime(10*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
