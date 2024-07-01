extends SceneBase

var npcID = ""
var npcVariation = ""
var iterations = 0
var doneWhenIterations = -1
var gotGagged = false
var removedOtherGag = ""

func _init():
	sceneID = "HypnoEncounterKneel"

func _initScene(_args = []):
	npcID = _args[0]
	var npc = GlobalRegistry.getCharacter(npcID)
	
	var personality:Personality = npc.getPersonality()
	if(personality.getStat(PersonalityStat.Mean) > 0.3 || personality.getStat(PersonalityStat.Subby) < -0.6):
		npcVariation = "mean"
	if(personality.getStat(PersonalityStat.Mean) < -0.3):
		npcVariation = "kind"
	if(personality.getStat(PersonalityStat.Subby) > 0.6 || personality.getStat(PersonalityStat.Coward) > 0.8):
		npcVariation = "subby"
		# there is no subby version
		
func getSceneCreator():
	return "PTS + LewDevy"
	
func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	var npc: BaseCharacter = GlobalRegistry.getCharacter(npcID)
	var dickWord = "{npc.cock}"
	if(!npc.hasPenis()):
		dickWord = "strapon"
	
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Solo, "kneel")
		
		# (default)
		if(!(npcVariation in ["mean", "kind"])):

			saynn("[say=npc]"+RNG.pick([
				"Now kneel.",
				"Be a good {pc.boy} and kneel for me.",
				"Get on your knees.",
				"Your place is on your knees.",
				"You'd look a lot better on your knees."
			])+"[/say]")
			
			saynn("You slowly sink down on your knees for {npc.him}.")
			
			saynn("[say=npc]"+RNG.pick([
				"I'll be back. Wait here.",
				"Now stay.",
				"Wait right here.",
				"Don't go anywhere.",
			])+"[/say]")
			
			saynn("{npc.Name} turns around and walks away, leaving you kneeling on the ground.")
			
		# (mean version)
		if(npcVariation == "mean"):

			saynn("[say=npc]"+RNG.pick([
				"Now kneel.",
				"Be a good toy and get down on your knees.",
				"Kneel, bitch.",
				"Kneel, you slut.",
				"On your knees, whore.",
				"You belong on your knees.",
			])+"[/say]")
			
			saynn("{npc.He} {npc.verb('push', 'pushes')} you down on your knees.")

			saynn("[say=npc]"+RNG.pick([
				"Wait here, if you know what's good for you.",
				"Don't even think about going anywhere.",
				"Now stay, slut.",
				"Be a good pet and stay right here.",
				"Don't go anywhere, or you'll regret it.",
			])+"[/say]")
			
			saynn("{npc.Name} {npc.verb('turn')} around and {npc.verb('strut')} off.")

		# (kind version)
		if(npcVariation == "kind"):
			
			saynn("[say=npc]"+RNG.pick([
				"Would you be a good {pc.boy} and kneel for me?",
				"Wouldn't you like to kneel for me?",
				"Be good and kneel for me.",
				"Get on your knees, please?",
			])+"[/say]")
			
			saynn("You find yourself compelled to obey as {npc.he} gently guides you down on your knees.")
				
			saynn("[say=npc]"+RNG.pick([
				"I'll be back before you can blink, okay?",
				"Back in just a moment!",
				"Now just wait right there...",
				"Now don't wander off while I'm gone!",
				"Be good and wait here for me."
			])+"[/say]")
			
			saynn("{npc.He} {npc.verb('shoot')} you a smile and {npc.verb('run')} off somewhere.")
			
		# (subby version)
		# there is no subby version
			
		saynn("You don't [i]have[/i] to obey. You should probably just stand up, but you want to follow {npc.his} order and...")
		HypnokinkUtil.addHypnoButtons(self, "kneel", "resist", ["Kneel", "Remain", "Stay", "Not move"], ["Get up", "Resist", "Stand"])
			
		
	if(state == "kneel"):
		removeCharacter(npcID)
		playAnimation(StageScene.Solo, "kneel")
		
		saynn(RNG.pick([
				"You remain on your knees.",
				"You could stand up and walk away at any time, yet you continue kneeling.",
				"You kneel.",
				"You stay on your knees.",
				"You can't seem to get up.",
			]))
		
		saynn(RNG.pick([
				"Why are you still here? You should stand up and move on, but you...",
				"At any time, you could...",
				"Now. Now's the time to...",
				"You want to be a good {pc.boy} for {npc.him} and...",
				"You really should just...",
			]))
			
		HypnokinkUtil.addHypnoButtons(self, "kneel", "resist", ["Kneel", "Remain", "Stay", "Not move"], ["Get up", "Resist", "Stand"])
	
	if(state == "kneeled_enough"):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "kneel", {npc=npcID})
		
		saynn("{npc.Name} finally comes back.")
	
		# (default)
		if(!(npcVariation in ["mean", "kind"])):

			saynn("[say=npc]"+RNG.pick([
				"Still here? Good {pc.boy}.",
				"You're pretty deep, huh?",
				"I see you're good at staying put."
			])+"[/say]")
			
			
			if(!(GM.pc.buffsHolder.hasBuff(Buff.RingGagBuff))):
				saynn("{npc.He} {npc.verb('dangle')} a set of straps connected to a metal ring in front of you.")
				saynn("[say=npc]I've brought a little gift for you.[/say]")
				if(GM.pc.getInventory().hasSlotEquipped(InventorySlot.Mouth)):
					saynn("{npc.He} {npc.verb('remove')} your current gag.")
					saynn("[say=npc]That'd just get in the way. Lucky you.[/say]")
				saynn("{npc.He} {npc.verb('grab')} you by the jaw.")
				saynn("[say=npc]Open up.[/say]")
				saynn("Maybe you could still stop, but you only want to be good for {npc.him}, and so you...")
				HypnokinkUtil.addUnresistableHypnoButtons(self, "get_gagged", ["Open", "Open up"])
			else:
				saynn("{npc.He} {npc.verb('look')} you over.")
				saynn("[say=npc]Had to take care of something. But now I've got plenty of time for my pet.[/say]")
				saynn("{npc.He} {npc.verb('grab')} you by the jaw.")
				saynn("[say=npc]I'm gonna make good use of your mouth.[/say]")
				saynn("Maybe you could still stop, but you only want to be good for {npc.him}, and so you...")
				HypnokinkUtil.addUnresistableHypnoButtons(self, "get_fucked_oral_1", ["Whimper", "Get ready", "Gulp"])
			
		# (mean version)
		if(npcVariation == "mean"):

			saynn("[say=npc]"+RNG.pick([
				"Knew you were a bitch.",
				"Still here? Good pet.",
				"Heh. You're such a slut.",
			])+"[/say]")
			
			if(!(GM.pc.buffsHolder.hasBuff(Buff.RingGagBuff))):
				saynn("{npc.He} {npc.verb('dangle')} a set of straps connected to a metal ring in front of you.")
				saynn("[say=npc]Sluts like you don't need to talk.[/say]")
				if(GM.pc.getInventory().hasSlotEquipped(InventorySlot.Mouth)):
					saynn("{npc.He} roughly {npc.verb('remove')} your current gag.")
					saynn("[say=npc]What good's a gag if I can't use your throat with it in the way?[/say]")
				saynn("{npc.He} {npc.verb('grab')} you by the jaw, clearly intent on forcing it open.")
				saynn("[say=npc]Open up or I'll make you.[/say]")
				saynn("You would try to resist, but {npc.nameS} demeanor is so commanding that you just...")
				HypnokinkUtil.addUnresistableHypnoButtons(self, "get_gagged", ["Open", "Open up"])
			else:
				saynn("{npc.He} {npc.verb('look')} you over.")
				saynn("[say=npc]Made sure we won't be interrupted. Now...[/say]")
				saynn("{npc.He} {npc.verb('grab')} you by the jaw.")
				saynn("[say=npc]I'm gonna use your throat until you choke.[/say]")
				saynn("At this point, you only want to open up your mouth for {npc.him} and taste {npc.his} "+dickWord+". You stick out your tongue for {npc.him} and...")
				HypnokinkUtil.addUnresistableHypnoButtons(self, "get_fucked_oral_1", ["Whimper", "Get ready", "Gulp"])
				
		# (kind version)
		if(npcVariation == "kind"):
			
			saynn("[say=npc]"+RNG.pick([
				"What a good {pc.boy}!",
				"Just where I left you.",
				"Aw, still waiting for me? Good {pc.boy}!",
				"I'm back! Did you miss me?",
			])+"[/say]")
			
			saynn("[say=npc]I picked up a little reward for you, if you're obedient.[/say]")
			if(GM.pc.getInventory().hasSlotEquipped(InventorySlot.Mouth) && !(GM.pc.buffsHolder.hasBuff(Buff.RingGagBuff))):
				saynn("{npc.He} carefully {npc.verb('remove')} your gag.")
				saynn("[say=npc]Don't want that getting in the way, do we?[/say]")
			saynn("{npc.He} {npc.verb('cup')} your jaw in {npc.his} hand.")
			saynn("[say=npc]Now lets put that mouth of yours to use, hm?[/say]")
			
			saynn("You know you could stop this anytime, but you just don't [i]want[/i] to. What you really want is to just open your mouth and...")
			HypnokinkUtil.addUnresistableHypnoButtons(self, "get_fucked_oral_1", ["Nod", "Get ready", "Gulp"])
			
		# (subby version)
		# there is no subby version
	
	if(state == "get_gagged"):
		playAnimation(StageScene.Duo, "kneel", {npc=npcID})
		
		# (default)
		if(!(npcVariation in ["mean"])):
			saynn("{npc.He} {npc.verb('buckle')} the ring gag between your teeth.")
			saynn("[say=pc]Nnh...[/say]")
			saynn("[say=npc]Safety first~[/say]")
			saynn("{npc.He} {npc.verb('reach', 'reaches')} down, towards {npc.his} crotch.")
			saynn("[say=npc]Now get to work.[/say]")
			saynn("You really should stop. Instead you ready your mouth and stick out your tongue, you don't [i]want[/i] to stop, you want to...")
			
		# (mean version)
		if(npcVariation == "mean"):
			saynn("{npc.He} rougly {npc.verb('wrap')} the straps around your head, buckling the ring gag tighly between your teeth.")
			saynn("[say=pc]Nnh! Not... so tight...[/say]")
			saynn("[say=npc]Like I'm gonna trust a bitch not to bite.[/say]")
			saynn("{npc.He} {npc.verb('reach', 'reaches')} down, towards {npc.his} crotch.")
			saynn("[say=npc]I'm gonna use your throat until you choke.[/say]")
			saynn("At this point, you only want {npc.him} to use your mouth and let you taste {npc.his} "+dickWord+". You stick out your tongue for {npc.him}, look up at {npc.him} with begging eyes and...")
					
		# (kind version)
		# there is no kind version
			
		# (subby version)
		# there is no subby version
		
		HypnokinkUtil.addUnresistableHypnoButtons(self, "get_fucked_oral_1", ["Whimper", "Get ready", "Gulp"])
		
	if(state == "get_fucked_oral_1"):
		var sucking = true
		
		if(!(npcVariation in ["mean", "kind"])):
			if(npc.hasPenis()):
				saynn("{npc.He} {npc.verb('place')} {npc.his} "+dickWord+" in front of your mouth, and without much regard towards your comfort thrusts right in. {npc.His} "+dickWord+" easily slides along your tongue and after only a few moments prods against the back of your throat.")
				saynn("[say=npc]"+RNG.pick([
					"Don't stop there, you can do better than that.",
					"Open wider, slut~",
					"It's gonna go a lot deeper than this.",
					"Be obedient and take it deeper for me."
					])+"[/say]")
				saynn("Your mind sinks into a sea of submission. You want to continue tasting {npc.his} "+dickWord+", it feels so good to...")
			else:
				saynn("{npc.He} {npc.verb('place')} {npc.his} wet pussy in front of your mouth, and without much regard towards your comfort {npc.verb('clamp')} your head between {npc.his} thighs. Taking the hint, you stick out your tongue and start licking.")
				saynn("[say=npc]"+RNG.pick([
					"More. You can do better than that.",
					"Work that tongue, slut~",
					"I'm gonna make you my personal toy.",	
					])+"[/say]")
				saynn("Your mind sinks into a sea of submission. You want to continue tasting {npc.his} pussy, it feels so good to...")
				sucking = false
				
		# (mean version)
		if(npcVariation == "mean"):
			#always uses strapon
			saynn("Wasting no time, {npc.he} {npc.verb('thrust')} {npc.his} "+dickWord+" straight into your mouth. Sparing no time, {npc.he} {npc.verb('begin')} to pound at your face, forcing it deeper down your throat with every thrust.")
			saynn("[say=npc]"+RNG.pick([
				"Gag on it, bitch.",
				"Take it deep, slut.",
				"Fits like a glove. Am I right, pet?",
				"You're my personal fuckhole now."
				])+"[/say]")
			saynn("You feel {npc.his} "+dickWord+" sliding in and out of your mouth, strands of saliva dripping out onto the ground. Your mind succumbs to the pleasure as you... ")
				
		# (kind version)
		if(npcVariation == "kind"):
			if(npc.hasPenis()):
				saynn("{npc.He} carefully {npc.verb('position')} {npc.his} "+dickWord+" in front of your mouth, and slowly and gently {npc.verb('push', 'pushes')} it in, giving you plenty of time to work it with your tongue and delight in its taste. Once {npc.he} {npc.isAre} satisfied, {npc.he} scratches the back of your head to catch your attention.")
				saynn("[say=npc]"+RNG.pick([
					"Are you ready for me?",
					"Let's go a bit deeper now.",
					"You can take it, right?",
					"Open wide now~",
					"Here it comes...",
					])+"[/say]")
			else:
				saynn("{npc.He} {npc.verb('place')} {npc.his} wet pussy in front of your mouth, and gently {npc.verb('pulls')} your head between {npc.his} thighs. Taking the hint, you stick out your tongue and start licking {npc.his} wet folds.")
				saynn("[say=npc]"+RNG.pick([
					"Got started right away, what a good {pc.boy}!",
					"Show me what you can do with that tongue.",
					"Very good, just like that...",
					])+"[/say]")
				sucking = false
			saynn("You put your tongue to work. Your thoughts fade into blissful obedience, and soon all you can do is... ")
			
		# (subby version)
		# there is no subby version
		
		if(sucking):
			playAnimation(StageScene.SexOral, "sex", {pc= npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			HypnokinkUtil.addUnresistableHypnoButtons(self, "get_fucked_oral_2", ["Take it", "Gag", "Get fucked", "Suck"])
		else:
			playAnimation(StageScene.SexOral, "lick", {pc= npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			HypnokinkUtil.addUnresistableHypnoButtons(self, "get_fucked_oral_2", ["Lick"])
		
	if(state == "get_fucked_oral_2"):
		var sucking = true
		
		if(!(npcVariation in ["mean", "kind"])):
			if(npc.hasPenis()):
				saynn("You regain some semblance of awareness as {npc.nameS} hand grips the back of your head.")
				saynn("[say=npc]"+RNG.pick([
					"Anybody home?",
					"No lights on in there...",
					"Don’t tell me you’ve passed out on me already.",
					"Going deeper? So am I!",
				])+"[/say]")		
				saynn("{npc.He} {npc.verb('pick')} up the pace, each thrust more and more insistent. As the tip of {npc.his} "+dickWord+" slides deeper and deeper into your throat, a pleasant numbness follows it, allowing you to take it with surprising ease and without protest. On some level you are aware that you’ll probably need to breathe at some point...")			
			else:
				saynn("{npc.He} {npc.verb('shiver')} and tightly {npc.verb('squeeze')} your head in between {npc.his} {npc.masc} thighs, burying your face until you can barely breathe. Lost in the moment, you diligently lap at {npc.his} folds and suck on {npc.his} clit.")
				saynn("[say=npc]"+RNG.pick([
					"You- you're pretty good at this~",
					"Ooh, that hits the spot!",
					"Don't you dare fucking stop, slut.",
					])+"[/say]")
				sucking = false	
			saynn("You just can't stop! You want to continue being a good {pc.boy} for {npc.him}! You want to...")
			
		# (mean version)
		if(npcVariation == "mean"):
			saynn("You regain some semblance of awareness as {npc.nameS} hand painfully grips the back of your head.")
			saynn("[say=npc]"+RNG.pick([
				"Don't pass out on me yet, pet.",
				"I'm nowhere near done, slut.",
				"Hey whore, no sleeping on the job, keep sucking!",
				"Be a good bitch and work that tongue!",
			])+"[/say]")
			saynn("You feel {npc.him} going even deeper than before. You enjoy the feeling of being used purely for [i]{npc.his}[/i] pleasure. You could stop this, but you want to be a good bitch for {npc.him}, you want to...")
				
		# (kind version)
		if(npcVariation == "kind"):
			if(npc.hasPenis()):
				saynn("You regain some semblance of awareness as {npc.nameS} hand strokes the back of your head.")
				saynn("[say=npc]"+RNG.pick([
					"Wakey wakey...",
					"Hey now, don't pass out on me.",
					"Are you okay? You want to keep going, right?",
					"Looks like you're having fun~",
				])+"[/say]")
				saynn("{npc.He} {npc.verb('pick')} up the pace, each thrust more and more insistent. As the tip of {npc.his} "+dickWord+" slides deeper and deeper into your throat, a pleasant numbness follows it, allowing you to take it with surprising ease and without protest. On some level you are aware that you’ll probably need to breathe at some point...")
			else:
				saynn("{npc.He} {npc.verb('shiver')} and tightly {npc.verb('squeeze')} your head in between {npc.his} {npc.masc} thighs, burying your face until you can barely breathe. Lost in the moment, you diligently lap at {npc.his} folds and suck on {npc.his} clit.")
				saynn("[say=npc]"+RNG.pick([
						"You're pretty good at this~",
						"Ooh, that hits the spot!",
						"K-keep going, just like that.",
					])+"[/say]")
				sucking = false
			saynn("You just can't stop! You want to continue being a good {pc.boy} for {npc.him}! You want to...")
			
		# (subby version)
		# there is no subby version
		
		if(sucking):
			playAnimation(StageScene.SexOral, "fast", {pc= npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			HypnokinkUtil.addUnresistableHypnoButtons(self, "get_fucked_oral_3", ["Take it", "Gag", "Get fucked", "Suck", "Swallow"])
		else:
			playAnimation(StageScene.SexOral, "grind", {pc= npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			HypnokinkUtil.addUnresistableHypnoButtons(self, "get_fucked_oral_3", ["Lick"])
		
	if(state == "get_fucked_oral_3"):
		
		if(!(npcVariation in ["mean", "kind"])):
			if(npc.hasPenis()):
				saynn("[say=npc]"+RNG.pick([
					"I’m gonna-",
					"Get ready-",
					"Nnnh! Swallow for me!",
				])+"[/say]")
				saynn("The edges of your vision start to blur. {npc.He} {npc.verb('grip')} your head tightly, and with one last thrust cums straight down your throat. Obediently, you swallow as {npc.he} {npc.verb('pump')} seed deep into you, the action almost mechanical as you instinctively gulp down every drop. Just before you pass out from lack of air, {npc.name} finally {npc.verb('pull')} out. You're left panting, still kneeling and looking like a greedy slut, leftover drops of cum dripping from your tongue.")	
			else:
				saynn("[say=npc]"+RNG.pick([
					"Ah! Y-you're gonna make me cum!",
					"Keep at it! I'm gonna burst soon!",
					"Get ready for me, I'm gonna cum!",
				])+"[/say]")
				saynn("You prepare yourself as {npc.he} {npc.verb('grip')} your head, pushing you into {npc.his} lewd wetness as {npc.he} {npc.verb('cum')} hard. {npc.His} juices are forced down your throat with some stray drops escaping out the sides of your gagged mouth, {npc.name} gripping the back of your head as {npc.he} {npc.verb('orgasm')}, leaving you panting and wanting more...")	
			saynn("You did it! You hope you were a good {pc.boy} for {npc.him}, swallowing all that tasty wetness, as you continue to...")		
			
		# (mean version)
		if(npcVariation == "mean"):
			saynn("[say=npc]"+RNG.pick([
				"Oh fuck! Your mouth-pussy is gonna make me cum!",
				"...",
				"Ready to take my load, you stupid fuckdoll?",
				"Now be a good bitch in heat and make me cum!",
				"Take it all, whore!",
				"I'm gonna leave you begging for more!",
			])+"[/say]")
			if(npc.hasPenis()):
				saynn("You barely have any time to prepare as {npc.he} {npc.verb('shove')} {npc.his} "+dickWord+" as deep into your mouth as he physically can, making your eyes roll back in response as you feel {npc.his} shaft start to pulse, sending one wave of cum after another deep down your throat. You instinctively gulp it all down, you want to satisfy {npc.him}.")	
			else:
				saynn("You feel your consciousness fading slightly as {npc.he} {npc.verb('push', 'pushes')} {npc.his} strap-on deep down your throat, making you choke. As your face presses into {npc.his} crotch, {npc.he} finally {npc.verb('explode')}, {npc.his} juices flowing down your cheeks and {npc.his} shaky orgasm making your head vibrate.")	
			saynn("It's a torturously long moment before {npc.he} {npc.verb('decide')} to finally pull out and allow you to heave in some precious air.")
			saynn("You look up at {npc.him} with a lustful look on your face, still recovering from the mind-numbing experience. You didn't want {npc.him} to stop. You wanted to...")
			
		# (kind version)
		if(npcVariation == "kind"):
			if(npc.hasPenis()):
				saynn("[say=npc]"+RNG.pick([
					"Swallow for me, beautiful~",
					"Get ready to take it all!",
					"Ah! I'm gonna cum soon, prepare yourself!",
				])+"[/say]")
				saynn("The edges of your vision start to blur. {npc.He} {npc.verb('grip')} your head more firmly, and with one last thrust {npc.verb('cum')} straight down your throat. Obediently, you swallow as {npc.he} {npc.verb('pump')} seed deep into you, the action almost mechanical as you instinctively gulp down every drop. Careful to ensure you don't pass out from lack of air, {npc.name} quickly pulls out. You're left panting, still kneeling and looking like a well used pet, leftover drops of cum dripping from your tongue.")
			else:
				saynn("[say=npc]"+RNG.pick([
					"Ahh! You feel so fucking good!",
					"Get ready to take it all!",
					"Ah! I'm gonna cum!",
				])+"[/say]")
				saynn("You prepare yourself as {npc.he} {npc.verb('grip')} your head, pushing you into {npc.his} lewd wetness as {npc.he} {npc.verb('cum')} hard. {npc.His} juices are forced down your throat with some stray drops escaping out the sides of your gagged mouth, {npc.name} stroking the back of your head as {npc.he} {npc.verb('orgasm')}, until finally you're left panting and wanting more...")	
			saynn("You did it! You hope you were a good {pc.boy} for {npc.him}, swallowing all that tasty wetness. You look up at {npc.him}, submission evident on your face, as you continue to...")	
			
		# (subby version)
		# there is no subby version	
		
		playAnimation(StageScene.SexOral, "start", {pc= npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
		HypnokinkUtil.addUnresistableHypnoButtons(self, "oral_afterward")
		
	if(state == "oral_afterward"):
		playAnimation(StageScene.Duo, "kneel", {npc=npcID})
		
		if(!(npcVariation in ["mean", "kind"])):
			if(gotGagged):
				saynn("[say=npc]I'll be taking that gag back...[/say]")
				saynn("{npc.He} {npc.verb('unbuckle')} the ring gag. You work your jaw a few times.")
				if(removedOtherGag):
					saynn("[say=npc]But you can have this back.[/say]")
					saynn("{npc.He} {npc.verb('replace')} it with your previous one.")
			saynn("[say=npc]That was fun. We should do this again sometime.[/say]")
			saynn("Then {npc.he} {npc.verb('walk')} away, leaving you still on your knees, drooling with a lewd, satisfied expression on your face.")
			saynn("After a while, you struggle back up on shaky feet, remainders of your wet experience still hanging from your chin.")
			
		# (mean version)
		if(npcVariation == "mean"):
			if(removedOtherGag):
				saynn("[say=npc]You can have this back.[/say]")
				saynn("{npc.He} {npc.verb('remove')} only to replace it with your previous one.")
			elif(gotGagged):
				saynn("[say=npc]You can keep the gag.[/say]")
				saynn("{npc.He} {npc.verb('grin')} maliciously as {npc.he} tightens the buckles one more time.")
			saynn("Now satisfied, {npc.he} {npc.verb('strut')} off, leaving you kneeling with an expression of dazed pleasure on your face. Eventually you notice your tongue is still sticking out and retract it.")
			saynn("It's a long while before you struggle back up on shaky feet, still influenced by {npc.his} strong, commanding presence.")
				
		# (kind version)
		if(npcVariation == "kind"):
			saynn("[say=npc]Aah~ We should do this again sometime. Oh, and before I forget...[/say]")
			saynn("{npc.He} {npc.verb('hand')} you a credit chit.")
			saynn("With a wink, {npc.he} {npc.verb('walk')} away, leaving you still on your knees.")
			saynn("It takes a few moments for you to realise you're free to get back up, your thoughts still occupied with {npc.nameS} strong scent.")
			
		# (subby version)
		# there is no subby version	
		
		addButton("Leave", "Time to go", "endthescene")
		
	if(state == "resist"):
		saynn("You begin to rise, on the brink of breaking the spell.")
		saynn("[say=pc]"+RNG.pick([
			"Wait, what am I...", 
			"Where am I...", 
			"Why am I...", 
			"Wait a minute-", 
			"But why should I-"
			])+"[/say]")
		
		saynn("But now that you know you [i]can[/i] leave, you really should just...")
		HypnokinkUtil.addHypnoButtons(self, "kneel", "resist_2", ["Kneel", "Remain", "Stay", "Not move"], ["Get up", "Resist", "Stand"])
	if(state == "resist_2"):
		removeCharacter(npcID)
		playAnimation(StageScene.Solo, "stand")
		
		saynn("You manage to shake it off and drag yourself back up on your feet. Better go before {npc.name} comes back.")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")

func _react(_action: String, _args):
	var npc: BaseCharacter = GlobalRegistry.getCharacter(npcID)

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "kneel"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(2,6))
		processTime(5 * 60)
		if(doneWhenIterations == -1):
			doneWhenIterations = RNG.randi_range(3,6)
		iterations += 1
		if(iterations >= doneWhenIterations):
			setState("kneeled_enough")
			return
			
	if(_action == "get_gagged"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(2,6))
		processTime(1 * 60)
		GM.pc.addLust(RNG.randi_range(2,6))
		if(GM.pc.getInventory().hasSlotEquipped(InventorySlot.Mouth)):
			var preexistingGag = GM.pc.getInventory().removeItemFromSlot(InventorySlot.Mouth)
			removedOtherGag = preexistingGag.id
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ringgag"))
		gotGagged = true
		
	if(_action == "get_fucked_oral_1"):
		GM.pc.addLust(RNG.randi_range(10,15))
		if(npcVariation == "kind" && GM.pc.getInventory().hasSlotEquipped(InventorySlot.Mouth)):
			GM.pc.getInventory().removeItemFromSlot(InventorySlot.Mouth)
		if(!npc.hasPenis() && npcVariation == "mean"):
			npc.getInventory().equipItem(GlobalRegistry.createItem("StraponFeeldoe"))
			npc.getInventory().removeItemFromSlot(InventorySlot.UnderwearBottom)
		
	if(_action == "get_fucked_oral_2"):
		GM.pc.addLust(RNG.randi_range(10,15))
		
	if(_action == "get_fucked_oral_3"):
		GM.pc.addLust(RNG.randi_range(20,25))
		if(npc.hasPenis()):
			GM.pc.cummedInMouthBy(npcID)
		else:
			if(npcVariation == "mean"):
				npc.cumOnFloor()
			else:
				GM.pc.cummedInMouthBy(npcID, FluidSource.Vagina)
				
	if(_action == "oral_afterward"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(20,30))
		processTime(10 * 60)
		if(removedOtherGag != ""):
			GM.pc.getInventory().removeEquippedItemsWithBuff(Buff.RingGagBuff)
			GM.pc.getInventory().equipItem(GlobalRegistry.createItem(removedOtherGag))
		else:
			if(npcVariation != "mean" && gotGagged):
				GM.pc.getInventory().removeEquippedItemsWithBuff(Buff.RingGagBuff)		
		if(npcVariation == "kind"):
			GM.pc.addCredits(1)
		GM.pc.addSkillExperience(Skill.Hypnosis, 10)
		
		
	if(_action == "resist"):
		pass

	setState(_action)


func _react_scene_end(_tag, _result):
	pass

func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["npcVariation"] = npcVariation
	data["iterations"] = iterations
	data["doneWhenIterations"] = doneWhenIterations
	data["gotGagged"] = gotGagged
	data["removedOtherGag"] = removedOtherGag
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npcVariation = SAVE.loadVar(data, "npcVariation", "")
	iterations = SAVE.loadVar(data, "iterations", 0)
	doneWhenIterations = SAVE.loadVar(data, "doneWhenIterations", -1)
	gotGagged = SAVE.loadVar(data, "gotGagged", false)
	removedOtherGag = SAVE.loadVar(data, "removedOtherGag", "")

