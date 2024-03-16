extends SlaveTypeBase

func _init():
	id = SlaveType.Pet

func getVisibleName():
	return "Pet"

func getVisibleDesc():
	return "Turn your slave into a personal pet and get ability to give them walkies"

func getEnslaveText(_npc):
	return "[say=pc]You're gonna make for such a good pet for me, little cute {npc.boy}.[/say]"

# F- F  F+ D- D  D+ C- C  B- B  A- A  S- S  S+ S++
# 0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15
func getTrainText(_npc, _skillLevel):
	if(_skillLevel == 0):
		return "Your slave doesn’t know anything about how to be a good pet for you. So you just start by explaining {npc.him} the things that you will expect {npc.him} to be able to do by the end of this training. Crawling around, making cute noises, obeying commands."
	if(_skillLevel == 1):
		return "Today you explain to your slave who pets actually are, the differences between being a slave and a pet. You tell {npc.him} that pets are generally treated less harshly and strictly. But they’re still expected to obey just as much. Pets might have to bark or meow instead of talking, they are basically degraded to the level of a household animal. Pets might have to crawl around naked everywhere and sleep in a small pet bed or a cage if they are not obeying."
	if(_skillLevel == 2):
		return "Pets aren’t supposed to walk on two legs, today you teach your slave this. You make {npc.him} kneel and then get on all fours before crawling around you a few times. Yes, hands and knees will hurt at first. But you tell your pet that {npc.he} just needs enough practice."
	if(_skillLevel == 3):
		return "Bones. Pets love bones. You train your pet how to treat bones, how to play with them, how to bury them. Getting on all fours, moving the tail out of the way and spreading your ass for a good bone is a sign of a good pet."
	if(_skillLevel == 4):
		return "A good pet knows a lot of tricks. You start by doing some simple ones like ‘sit’ and ‘up’, repeating them until you see enough progress. Then you move on to more tricky commands like ‘voice’ or ‘give paw’. You explain that feeling humiliated is fine at first, that feeling will pass with enough training. You still expect {npc.him} to do every command. Now roll over and show me your belly! Who is a good {npc.boy}?"
	if(_skillLevel == 5):
		return "Today you teach your slave that collars and leashes are the most important parts of being a pet. You click a leash to {npc.his} collar and train {npc.him} to follow you around the cell. Each time {npc.he} slows down, you are quick to yank on it, teaching {npc.him} a good lesson: obedience is key."
	if(_skillLevel == 6):
		return "You teach your slave that pets aren’t supposed to wear clothes. Being naked is a normal state for them. And so they shouldn’t be ashamed of that. They are still wearing collars at least! You tell your pet that if {npc.he} {npc.isAre}n’t happy with that, you can always force a bitchsuit onto {npc.him}."
	if(_skillLevel == 7):
		return "Looking cute is how a lot of pets get away with naughty things that they do. You train your pet to stick {npc.his} tongue out and pant audibly, to tilt head at something confusing, to wag {npc.his} tail when happy."
	if(_skillLevel == 8):
		return "Pets don’t talk, we all know that. So today you train your pet to bark or meow if {npc.he} wants your attention. If {npc.he} tries to say something, you just ignore it until you hear an animal noise."
	if(_skillLevel == 9):
		return "Pets have paws, not hands. You train your pet to use {npc.his} mouth more by making {npc.him} bring you the stick after you throw it! If {npc.he} ever touches it with {npc.his} hands, you are quick to swat {npc.his} {npc.thick} butt!"
	if(_skillLevel == 10):
		return "You teach your pet that being in heat is a normal state of a pet. It doesn’t even have to be an actual heat, if seeing some bone or pussy makes you needy, you’re in heat. You teach your pet not to hide it. Instead, pets in heat should show it in their every action. Present their butt, rub themselves against the owner, make cute noises. You also train your pet to be a good cockwarmer. Why not."
	if(_skillLevel == 11):
		return "Pets are often used as a way to battle bad emotions. You train your pet to help with that. You teach {npc.him} to sit on your lap, to purr, to nuzzle when you are feeling down. You train {npc.him} to be a good emotional support animal."
	if(_skillLevel == 12):
		return "Walkies are the best part about being a pet. Any pet should be excited when the w-a-l-k-i-e-s are even mentioned. You also teach your pet that being naked during walkies is completely okay, no one will bat an eye seeing a pet that is not wearing anything. Pets that aren’t naked will look strange though."
	if(_skillLevel == 13):
		return "The most important lesson is.. a pet’s place is always below their owner. No matter what. A pet is here to serve by being a cute warm blanket. Or a needy cockwarmer slut. If the owner tells you to jump - you jump high. If the owner tells you to lick - you lick eagerly."
	if(_skillLevel == 14):
		return "You teach your pet that being bratty is okay. Unlike slaves, pets don’t have to always obey 100%, they are allowed to be somewhat silly about it. But only up to a point. You tell {npc.him} that if you feel any malicious intent behind {npc.his} actions, you will punish. And you will punish harshly. Punishments aren’t supposed to be fun."
	if(_skillLevel == 15):
		return "There is not much new you can teach your slave. {npc.He} {npc.isAre} pretty much a perfect pet now! But you still go through some old lessons and practice the art of being a cute puppy/ kitty with {npc.him}."
		
	return .getTrainText(_npc, _skillLevel) 

func getUnlockHints(_npc):
	return [
		{
			unlocksAt = 3,
			name = "Walkies",
			text = "You can now give your pet walkies around the station!",
		},
		{
			unlocksAt = 8,
			name = "More actions",
			text = "More actions are available to satisfy your pet's wants during the walkies",
		},
	]
