extends SlaveTypeBase

func _init():
	id = SlaveType.Slut

func getVisibleName():
	return "Slut"

func getVisibleDesc():
	return "Turn your slave into a fucktoy and get an ability to whore them out"

func getEnslaveText(_npc):
	return "[say=pc]I'm gonna make such a good fucktoy out of you, little slut.[/say]"

# F- F  F+ D- D  D+ C- C  B- B  A- A  S- S  S+ S++
# 0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15
func getTrainText(_npc, _skillLevel):
	if(_skillLevel == 0):
		return "Your slave might have some experience in sex but {npc.he} has absolutely no idea how to be a good slut. You start simple, just explaining that you’re planning to make a great S++ whore out of {npc.him}."
	if(_skillLevel == 1):
		return "Today you teach your new slut the most important lesson: It’s not about {npc.his} own pleasure. It’s about making the other person cum in the best and most juicy way possible. Great performances will lead to great creds. Great creds will lead to more rewards from you."
	if(_skillLevel == 2):
		return "Sex requires a lot of stamina. You show your slave some simple stretching exercises and also ones designed to emphasize those child-bearing hips."
	if(_skillLevel == 3):
		return "Successfully getting into someone’s pants starts with teasing. You teach your slave the way that {npc.he} should talk and act in order to make someone horny for more. Biting your lip, playfully sticking tongue out, talking with a low huffy voice. Even just staring at someone bulge might sway the person into the right direction."
	if(_skillLevel == 4):
		return "Being seductive is very important for sluts. You ask your slave to show you some sexy poses that you then rank and comment on. Twerking is a no, sensually swaying your hips is a huge yes."
	if(_skillLevel == 5):
		return "Bending over or spreading your legs is easy. You teach your slave how to do this in the most sexual way possible. How to give any onlookers only a short glance of your private bits, enough to draw them in without putting them off."
	if(_skillLevel == 6):
		return "You tell your slut that sometimes {npc.he} will have to fit an entire horsecock. So better start training your throat as early as possible. You help your slave to get rid of {npc.his} useless gag reflex.. just to start training {npc.him} how to purposefully trigger it for that tight squeeze and hot wet noises. Some people just like it messy."
	if(_skillLevel == 7):
		return "You’re not training a slut for nothing, you will expect profits from {npc.him}. So now comes the lesson about how to pull the most amount of creds out of others, how to haggle and be greedy without going so far as to never get a client or end up abused for free."
	if(_skillLevel == 8):
		return "You teach your slut that some clients will be fine with vanilla. But some will want to do some very fucked-up shit with {npc.him}. And so it is very important when to say no. But it is even more important to sometimes push past your limits when the extra creds are offered. You just gotta not forget to actually get them when you’re gonna be gagging cum or something worse onto the floor out of all your gaping holes. "
	if(_skillLevel == 9):
		return "Creampies! You explain to your slut that people will cum inside {npc.him}, a lot. So you train your slave how to spread their bits and show the seed leaking out in the most sexy way possible."
	if(_skillLevel == 10):
		return "You tell your slave that {npc.his} previous sexual orientation doesn’t matter at all. Under your command the slut must be able to suck and fuck even a tentacle if the need for that would ever arise. You train your slut how to suck cocks, lick pussies and eat asses with the same eagerness."
	if(_skillLevel == 11):
		return "Cowgirl position is where your slut gonna be able to show everything that {npc.he} knows. You teach your slave how to ride you in the best way possible, beginning with how to lower {npc.his} body onto someone’s cock or strapon and how to show off those {npc.breasts} that {npc.he} has during the riding."
	if(_skillLevel == 12):
		return "You explain your slut that {npc.he} won’t like every single cock or pussy. And yet, during sex {npc.he} must be able to make it seem like it's the best moment of {npc.his} life. Moans! You train your slut to moan loudly and passionately, without it feeling forced. Sometimes you just have to fake it until you make it, you also train your slut how to fake powerful orgasms when the time comes for it."
	if(_skillLevel == 13):
		return "Safety first. Which is why you finally decide to teach your slut how to take even the biggest cocks without hurting {npc.himself}. But if your holes are too loose, the pleasure won’t be as good, so you teach your slut how to purposefully clench and milk cocks for every last drop. Condoms are also important, probably."
	if(_skillLevel == 14):
		return "You explain your slut that some clients know exactly what they want. With them, you just have to bend over and moan like a good slut. But some will be a little more.. subby and nervous. So you show your slut when and how {npc.he} should take control of the scene and how to make squirm even the most shy cuties."
	if(_skillLevel == 15):
		return "There is not much new you can teach your slave. {npc.He} {npc.isAre} pretty much a perfect slut now! But you still go through some old lessons and practice the art of being a whore with {npc.him}."
		
	return .getTrainText(_npc, _skillLevel) 

func getUnlockHints(_npc):
	return [
		{
			unlocksAt = 2,
			name = "Order slut",
			text = "You can now order your slut to be fucked by one of your other slaves",
		},
		{
			unlocksAt = 5,
			name = "Prostitution",
			text = "You can now order your slut to whore herself out! The higher the slut skill, the more your sluts will earn.",
		},
	]
