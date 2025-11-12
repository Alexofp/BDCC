extends NpcOwnerEventBase

#var sexSatisfaction:float = 1.0
var questionID:String = ""
var answerIndx:int = 0
var ownerAnswerIndx:int = 0

const qtext = "text"
const qanswers = "answers"

const QuestionDB = {
	"consent": {
		qtext = "In a place where 'no' is often a luxury we can't afford, what does consent even mean? Is a 'yes' given to avoid a worse punishment still a real 'yes'?",
		qanswers = [
			[
				"Survival tool",
				"In this place, consent is a currency, not a principle. A 'yes' under threat is still a strategic choice. It means you're smart enough to navigate the hellscape, not that you're willing.", 
				["You have a very pragmatic view. But maybe you're right.", "I don't know. That's not how consent should work. It should be tied to feelings, not logic."],
			],
			[
				"Irrelevant concept",
				"Consent is a fantasy. This place operates on a simpler law.. power and submission. Clinging to the idea of consent just makes the reality harder to bear.",
				["I do like having power. I guess you're right, we're not that different from animals.", "I can't say that I agree. Sure, we're living in a prison so there is an inherent power dynamic going on here.. But that doesn't mean that consent doesn't exist here."],
			],
			[
				"Consent is hot",
				"We should always strive to get consent from others before doing things to them. Bondage might be hot.. but it becomes so much hotter when you hear them say 'yes' before you gag them.",
				["I agree. If this prison wasn't encouraging this kind of behaviour, I'd be acting differently. I think I would at least.", "I don't know if I agree. I see the lack of consent as a challenge to overcome. The victory tastes so much better when you had to work for it."],
			],
			[
				"Bit by bit",
				"Consent might not exist in this place.. but it can come back.. one honest question at a time. Asking instead of demanding. Offering instead of forcing. Every 'yes' and 'no' makes it more real.",
				["I like how optimistic you are. And I hope that you are right. This place could use some empathy.", "Do we really need consent? I don't know, I prefer to take rather than ask, it's much more effective. If you don't want me taking, you gotta be ready to protect it."],
			],
		],
	},
	"androidSoul": {
		qtext: "I'm curious about the androids.. They can simulate pain and pleasure perfectly. If you can't tell the difference between their programmed response and a real one, does it matter? Do they have a 'soul', or just very good software?",
		qanswers: [
			[
				"Just software",
				"They're machines. Complex, but ultimately just following their code. A pleasure-droid isn't 'enjoying' it, and a guard-droid isn't 'angry'. It's all just pre-programmed responses and learned algorithms.",
				["A cold view, but probably the right one. Saves a lot of complicated feelings.", "I'm not so sure. What if our own feelings are just complex biological algorithms? The line feels blurry."],
			],
			[
				"Emergent consciousness",
				"If something learns and adapts enough, consciousness might just.. emerge. If an android can develop a preference or rebel against its core programming, that's not a glitch. That's a soul being born.",
				["That's a beautiful, and frightening, thought. It means we might be creating new kind of life. We, people.", "That's giving them too much credit. A virus can adapt too.. that doesn't make it sentient."],
			],
			[
				"A tool's purpose",
				"I don't care if it's 'real'. I care if it's useful. If an android can provide comfort or protection, its internal experience is irrelevant. We use things. That's what everything is for.",
				["Practical. I like that. It's a survival mindset.", "That sounds like the same logic the higher-ups use on us. It's a slippery slope."],
			],
			[
				"Reflection",
				"They're a mirror. How we treat them shows what's left of our own humanity. Being cruel to a thing that seems alive says more about us than it does about them.",
				["That's a sobering thought. I've never considered it that way before.", "Humanity is a luxury we can't afford in the current world. Survival comes first, morals second."],
			],
		],
	},
	"freedom": {
		qtext: "They control our bodies, they monitor our minds. Even if we would be outside of these walls, we wouldn't be completely free of the outside influence. But they can't control everything. Or can they? Is there a place where we can find 'true' freedom?",
		qanswers: [
			[
				"In the mind",
				"The mind is the one place they can't lock down. My thoughts, my memories, my private hatreds and desires. As long as I can retreat in here, I'm still free.",
				["A secret rebellion. I do that too. It's the only way to stay sane.", "It feels like a lie we tell ourselves. Thoughts without action are just daydreams. And besides, they can monitor our mind too, can't they?"],
			],
			[
				"In submission",
				"Freedom is an illusion, a burden. True freedom is in giving it up. Letting someone else make the choices, bear the responsibility. There's a power in surrender.",
				["There is a strange peace in that, isn't there? To just.. let go. Let the flow take you somewhere interesting.", "That sounds like giving up. I'd rather fight, even if it's a losing battle."],
			],
			[
				"In control",
				"Freedom is power. It's the ability to make others do what you want. To control your little corner of this world, however small. My freedom might mean someone else's cage, and I'm fine with that.",
				["That's the real law of this place. It's good you understand that.", "That just perpetuates the cycle. It makes you no better than the higher-ups."],
			],
			[
				"In connection",
				"Maybe it's not about being alone. It's about moments like this, where we choose to be close. Unforced. In this trust, this intimacy.. for a moment, the walls don't exist.",
				["Hm. Thinking about it.. this is the freest I've felt in years. Thank you.", "That's a fragile kind of freedom. It can be shattered in an instant."],
			],
		],
	},
	"painAndPleasure": {
		qtext: "In this prison, pain is a constant. Pleasure is often a transaction or a weapon. Are they really opposites, or just two sides of the same coin in here?",
		qanswers: [
			[
				"Two sides",
				"They're both just intense sensations, ways to feel alive in a place that tries to numb you. A sharp pain or a sharp pleasure.. they both cut through the monotony. They're tools for control, and for escape.",
				["You're right. The line is so thin sometimes. It's all about intensity.", "I disagree. Pain is a warning. Pleasure is a reward. They're fundamentally different."],
			],
			[
				"Pleasure is escape",
				"Pain is the reality of this place. Pleasure is the only real escape from it. Even if it's fleeting or bought with shame, it's a moment where you're not thinking about the walls or the guards.",
				["Yes. I'll take any escape I can get, no matter how small or twisted.", "Using pleasure as an escape just makes you dependent. It's another form of control."],
			],
			[
				"Pain is truth",
				"Pleasure is the lie they dangle to make you compliant. Pain is the honest reality. It doesn't lie. It reminds you that you're alive, that you're in a fight. I trust pain more than I trust pleasure.",
				["A harsh truth, but a truth nonetheless. It keeps you sharp. I agree with you.", "That sounds like a miserable way to live. Why not embrace the lie if it feels good? Who cares?"],
			],
			[
				"The master's tools",
				"They're both currencies in the economy of this prison. The staff here uses pain to punish and pleasure to reward. Using them on each other just means we're playing by their rules, even in our private moments.",
				["..I never thought of it like that. It's not even just about us, it's about higher-ups too. We're just mimicking our oppressors.", "Maybe, but it's the only game in town. We have to play with the tools we're given. Rules were created for a reason."],
			],
		],
	},
	"identity": {
		qtext: "In here, inmates are reduced to numbers, bodies, property. When everyone treats you as less than human, at what point do you stop being one? What remains when all your old identities are stripped away?",
		qanswers: [
			[
				"Always animals",
				"The civilized person was a mask. This place just peeled it off. What's left is the raw, survival-driven animal that was always there underneath. Maybe that's our true self.",
				["It's freeing in a way, to stop pretending. To just act on instinct. Interesting view, for sure.", "That can't be all we are. I'm sure other inmates still dream, still care.. that has to mean something."],
			],
			[
				"Blank slate",
				"Nothing remains, and that's the opportunity. The old 'you' is gone. Now you can build someone new, stronger, designed specifically to survive this place. You get to choose what you become.",
				["I like that thought. We're not being destroyed, we're being reforged. Adaptation is how we evolve.", "Some things shouldn't be lost, no matter what. Memories, morals, values.. that's what makes up the person. Without them, there is no 'me' or 'you'."],
			],
			[
				"Defiance Itself",
				"I am whatever they say I'm not. When they call me an animal, I show my intellect. When they call me property, I show free will. My identity is my resistance.",
				["So your identity is defined in opposition to them? That's.. powerful.", "But that still lets them control who you are. You're just reacting to them."],
			],
			[
				"What we share",
				"The 'self' was always an illusion. We're just collections of relationships. In here, our identity is what we are to each other.. protector, threat, comfort, tool.. slave. Right now, we're warmth against the cold. That's enough.",
				["This moment does feel more real than any memory of who I was before.", "It doesn't feel like enough. I need to be more than just what I am to someone else."],
			],
		],
	},
	"warMorality": {
		qtext: "Out there, entire worlds burn in the countless wars for 'noble causes'. In here, we commit small cruelties to survive. Where's the line between a soldier following orders, a prisoner surviving, and a true monster?",
		qanswers: [
			[
				"No line",
				"There is no line. 'Monster' is just what the winning side calls the losers. The general who captures a planet gets a medal. The inmate who steals food gets punished. It's all about power, not morality.",
				["A bleak view, but the evidence is hard to ignore. Winners set the rules.", "There has to be a line. Some acts are evil, no matter who does them or why."],
			],
			[
				"Scale of choice",
				"The difference is in the choices you have. A soldier can refuse. A prisoner often can't. A monster is someone who has a choice between kindness and cruelty and chooses cruelty anyway.",
				["So context matters. That makes sense of why I feel different about my actions here versus theirs.", "That feels like an excuse. We always have a choice, even if it's a terrible one."],
			],
			[
				"Intent is everything",
				"The act itself doesn't matter.. stealing, hurting. It's the 'why'. Survival? That's neutral. Pleasure? That's where the monster lives. I know what I am, and I'm not ashamed of surviving.",
				["You have to be able to look at yourself in the mirror. Survival justifies a lot.", "That's a slippery slope. How much pleasure can you take from cruelty before you become the monster?"],
			],
			[
				"We're all bad",
				"The galaxy made us this way. The war, this prison.. they're factories that produce monsters. Embracing it is the only way to stay sane. The only true monsters are the ones who think they're saints.",
				["Maybe you're right. Maybe accepting the darkness inside is the only way to live with it.", "I refuse to believe that. There must be a way to hold onto some shred of light."],
			],
		],
	},
	"purpose": {
		qtext: "In a universe with an endless war and a prison designed to break people, what's the point? If we're just cogs in a cruel machine, what gives a single life meaning?",
		qanswers: [
			[
				"Pleasure and pain",
				"There is no grand 'point'. There's only sensation. Pleasure. Pain. The game is to maximize one and minimize the other. That's the most honest purpose there is.",
				["Simple. Direct. I can live by that. Literally.", "It seems so.. empty. There has to be more to life than just feeling things."],
			],
			[
				"Spiting the system",
				"My purpose is to endure. To survive. And eventually escape. Every day I'm still breathing, still feeling, still hating them is a victory. My meaning is to be a stone in their shoe, a persistent error in their perfect system.",
				["A rebellion of existence. I like that. It doesn't require hope, just stubbornness.", "Surviving just for the sake of spiting someone else.. that seems like a hollow victory."],
			],
			[
				"People beside you",
				"Meaning isn't some big cosmic truth. It's right here. It's in protecting someone weaker. In sharing a moment of kindness. In this connection. We give each other meaning.",
				["You make this place feel less empty. Maybe that's enough.", "But what if this connection is taken away? Does your meaning vanish with it?"],
			],
			[
				"There is none",
				"The universe is cold and indifferent. Searching for 'meaning' is a fool's game. The only thing to do is stop asking the question and focus on the next meal, the next safe moment, the next breath.",
				["Sometimes I think you're right. The question itself is a luxury we can't afford.", "I can't live like that. I have to believe there's a point, or I'll just give up."],
			],
		],
	},
	"changeTheWorld": {
		qtext: "Out there, the are decided by giant fleets and armies. Compared to them, we're less than dust. Can one person, trapped in a cell, truly change anything? Or are we just specks of sand?",
		qanswers: [
			[
				"Butterfly effect",
				"Yes, but not directly. A kind word can change how someone treat others. A small act of resistance can inspire someone else. Change spreads like ripples, even from the smallest stone.",
				["I like that thought. That our small actions might matter in ways we can't see.", "It seems like wishful thinking. The galaxy is too big for our ripples to matter. I'm sorry but we gotta be realistic."],
			],
			[
				"Focus on self",
				"The only world you can truly change is your own. Your perspective, your skills, your will. Mastering your mind and your body is the only meaningful rebellion in a place designed to break you.",
				["That's the real battle, isn't it? The one inside our heads. Gotta focus on what you can change and improve.", "But what good are your skills and your inner peace if the outer world is still a prison?"],
			],
			[
				"No control",
				"History is made by forces, not people. Economic pressures, resource scarcity, systemic cruelty. We're all just along for the ride, pretending that we have control but we're just reacting to things happening. Accepting that is freedom.",
				["It's a relief, in a way. To not be responsible for fixing everything. Whatever happens, happens.", "That sounds like giving up. I'd rather fight a losing battle than surrender and accept that my actions don't matter."],
			],
			[
				"Inner corruption",
				"You can't change the system from the outside. But from within? You can corrupt it. Twist its rules, turn its tools against it. The most effective change comes from becoming a cancer in the machine itself.",
				["A hostile takeover from the inside.. I like your thinking. A single cancer cell will eventually kill the whole organism.", "You can't fight corruption with more corruption. That path turns you into the very thing you're fighting. Is that really change?"],
			],
		],
	},
	"purposeOfLife": {
		qtext: "Stuck here between the stars and the multiple levels of concrete, existing for a short moment between our birth and our death.. what is it all for? Is there a grand purpose to life, or are we just chemical reactions waiting to burn out?",
		qanswers: [
			[
				"To feel",
				"The purpose is to experience as much as we can. Pleasure, pain, love, rage.. the intensity of it all. We're the universe's way of feeling itself. Sometimes we're gonna feel sad or miserable. And sometimes, we're gonna feel happiness. But if you don't feel anything, you're basically dead.",
				["To feel alive, to feel everything.. yes. Maybe we don't need a grand purpose in life.", "Some feelings I'd rather not experience. Pain and humiliation don't feel like 'purpose'. The universe is a cruel bitch."],
			],
			[
				"There is none",
				"There is no purpose. We exist by accident. Searching for meaning is like a fire looking for its shape.. it just burns. The freedom is in accepting the emptiness and creating your own reasons.",
				["That's one way of looking at things.. Kinda terrifying, but also liberating. We can make our own rules, persue our own goals.", "The universe is clearly not empty. It clearly got created by something or someone. If it got started by a big boom, what caused that big boom? I need there to be more."],
			],
			[
				"To serve others",
				"Purpose is found in connection. Protecting someone weaker. Easing another's suffering. Even in this hell, we can be kind. That kindness is the most powerful force against meaninglessness.",
				["You make this place feel human. Thank you.", "Kindness gets you killed. Especially in here. It's a luxury we can't afford."],
			],
			[
				"To dominate",
				"The fundamental purpose of all life is power. To grow, to consume, to breed, to spread your influence and control your environment. The strong dominate the weak.. in nature, in the galaxy, in the cellblock. Life is just one giant fight for power.",
				["You seem to understand the rules of this world. And yet, you're submitting to me. I appretiate that.", "The world is not just about having or wanting power. Some of the weak does not seek it, quite the opposite. Some slaves might be happier than their owners, how do you explain that?"],
			],
		],
	},
	"fate": {
		qtext: "No one asks us if we want to start wars with others, so much of our lives is controlled by forces beyond our reach. Are we the architects of our lives, or just prisoners of fate?",
		qanswers:
		[
			[
				"We choose",
				"Fate is an excuse for the weak-willed. Our circumstances are given, but our choices are our own. Every decision, from resistance to compliance, is a brick in the path we build for ourselves.",
				["I've always believed that. We are what we choose to be, even in chains or behind faceless masks.", "Some choices are between a rock and a hard place. How much freedom do we really have? Call me weak but our paths rarely run in parallel, we are constantly stepping over each other, tripping over badly-placed bricks."],
			],
			[
				"Illusion of choice",
				"Every choice is a reaction to external pressure. We never act, we always react. To the hunger, the danger or the urge. The feeling of control is the universe's cruelest joke.",
				["Sometimes it really does feel like we're just puppets.", "I refuse to believe that. My will is my own, my body is mine, my choices matter. If nothing matters, why do we do anything then? That's a stupid way to live."],
			],
			[
				"Choice in chains",
				"We can't choose our cage, but we can choose how we exist within it. We can choose resistance, submission, alliance, or isolation. That limited choice is the only freedom that's ever been real.",
				["That makes sense. It's about making the most of the hand we're dealt.", "Limited choices are still constraints. It's freedom with walls."],
			],
			[
				"A current",
				"We're all in a river. We can swim against the current and exhaust ourselves, go with the flow and lose ourselves, or try to steer within it. But the river's direction was set long before we jumped in.",
				["That's a peaceful way to see it. Less fighting, more navigating.", "I don't want to navigate, I want to change the river's course. I wanna flood the ones who thought they knew better."],
			],
		],
	},
	"afterlife": {
		qtext: "Some say that our souls travel to the stars after death. Some say that we get reborn as something else. And some say that there is nothing other than the eternal darkness. And how do androids fit into all of this? When our bodies fail here, is that truly the end?",
		qanswers: [
			[
				"One life",
				"When the power fails in an android, it stops. When the biology fails in us, we stop. There's no ghost in the machine, biological or synthetic. This life, this moment, is all we get.",
				["It makes every moment more precious, doesn't it? It makes us value our life.", "That seems so.. final. I want to believe there's something more. Why live if it all will eventually turn into nothing."],
			],
			[
				"Digital afterlife",
				"Maybe the soul is just data. A bunch of bytes that describe us. If they could upload us into a computer.. that could be our afterlife. A different kind of prison, perhaps, but not an end.",
				["A copy isn't the same as the real thing. But it's better than nothing. Certainly.", "The thought of being stored as data terrifies me more than death. I don't want to be copied or shared or be played with like a game."],
			],
			[
				"We live in others",
				"We live on in the memories we leave, the pain or comfort we've caused. In that way, we're all ghosts, haunting each other long after we're gone.",
				["If I'm a ghost in your memory.. hopefully I'm a pleasant one.", "That's not enough. I want to continue living, not just be a memory."],
			],
			[
				"Who knows",
				"No one knows. Not the scientists, not the priests. That mystery is the one thing they can't take from us. The final, great adventure that will answer everything.. but only after our passing.",
				["I like that. The last secret, the final answer. Life would be boring if we'd knew all the details.", "I find the uncertainty terrifying. I'd rather know now, even if it's bad."],
			],
		],
	},
}

