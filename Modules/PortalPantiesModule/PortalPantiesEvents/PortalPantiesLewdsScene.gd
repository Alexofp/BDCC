extends "res://Scenes/SceneBase.gd"

var cockType = "canine"
var npcID = ""

func _init():
	sceneID = "PortalPantiesLewdsScene"

func _reactInit():
	cockType = RNG.pick([
		"canine",
		"feline",
		"dragon",
		"equine",
		"generic",
	])

	var possible = [
		"anal",
	]
	if(GM.pc.hasVagina()):
		possible.append("vaginal")
	if(GM.pc.hasPenis() && !GM.pc.isWearingChastityCage() && !GM.pc.hasReachablePenis()):
		possible.append("cock")
		possible.append("cock")

	setState(RNG.pick(possible))
	
	if(state == "cock"):
		setState(RNG.pick([
			"cockSuck",
			"cockTeaseThighs",
			"cockVaginal",
			"cockAnal",
			"cockCondom",
			"cockStroking",
			"cockWarming",
		]))
	
	if(state in ["anal", "vaginal"]):
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true})
	elif(state in ["cockTeaseThighs", "cockVaginal", "cockCondom"]):
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasReachableVagina]], InmateGenerator.new(), {NpcGen.HasVagina: true})
	else:
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new(), {})
	if(npcID == null || npcID == ""):
		npcID = "inmateMaleCanine"
	GM.main.updateCharacterUntilNow(npcID)
	
	var theChar:BaseCharacter = getCharacter(npcID)
	if(theChar != null):
		if(theChar.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisRidges)):
			cockType = "dragon"
		elif(theChar.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisFlare)):
			cockType = "equine"
		elif(theChar.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisBarbs)):
			cockType = "feline"
		elif(theChar.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)):
			cockType = "canine"
		else:
			cockType = "generic"
		
	GM.pc.addCredits(1)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():

	if(state == "vaginal"):
		playAnimation(StageScene.SexPortal, RNG.pick(["sex", "fast"]), {pc=npcID, npc="pc", bodyState={exposedCrotch=true,hard=true}})
		
		# (if has pussy)
		if(cockType == "canine"):
			saynn(RNG.pick([
				"A canine cock is brushing against your pussy folds before finding the pussy hole and sliding inside! You feel the knot slapping against your slit as they try to shove it in too.",
				"Oh, you were busy with something when a knotted canine cock decided to penetrate your pussy through the portal panties!",
				"A gasp escapes from your lips as you feel your private pussy folds get spread by a canine cock, someone has found the fleshlight!",
			]))
		if(cockType == "feline"):
			saynn(RNG.pick([
				"Someone’s cock suddenly gets thrusted into your pussy slit! It has barbs, causing you to let out a muffled noise of surprise.",
				"Some person has found a fleshlight with your pussy sticking out and decided to shove their feline cock in! You feel the barbs brushing against your soft flesh.",
				"A barbed feline cock gets shoved into your {pc.pussyStretch} pussy, spreading its folds! You try to find a good spot nearby to wait it out.",
			]))
		if(cockType == "dragon"):
			saynn(RNG.pick([
				"A dragon cock teasingly grinds against your pussy folds, letting you feel its ribbed texture, before roughly thrusting inside!",
				"Your lips let out a moan as a dragon cock finds your pussy and starts fucking you raw!",
				"Someone’s cock rubs against your pussy before stretching it open and sliding inside! You feel its rubbed texture massaging your soft inner walls.",
			]))
		if(cockType == "equine"):
			saynn(RNG.pick([
				"A bulky flared cock’s tip is suddenly putting pressure on your {pc.pussyStretch} pussy! You don’t believe that it will fit but the horse cock proves you wrong by stretching you out enough to slide in.",
				"A huge horse cock is brushing its flared head against your slit before suddenly forcibly spreading the petals aside and proceeding to fuck you through the portal panties!",
				"Someone has picked up the fleshlight and is now teasing your pussy with their horse cock. The flared head is leaking pre all over your folds before sinking in and stretching your slit  enough to start pounding it.",
			]))
		if(cockType == "generic"):
			saynn(RNG.pick([
				"A {npc.penis} is rubbing against your sex, making the folds moist before sliding inside and proceeding to fuck you through the portal panties!",
				"You feel that the fleshlight with your pussy sticking out was picked up by someone! A {npc.penis} is then pressed against your sensitive folds, spreading them open before sliding in and fucking you!",
				"Someone’s hard cock suddenly gets shoved deep into your pussy through your portal panties!",
			]))
			
		if(GM.pc.getLust() >= 50):
			saynn("You whisper to yourself lustfully.")
			
			saynn(RNG.pick([
				"[say=pc]F-fuck.. yeah..[/say]",
				"[say=pc]Yes-s~..[/say]",
				"[say=pc]Please, fuck me~[/say]",
				"[say=pc]Yes, go raw on me~[/say]",
				"[say=pc]I need this so much..[/say]",
				"[say=pc]My pussy is getting used like a fleshlight~[/say]",
			]))
		else:
			saynn("You whisper to yourself quietly.")
			
			saynn(RNG.pick([
				"[say=pc]It’s happening again..[/say]",
				"[say=pc]I’m getting fucked..[/say]",
				"[say=pc]Oh fuck..[/say]",
				"[say=pc]Oh no..[/say]",
				"[say=pc]I’m not a fleshlight..[/say]",
				"[say=pc]It will never stop, will it..[/say]",
			]))

		addButton("Continue", "You’re getting fucked!", "vaginal_cum")
		
	if(state == "vaginal_cum"):
		playAnimation(StageScene.SexPortal, RNG.pick(["inside", "fast"]), {pc=npcID, npc="pc", bodyState={exposedCrotch=true,hard=true}})
		
		saynn(RNG.pick([
			"The cock gradually picks up the pace, fucking your sex through the portal panties while you can’t do anything about it. Your pussy becomes slick with your juices, allowing your sex to be pounded nice and rough!",
			"You can’t do anything to stop them even if you wanted to, their eager cock is using your slit as if it's a real fleshlight, delivering you all the pleasure in the process.",
			"Portal panties means you can’t even see who is fucking you. All you feel is their cock pounding your slit with zero concerns about your opinion. And the pleasure it offers slowly drives you insane. Who would have thought that portal panties can be so hot.",
			"You can’t help but to moan while having your fuckhole used like you are some kind of fucktoy. A slight bump is moving up and down on your belly as the cock slides inside.",
			"More pleasure noises escape from you as the cock starts pounding your slit faster. You really hope no one sees you like this.",
			"You look around, hoping no one sees you getting pounded out in the public like that. Your cheeks blush red, you feel yourself getting close to an orgasm.",
		]))
		
		if(cockType == "canine"):
			saynn(RNG.pick([
				"The canine cock ravages your pussy and then shoves its knot inside. You gasp and cover your mouth while your slit clenches around the meaty orb and squirts with your female juices. A second later you feel your womb getting stuffed with someone’s cum! Someone is breeding you and you don’t even know who!",
				"The cock pounds at your cervix, quickly sending you over the edge. You cum as your body starts to squirm and shiver from the pleasure waves. And at the same time, you’re getting knotted! The whole canine member fits inside you, twitching and throbbing as it stuffs your womb full of its cum!",
			]))
		if(cockType == "feline"):
			saynn(RNG.pick([
				"The feline cock rakes at your inner walls as it thrusts in and out, causing extra sensations. It doesn’t take long until you feel the peak coming close. And the dick seems to be about to cum too, you feel it throbbing and then suddenly bursting with seed. You shut your mouth and cover it as your pussy starts clenching around the shaft, milking it for all its cum. It feels so good, being bred by some stranger’s cock.",
				"The cock smashes your cervix and tries to break through it, you feel the barbs getting stiffer as the dick is about to cum. You clench and shut your legs as the orgasm overwhelms you, not making any noises is so hard right now. And a second later, you feel the feline cock penetrating your natural barricade and scratching at your womb as it starts stuffing it full of its virile seed. Fuck, did someone just breed you, thinking your pussy was just a part of a fleshlight?",
			]))
		if(cockType == "dragon"):
			saynn(RNG.pick([
				"The dragon cock’s thrusts become faster and more powerful, its ribbed structure is quickly sending you over the edge. You bite your lip and let out a passionate moan as your pussy starts clenching around the intruding member. And soon enough, you feel hot sticky cum getting stuffed into your womb completely unceremoniously. Someone really just used you like you were some kind of pleasure toy.",
				"The cock starts thrusting harder against your cervix, smashing it each time and making your eyes roll up from a sure amount of pleasure. Little shivers quickly turn into full blown squirming, you let out a muffled moan as the orgasmic waves hit your poor mind. Your pussy walls feel the shaft’s ribbed texture as they clench around it, a few seconds later you feel something hot and sticky stuffing your womb full, it’s dragon cum! The cock then quickly gets pulled out, leaving your slit to leak cum until somebody else decides to use you. You just got fucked by some stranger.",
			]))
		if(cockType == "equine"):
			saynn(RNG.pick([
				"The horse cock is pounding at your cervix and smashes your pleasure point each time it slides in. You feel like you won’t be able to endure it for long, your pussy walls start clenching around the fat flared shaft as you both cum! The stranger starts emptying their balls inside you, quickly stuffing your womb to the brim and causing your belly to suddenly look very bumpy. And it feels good, you let your tongue out and drool while some stud is breeding you rough.",
				"The flared tip of the cock is pounding your cervix, causing a huge spike of pleasure. Your poor {pc.pussyStretch} pussy is stretched open wide for that stallion cock while it slides in and out. You hide your face from everyone and start moaning lustfully as your sex squirts from overstimulation. And a second later you feel the horse cock inflating even more as it starts shooting its sticky virile seed directly into your womb, claiming it. Your legs shake and really want to give up, you’re being bred by someone you can’t see! And just as quick, the flared cock is pulled out of your used fuckhole, leaving the fleshlight to leak cum.",
			]))
		if(cockType == "generic"):
			saynn(RNG.pick([
				"The {npc.penis} ravages your slit nice and fast, the tip is brushing against your natural barricade while also rubbing your pleasure point. You put a palm on your belly and feel it move inside you. You can’t stop the moans from escaping your lips, the orgasm creeps closer until finally overwhelming your body, making you squirm and shiver. The cock cums inside you soon after, stuffing your womb with its seed. Someone just used you as a cum dump.",
				"You can’t endure it for long, the {npc.penis} quickly pushes you over the edge and causes your climax to overwhelm you. Your legs shiver and shake while your pussy gets tight around the shaft, causing it to cum soon after, stuffing your womb full of its seed. Then it just gets pulled out, leaving your {pc.pussyStretch} slit to slowly tighten up and leak jizz.",
			]))
		
		addButton("Continue", "So much cum..", "endthescene")


	if(state == "anal"):
		playAnimation(StageScene.SexPortal, RNG.pick(["sex", "fast"]), {pc=npcID, npc="pc", bodyState={exposedCrotch=true,hard=true}})
		
		if(cockType == "canine"):
			saynn(RNG.pick([
				"You grab onto your panties when you realize that someone’s cock has found the portal with your {pc.analStretch} tailhole sticking out. Its canine pointy head is prodding at your sensitive flesh and then applies enough pressure to slide in and start fucking you!",
				"You feel something happening inside your panties, someone’s knotted cock is brushing against your {pc.analStretch} anus. You let out a small gasp as your butt then gets violated without much prelude.",
				"Someone has found the fleshlight with your anus! You feel somebody spit on your tailhole soon followed by a canine cock roughly shoving itself down your nethers.",
			]))
		if(cockType == "feline"):
			saynn(RNG.pick([
				"Someone’s cock is prodding at your tailhole, finding the right angle just to then roughly thrust inside, stretching you out! You feel its tip having barbs, they scratch at your soft inner walls.",
				"Some person has found a fleshlight that features your anus on it! You feel the barbs brushing against your soft flesh as someone’s cock starts to slide in and out, fucking you.",
				"You grasp onto the nearby wall as you feel someone suddenly shoving their feline cock down your {pc.analStretch} tailhole, they clearly want to fuck you rough!",
			]))
		if(cockType == "dragon"):
			saynn(RNG.pick([
				"A dragon cock teasingly prods at your tailhole before stretching it open and sliding inside, letting you feel its ribbed texture!",
				"Your lips let out a moan as a dragon cock finds your {pc.analStretch} butthole and starts fucking you raw!",
				"Someone’s cock rubs against your backdoor, covering it with pre. It then gets pressed against your star and applies enough pressure to sink inside, violating your butt! You feel its rubbed texture massaging your soft inner walls as it starts fucking you.",
			]))
		if(cockType == "equine"):
			saynn(RNG.pick([
				"A muffled gasp escapes from your lips as you feel a flared cock pressed against your tailhole. Its tip is huge but they got enough strength to shove their fat shaft down your star and start fucking it!",
				"A bulky horse cock is brushing its flared head against your anus before forcibly spreading it wide open and fucking you through the portal in your panties!",
				"You feel a warm string of pre landing on your butthole a few seconds before someone's horse cock is forcing itself inside, stretching your star wide open.",
			]))
		if(cockType == "generic"):
			saynn(RNG.pick([
				"Someone’s {npc.penis} is rubbing against your backdoor, making it moist from precum before sliding inside and proceeding to fuck you through the portal panties!",
				"A {npc.penis} is pressed against your tailhole, spreading it open before sliding in and proceeding to rail you!",
				"A hard cock suddenly gets shoved deep into your butthole through your portal panties!",
			]))
			
		if(GM.pc.getLust() >= 50):
			saynn("You whisper to yourself lustfully.")
			
			saynn(RNG.pick([
				"[say=pc]F-fuck.. yeah..[/say]",
				"[say=pc]Yes-s~..[/say]",
				"[say=pc]Please, fuck me~[/say]",
				"[say=pc]Oh no, I’m getting fucked raw again~[/say]",
				"[say=pc]Yeah, stretch my fuckhole..[/say]",
				"[say=pc]Yeah, use that fleshlight~[/say]",
			]))
		else:
			saynn("You whisper to yourself quietly.")
			
			saynn(RNG.pick([
				"[say=pc]It’s happening again..[/say]",
				"[say=pc]My hole is getting used like I’m some fucktoy..[/say]",
				"[say=pc]Oh fuck..[/say]",
				"[say=pc]Oh.. wa-ait..[/say]",
				"[say=pc]I’m not a fleshlight..[/say]",
				"[say=pc]It will never stop, will it..[/say]",
			]))

		addButton("Continue", "You’re getting fucked!", "anal_cum")

	if(state == "anal_cum"):
		playAnimation(StageScene.SexPortal, RNG.pick(["inside", "fast"]), {pc=npcID, npc="pc", bodyState={exposedCrotch=true,hard=true}})
		
		saynn(RNG.pick([
			"The cock gradually picks up the pace, fucking your sex through the portal panties while you can’t do anything about it. Your inner walls become slick with all the precum, allowing your sex to be pounded nice and rough!",
			"You can’t do anything to stop them even if you wanted to, their eager cock is using your tailhole as if it's attached to a real fleshlight, delivering you all the pleasure in the process.",
			"Portal panties means you can’t even see who is fucking you. All you feel is their cock pounding your ass with very little consideration about it. And the pleasure it offers slowly drives you insane. Who would have thought that portal panties can be so hot.",
			"You can’t help but to moan while having your fuckhole used like you are some kind of fucktoy. A slight bump is moving up and down on your belly as the cock slides inside.",
			"More pleasure noises escape from you as the cock starts pounding your butt faster. You really hope no one sees you like this.",
			"You look around, hoping no one sees you getting pounded out in the public like that. Your cheeks blush red, you feel yourself getting close to an orgasm.",
		]))
		
		if(cockType == "canine"):
			saynn(RNG.pick([
				"The canine cock eagerly pounds your tailhole and even shoves its knot inside with its last thrust. You gasp and try to cover your mouth while your insides are clenching around the meaty orb. You feel your nethers getting stuffed with someone’s seed, they are cumming inside you!",
				"The knotted cock pounds your butt rough, quickly sending you past the peak. Your body squirms and quivers from the pleasure waves. And at the same time, the round fat orb slips in too, knotting you! The whole canine member fits inside you, twitching and throbbing as it stuffs your ass full of cum!",
			]))
		if(cockType == "feline"):
			saynn(RNG.pick([
				"The feline cock rakes at your soft anal walls as it thrusts in and out, causing extra sensations. You can’t endure that onslaught on your ass for long, sneaky moans escape from you as your tailhole starts pulsating and clenching around the cock. And very soon after, you feel hot sticky cum flowing deep into your nethers, stuffing your ass! The stranger then pulls his dick out, causing the barbs to scratch at your insides for the last time before leaving the fleshlight alone.",
				"You feel the barbs getting stiffer as the dick inside your butt is about to cum. You clench and close your legs shut as the climax overwhelms you. And as you cum yourself, you feel the feline cock doing a few rough thrusts before stuffing your nethers full of its virile seed. Fuck, did someone just cum inside you, thinking your butthole was just a part of a fleshlight?",
			]))
		if(cockType == "dragon"):
			saynn(RNG.pick([
				"The dragon cock’s thrusts become faster and more powerful, you feel its ribbed texture brush against your inner walls so much, sending you over the edge. That's when the intruding member starts stuffing you full of its seed. You bite your lip and let out a passionate moan as your butt starts clenching around the shaft, milking it hard.",
				"The pace becomes faster, the ribbed cock is fucking you so rough your stretched tailhole probably makes sloppy wet noises. You feel the cock getting twitchy a second before it starts cumming in you, shooting its seed deep down your insides, breeding your ass.",
			]))
		if(cockType == "equine"):
			saynn(RNG.pick([
				"The horse cock gets rammed deep down your fuckhole, stretching the inner walls so much as it slides inside. The flared fat head is brushing against your pleasure point, making you whine from pleasure. Suddenly you feel its glands inflate even more as it starts cumming inside, stuffing your tailhole full to the brim with its seed. Then, just as the quick, the cock gets pulled out, leaving you to gape and leak through the portal panties.",
				"The flared tip of the cock is pounding your ass, providing you with so much pleasure as it smashes your pleasure point. Your poor {pc.analStretch} tailhole is stretched open wide for that stud cock as it rails you. And a second later you feel the horse cock shooting its sticky virile seed deep inside you. Your legs shake and really want to give up, you’re being bred by someone you can’t see! The flared cock is then pulled out of your used fuckhole, leaving the fleshlight to leak cum. Your belly is now way more bumpy than it was.",
			]))
		if(cockType == "generic"):
			saynn(RNG.pick([
				"The {npc.penis} picks up the pace and fucks you at a crazy speed, sliding in and out and not even giving your insides enough time to tighten up before they are spread wide open again. You drop a few rouge moans as you cum from so much stimulation on your pleasure point. The inner walls clench around the shaft as it starts shooting its load deep inside you. You both came at roughly the same moment!",
				"The hard cock throbs and twitches as it fucks you, a few thrusts later it starts to fill your bowels full of its seed. It was too much for you, your body squirms hard while your tailhole clenches around the shaft, milking it.",
			]))
		
		addButton("Continue", "So much cum..", "endthescene")
		
		
		
	if(state == "cockSuck"):
		playAnimation(StageScene.SexPortalOral, RNG.pick(["suck", "suckfast"]), {pc=npcID, npc="pc", npcBodyState={hard=true}})
		
		saynn("You almost forgot that you were wearing these portal panties. But you get reminded of them when you suddenly feel someone’s lips wrapping around the tip of your {pc.cock} and gently sucking on it.")
		
		saynn("Such teasing makes you hard and eager. You look around and hope that nobody is watching. The lips seem to notice your shaft inflating with blood and give it a little kiss before opening wide to let your dick past the teeth. You feel the warm slick walls of someone’s mouth closing around your member and their tongue licking it.")
		
		saynn("Your cock leaks a few drops of pre and the tongue catches them. Then you feel the lips begin to slide across the surface of your dick, sucking you off so well. You wonder if they even realize that they’re sucking a real cock and not some realistic toy.")
		
		addButton("Cum!", "You can’t really control any of this", "cockSuckCum")
		
	if(state == "cockSuckCum"):
		playAnimation(StageScene.SexPortalOral, RNG.pick(["hold", "suck", "suckfast"]), {pc=npcID, npc="pc", npcBodyState={hard=true}})
		
		saynn("You try to stay calm but the little noises of pleasure come out on their own when the lips suddenly go super deep and meet with the base of your cock, deep throating it. Your toes curl up at the feeling of tight throat walls milking your cock. That quickly pushes you over the edge, your {pc.cock} shoots its load deep down into someone’s throat as you arch your back and let out more muffled noises.")
		
		saynn(RNG.pick([
			"[say=pc]Oh fuck..[/say]",
			"[say=pc]Cumming..[/say]",
			"[say=pc]It’s so tight.[/say]",
		]))
		
		saynn("Whoever that is, they seem to eagerly swallow your {pc.cum} before licking your cock until it's clean of any mess.")
		
		addButton("Continue", "Fun times", "endthescene")


	if(state == "cockTeaseThighs"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["tease"]), {pc=npcID, npc="pc", npcBodyState={hard=true}, bodyState={exposedCrotch=true, hard=true}})
		
		saynn("Someone’s digits brush over the surface of your {pc.cock}. They then focus on rubbing the tip, quickly making you hard and lusty, you feel the digits catching your precum and spreading it along the shaft.")
		
		saynn("After teasing you like that, the digits get pulled away, replaced with something quite more soft. You feel your dick trapped between someone’s thighs that then begin sliding back and forth along it, making you feel so good. They grind your cock with their pussy, the sensitive petals are coating your dick with juices, making your shaft more slick. You feel like you won’t endure this for long, your cock is already throbbing, ready to waste its load.")
		
		if(RNG.chance(50)):
			addButton("Cum!", "It's just too much", "cockTeaseThighsCumInside")
		else:
			addButton("Cum!", "It's just too much", "cockTeaseThighsCumOutside")
		
	if(state == "cockTeaseThighsCumInside"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["sex", "fast", "inside"]), {pc=npcID, npc="pc", npcBodyState={hard=true}, bodyState={exposedCrotch=true, hard=true}})
		
		saynn("The thighs still brush against your cock. But just when you’re about to cum, you feel their pussy shifting position and pressing against your cock, the sudden move was enough for you to penetrate their pussy folds and slide into their sex. The wet soft inner walls engulf your cock, forcing you to let out a moan as you cum hard, your {pc.cock} starts shooting waves of {pc.cum} directly into their babymaker, stuffing it full. Makes you wonder if they expected a creampie from a random cock attached to a fleshlight today.")
		
		saynn("The pussy walls milk your cock hard, extracting every last drop. But as their orgasm fades, they just pull your cock out of their stuffed slit and leave you somewhere.")
		
		addButton("Continue", "Fun times", "endthescene")
		
	if(state == "cockTeaseThighsCumOutside"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["tease"]), {pc=npcID, npc="pc", npcBodyState={hard=true}, bodyState={exposedCrotch=true, hard=true}})
		
		saynn("The thighs brush against your cock harder, you feel the pussy squirting all over your length as the stranger on the other end starts to cum. And that’s when you reach your peak and cum too, your {pc.cock} starts shooting strings of {pc.cum} somewhere you can’t see, probably messing up the floor and making whoever uses the toy surprised.")
		
		saynn("As your orgasm fades, you feel the fleshlight with your cock just placed somewhere.")
	
		addButton("Continue", "Fun times", "endthescene")
	
	
	if(state == "cockVaginal"):
		playAnimation(StageScene.SexPortalRide, RNG.pick(["sex", "fast"]), {pc=npcID, npc="pc", npcBodyState={hard=true}, bodyState={exposedCrotch=true, hard=true}})
		
		saynn("A little noise escapes from you as you feel someone’s tongue suddenly licking your {pc.cock} through the portal panties. Blood quickly starts flowing towards your member, preparing and making it bigger.")
		
		saynn("Then you feel your cock pressed against a pussy! Wet needy folds are being spread by your dick as you feel somebody lowering themselves onto the fleshlight with your member sticking out. Huh, they seem very eager to get their pussy stuffed.")
		
		saynn("They then start bouncing on your cock up and down. They ride you so well that you quickly find yourself panting and arching your back, their inner walls wrap around your shaft in such a pleasurable way.")
		
		saynn("The tip of your cock is smashing their cervix, you feel like you’re about to cum!")
		
		addButton("Cum inside", "It’s not like you have a choice", "cockVaginalCum")
	
	if(state == "cockVaginalCum"):
		playAnimation(StageScene.SexPortalRide, RNG.pick(["inside", "fast", "tease"]), {pc=npcID, npc="pc", npcBodyState={hard=true}, bodyState={exposedCrotch=true, hard=true}})
		
		saynn("Whoever they are, they don’t seem to care about the possibility of getting creampied. Or maybe they don’t expect a randomly found toy to impregnate them so they keep riding you as your cock starts throbbing and shooting {pc.cum} directly into their womb, stuffing it full. You close your mouth and struggle to keep still as your balls are being drained by the twitching pussy.")
		
		saynn("Then they just pull your cock out of their used hole and leave the fleshlight be.")
		
		addButton("Continue", "Fun times", "endthescene")
		
	
	if(state == "cockAnal"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["sex", "fast"]), {pc=npcID, npc="pc", npcBodyState={hard=true}, bodyState={exposedCrotch=true, hard=true}})
		
		saynn("You stop as you feel somebody grabbing the fleshlight with your cock sticking out and groping your balls. Then they use their tongue to get you hard and make you leak precum just so they can shove your member up their butt a second later.")
		
		saynn("You let out a little moan as your {pc.cock} is stretching their tight ring and sliding deeper. The hand starts shoving your dick in and out, making it so your shaft is pounding their butt rough and fast, smashing their pleasure spot.")
		
		addButton("Cum!", "You can’t endure this very long", "cockAnalCum")
	
	if(state == "cockAnalCum"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["tease", "inside", "fast"]), {pc=npcID, npc="pc", npcBodyState={hard=true}, bodyState={exposedCrotch=true, hard=true}})
		
		saynn("The inner walls of that anus start clenching around your cock in a very irregular pattern, you feel them cumming! And soon after, the frictions and the feeling of tightness sends you over the edge too, your member shoots its load inside someone’s nethers, stuffing their butt full of your {pc.cum}.")
		
		addButton("Continue", "Fun times", "endthescene")
		
		
	if(state == "cockCondom"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["sex", "fast"]), {pc=npcID, npc="pc", npcBodyState={hard=true, condom=true}, bodyState={exposedCrotch=true, hard=true}})
		
		saynn("You suddenly feel some kind of rubber object brushing against your cock. Is someone putting a condom on you? Yeah, seems so, the digits stretch-drag the rubber over your whole length before giving your shaft a few strokes and rubs. The teasing does its work, gradually making you harder.")
		
		saynn("Then the stranger grabs the fleshlight and starts using your cock as a dildo, shoving into their pussy and sliding it in and out. Their tight slit feels so pleasurable and the condom is coated in lube, meaning it's so easy for them to use your cock for their pleasure.")
		
		if(RNG.chance(50)):
			addButton("Cum!", "Stuff that condom", "cockCondomCumBreak")
		else:
			addButton("Cum!", "Stuff that condom", "cockCondomCumNoBreak")
		
	if(state == "cockCondomCumBreak"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["inside", "tease"]), {pc=npcID, npc="pc", npcBodyState={hard=true, condom=true}, bodyState={exposedCrotch=true, hard=true}})
		
		saynn("You can only endure this for so long before you cum, your {pc.cock} is throbbing as it fills the condom with your {pc.cum} while it's inside someone. Their pussy walls get even tighter as the orgasm overwhelms them too, and that extra stimulation is enough to extend your climax, your cock keeps stuffing the condom until it [b]suddenly breaks, spilling all of its contents[/b]. Oops, seems like you might have knocked them up by accident. Hopefully they don’t mind.")
		
		addButton("Continue", "Fun times", "endthescene")
		
	if(state == "cockCondomCumNoBreak"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["inside", "fast"]), {pc=npcID, npc="pc", npcBodyState={hard=true, condom=true}, bodyState={exposedCrotch=true, hard=true}})
		
		saynn("You can only endure this for so long before you cum, your {pc.cock} is throbbing as it fills the condom with your {pc.cum} while it's inside someone. Their pussy walls get even tighter as the orgasm overwhelms them too, at least you won’t knock them up.")
		
		addButton("Continue", "Fun times", "endthescene")


	if(state == "cockStroking"):
		playAnimation(StageScene.SexPortalOral, RNG.pick(["hold"]), {pc=npcID, npc="pc", npcBodyState={hard=true}})
		
		saynn("Someone’s digits suddenly wrap around your shaft and give it a gentle stroke, to test maybe. Their grasp is quite soft, you can’t help yourself but to slowly get harder as they caress your {pc.cock}. One of the fingers finds the tip and starts rubbing it while another hand joins to play with your balls, making you curl your toes from pleasure.")
		
		saynn("Then the palm notices your reaction and tightens its grip around your cock before proceeding to teasingly jack you off. The stroking is too much, you try to hump the hand but there is nothing you can do about it, you have zero control over what happens to you. You’re leaking more precum and the hand then spreads it over your length before gradually picking up the pace, finally getting you closer to your peak.")
		
		addButton("Cum!", "Hopefully they don’t plan on denying you", "cockStrokingCum")

	if(state == "cockStrokingCum"):
		playAnimation(StageScene.SexPortalOral, RNG.pick(["hold"]), {pc=npcID, npc="pc", npcBodyState={hard=true}})
		
		saynn("You the feeling of pressure rising, you don’t care that you’re not fucking someone, one hand is enough to make you feel very good. Your {pc.cock} starts twitching more and more before suddenly shooting a strong thick string of {pc.cum} into the air followed by a few smaller ones after. You moan and squirm slightly while the hand milks your balls dry.")
		
		addButton("Continue", "Fun times", "endthescene")
		
	
	if(state == "cockWarming"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["inside"]), {pc=npcID, npc="pc", npcBodyState={hard=true}, bodyState={exposedCrotch=true}})
		
		saynn("Huh? You feel someone grabbing the fleshlight with your cock and brushing it against their ass. That causes your member to gradually get harder. The stranger then rubs your rod between their buttcheeks, stroking it that way and causing you to moan quietly. Having your cock hotdogged like that just feels too good, you leak precum all over their butt.")
		
		saynn("And then they just shove your {pc.cock} up their butt and let it stay there. No movement, no fucking, they just use their tight butt to warm your cock, maybe they were just looking for a good buttplug. Their inner walls clench around your shaft sometimes, making you keep your erection, it seems they’re gonna be your cock warmer for a while.")
		
		addButton("Continue", "Fun times", "endthescene")

	
