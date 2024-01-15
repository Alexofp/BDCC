extends "res://Scenes/SceneBase.gd"

var npcsToUse = []
var femaleNpcID = ""

func _init():
	sceneID = "PortalPantiesQuestCellblockScene"

func _run():
	if(state == ""):
		addCharacter("inmateCrowd")
		playAnimation(StageScene.Solo, "stand")

	if(state == ""):
		# (You hear noise)

		# (You approach noise and see inmates holding the fleshlights)

		# (You feel breath on your holes, some poke you, these are yours for sure)

		saynn("You look around the cellblock, almost ready to give up searching for the fleshlights that have portals with your private bits on them. But something peaks your interest, you hear some noise coming from a group of inmates far away.")

		saynn("And as you step towards them, you now also feel a warm breath washing over your sensitive flesh, it seems someone has your toys.")

		addButton("Approach", "You gotta get your fleshlights back!", "approach")

	if(state == "approach"):
		# (You approach them and get attention)

		# (Inmates wonder why are you so interested in them)

		# (Some poke your fleshlights and realize they are somehow work like portals)

		# (they tease you more and surround you)

		saynn("You approach a group of inmates. Most of them wear the red clothes but there are a few lilacs and general pop inmates too. Though they stay a few meters away.")

		saynn("You sneak up to the main group and listen in on their chatter. They seem to be surrounding someone.")

		saynn("[sayMale]Fleshlights? Why would we fuck fake holes? We have sluts with real ones.[/sayMale]")

		saynn("Another inmate answers.")

		saynn("[sayMale]These are better than the real ones. At least the guy said so.[/sayMale]")

		saynn("The guy fetches something from the other guy.")

		saynn("[sayMale]Is that so, huh?[/sayMale]")

		saynn("Oh no. They are holding your fleshlights, you clearly see your own bits and even notice yourself clenching from fear.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You see him holding your pussy and then forcing in two digits before spreading the folds open, showing off your wet folds to inmates around. That makes you gasp and cover your mouth a second later. Some lilac raises his brow.")

		# (if no pussy)
		else:
			saynn("You see him holding your tailhole and then prodding at it before forcing two saliva-coated digits inside and spreading it open before showing off to everyone how your hole reacts and twitches. That makes you gasp and cover your mouth a second later. Some lilac raises his brow.")

		saynn("[sayMale]Oh yeah, look. This slutty hole tries to suck my fingers in.[/say]")

		# (if has cock)
		if(GM.pc.hasPenis()):
			if(GM.pc.isWearingChastityCage()):
				saynn("Another inmate is fidgeting with the fleshlight that has your caged up cock on it, she wiggles it in the air and bites her lip seeing how realistic your balls sway.")
			else:
				saynn("Another inmate is fidgeting with the fleshlight that has your cock on it, she wiggles it in the air and bites her lip seeing how realistic your balls sway.")

			saynn("[sayFemale]Can I keep this part~?[/sayFemale]")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("More inmates are crowding around your holes and teasing them, both your pussy and the tailhole are being rubbed and prodded! Inmates chuckle and discuss the way your holes twitch after any touch and even begin to look aroused, so realistic. You can’t help but to grab onto your crotch with one hand while still covering your mouth with another.")

		# (if no pussy)
		else:
			saynn("More inmates are crowding around your hole and teasing it, your {pc.analStretch} tailhole is being rubbed and prodded! Inmates chuckle and discuss the way your hole twitches after any touch and even begin to look aroused, so realistic. You can’t help but to grab onto your crotch with one hand while still covering your mouth with another.")

		saynn("The lilac gets even more suspicious of you and gets everyone’s attention.")

		saynn("[sayMale]Hey-y, look at {pc.him}! It’s like {pc.he} feels whatever you’re doing to these toys![/sayMale]")

		saynn("Such a smartass, why did he do that. But it worked, the crowd turns towards you and suddenly realizes that you feel the teasing.")

		saynn("[sayMale]Woah, the lilac slut is right![/sayMale]")

		saynn("You can’t stop blushing as they begin to crowd around you, their lusty eyes hungrily checking out your {pc.masc} curves. You gotta do something!")

		addButton("Intimidate", "Threaten to use force to get your private bits back!", "intimidate")
		addButton("Offer credits", "Maybe you can just buy them out", "offer_credits")
		addButton("Just watch", "Maybe you should let them have some fun with you", "just_watch")


	if(state == "intimidate"):
		addCharacter("stud")
		playAnimation(StageScene.Duo, "stand", {npc="stud"})
		# (You say that you will fight for them)

		# (Strongest person steps out?)

		saynn("[say=pc]You better give them to me willingly![/say]")

		saynn("You try to sound as intimidating as possible but the inmates clearly outnumber you and having a blush on your cheeks doesn’t help.")

		saynn("One of the reds steps out, a huge horse that is built like a shelf, the strongest inmate in the crowd. His muscle structure can probably make any bodybuilder jealous.")

		saynn("[say=stud]Or what?[/say]")

		saynn("You raise your brow at the sight of his exposed cock, the guy clearly has no shame.")

		saynn("[say=pc]Or I will beat you up?[/say]")

		saynn("He snorts like a horse. Other inmates laugh.")

		saynn("[say=stud]Go ahead.[/say]")

		addButton("Fight", "Time to fight!", "fight")
		addButton("Offer credits", "Maybe you can just buy them out", "offer_credits")
		addButton("Just watch", "Maybe you should let them have some fun with you", "just_watch")



	if(state == "if_won"):
		# (Others scatter, you get your fleshlights and leave)

		saynn("The horse grunts and hits the floor, unable to continue fighting.")

		saynn("[say=stud]Grr-r..[/say]")

		saynn("Other inmates see how easy you managed to beat the strongest of them and all collectively decide to pussy out.")

		saynn("[sayMale]Whatever, this fucktoy is not worth it![/sayMale]")

		saynn("They drop the fleshlights, causing you to wince slightly as they hit the floor.")

		saynn("But whatever, you managed to get your holes back! Well, kinda. They’re still attached to fleshlights.")

		saynn("Time to return them to Alex.")

		# (scene ends)
		addButton("Continue", "That was easy", "endthescene")

	if(state == "if_lost"):
		playAnimation(StageScene.Duo, "defeat", {npc="stud"})
		# (You get punished? Maybe you are made to lick/suck yourself. And its humiliating)

		# (Yeah, you can pick which one you wanna lick)

		saynn("You drop to your knees, unable to continue fighting. The stud turns around and flexes his muscles to others like he is barely even winded, such a show off.")

		saynn("[say=stud]Teach {pc.him} a lesson. I will be back.[/say]")

		saynn("Inmates crowd around you even tighter, someone holds your own fleshlights near your face. And as you try to reach for one, someone grabs your arms and wrenches behind your back before forcibly bringing your head closer to the toys.")

		saynn("[sayMale]You wanted your fleshlights? C’mon, here, have a little taste then![/sayMale]")

		saynn("Seems like you don’t have a choice but to humiliate yourself.")

		saynn("[sayMale]C’mon slut! Lube yourself up before we all take turns![/sayMale]")

		addButtonWithChecks("Lick pussy", "Lick your own pussy", "lick_pussy", [], [ButtonChecks.HasVagina])
		addButton("Lick anus", "Rim yourself", "lick_anus")
		if(!GM.pc.isWearingChastityCage()):
			addButtonWithChecks("Suck dick", "Suck your own dick", "suck_dick", [], [ButtonChecks.HasPenis])
		else:
			addDisabledButton("Suck dick", "You can't suck a chastity cage :(")


	if(state == "lick_pussy"):
		playAnimation(StageScene.SexPortalOral, "lick", {onlyRight=true})
		# (needs pussy)
		saynn("You decide that playing with your own pussy is the best choice in the current position. You bring your head closer to the fleshlight with your {pc.pussyStretch} sex sticking out and take a good look first. You have never seen your folds from so close, you notice all the miniscule twitching and how soft the sensitive flesh is.")

		saynn("Inmates greedily watch you as you take your time. You see some exposing their cocks and idly stroking themselves. You let your tongue roll out and reach for your slit before giving it a little lick. It feels.. strange. Your own pussy reacts by clenching slightly.")

		saynn("[sayMale]What, it tastes bad? Maybe you should have let less cocks in![/sayMale]")

		saynn("Their snarky remarks feel humiliating. You continue teasing your own slit, dragging the tongue over the folds and then focusing on the clit, making little circle motions around it with the tip. Despite the situation, it feels quite.. arousing.")

		saynn("All the while other inmates are prodding at your anus and even stretching it open with their fingers before spitting into it.")

		saynn("You find the pussy hole with your tongue and start lapping at it, tasting your own pussy juices and moaning softly from the sensations, you always know where it feels the best for you.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "lick_anus"):
		playAnimation(StageScene.SexPortalOral, "lick", {onlyRight=true})
		
		saynn("You decide that playing with your own butt is the best choice in the current position. You bring your head closer to the fleshlight with your {pc.analStretch} tailhole sticking out and take a good look first. You have never seen your pucker from so close, you notice all the miniscule twitching and how soft the sensitive flesh is.")

		saynn("Inmates greedily watch you as you take your time. You see some exposing their cocks and idly stroking themselves. You let your tongue roll out and reach for your anal ring before giving it a little lick. It feels.. strange. Your own butthole reacts by clenching slightly.")

		saynn("[sayMale]What, it tastes bad? Maybe you should have let less cocks in![/sayMale]")

		saynn("Their snarky remarks feel humiliating. You continue teasing your own star, dragging the tongue around it with a little circular motions before prodding in the middle. Despite the situation, it feels quite.. arousing.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("All the while other inmates are prodding at your pussy and even stretching it open with their fingers before spitting into it.")

		saynn("You do a few lapping motions with your tongue and coat it generously with your saliva while moaning softly from the sensations, you always know where it feels the best for you.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "suck_dick"):
		# (needs dick)
		playAnimation(StageScene.SexPortalOral, "suckfast", {onlyRight=true, npcBodyState={hard=true}})

		saynn("You decide that blowing yourself is the best choice in the current position. You bring your head closer to the fleshlight with your {pc.cock} sticking out and take a good look first. You have never seen your dick from so close, you notice all the miniscule twitching and how veiny the texture is.")

		saynn("Inmates greedily watch you as you take your time. You see some exposing their cocks and idly stroking themselves. You let your tongue roll out and reach for your shaft before giving its tip a little lick. It feels.. strange. Your own cock reacts by getting slightly harder.")

		saynn("[sayMale]What, it tastes bad? Maybe you shouldn’t have fucked so many dirty whores![/sayMale]")

		saynn("Their snarky remarks feel humiliating. You continue teasing your own dick, dragging the tongue over the whole length and then focusing on the head, making little circle motions around the tip. Despite the situation, it feels quite.. arousing. You leak some precum that you quickly catch and swallow.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("All the while other inmates are prodding at your pussy and even stretching it open with their fingers before spitting into it.")

		# (else)
		else:
			saynn("All the while other inmates are prodding at your anus and even stretching it open with their fingers before spitting into it.")

		saynn("You part your lips and engulf the head of your cock before proceeding to suck on it. You slide your lips over your own shaft and moan while teasing the part that’s inside your mouth with your tongue.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		playAnimation(StageScene.SexPortal, "fast", {pc="stud", npc="pc", bodyState={exposedCrotch=true, hard=true}})
		
		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("But just before you can make yourself cum, the horsie returns and grabs the fleshlight with your pussy for himself.")

			saynn("[say=stud]You’re not walking away without my foals.[/say]")

			saynn("He is probably very right, the size of his balls is quite imposing. You’re still kneeling on the floor as the guy holds the fleshlight above the flared tip of his cock and then forces your pussy onto his length, making you moan as your petals get stretched wide open. You even notice a bulge in the shape of his cock appearing on your belly and going up and down as he starts fucking you remotely.")

			saynn("Other inmates watch the action and stroke themselves off, some already wasted their load messing up the floor.")

			saynn("[say=pc]H-hey-..[/say]")

			saynn("He uses the fleshlight like it's a toy and not with your actual pussy trapped in there, thrusting inside rough and pounding at your inner barricage. More pleasure noises are forced out of you as you hold onto your belly and feel the bump with your palm.")

			saynn("You cum very soon after, they let go of your arms, letting your body squirm and shiver all it wants while the inmates keep jerking themselves off. Your pussy slit gets very tight around the horse cock shaft, increasing the friction and the pleasure received by so much.")

		# (if no pussy)
		else:
			saynn("But just before you can make yourself cum, the horsie returns and grabs the fleshlight with your butthole for himself.")

			saynn("[say=stud]You’re not walking away without getting bred.[/say]")

			saynn("Your eyes open wide, even the size of his balls is quite imposing. You’re still kneeling on the floor as the guy holds the fleshlight above the flared tip of his cock and then forces your tailhole onto his length, making you moan as your sensitive star gets stretched wide open. You even notice a bulge in the shape of his cock appearing on your belly and going up and down as he starts fucking you remotely.")

			saynn("Other inmates watch the action and stroke themselves off, some already wasted their load messing up the floor.")

			saynn("[say=pc]H-hey-..[/say]")

			saynn("He uses the fleshlight like it's a toy and not with your actual butthole trapped in there, thrusting inside rough and pounding you with deep motions. More pleasure noises are forced out of you as you hold onto your belly and feel the bump with your palm.")

			saynn("You cum very soon after, they let go of your arms, letting your body squirm and shiver all it wants while the inmates keep jerking themselves off. Your anal ring gets very tight around the horse cock shaft, increasing the friction and the pleasure received by so much.")

		addButton("Creampie!", "He is gonna cum", "creampie!")

	if(state == "creampie!"):
		playAnimation(StageScene.SexPortal, "inside", {pc="stud", npc="pc", bodyState={exposedCrotch=true, hard=true}})
		
		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("The stud feels the tightness and only gets eager, he slides your pussy over his cock fast and rough until the peak. He lets out a wild horse noise while his cock starts stuffing your womb full of his virile thick seed. Your belly receives an even bigger bump from such a big load. Your eyes roll up from the immense amount of pleasure.")

			saynn("[say=pc]Fuck..[/say]")

			saynn("Then he just pulls out and throws the fleshlight to you. Your pussy is gaping and struggling to close up, instead just leaking cum profusely.")

		# (if no pussy)
		else:
			saynn("The stud feels the tightness and only gets eager, he slides your {pc.analStretch} butthole over his cock fast and rough until the peak. He lets out a wild horse noise while his cock starts stuffing your {pc.thick} butt full of his virile thick seed. Your belly receives an even bigger bump from such a big load. Your eyes roll up from the immense amount of pleasure.")

			saynn("[say=pc]Fuck..[/say]")

			saynn("Then he just pulls out and throws the fleshlight to you. Your used fuckhole is gaping and struggling to close up, instead just leaking cum profusely.")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		playAnimation(StageScene.SexPortal, "tease", {pc="stud", npc="pc", bodyState={exposedCrotch=true, hard=true}})

		saynn("And as the other inmates creep in, wanting to take a turn at breeding you, the stud stops them.")

		saynn("[say=stud]Fuck off, limp dick losers. That was my hole to breed.[/say]")

		saynn("He takes the other fleshlights too and gives them to you, such a nice guy.")

		addButton("Leave!", "Gotta run before he changed his mind", "leave!")

	if(state == "leave!"):
		playAnimation(StageScene.Solo, "stand")
		
		saynn("You hold your fleshlights and make your escape!")

		# (scene ends)
		addButton("Continue", "That was easy", "endthescene")



	if(state == "offer_credits"):
		removeCharacter("stud")
		playAnimation(StageScene.Solo, "stand")
		
		# (You ask how much credits would be enough)

		# (They say the fun has no cost)

		saynn("[say=pc]Well, maybe some credits will interest you more?[/say]")

		saynn("There is a short silence soon followed by inmates laughing at your offer.")

		saynn("[sayMale]Really? The fun of fucking a slut through a portal is priceless. Am I right, guys?[/sayMale]")

		saynn("They cheer and laugh more, it seems persuading them will be harder than you think.")

		addButtonWithChecks("Offer 20 creds", "Make an offer", "offer_20_creds", [], [[ButtonChecks.HasCredits, 20]])
		addButton("Intimidate", "Threaten to use force to get your private bits back!", "intimidate")
		addButton("Just watch", "Maybe you should let them have some fun with you", "just_watch")

	if(state == "offer_20_creds"):
		# (You flash a 20 cred chip)

		# (They think and decide its not worth it, they can have all the fun they want)

		# (Someone does agree though and tries to give you the fleshlight)

		# (But others don’t like it so there is a fight starting between them as you throw the credits into air)

		# (You sneakily steal the fleshlights)

		saynn("You decide to go for it still. After waiting until everyone is calm, you produce a chip with about twenty creds on it and wave it a bit.")

		saynn("You see some interest in the eyes of all inmates. They then look at each other.")

		saynn("[say=pc]Twenty creds that can get you so much. Or one fuck. I think the choice is obvious?[/say]")

		saynn("[sayMale]Yeah, we can fuck you and then take the creds, slut.[/sayMale]")

		saynn("You didn’t expect that reaction. Inmates look at your fleshlights even more lustfully, some even begin to pull their shorts down.")

		saynn("Huh. You suddenly come up with a crazy idea. You get everyone’s attention again and then throw the chip into the crowd. It makes noise as it ricochets from a few heads and then hits the floor somewhere.")

		saynn("Inmates gasp and realize how easy they can get your creds, they all begin searching for them until somebody picks them up. But that’s when another inmate decides to punch the first, starting a huge fight!")

		saynn("[say=pc]Oops..[/say]")

		saynn("Yeah, it worked too well, the whole crowd suddenly starts punching and kicking each other while trying to get to your creds. All the while you sneakily steal your unattended fleshlights and quickly make your way!")

		saynn("Phew! Gotta return them to Alex now.")

		# (scene ends)
		addButton("Continue", "That was easy", "endthescene")




	if(state == "just_watch"):
		playAnimation(StageScene.SexFreeStanding, "tease", {pc=getSomeoneWithDick(), npc="pc", npcBodyState={naked=true}})
		
		# (You don’t do anything and watch your holes getting teased)

		# (They start fucking your holes in your view)

		# (If has cock then they make you fuck yourself later)

		# (After lots of fucking, they leave the cum leaking fleshlights on the floor and leave)

		saynn("Bright blush shines on your cheeks, you’re not even sure if you should do anything, them playing with your private bits feels kinda nice after all..")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("One of the inmates keeps sliding his digits in and out of your aroused sex while watching you squirm and try to close the legs.")

		# (else)
		else:
			saynn("One of the inmates keeps sliding his digits in and out of your aroused {pc.analStretch} anus while watching you squirm and try to close the legs.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("One of the girls keeps teasing your chastity cage before hugging it between her generous breasts. Too bad you can’t really feel her grinding your cage against her tits..")
		elif(GM.pc.hasPenis()):
			saynn("One of the girls keeps stroking your cock before hugging it between her generous breasts and grinding your shaft like that. Feels so fucking good.")

		saynn("[sayMale]You like it, huh?[/sayMale]")

		# (if not naked)
		if(!GM.pc.isFullyNaked()):
			saynn("Someone walks up behind you and starts undressing you! He undoes and removes all the clothing, leaving you in nothing but the portal panties. You don’t resist much, all the teasing made you quite horny for more attention and this surely will provide some.")

		saynn("You’re mostly naked. And quite needy too, your own hands slide over your {pc.masc} body, sometimes going over your {pc.breasts} as well. All the while your bits are getting teased and prodded by all the inmates. Some of them began pulling their shorts down, exposing cocks and stroking themselves!")

		saynn("[sayMale]Who’s first?[/sayMale]")

		saynn("The question makes you feel quite excited, you see many inmates lining up to use you.")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("The first hard cock pierces your moist pussy folds, making you moan and get down to your knees. The canine shaft stretches you enough and starts sliding in and out at a steady rate, letting you get used to the size and girth.")

			saynn("All the while, someone else’s cock prods at your tailhole a few times before applying substantially more pressure and sinking into the other fleshlights. Fuck, are they really gonna fuck both of your holes at the same time.")

			saynn("The answer is quite obvious, inmates get a better grasp on the fleshlights and use them for their purpose, pleasuring themselves with your needy fuckholes. And you don’t really mind, you love the experience, more moans escape from you while the cocks pound you from a distance.")

			# (if has cock)
			if(GM.pc.hasPenis() && !GM.pc.isWearingChastityCage()):
				saynn("One of the girls seems like she wants to be on a safe side, she puts a condom over your hard shaft before exposing her pussy slit and stuffing it with your length, using your {pc.cock} as a dildo.")

			saynn("Other inmates are awaiting their turn or just stroke themselves while watching you squirming around on the floor, the sight of a moving bump on your belly is quite hot.")

			saynn("So much onslaught is done to your bits, your first climax overwhelms you very soon, causing you to arch your back and throw your head back, moaning into the air while the inmates around begin firing the loads, covering you with their seed.")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("Your cock shoots out a weak load through the chastity cage! Your {pc.cum} lands on the breasts of the curious girl.")
			elif(GM.pc.hasPenis()):
				saynn("Your cock stuffs the condom inside the girl full of your {pc.cum}. She takes it out and quickly ties it up so nothing leaks out.")

			saynn("Your holes get tight around the intruding cocks, a few moments later you hear some manly grunts and then feel your womb and butt getting stuffed with virile seed!")

			saynn("[sayMale]Fuck, {pc.he} is good.[/sayMale]")

		# (if NO pussy)
		else:
			saynn("The first hard cock pierces your {pc.analStretch} star, making you moan and get down to your knees. The canine shaft stretches you enough and starts sliding in and out at a steady rate, letting you get used to the size and girth.")

			saynn("Someone else tries to join them but two cocks are a bit much for you. For now at least.")

			saynn("The inmate gets a better grasp on the fleshlights and uses it for its purpose, pleasuring himself with your needy fuckhole. And you don’t really mind, you love the experience, more moans escape from you while the cock pounds you from a distance.")

			# (if has cock)
			if(GM.pc.hasPenis() && !GM.pc.isWearingChastityCage()):
				saynn("One of the girls seems like she wants to be on a safe side, she puts a condom over your hard shaft before exposing her pussy slit and stuffing it with your length, using your {pc.cock} as a dildo.")

			saynn("Other inmates are awaiting their turn or just stroke themselves while watching you squirming around on the floor, the sight of a moving bump on your belly is quite hot.")

			saynn("So much onslaught is done to your bits, your first climax overwhelms you very soon, causing you to arch your back and throw your head back, moaning into the air while the inmates around begin firing the loads, covering you with their seed.")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("Your cock shoots out a weak load through the chastity cage! Your {pc.cum} lands on the breasts of the curious girl.")
			elif(GM.pc.hasPenis()):
				saynn("Your cock stuffs the condom inside the girl full of your {pc.cum}. She takes it out and quickly ties it up so nothing leaks out.")

			saynn("Your fuckhole gets tight around the intruding cock, a few moments later you hear some manly grunts and then feel your butt getting stuffed with virile seed!")

			saynn("[sayMale]Fuck, {pc.he} is good.[/sayMale]")

		addButton("Continue", "Fun times!", "continue3")

	if(state == "continue3"):
		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("After the inmates are done using your fleshlights, another two take their place, already exposing their hard cocks and thrusting inside your used fuckholes, not even letting them leak the excess cum out first.")

			saynn("So much pleasure, your eyes start to roll up slightly after each thrust, tongue rolls out the mouth and drools a bit, your hands keep rubbing your body.")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("Another, much more brave girl, grabs the fleshlight with your locked cock and cleans it with her tongue before trapping the device between her legs. She then starts lowering herself onto it, the tip of your chastity cage gently kisses her pussy lips before she proceeds to grind you, the only thing she can do with that cage on you. But she seems to be enjoying herself nonetheless.")
			elif(GM.pc.hasPenis()):
				saynn("Another, much more brave girl, grabs the fleshlight with your cock and cleans it with her tongue before trapping the device between her legs. She then starts lowering herself onto it, the tip of your shaft gently kisses her pussy lips before spreading them open and sliding inside. After she gets used to your size, she starts riding the toy, using your dick for her pleasure.")

			saynn("More inmates force themselves over the edge, covering you with extra semen and making you look so messy. More passionate love noises escape from you while you watch your holes getting fucked so effortlessly.")

			saynn("The guys quickly pick up the pace and efficiently fuck you, never leaving at least one hole without a dick. Soon they also reach their peaks, grunting as their cocks start snowballing your holes, stuffing them with more cum while the old one is still there. Your womb is full to the brim already. And soon, another climax overwhelms you as well, making your body shiver and your legs shake from involuntary muscle contractions.")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("The girl grinding your chastity cage moans and has her share of the pie as well, your member starts shooting weak spurts of {pc.cum} that land on her pussy.")
			elif(GM.pc.hasPenis()):
				saynn("The girl riding your cock moans and has her share of the pie as well, your {pc.cock} starts shooting {pc.cum} directly into her womb, stuffing her full.")

			saynn("The guys then pull out, leaving your holes to gape and leak for a bit.")

			# (if has cock)
			if(GM.pc.hasPenis() && !GM.pc.isWearingChastityCage()):
				saynn("Another female inmate then steals two of the fleshlights, one with your cock and one with your pussy. She starts rubbing your cock against your own slit, sending shivers down your spine.")

				saynn("[sayFemale]I wonder, can we make that slut fuck {pc.himself}? Beg for it~[/sayFemale]")

		# (if NO pussy)
		else:
			saynn("After the inmate is done using your fleshlights, another two take his place, already exposing their hard cocks and thrusting inside your used fuckhole, both in the same one, not even letting it leak the excess cum out first.")

			saynn("So much pleasure, your eyes start to roll up slightly after each thrust, tongue rolls out the mouth and drools a bit, your hands keep rubbing your body.")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("Another, much more brave girl, grabs the fleshlight with your locked cock and cleans it with her tongue before trapping the device between her legs. She then starts lowering herself onto it, the tip of your chastity cage gently kisses her pussy lips before she proceeds to grind you, the only thing she can do with that cage on you. But she seems to be enjoying herself nonetheless.")
			elif(GM.pc.hasPenis()):
				saynn("Another, much more brave girl, grabs the fleshlight with your cock and cleans it with her tongue before trapping the device between her legs. She then starts lowering herself onto it, the tip of your shaft gently kisses her pussy lips before spreading them open and sliding inside. After she gets used to your size, she starts riding the toy, using your dick for her pleasure.")

			saynn("More inmates force themselves over the edge, covering you with extra semen and making you look so messy. More passionate love noises escape from you while you watch your hole getting fucked so effortlessly.")

			saynn("The guys quickly pick up the pace and efficiently fuck you, never leaving your fuckhole without a dick. Soon they also reach their peaks, grunting as their cocks start snowballing you, stuffing your butt with more cum while the old one is still there. And soon, another climax overwhelms you as well, making your body shiver and your legs shake from involuntary muscle contractions.")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("The girl grinding your chastity cage moans and has her share of the pie as well, your member starts shooting weak spurts of {pc.cum} that land on her pussy.")
			elif(GM.pc.hasPenis()):
				saynn("The girl riding your cock moans and has her share of the pie as well, your {pc.cock} starts shooting {pc.cum} directly into her womb, stuffing her full.")

			saynn("The guys then pull out, leaving your hole to gape and leak for a bit.")

			# (if has cock)
			if(GM.pc.hasPenis() && !GM.pc.isWearingChastityCage()):
				saynn("Another female inmate then steals both fleshlights, one with your cock and one with your anus. She starts rubbing your cock against your own ring, sending shivers down your spine.")

				saynn("[sayFemale]I wonder, can we make that slut fuck {pc.himself}? Beg for it~[/sayFemale]")

		addButton("More", "You just want more", "more")
		if(!GM.pc.isWearingChastityCage()):
			addButtonWithChecks("Self-fuck", "That sounds too hot to pass up", "self-fuck", [], [ButtonChecks.HasPenis])
		else:
			addButton("Self-fuck", "You can't do that with chastity on :(")

	if(state == "self-fuck"):
		# (needs cock)
		randomSexShouldStop = true
		playAnimation(StageScene.SexPortalProxy, "fast", {pc=femaleNpcID, npc="pc", npcBodyState={hard=true, naked=true}})

		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("Your eyes glow from lust while watching your own cock twitching and dripping over your own slit.")

			saynn("[say=pc]Please..[/say]")

			saynn("[sayFemale]Hmm-m~[/sayFemale]")

			saynn("The girl lets the tip of your cock brush against your own sensitive folds, the sensations of two sensitive organs rubbing against each other are too good, you become desperate.")

			saynn("[say=pc]Ple-ease, let me feel it.. Just stick it in..[/say]")

			saynn("She hums some more, deciding how much more she wants to humiliate you.")

			saynn("[sayFemale]Fi-ine~[/sayFemale]")

			saynn("Finally, she starts moving the fleshlights closer, your cock puts pressure on your own slit, spreading it open, before slowly sliding inside. You gasp and squirm from the feeling of your own bits rubbing against each other.")

			saynn("The girl then starts playfully slide the pussy fleshlight along your length, making you fuck yourself. More moans escape from your lips while your own cock is pounding at your cervix. To any random person it might look strange, girl using a toy to fuck another toy. But it feels so good, any time you clench you get closer to your climax.")

			saynn("[sayFemale]Gonna breed yourself~? You have so much cum in there but maybe yours will be lucky~?[/sayFemale]")

		# (if NO pussy)
		else:
			saynn("Your eyes glow from lust while watching your own cock twitching and dripping over your own butthole.")

			saynn("[say=pc]Please..[/say]")

			saynn("[sayFemale]Hmm-m~[/sayFemale]")

			saynn("The girl lets the tip of your cock brush against your own {pc.analStretch} ring, the sensations of two sensitive organs rubbing against each other are too good, you become desperate.")

			saynn("[say=pc]Ple-ease, let me feel it.. Just stick it in..[/say]")

			saynn("She hums some more, deciding how much more she wants to humiliate you.")

			saynn("[sayFemale]Fi-ine~[/sayFemale]")

			saynn("Finally, she starts moving the fleshlights closer, your cock puts pressure on your own star, spreading it open, before slowly sliding inside. You gasp and squirm from the feeling of your own bits rubbing against each other.")

			saynn("The girl then starts playfully slide the tailhole fleshlight along your length, making you fuck yourself. More moans escape from your lips while your own cock is pounding your ass. To any random person it might look strange, girl using a toy to fuck another toy. But it feels so good, any time you clench you get closer to your climax.")

			saynn("[sayFemale]Gonna cum inside yourself~?[/sayFemale]")

		addButton("Cum!", "Cum inside yourself", "cum_inside_self")

	if(state == "cum_inside_self"):
		playAnimation(StageScene.SexPortalProxy, "inside", {pc=femaleNpcID, npc="pc", npcBodyState={hard=true, naked=true}})

		
		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("The girl starts sliding the pussy fleshlight faster, causing it to make wet noises as your {pc.cock} is hammering at your pleasure point while keeping the folds stretched open.")

			saynn("More passionate moans can be heard from you as the climax waves make you quiver and shake. Your cock starts throbbing and pulsating before shooting sticky hot {pc.cum} inside your own pussy, adding to what is currently in your womb already. It feels so good, your own pussy is milking your balls dry.")

			saynn("[say=pc]F-fu-uck..[/say]")

			saynn("[sayFemale]Yeah, fill that slutty pussy~[/sayFemale]")

			saynn("The girl pulls your cock out of your pussy and offers you a great view, she moves the fleshlight with your used sex closer to your face, letting you see in great detail the amount of cum stuffed inside you.")

			saynn("You’re ready to black out from so much pleasure.")

		# (if NO pussy)
		else:
			saynn("The girl starts sliding the tailhole fleshlight faster, causing it to make wet noises as your {pc.cock} is hammering at your pleasure point while keeping the ring stretched open.")

			saynn("More passionate moans can be heard from you as the climax waves make you quiver and shake. Your cock starts throbbing and pulsating before shooting sticky hot {pc.cum} inside your own ass, adding to what is currently in it already. It feels so good, your own fuckhole is milking your balls dry.")

			saynn("[say=pc]F-fu-uck..[/say]")

			saynn("[sayFemale]Yeah, fill that slutty ass~[/sayFemale]")

			saynn("The girl pulls your cock out of your anus and offers you a great view, she moves the fleshlight with your used sex closer to your face, letting you see in great detail the amount of cum stuffed inside you.")

			saynn("You’re ready to black out from so much pleasure.")

		addButton("Continue", "See what happens next", "continue4")

	if(state == "more"):
		saynn("More and more inmates use you, eventually you lose count even. Dicks get freely shoved inside the fleshlight, fuck you through it and then stuff you with more cum.")

		saynn("You start blacking out from so much pleasure..")

		addButton("Continue", "See what happens next", "continue4")

	if(state == "continue4"):
		playAnimation(StageScene.Solo, "stand")
		randomSexShouldStop = true
		saynn("After all the inmates were mostly satisfied, they just started scattering, leaving a messy you on the floor.")

		saynn("But hey, at least they left all the fleshlights to you. They’re all covered in cum so that’s probably why nobody wants to touch them anymore.")

		saynn("You catch your breath and gather your toys before preparing to leave. Gotta return the fleshlights to Alex so he can finally take the portal panties off of you. Although you’re not sure yet if you want them removed..")

		# (scene ends)

		addButton("Continue", "That was fun", "endthescene")

var randomSexIsPlaying = false
var randomSexShouldStop = false
func playRandomSexAnim():
	if(randomSexIsPlaying):
		return
	randomSexShouldStop = false

	while(true):
		if(npcsToUse.size() > 0):
			var randNPC = RNG.pick(npcsToUse)
			playAnimation(StageScene.SexPortal, RNG.pick(["sex", "fast"]), {pc=randNPC, npc="pc", npcBodyState={naked=true}, bodyState={exposedCrotch=true,hard=true}})
		
		randomSexIsPlaying = true
		yield(get_tree().create_timer(4.0 + RNG.randf_range(0.0, 4.0)/Util.maxi(1, npcsToUse.size())), "timeout")
		if(randomSexShouldStop):
			randomSexIsPlaying = false
			return

func getSomeoneWithDick():
	var thenpc = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true})
	if(thenpc == null || thenpc == ""):
		return "inmateMaleCanine"
	GM.main.updateCharacterUntilNow(thenpc)
	return thenpc

func getAFemale():
	var thenpc = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.Gender, Gender.Female], [NpcCon.HasReachableVagina]], InmateGenerator.new(), {NpcGen.HasVagina: true})
	if(thenpc == null || thenpc == ""):
		return "inmateMaleCanine"
	GM.main.updateCharacterUntilNow(thenpc)
	return thenpc

func _react(_action: String, _args):
	if(_action == "fight"):
		runScene("FightScene", ["stud"], "studfight")
	
	if(_action == "creampie!"):
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy("stud")
			GM.pc.cummedInVaginaBy("stud")
		else:
			GM.pc.gotAnusFuckedBy("stud")
			GM.pc.cummedInAnusBy("stud")
		
		GM.pc.orgasmFrom("stud")
		GM.pc.addSkillExperience(Skill.SexSlave, 10, "portalpanties_studfuck")
		
	if(_action == "continue2"):
		var pickedInmate = getSomeoneWithDick()
		var pickedInmate2 = getSomeoneWithDick()
		npcsToUse = [pickedInmate, pickedInmate2]
		playRandomSexAnim()
		
		GM.pc.cummedOnBy(RNG.pick(npcsToUse))
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy(pickedInmate)
			GM.pc.cummedInVaginaBy(pickedInmate)
			GM.pc.gotAnusFuckedBy(pickedInmate2)
			GM.pc.cummedInAnusBy(pickedInmate2)
			GM.pc.orgasmFrom(pickedInmate)
			GM.pc.addTallymarkCrotch()
			GM.pc.addTallymarkButt()
		else:
			GM.pc.gotAnusFuckedBy(pickedInmate)
			GM.pc.cummedInAnusBy(pickedInmate)
			GM.pc.gotAnusFuckedBy(pickedInmate2)
			GM.pc.cummedInAnusBy(pickedInmate2)
			GM.pc.orgasmFrom(pickedInmate)
			GM.pc.addTallymarkButt()
			GM.pc.addTallymarkButt()
			
		GM.pc.addSkillExperience(Skill.SexSlave, 10, "portalpanties_gangfuck")
		addMessage("Someone keeps track of the amount of times you were fucked")
		var zone = BodyWritingsZone.getRandomZone()
		GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
		addMessage("Someone also left a memento on your "+BodyWritingsZone.getZoneVisibleName(zone)+"..")
	
	if(_action == "continue3"):
		var pickedInmate = getSomeoneWithDick()
		var pickedInmate2 = getSomeoneWithDick()
		npcsToUse.append_array([pickedInmate, pickedInmate2])
		playRandomSexAnim()
		
		GM.pc.cummedOnBy(RNG.pick(npcsToUse))
		GM.pc.cummedOnBy(RNG.pick(npcsToUse))
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy(pickedInmate)
			GM.pc.cummedInVaginaBy(pickedInmate)
			GM.pc.gotAnusFuckedBy(pickedInmate2)
			GM.pc.cummedInAnusBy(pickedInmate2)
			GM.pc.orgasmFrom(pickedInmate)
			GM.pc.addTallymarkCrotch()
			GM.pc.addTallymarkButt()
		else:
			GM.pc.gotAnusFuckedBy(pickedInmate)
			GM.pc.cummedInAnusBy(pickedInmate)
			GM.pc.gotAnusFuckedBy(pickedInmate2)
			GM.pc.cummedInAnusBy(pickedInmate2)
			GM.pc.orgasmFrom(pickedInmate)
			GM.pc.addTallymarkButt()
			GM.pc.addTallymarkButt()
			
		var zone = BodyWritingsZone.getRandomZone()
		GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
		addMessage("Someone also left a memento on your "+BodyWritingsZone.getZoneVisibleName(zone)+"..")
	
	if(_action == "more"):
		for _i in range(RNG.randi_range(3,5)):
			var randValue = RNG.randi_range(0, 100)
			if(randValue < 40 && GM.pc.hasVagina()):
				var pickedInmate = getSomeoneWithDick()
				npcsToUse.append(pickedInmate)
				
				GM.pc.gotVaginaFuckedBy(pickedInmate)
				GM.pc.cummedInVaginaBy(pickedInmate)
				GM.pc.addTallymarkCrotch()
			elif(randValue < 80):
				var pickedInmate = getSomeoneWithDick()
				npcsToUse.append(pickedInmate)
				
				GM.pc.gotAnusFuckedBy(pickedInmate)
				GM.pc.cummedInAnusBy(pickedInmate)
				GM.pc.addTallymarkButt()
			else:
				GM.pc.cummedOnBy(RNG.pick(npcsToUse))
				
				var zone = BodyWritingsZone.getRandomZone()
				GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
				addMessage("Someone left a memento on your "+BodyWritingsZone.getZoneVisibleName(zone)+"..")
	
	if(_action == "cum_inside_self"):
		randomSexShouldStop = true
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy("pc")
			GM.pc.cummedInVaginaBy("pc")
			GM.pc.addTallymarkCrotch()
		else:
			GM.pc.gotAnusFuckedBy("pc")
			GM.pc.cummedInAnusBy("pc")
			GM.pc.addTallymarkButt()
		GM.pc.orgasmFrom("pc")
	
	if(_action == "self-fuck"):
		femaleNpcID = getAFemale()
	
	if(_action in ["continue4", "leave!", "offer_20_creds"]):
		addMessage("Task was updated")
		addExperienceToPlayer(50)
		
	if(_action == "offer_20_creds"):
		GM.pc.addCredits(-20)
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "studfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("if_won")
			addExperienceToPlayer(60)
			addMessage("Task was updated")
		else:
			setState("if_lost")
			addExperienceToPlayer(30)

func getDevCommentary():
	return "This scene is fun x3. Just because one of the options involves you fucking yourself. Why can't you do that outside of this scene?.. Because I'm lazy.. It would require me to change the logic a little.. have the fleshlight be an actual item.. or like.. one for each hole/dick?.. Just like, thinking about how I should implement it is kinda exhausting already. But if you wanna write that yourself, go ahead ^^."

func hasDevCommentary():
	return true

func saveData():
	var data = .saveData()
	
	data["npcsToUse"] = npcsToUse
	data["femaleNpcID"] = femaleNpcID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcsToUse = SAVE.loadVar(data, "npcsToUse", [])
	femaleNpcID = SAVE.loadVar(data, "femaleNpcID", "inmateMaleCanine")
