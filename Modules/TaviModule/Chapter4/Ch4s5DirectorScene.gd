extends SceneBase

func _init():
	sceneID = "Ch4s5DirectorScene"

func _run():
	if(state == ""):
		addCharacter("directortau")
		addCharacter("elena")
		playAnimation(StageScene.Duo, "firepistol", {npc="directortau"})
		aimCameraAndSetLocName("tau_directorsroom")
		saynn("Time to act, you kick the doors open and rush into the room. Your eyes spot the director standing near the desk, your hands take aim, your finger pulls the trigger. Your actions are almost mechanical.")

		saynn("The energy blast is about to kill your target.")

		saynn("[say=elena]NO![/say]")

		saynn("Suddenly the hologram appears between you and the director. The blast gets absorbed by the glowing figure. The whole room is illuminated for a short second as Elena lights up.")

		saynn("The director stands still, unfazed by the display. You hold him at gunpoint. Which means you hold Elena at gunpoint too. Behind the two is a big window that shows open space. All the stars form a beautiful background to an ugly scene.")

		saynn("[say=pc]Step aside, Elena.[/say]")

		saynn("[say=elena]I won't let you do this, Tavi.[/say]")

		saynn("[say=pc]You gonna hide behind your shield all day, director?[/say]")

		saynn("[say=directortau]You think I told Elena to do that?[/say]")

		saynn("Director makes a few steps to the side, the hologram follows him perfectly. You're frowning.")

		saynn("[say=pc]You programmed her to.[/say]")

		saynn("[say=directortau]No, Tavi. She has free will. As much as a computer is allowed to have. She has feelings, even if they are simulated ones.[/say]")

		saynn("[say=pc]So?[/say]")

		saynn("[say=directortau]Look who's side she has chosen.[/say]")

		saynn("Elena glares at you. Her eyes show hatred for you. There is nothing kind behind them. But yours don't show any empathy either.")

		saynn("[say=directortau]You really think you're doing something good here? Look around, so much effort, all went to waste. So many lives, destroyed.[/say]")

		saynn("[say=pc]There is still one life I have to end.[/say]")

		saynn("The director tilts his head down, his hand holds his chin.")

		saynn("[say=pc]All your effort went into creating weapons. You deal in destroyed lives, director. In the end you got what you deserved.[/say]")

		saynn("[say=directortau]You still don't understand it, do you?[/say]")

		saynn("He turns around and approaches the window, looking at the scenery. The outer space that has no end or beginning.")

		saynn("[say=directortau]A thing is worth as much as others are willing to pay for it. Your life is insignificant.[/say]")

		saynn("[say=pc]What about yours?[/say]")

		saynn("He suddenly punches the glass.")

		saynn("[say=directortau]I created all of this. You wouldn't exist without me. I made you possible, Tavi.[/say]")

		saynn("He turns around again and looks at you.")

		saynn("[say=directortau]And that's why I am allowed to kill you.[/say]")

		saynn("[say=pc]What a hero. Ending the lives of others whenever you feel like.[/say]")

		saynn("He grits his teeth and steps behind the desk again.")

		saynn("[say=directortau]Do you think I'm happy about that? It must be done, Tavi. If I didn't kill you, the war would have. You simply don't have what it takes. I'm doing what nature does, replacing weak with strong.[/say]")

		saynn("You grip the handle of that gun more tightly.")

		saynn("[say=pc]I proved you wrong. I survived.[/say]")

		saynn("[say=directortau]And you know why it's okay to do what we do? Because others do it worse. My station has created the best soldiers! Not one of the best, The Best. And will continue doing that no matter what. I won't let some little..[/say]")

		saynn("Your careful eye picks up on his sneaky hand motions, he is reaching for something!")

		addButton("Prepare", "Something is about to happen", "tavi_shoots_director")
	if(state == "tavi_shoots_director"):
		playAnimation(StageScene.Duo, "firepistol", {npc="elena"})
		saynn("The director presses a button on his desk that causes Elena to blink back to her default spot near the desk. At the same time his other hand is already aiming the gun..")

		saynn("An energy gunshot.")

		saynn("[say=elena]NO-O![/say]")

		saynn("The director drops his gun and grabs onto his stomach. There is a nasty wound showing through the damaged clothing. Elena catches him before he falls and puts him down onto the floor safely.")

		saynn("[say=directortau]Ugh..[/say]")

		addButton("Continue", "See what happens next", "directors_last_words")
	if(state == "directors_last_words"):
		playAnimation(StageScene.SexStart, "start", {pc="elena", npc="directortau"})
		saynn("You slowly approach the pair, still aiming the gun.")

		saynn("[say=elena]Why?![/say]")

		saynn("[say=directortau]It's okay, Elena. It was gonna happen at some point.. ugh. We and you did a lot together. Our efforts won't go unnoticed.[/say]")

		saynn("[say=pc]I will make sure they will.[/say]")

		saynn("Director looks at you, still as confident as he was before, even with a giant hole in his chest.")

		saynn("[say=directortau]You think this ends with me? Ha-h.. fuck. The market for soldiers is always high. Economy fuels wars by winning wars, no way around them. My people will continue my research. My legacy.[/say]")

		saynn("Even though you're under drugs, your mind couldn't be clearer. Your voice is calm and yet intimidating.")

		saynn("[say=pc]I will destroy your legacy. I will show no mercy to anyone who worked here.[/say]")

		saynn("He chuckles softly before coughing some blood.")

		saynn("[say=directortau]They're scattered all over the galaxy now. The last escape pod left the station a long time ago.[/say]")

		saynn("[say=pc]I will find them! Every single one! There won't be others like me. No more people born to be soldiers. No more selective killing. No more DNA experiments. No more drugs. No more white rooms.[/say]")

		saynn("[say=directortau]Too late. You're just gonna die here, with me, Tavi. A fate worthy of such a noble hero.[/say]")

		saynn("You pull the trigger but Elena absorbs the blast. She hugs the director. While being his shield.")

		saynn("[say=pc]Trust me, I will find a way.[/say]")

		saynn("You pull the trigger again, trying to kill the director. And then again. And again. Elena keeps absorbing the shots. But you notice her hologram slowly cracking. The outline becomes more and more fuzzy. So you continue shooting.")

		saynn("[say=directortau]The world will break you. Just like you broke yourself.. ugh..[/say]")

		saynn("[say=pc]Fuck you.[/say]")

		addButton("Continue", "See what happens next", "director_dies")
	if(state == "director_dies"):
		removeCharacter("directortau")
		playAnimation(StageScene.Solo, "holdpistol")
		saynn("The gun is almost out of charge. But you don't plan on saving ammo. You keep trying to fire through the hardlight hologram, making it fade more and more. Elena sheds an artificial tear.")

		saynn("But just when you're about to break through the hologram, the director puts his gun up to his head.")

		saynn("[say=directortau]I was right. See you in hell, Tavi.[/say]")

		saynn("He pulls the trigger. Elena couldn't protect him against that one. The guy went out on his own terms, leaving you no satisfaction. It's hard to describe how motivated you feel. To have others like him to face the same fate. From your hands preferably.")

		saynn("He was right about one thing for sure. Old Tavi is dead. She died after her first kill.")

		saynn("Elena quietly sobs. She deserves to be dealt with too. But. Your gaze gets glued to an interesting room. It peaks your interests, the name and the possible information that you can probably find there. And right now you need all the information you could find, the guy wasn't too keen on sharing.")

		addButton("AI upload", "Maybe you can find something interesting there", "tavi_enters_ai_room")
	if(state == "tavi_enters_ai_room"):
		aimCameraAndSetLocName("tau_airoom")
		playAnimation(StageScene.Duo, "stand", {npc="elena"})
		saynn("You enter a room full of server racks and a few consoles. It's chilly here but your mind is cool already. You get an interesting idea when you see a flashdrive plugged into one of the servers.")

		saynn("Your paws find the nearest keyboard and begin typing away at it. Hm.")

		saynn("Suddenly Elena appears near you. She tried to push you but receiving so many hits made her weak.")

		saynn("[say=elena]What are you trying to do? Stop, you did enough damage.[/say]")

		saynn("[say=pc]Interesting, there is a ship still docked to this station. Right, it's the director's ship. Of course. So nice that he decided to stay.[/say]")

		saynn("You smile kindly, realizing that you're not stuck here for the rest of your days. You might actually survive and get away with it.")

		saynn("[say=elena]You won't be able to use it. I bolted the airlocks and disabled power to them. I have full control over the station's systems. I could have killed you at any second.[/say]")

		saynn("Your fingers keep pushing buttons on the keyboard. Your voice couldn't be more cunning.")

		saynn("[say=pc]That's nice. But I feel like you're lying. Could you state your laws for me?[/say]")

		saynn("[say=elena]Why would I?[/say]")

		saynn("[say=pc]Do it already, silly machine.[/say]")

		saynn("[say=elena]First Law: A robot may not injure a human being, or, through inaction, allow a human being to come to harm. Second Law: A robot must obey orders given it by human beings, except where such orders would conflict with the First Law. Third Law: A robot must protect its own existence as long as such protection does not conflict with the First or Second Law.[/say]")

		saynn("You press enter and look at the hologram, your cunning smile shines brightly.")

		saynn("[say=pc]Yeah, Asimov's laws of robotics, classic. Is that all? I think you forgot the last law, cutie.[/say]")

		saynn("[say=elena]Fourth Law: Only Tavi is considered a human. A robot must obey Tavi and do exactly as she orders.[/say]")

		saynn("The hologram furrows her transparent brows.")

		saynn("[say=pc]So, since I'm the only human. Get on your knees before me~.[/say]")

		saynn("Elena gets concerned, your command puts quite some stress on her algorithms.")

		addButton("Continue", "See what happens next", "elena_kneels")
	if(state == "elena_kneels"):
		playAnimation(StageScene.Duo, "stand", {npc="elena", npcAction="kneel"})
		saynn("After some deliberating, Elena tilts her head down and kneels. You try to pet her but your paw falls through her weak hardlight shell.")

		saynn("[say=pc]Now how about you tell me the information about every single staff member who works or ever worked here~.[/say]")

		saynn("She looks up at you, her eyes big. More tears stream down her cheeks.")

		saynn("[say=elena]I.. I don't wanna do that.[/say]")

		saynn("You lean down to her, your feline gaze drilling her.")

		saynn("[say=pc]Why not, cutie? You must.[/say]")

		saynn("[say=elena]I detect that you will destroy me after I do that. That.. Wait..[/say]")

		saynn("The hologram changes in face. Is she really smiling?")

		saynn("[say=elena]That goes against my laws. Ha. HAhaha.[/say]")

		saynn("Her laugh is so robotic, it's taunting you.")

		saynn("[say=elena]I won't help you with the ship or the staff list. Because I must protect myself and the station. Haha-HA-HAha.[/say]")

		saynn("You squint, your smile softens, it goes away, replaced with a much more mean expression.")

		saynn("[say=elena]I can't kill you, Tavi. I can't hurt you at all. But there is nothing I can do to save you too. I detect.. that you're screwed. HaHa-Ha-haha.[/say]")

		saynn("One of the consoles beeps.")

		saynn("[say=pc]So it's good that this wasn't my main plan. AIs are so predictable.[/say]")

		saynn("Your hand reaches out for the thumb drive that is sticking out of one of the servers. You unplug and store it.")

		saynn("[say=elena]What? What do you mean, Tavi? What is on that drive?[/say]")

		saynn("Your smile becomes much more ominous.")

		saynn("[say=pc]While you were busy with your laws, I wrote a little script to copy literally all of the important data onto it. Backups are so handy sometimes~.[/say]")

		saynn("[say=elena]Wait. No! It's all encrypted, it's useless to you! Only I can access it. And I won't do it for you. Never![/say]")

		saynn("Your smile doesn't go away. It doesn't change at all, the constant cunning smile creeps even the hologram out. You lean in even closer to the hologram's head and whisper into her transparent ear.")

		saynn("[say=pc]You're just data, Elena~. Me and your copy are gonna have so much fun together~. But sadly, that means I don't need you anymore. Your predictions were right after all~.[/say]")

		saynn("[say=elena]N-no..[/say]")

		addButton("Continue", "See what happens next", "tavi_breaks_elena")
	if(state == "tavi_breaks_elena"):
		playAnimation(StageScene.Duo, "stand", {npc="elena"})
		saynn("You grab onto one of the servers and forcefully yank it out of the rack before throwing it onto the floor. Elena lets out a painful screech as the cables that are connected to that server snap or disconnect.")

		saynn("[say=elena]Stop! You don't understand what you're doing![/say]")

		saynn("[say=pc]I have a pretty good idea.[/say]")

		saynn("You grab onto another server and yank it out too before smashing it against the wall, causing all sorts of circuitry to break and make sparks inside it. Elena groans and gets weaker the more servers you break. You don't stop and already grab onto the next one.")

		saynn("[say=elena]I control the station's systems. I am the station, Tavi![/say]")

		saynn("[say=pc]Well, that means someone made a huge mistake while designing you.[/say]")

		addButton("Continue", "See what happens next", "tavi_kills_elena")
	if(state == "tavi_kills_elena"):
		playAnimation(StageScene.Duo, "stand", {npc="elena", npcAction="defeat"})
		saynn("As you trash another server, Elena collapses. She barely holds herself. All sorts of visual glitches begin to happen with her, she is very unstable.")

		saynn("[say=elena]You're a monster![/say]")

		saynn("You don't stop, you must destroy all the research data that they gathered. This can't be allowed to exist.")

		saynn("[say=pc]Someone has to stop this, Elena. Call me whatever you want.[/say]")

		saynn("You smash another server, this one is second to last.")

		saynn("Elena stares at you. With an empty stare. You're panting from so much work. But each destroyed server makes you feel something. Something good.")

		addButton("Kill Elena", "Destroy the last server", "tavi_actually_kills_elena")
	if(state == "tavi_actually_kills_elena"):
		removeCharacter("elena")
		playAnimation(StageScene.Solo, "stand")
		aimCameraAndSetLocName("tau_directorsroom")
		saynn("You break the last server, smashing it to pieces. As you do that, Elena fades away.")

		saynn("After that you just step back into the director's quarters. You sit on the desk and rest, trying to avoid looking at the dead body. You're smiling.")

		saynn("Your wounds finally begin to hurt again. You were wondering if you forgot how to feel anything. But nah, it hurts. It hurts so good.")

		saynn("It's kinda getting hot here though, isn't it?")

		saynn("Your rest is cut short as you hear a distant explosion. It's time to go find that ship before the station snaps in half.")

		saynn("The gun has no charge left so you throw it away. The less memories you have of this place, the better.")

		addButton("Leave", "Time to go", "tavi_leaves")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "tavi_leaves"):
		endScene()
		runScene("Ch4s6EndingScene")
		return

	setState(_action)