func _react(_action: String, _args):

	if(_action in ["vaginal_cum"]):
		GM.pc.gotVaginaFuckedBy(npcID)
		GM.pc.cummedInVaginaBy(npcID)
		GM.pc.orgasmFrom(npcID)
	
	if(_action in ["anal_cum"]):
		GM.pc.gotAnusFuckedBy(npcID)
		GM.pc.cummedInAnusBy(npcID)
		GM.pc.orgasmFrom(npcID)
	
	if(_action == "cockSuckCum"):
		getCharacter(npcID).gotThroatFuckedBy("pc", false)
		getCharacter(npcID).cummedInMouthBy("pc")
	
	if(_action == "cockCondomCumBreak"):
		getCharacter(npcID).gotVaginaFuckedBy("pc", false)
		getCharacter(npcID).cummedInVaginaBy("pc")
	
	if(_action == "cockAnalCum"):
		getCharacter(npcID).gotAnusFuckedBy("pc", false)
		getCharacter(npcID).cummedInAnusBy("pc")
	
	if(_action == "cockVaginalCum"):
		getCharacter(npcID).gotVaginaFuckedBy("pc", false)
		getCharacter(npcID).cummedInVaginaBy("pc")
	
	if(_action == "cockTeaseThighsCumInside"):
		getCharacter(npcID).gotVaginaFuckedBy("pc", false)
		getCharacter(npcID).cummedInVaginaBy("pc")
	
	if(_action == "cockTeaseThighsCumOutside"):
		getCharacter(npcID).cummedOnBy("pc")
	
	if(_action in ["cockSuckCum", "cockStrokingCum", "cockCondomCumNoBreak", "cockCondomCumBreak", "cockAnalCum", "cockVaginalCum", "cockTeaseThighsCumInside", "cockTeaseThighsCumOutside"]):
		GM.pc.orgasmFrom(npcID)
	
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["cockType"] = cockType
	data["npcID"] = npcID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	cockType = SAVE.loadVar(data, "cockType", "canine")
	npcID = SAVE.loadVar(data, "npcID", "inmateMaleCanine")