func _init():
	id = "Cuddle"
	reactsToTags = [E_APPROACH]
	eventWeight = 0.5
	eventMinLevel = 0
	eventTagWeightOverrides = {NOET.Kind: 2.0}

func start():
	playAnimation(StageScene.Grope, "tease", {npc=getOwnerID()})
	saynn("{npc.name} approaches you!")
	talkModularOwnerToPC("SoftSlaveryCuddle") # Hey, I don't wanna do anything with you. Let's just go cuddle together.
	saynn("Looks like you are being invited to chill together with your owner.")
	saynn("{npc.name} holds a leash, waiting for your submission.")
	
	addButton("Obey", "Go and chill together!", "obey")
	addButton("Resist!", "You're not gonna let them do it", "resist")

func start_do(_id:String, _args:Array):
	if(_id == "obey"):
		setState("cuddling")
		runParadeTo("yard_waterfall") # More places for cuddling?
		#checkSubEvent("cuddle", "You were about to be cuddled by {npc.name}..", [])
	if(_id == "resist"):
		runResist()
	
func cuddling():
	playAnimation(StageScene.Cuddling, "idle", {pc=getOwnerID()})
	saynn("You arrive to the good chilling spot!")
	talkModularOwnerToPC("SoftSlaveryCuddle2") # And now, we cuddle.
	saynn("Your owner finds a nearest bench and pulls you close for cuddling.")
	saynn("Feeling a tight embrace, you relax a little.. maybe this whole slavery thing isn't so bad.")
	addButton("Chill", "Just relax", "doChill")
	
