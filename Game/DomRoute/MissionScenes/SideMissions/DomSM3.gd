extends SceneBase

func _init():
	sceneID = "DomSM3"

func _run():
	if(state == ""):
		addCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {npc="announcer"})
		saynn("[say=announcer]Hey.[/say]")

		saynn("You turn around from the mission board and see Ans.")

		saynn("[say=pc]What's up, Ans?[/say]")

		saynn("[say=announcer]I have some free time, the arena is quiet. I was thinking of asking if you wanna go hang out?[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Why not. But why me?[/say]")

		saynn("[say=announcer]We're a team. And we barely know each other. C'mon, I don't bite, unlike the rest of the team. Hah.[/say]")

		saynn("Well, why not.")

		addButton("Follow", "Go hang out with Ans", "go_hangout")
	if(state == "go_hangout"):
		aimCameraAndSetLocName("yard_waterfall")
		playAnimation(StageScene.Duo, "stand", {npc="announcer", npcAction="sit"})
		saynn("You follow Ans out of the hideout and out of the hidden arena. He brings his mic-cane with him.")

		saynn("[say=pc]Aren't you afraid the guards will seize the cane?[/say]")

		saynn("You go through the busy gym.. and start following the many stone pathways that separate all the greenery.")

		saynn("[say=announcer]Eventually I get it back.[/say]")

		saynn("[say=pc]So you're allowed to keep it?[/say]")

		saynn("[say=announcer]I wouldn't say that I'm allowed to keep it.. but other inmates want me to keep it. And so they help me get it back each time.[/say]")

		saynn("You walk past a few crossroads. Ans doesn't seem to be having any trouble walking.. and yet he still leans on his cane sometimes. A habit probably.")

		saynn("[say=pc]Does the staff hate you?[/say]")

		saynn("[say=announcer]They don't hate me. But they don't like me either. I do have some connections though, I try to keep those alive.[/say]")

		saynn("He looks back and notices your concerned stare.")

		saynn("[say=announcer]Some people get what they want through coercion or violence. Some people do it through manipulation. I do it through charisma. At least I try to.[/say]")

		saynn("You reach a secluded spot. The path ends here. There are a few benches here, looking towards a little artificial pond with a small waterfall above it. The walls of the pond are made out of concrete, making it more of a.. pool.. a pool that's not made for swimming.")

		saynn("Ans takes a seat on one of the benches.")

		saynn("[say=announcer]Rather be friends than enemies. That's what I think.[/say]")

		saynn("You stand near, watching the view.")

		saynn("[say=pc]But will you be able to stab your staff buddies in the back when the time comes for it?[/say]")

		saynn("He stays silent for a bit.")

		saynn("[say=announcer]That's a really hard question you got there.[/say]")

		saynn("[say=pc]My bad. But I feel like it's important to know that.[/say]")

		saynn("[say=announcer]I'd love to be able to say yes. But you know how it is. Our human brains are just wired like that. Takes a very special set of conditions to betray somebody.[/say]")

		saynn("He is being honest, you can feel it.")

		saynn("[say=pc]At least don't stand in the way then.[/say]")

		saynn("[say=announcer]I understand that. I won't. Don't worry, I only have a few friends among the staff anyway.[/say]")

		saynn("A man of connections.")

		addButton("Sit", "Take a seat near him", "do_sit")
	if(state == "do_sit"):
		playAnimation(StageScene.Duo, "sit", {npc="announcer", npcAction="sit"})
		saynn("You take a seat on the same bench, near him.")

		saynn("[say=pc]I get a feeling that this spot is getting used a lot for conversations.[/say]")

		saynn("[say=announcer]The running water has a calming effect.[/say]")

		saynn("He is not wrong.")

		saynn("[say=announcer]It also makes it so the cameras can't hear us.[/say]")

		saynn("He is smiling.")

		saynn("[say=announcer]Ask me something if you want. Just know that I really-really like talking.[/say]")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "talk_menu"):
		saynn("What do you want to talk about?")

		addButton("Captain", "Talk about the captain with him", "ask_captain")
		addButton("Kait&Avy", "Talk about Kait and Avy", "ask_kait_avy")
		addButton("Earth", "Ask him about the Earth", "ask_earth")
	if(state == "ask_captain"):
		saynn("[say=pc]The captain, what do you think about him?[/say]")

		saynn("[say=announcer]The captain? He is interesting. He is not violent.. but he is not exactly friendly either. He has that strange aura around him.[/say]")

		saynn("[say=pc]Was it his idea to put collars around our necks?[/say]")

		saynn("[say=announcer]Pretty sure it was always like that, before him even. He just continued the tradition.[/say]")

		saynn("Ans takes a short pause to think.")

		saynn("[say=announcer]I'd say that we lucked out, overall. There are normal prisons that don't make the inmates wear shock collars.. but I've also heard about some that do much worse things.[/say]")

		saynn("A bit of silence again.")

		saynn("[say=announcer]I'm not sure how I feel about breeding being allowed here. Recreational sex would be enough. We don't need more kids that won't get to know their parents because they're dangerous criminals.[/say]")

		saynn("[say=pc]Are you friends with the captain?[/say]")

		saynn("[say=announcer]We talked a few times. He is a careful guy, sees through any attempts at befriending him. Even my charisma is not enough to break through this impenetrable wall.[/say]")

		saynn("[say=pc]I guess we just need an unstoppable force for that.[/say]")

		saynn("[say=announcer]I think Kait might just be that force, hah. Or maybe you, who knows.[/say]")

		saynn("[say=pc]We will find a way.[/say]")

		saynn("[say=announcer]But yeah.. I've been trying to understand him. Figure out what kind of person he is. He doesn't seem to care about wealth for example. That is so strange.[/say]")

		saynn("[say=pc]Why is that strange?[/say]")

		saynn("[say=announcer]Because that is what AlphaCorp is all about. It's a corporation, its job is to extract as much profit as possible. We all should be in the mines for an eternity, slaving away for resources that he would be able to sell. Instead.. he allows us to do whatever we want.[/say]")

		saynn("[say=pc]Maybe that's his way of rehabilitating us.[/say]")

		saynn("[say=announcer]I don't know what it is. I don't know why he is doing it. A lot of bad things are happening in this prison and he just lets it all happen. He is no saint, far from it.[/say]")

		saynn("[say=pc]Is the arena one of those bad things?[/say]")

		saynn("[say=announcer]My arena is.. it has good and bad sides to it. It helps to lower the overall chaos, allows people to let their rage out in a more controlled environment.[/say]")

		saynn("[say=pc]Maybe we do need more chaos?[/say]")

		saynn("[say=announcer]I don't know.[/say]")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_kait_avy"):
		saynn("[say=pc]Kait and Avy still hate each other.[/say]")

		saynn("[say=announcer]They will come around.[/say]")

		saynn("[say=pc]I wouldn't be so sure.[/say]")

		saynn("[say=announcer]I'm sure they will. For now it might actually be a good thing.[/say]")

		saynn("[say=pc]Why?[/say]")

		saynn("[say=announcer]Keeps them in a competitive mood.[/say]")

		saynn("[say=pc]There won't be time for friendly competitions soon.[/say]")

		saynn("[say=announcer]At some point they will realize who the real enemy is.[/say]")

		saynn("[say=pc]If you say so.[/say]")

		saynn("[say=announcer]The secret to bonding is quite simple. All you need is time.[/say]")

		saynn("[say=pc]Sure. Again, let's hope we have enough of it.[/say]")

		saynn("[say=announcer]The more time you spend near someone, the more they grow on you. And vice versa. Kait and Avy are arena rivals, that's why they hate each other. At some point they will realize that their rivalry is pointless. There are bigger problems.[/say]")

		saynn("[say=pc]Avy did do some very bad things to Kait inside the arena.[/say]")

		saynn("[say=announcer]Kait wouldn't sign up if she didn't understand the risks. Something tells me.. that maybe she likes to lose sometimes.[/say]")

		saynn("[say=pc]Sounds crazy.[/say]")

		saynn("He chuckles.")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_earth"):
		saynn("[say=pc]I'm curious. What happened to the Earth, your planet? Did AlphaCorp capture it, just like all the other ones?[/say]")

		saynn("[say=announcer]AlphaCorp? Even AlphaCorp didn't want to touch that mess of a planet.[/say]")

		saynn("[say=pc]And yet you're still here somehow.[/say]")

		saynn("[say=announcer]Yeah, well. We had to escape the Earth. Me and my girls.[/say]")

		saynn("[say=pc]What happened?[/say]")

		saynn("[say=announcer]Same old things. Wars happened, of course. The population was growing.. but the civilized world had only so much space in it. The upper cats didn't like the underdogs entering the arena.[/say]")

		saynn("[say=pc]The arena having no rules didn't help I assume.[/say]")

		saynn("[say=announcer]Hah. Basically.. There must always be rich countries and poor countries. I think that's called harmony. Anyone who tried to mess with that balance was met with.. resistance.[/say]")

		saynn("You can feel some sarcasm in his words.")

		saynn("[say=pc]So what did the poor countries do?[/say]")

		saynn("[say=announcer]They tried to become rich. When that didn't work out, they just made others poor instead. Destroying is much easier than creating.[/say]")

		saynn("[say=pc]That's one way to level the playing field. And how did they do that? Nukes?[/say]")

		saynn("[say=announcer]A few nukes wouldn't change the status quo. But the world is full of smart people. Smart and evil people.[/say]")

		saynn("[say=announcer]Why nuke a town and kill a few million.. when you can nuke a little weak point and kill billions instead.[/say]")

		saynn("[say=pc]A weak point?[/say]")

		saynn("[say=announcer]The whole world depends on trade. Exchange of goods and services is how we managed to grow so much. Make a few choke-points into a radioactive no-mans-land for twenty years.. and your money is suddenly worthless, you can't buy anything with it.[/say]")

		saynn("[say=pc]Surely the countries can support themselves still, even without global trade?[/say]")

		saynn("[say=announcer]They can, kinda. Their quality of life would have to drop of course. Heavily. People really didn't like it when they realized that they would suddenly have to live like poor people. Your average folk started fighting for what little scraps of normal life that were left. The rich people did the smart thing.. and peaced out on their private rockets.[/say]")

		saynn("[say=pc]Were you rich?[/say]")

		saynn("[say=announcer]A rich person wouldn't be a pimp, hah. I am the underdog that managed to make it out. For better or for worse.[/say]")

		saynn("[say=pc]Welcome to space.[/say]")

		saynn("[say=announcer]Thanks, it's very cozy up here. I've been looking around. I don't know if you noticed it yet. But you're living in a post-money society.[/say]")

		saynn("He didn't lie when he said that he likes to talk.")

		saynn("[say=pc]Mm? What does that mean?[/say]")

		saynn("[say=announcer]Nobody has any. Not a single bill. Except for, maybe, the president.[/say]")

		saynn("[say=pc]How am I able to buy something from a vendomat then?[/say]")

		saynn("[say=announcer]It's another huge story. I don't know if you want me to bore you so much.[/say]")

		saynn("[say=pc]Bore me all you want.[/say]")

		saynn("[say=announcer]From what I gathered.. You all share one giant debt between each other. You just exchange little pieces of it. Credits.[/say]")

		saynn("[say=pc]Credits always seemed like normal money to me.[/say]")

		saynn("[say=announcer]You had normal money before. But then you lost it all to the corporations. And so they had to do something about that. They created credits. A stable currency, completely made up of course. The problem is, you all still have your debts.[/say]")

		saynn("[say=pc]And so no matter how many credits we have, we're still corporate slaves then?[/say]")

		saynn("[say=announcer]You will never be richer than your boss. Now multiply that a billion times. It's not intuitive to think about.. but the upper class will always be shrinking in these conditions. You took that to its extreme until there was only one rich person left in the whole world. The person with all of the wealth of others. He is the CEO of AlphaCorp.[/say]")

		saynn("[say=pc]That doesn't make sense. Why? What reason?[/say]")

		saynn("[say=announcer]Greed? I guess that's just who we are. We always want more.[/say]")

		saynn("[say=pc]Why would they sit on all that wealth alone? Why not share it.. or something.[/say]")

		saynn("[say=announcer]Oh, they share it, of course. With friends. With family. Friends of family. They can also exchange it for some power over you. Once you have all of the money, you begin to crave power too.[/say]")

		saynn("[say=pc]It looks like they got full control over us already.[/say]")

		saynn("[say=announcer]Not quite. Some of us are clearly still fighting. The Syndicate also exists.. but I don't know if I would trust them at all.[/say]")

		saynn("[say=pc]The Syndicate?[/say]")

		saynn("[say=announcer]A bunch of families who are trying to stop AlphaCorp. Doesn't matter. The thing is.. when they will all lose.. and submit.. That's when it's gonna be over. All of it. Our whole world will just become a playground for a single person. We will probably start calling them a god. We will be clapping and cheering.. as they destroy the whole galaxy.. out of pure boredom.[/say]")

		saynn("[say=pc]Pretty grim.[/say]")

		saynn("[say=announcer]All things eventually come to an end. We should enjoy what little moments we have, make the best out of them. My bad if I made you feel worse, wasn't my intention.[/say]")

		saynn("[say=pc]You're good.[/say]")

		saynn("[say=announcer]Sometimes I get thoughts like that. Being part of your team helps. Can't help but to think that I'm being.. less than useful.. sometimes. It's eating me up inside.[/say]")

		saynn("His voice has those little tones of vulnerability.")

		saynn("[say=pc]You offered us a place to scheme. And your wisdom. We couldn't have done what we did without you. So, relax.[/say]")

		saynn("[say=announcer]Yeah? Right.[/say]")

		addButton("Continue", "See what happens next", "talk_menu")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