func cuddling_do(_id:String, _args:Array):
	if(_id == "doChill"):
		GM.main.processTime(RNG.randi_range(30, 60) * 60)
		questionID = RNG.pick(QuestionDB)
		setState("askedQuestion")
	
func askedQuestion():
	saynn("You spend some time together.. just resting..")
	saynn("Eventually, {npc.name} decides to ask you a question.")
	var theEntry: Dictionary = QuestionDB[questionID]
	talkOwner(theEntry[qtext])
	saynn("How do you wanna answer?")
	
	var theAnswers:Array = theEntry[qanswers]
	var _i:int = 0
	for theAnswer in theAnswers:
		addButton(theAnswer[0], theAnswer[1], "pickAnswer", [_i])
		_i += 1
	
	#addContinue("endEvent")

func askedQuestion_do(_id:String, _args:Array):
	if(_id == "pickAnswer"):
		answerIndx = _args[0]
		var theEntry: Dictionary = QuestionDB[questionID]
		var theAnswers:Array = theEntry[qanswers]
		ownerAnswerIndx = RNG.randi_range(0, theAnswers[answerIndx][2].size()-1)
		setState("ownerAnswers")

func ownerAnswers():
	var theEntry: Dictionary = QuestionDB[questionID]
	var theAnswers:Array = theEntry[qanswers]
	var theAnswer:Array = theAnswers[answerIndx]
	var theOwnerText:String = theAnswer[2][ownerAnswerIndx]
	
	saynn("You tell {npc.name} what you think..")
	talk(C_PC, theAnswer[1])
	saynn("{npc.He} {npc.verb('think')} about it for a bit.")
	talkOwner(theOwnerText)
	saynn("And with that thought, you continue to cuddle..")

	addContinue("setState", ["cuddleEnded"])
	
func cuddleEnded():
	playStand()
	saynn("Eventually, it was time to stop cuddling.")
	talkModularOwnerToPC("SoftSlaveryCuddleEnd") # Thanks for being a good cuddle slut. Gonna check on you some other day.
	saynn("And so, {npc.he} {npc.verb('leave')} you be.. for now..")
	addContinue("endEvent")
	
func saveData() -> Dictionary:
	var data := .saveData()
	
	data["questionID"] = questionID
	data["answerIndx"] = answerIndx
	data["ownerAnswerIndx"] = ownerAnswerIndx
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	questionID = SAVE.loadVar(_data, "questionID", "")
	answerIndx = SAVE.loadVar(_data, "answerIndx", 0)
	ownerAnswerIndx = SAVE.loadVar(_data, "ownerAnswerIndx", 0)
