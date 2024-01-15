extends SceneBase

var npcID = ""
var npcVariation = ""
var gotStripped = false
var strippedItemID = ""
var iterations = 0
var doneWhenIterations = -1
var optionsUsed = []
var lastBodywritingZone = ""
var lastBodywritingID = ""

func _init():
	sceneID = "HypnoEncounterDoll"
	
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
		
func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	var npc: BaseCharacter = GlobalRegistry.getCharacter(npcID)
	npc = npc #dont bother me godot
	addCharacter(npcID)
	
	if(state == "" and (not GM.pc.getInventory().hasSlotEquipped(InventorySlot.Body))):
		#skip past stripping
		state = "stripped"
	
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		# (default)
		if(!(npcVariation in ["mean", "kind", "subby"])):

			saynn("[say=npc]"+RNG.pick([
				"This'll just get in the way.",
				"Take this off.",
				"Strip."
			])+"[/say]")
			
		if(npcVariation == "mean"):
			saynn("{npc.He} {npc.verb('grab')} you by your clothes and roughly pulls you closer.")
			
			saynn("[say=npc]"+RNG.pick([
				"Take this off or I'll rip it off.",
				"Take this off. Now.",
				"Strip, slut."
			])+"[/say]")

		# (kind version)
		if(npcVariation == "kind"):
			
			saynn("{npc.He} {npc.verb('brush', 'brushes')} some dust off your clothes.")
			saynn("[say=npc]"+RNG.pick([
				"Why don't you take this off?",
				"You wouldn't mind stripping for me, right?",
				"Can you strip down for me?",
			])+"[/say]")
			
		# (subby version)
		if(npcVariation == "subby"):
			
			saynn("{npc.He} {npc.verb('grip')} your clothes, clearly eager to get them off you.")
			saynn("[say=npc]"+RNG.pick([
				"Take these off, please?",
				"I want to see [i]all[/i] of your beatiful body!",
				"You've got nothing that needs hiding, handsome~",
			])+"[/say]")
			
		saynn("In no time at all your clothes are coming off as you...")
		HypnokinkUtil.addHypnoButtons(self, "stripped", "resist", ["Strip", "Remove"])
		
	if(state == "stripped"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		
		saynn("You obediently stand still, exposed and vulnerable both in body and mind.")
		
		# (default)
		if(!(npcVariation in ["mean", "kind", "subby"])):
			
			saynn("[say=npc]"+RNG.pick([
				"Raise your arms above your head.",
				"Hands up.",
				"Keep your arms above your head."
			])+"[/say]")
		
		if(npcVariation == "mean"):
			
			saynn("[say=npc]"+RNG.pick([
				"Arms above your head.",
				"Hands up, bitch.",
				"Keep your arms above your head."
			])+"[/say]")

		# (kind version)
		if(npcVariation == "kind"):
			
			saynn("[say=npc]"+RNG.pick([
				"Arms above your head, if you could?",
				"Hands up, please.",
				"Could you keep your arms above your head?",
			])+"[/say]")
			
		# (subby version)
		if(npcVariation == "subby"):
			saynn("[say=npc]"+RNG.pick([
				"Can you please raise your arms? I want access to all of you~.",
				"Hands up please? I just wanna bury my face in that chest~",
			])+"[/say]")
			
		saynn("As your arms mechanically start to rise without any real conscious decision on your part, you...")
		HypnokinkUtil.addHypnoButtons(self, "pick_subscene", "resist", ["Raise"])
	
	if(state == "cuffs_wrists" || state == "cuffs_ankles"):
		playAnimation(StageScene.ArmsRaisedDuo, "idle", {npc=npcID})
		
		var limb = "wrists" if state == "cuffs_wrists" else "ankles"
		# (default)
		if(!(npcVariation in ["mean", "kind", "subby"])):
			
			saynn("{npc.He} {npc.verb('grab')} your "+limb+", clamping something onto them.")
			
			saynn("[say=npc]"+RNG.pick([
				"Eyes forward. Dont move.",
				"You squirm too much.",
				"This'll keep you properly helpless."
			])+"[/say]")
		
		if(npcVariation == "mean"):
			
			saynn("{npc.He} painfully {npc.verb('squeeze')} your "+limb+", clamping something onto them.")
			
			saynn("[say=npc]"+RNG.pick([
				"Eyes forward. Let me cuff you.",
				"This should help keep you still.",
				"A bit of bondage can be fun."
			])+"[/say]")

		# (kind version)
		if(npcVariation == "kind"):
			
			saynn("{npc.He} gently {npc.verb('squeeze')} your "+limb+", clamping something onto them.")
			
			saynn("[say=npc]"+RNG.pick([
				"You like being restrained, don't you?",
				"I think you'd like to be a bit helpless~",
				"Are you a fan of cuffs?",
			])+"[/say]")
			
		saynn("Struggling to offer any resistance, you...")
		HypnokinkUtil.addHypnoButtons(self, "cuffs_"+limb+"_post", "resist", ["Hold still", "Wince", "Whine"])
		
	if(state == "bodywriting"):
		playAnimation(StageScene.ArmsRaisedDuo, "idle", {npc=npcID})
		saynn("{npc.He} {npc.verb('retrieve')} a black marker from somewhere and pops off the cap.")
		
		if(!(npcVariation in ["mean", "kind", "subby"])):
			
			saynn("[say=npc]"+RNG.pick([
				"Let's make it clear what you are.",
				"A little advertisement seems appropriate."
			])+"[/say]")
		
		if(npcVariation == "mean"):
			
			saynn("[say=npc]"+RNG.pick([
				"Let's make you look like the slut you are.",
				"Whores should be labeled.",
				"Hold still, bitch."
			])+"[/say]")

		# (kind version)
		if(npcVariation == "kind"):
			
			saynn("[say=npc]"+RNG.pick([
				"You don't mind if I leave a mark, right?",
				"You really need to advertise yourself~",
				"Just a little reminder...",
			])+"[/say]")
			
		# (subby version)
		if(npcVariation == "subby"):
			
			saynn("[say=npc]"+RNG.pick([
				"You don't mind if I leave a mark, right?",
				"Just so you don't forget me~",
			])+"[/say]")
		
		saynn("Still as you can be, you...")
		HypnokinkUtil.addHypnoButtons(self, "bodywriting_2", "resist", ["Hold still", "Wince", "Whine"])
		
	if(state == "bodywriting_2"):
		playAnimation(StageScene.ArmsRaisedDuo, "idle", {npc=npcID})
		saynn("{npc.He} {npc.verb('draw')} [b]'"+str(BodyWritings.getWritingText(lastBodywritingID))+"'[/b] on your "+BodyWritingsZone.getZoneVisibleName(lastBodywritingZone)+".")
		
		saynn("[say=npc]"+RNG.pick([
			"Suits you.",
			"Nice.",
			"Looks great on you.",
		])+"[/say]")
		
		saynn("Unable to offer any resistance, you...")
		HypnokinkUtil.addHypnoButtons(self, "pick_subscene", "resist", ["Hold still", "Wait", "Whine"])
		
	if(state == "kneel"):
		#only subby version
		playAnimation(StageScene.ArmsRaisedDuo, "idle", {npc=npcID, npcAction="kneel"})
		
		saynn("{npc.He} {npc.verb('kneel')} in front of you to admire you from closer up.")
		saynn("[say=npc]"+RNG.pick([
				"Ooh, I really want to play~",
				"I could make you feel so good...",
				"Mmm, I like what I see!"
			])+"[/say]")
		
		saynn("{npc.He} continues to kneel in front of you, nakedly ogling your body. Embarrased by the attentive desire, you...")
		HypnokinkUtil.addHypnoButtons(self, "kneel_2", "resist", ["Blush", "Pose"])
		
	if(state == "kneel_2"):
		var toOgle = "crotch"
		if(GM.pc.hasPenis()):
			toOgle = "{pc.penis}"
		elif(GM.pc.hasVagina()):
			toOgle = "{pc.vagina}"
		saynn("{npc.He} {npc.verb('explore')} your body with {npc.his} eyes, lingering for a long time on your "+toOgle+", but teasingly taking no action. You remain obediently still, posing to be admired.")
		saynn("[say=npc]"+RNG.pick([
				"What a lovely sight.",
				"I could just...",
				"So tempting~"
			])+"[/say]")
			
		saynn("{npc.He} eventually {npc.verb('rise')} back on {npc.his} feet, deciding to keep playing for now. Still flustered, you...")
		HypnokinkUtil.addHypnoButtons(self, "pick_subscene", "resist", ["Blush"])


	if(state == "punch"):
		playAnimation(StageScene.ArmsRaisedDuo, "idle", {npc=npcID, npcAction="punch"})
		#only mean version
		saynn("With no warning, {npc.he} {npc.verb('sock')} you in the stomach!")
		saynn("[say=npc]"+RNG.pick([
				"You'd make a good punching bag!",
				"Hold still, bitch.",
				"You're probably gonna enjoy this anyway."
			])+"[/say]")
		
		saynn("Wincing with pain, you...")
		HypnokinkUtil.addHypnoButtons(self, "punch_2", "resist", ["Hold still"])
	
	if(state == "punch_2"):
		playAnimation(StageScene.ArmsRaisedDuo, "idle", {npc=npcID, npcAction="punch"})
		#only mean version
		saynn("{npc.He} repeatedly {npc.verb('jab')} you in the stomach and chest!")
		saynn("[say=npc]"+RNG.pick([
				"I should make this part of my workout routine.",
				"Bruises look good on you.",
				"Maybe I should hit harder. Crack some ribs."
			])+"[/say]")
		
		saynn("Bruised, you...")
		HypnokinkUtil.addHypnoButtons(self, "pick_subscene", "resist", ["Suffer", "Endure"])
		
	if(state == "hug"):
		playAnimation(StageScene.Hug, "hug", {npc=npcID})
		if(!(npcVariation in ["mean", "kind", "subby"])):
			saynn("{npc.He} suddenly {npc.verb('draw')} you into a hug" + ("." if GM.pc.hasBoundArms() else ", and you reflexively wrap your arms around {npc.him}."))
		
			saynn("[say=npc]"+RNG.pick([
				"I can be nice~",
				"You are being [i]very[/i] obedient..."
			])+"[/say]")
		#no mean version
		# (kind version)
		if(npcVariation == "kind"):
			saynn("{npc.He} gently {npc.verb('draw')} you into a hug" + ("." if GM.pc.hasBoundArms() else ", and after a brief moment of hesitation, you wrap your arms around {npc.him}."))
			
			saynn("[say=npc]"+RNG.pick([
				"Good {pc.boy}...",
				"You're enjoying yourself, right?",
				"That's it, just relax...",
			])+"[/say]")
			
		# (subby version)
		if(npcVariation == "subby"):
			saynn("{npc.He} wraps {npc.his} arms around you" + (" and {npc.verb('nuzzle')} your chest}." if GM.pc.hasBoundArms() else ". As {npc.he} {npc.verb('nuzzle')} your chest, you return the hug."))
			
			saynn("[say=npc]"+RNG.pick([
				"Mmm~",
				"This is okay, right?",
				"I want you all to myself...",
			])+"[/say]")
		
		saynn("After a while {npc.he} {npc.verb('let')} go. You obediently raise your arms back up without even having to be told, and...")
		HypnokinkUtil.addHypnoButtons(self, "pick_subscene", "resist", [])
		
	if(state == "tease"):
		playAnimation(StageScene.ArmsRaisedSex, "tease", {npc=npcID})
		
		if(!(npcVariation in ["mean", "kind", "subby"])):
			saynn("{npc.He} slowly, teasingly {npc.verb('circle')} behind you. You shiver as you feel hands begin to explore all over your body.")
			
			saynn("[say=npc]"+RNG.pick([
				"You'd do just about anything to please me, hm?",
				"You are being [i]very[/i] obedient...",
			])+"[/say]")
			
		# (mean version)
		if(npcVariation == "mean"):
			saynn("{npc.He} {npc.verb('paces')} behind you. You shiver as you feel hands begin to grope you all over your body.")
			
			saynn("[say=npc]"+RNG.pick([
				"I could do [i]anything[/i] I want to you.",
				"That's it, slut. Squirm.",
				"You're all mine, and there's nothing you can do about it.",
			])+"[/say]")
			
		# (kind version)
		if(npcVariation == "kind"):
			saynn("{npc.He} slowly, teasingly {npc.verb('circle')} behind you. You shiver as you feel hands begin to gently brush over your body.")
			
			saynn("[say=npc]"+RNG.pick([
				"Good {pc.boy}...",
				"Enjoying yourself? Yes you are...",
				"That's it, just relax...",
			])+"[/say]")
			
		# (no subby version)
		
		saynn("As {npc.he} {npc.verb('continue')} to whisper in your ear, you...")
		HypnokinkUtil.addHypnoButtons(self, "tease_2", "resist", ["Shiver", "Whine"])
		
	if(state == "tease_2"):
		playAnimation(StageScene.ArmsRaisedSex, "inside", {npc=npcID})
		saynn("{npc.He} leans in even closer, right next to your ear.")
		
		if(!(npcVariation in ["mean", "kind", "subby"])):
			
			saynn("[say=npc]"+RNG.pick([
				"Maybe I'll just keep you to myself.",
				"We'll be doing this a lot more often, I promise you that.",
			])+"[/say]")
			
		# (mean version)
		if(npcVariation == "mean"):
			
			saynn("[say=npc]"+RNG.pick([
				"Gonna make you into my personal fuckpet.",
				"A slut like you should be used.",
				"You're gonna be my personal whore.",
			])+"[/say]")
			
		# (kind version)
		if(npcVariation == "kind"):
			
			saynn("[say=npc]"+RNG.pick([
				"I can make you have a [i]very[/i] good time.",
				"So very submissive and obedient~",
				"Want to a good [i]toy[/i] for me?",
			])+"[/say]")
			
		# (no subby version)
		
		saynn("{npc.His} breath as well as {npc.his} words dancing past your ear sends a hot, exciting shiver down your spine.")
		
		saynn("{npc.He} {npc.verb('let')} go, circling back in front of you, eyes locked on yours. You can only...")
		HypnokinkUtil.addHypnoButtons(self, "pick_subscene", "resist", ["Shiver", "Whine", "Gulp"])
		
	if(state == "hands_free_orgasm"):
		playAnimation(StageScene.SexFreeStanding, "tease", {pc=npcID, npc="pc"})
		
		# (default)
		if(!(npcVariation in ["mean", "kind", "subby"])):
			saynn("As your lust and desire becomes apparent, {npc.he} {npc.verb('drag')} your wrists down, behind your back.")

			saynn("[say=npc]"+RNG.pick([
				"What a cute slut you are~",
				"Getting off on this, huh?",
				"Who said you could enjoy yourself?"
			])+"[/say]")
			
			saynn("As {npc.he} {npc.verb('continue')} to tease you, you can't help but...")
			
		if(npcVariation == "mean"):
			saynn("As your lust and desire becomes apparent, {npc.he} {npc.verb('wrest')} your wrists down, behind your back.")
			
			saynn("[say=npc]"+RNG.pick([
				"I see you're getting off on this, bitch.",
				"Enjoying yourself, slut?",
				"Having fun? What a whore."
			])+"[/say]")
			
			saynn("As {npc.he} {npc.verb('continue')} to verbally abuse you, you can't help but...")

		# (kind version)
		if(npcVariation == "kind"):
			
			saynn("As your lust and desire becomes apparent, {npc.he} {npc.verb('grab')} hold of your wrists, gently pulling them behind your back.")
			saynn("[say=npc]"+RNG.pick([
				"Aw, you're enjoying yourself~",
				"Now now, you want to be a good {pc.boy}, right?",
				"Let's make sure you do this right...",
			])+"[/say]")
			saynn("As {npc.he} {npc.verb('continue')} to whisper words of encouragemenent, you can't help but...")
			
		# (subby version)
		if(npcVariation == "subby"):
			
			saynn("As your lust and desire becomes apparent, {npc.he} gently {npc.verb('guide')} you to put your hands behind your back.")
			saynn("[say=npc]"+RNG.pick([
				"Oh, you'll love this next part!",
				"You're having a lot of fun, I see~",
				"I know what'll make you feel good!",
			])+"[/say]")
			saynn("As {npc.he} {npc.verb('continue')} to express {npc.his} lustful desires, you can't help but...")
			
		HypnokinkUtil.addHypnoButtons(self, "hands_free_orgasm_2", "resist", ["Tense up", "Squirm"])
		
	if(state == "hands_free_orgasm_2"):
		playAnimation(StageScene.SexFreeStanding, "inside", {pc=npcID, npc="pc"})
		
		# (default)
		if(!(npcVariation in ["mean", "kind", "subby"])):
			saynn("With your wrists forcibly held behind your back, all you can do is squirm.")
			saynn("[say=npc]I've heard you've messed with your head so much you can even cum hands-free. Is that right?[/say]")
			saynn("Any protest you might have offered dies with the wave of pleasure that rolls through your body.")
			saynn("[say=npc]Neat! Alright, this should be cool to watch. Get all horny and needy for me.[/say]")
			saynn("You tense up and moan as wave after wave of phantom pleasure surges through you. Wrists secured behind your back, you can only lean forward as your building desire quickly brings you to the edge...")
			saynn("[say=npc]And... [b]Cum.[/b][/say]")
			saynn("Already so close, the command makes you...")
			
		if(npcVariation == "mean"):
			saynn("With your wrists painfully held behind your back, all you can do is squirm.")
			saynn("[say=npc]I've heard you're such a needy slut you can cum hands-free on command. Seems about right, from how much you're drooling.[/say]")
			saynn("Any protest you might have mustered dies with the wave of pleasure that rolls through your body.")
			saynn("[say=npc]Hah. Alright, this I gotta see. I wanna see you horny and desperate, slut. Show me ho much you want it.[/say]")
			saynn("You tense up and moan as wave after wave of phantom pleasure surges through you. Wrists secured behind your back, you can only lean forward as your building desire quickly brings you to the edge...")
			saynn("[say=npc][b]Cum[/b], "+RNG.pick(["slut", "whore", "bitch"])+".[/say]")
			saynn("Already so close, the command makes you...")

		# (kind version)
		if(npcVariation == "kind"):
			
			saynn("With your wrists carefully but securely held behind your back, all you can do is squirm.")
			saynn("[say=npc]I've heard you can even cum on command, completely hands-free. Does that sound nice?[/say]")
			saynn("Any comment you might have had dies with the wave of pleasure that rolls through your body.")
			saynn("[say=npc]I think that's a yes. Since you're so eager, why don't you get all horny and needy for me?[/say]")
			saynn("You tense up and moan as wave after wave of phantom pleasure surges through you. Wrists secured behind your back, you can only lean forward as your building desire quickly brings you to the edge...")
			saynn("[say=npc]Now be a good {pc.boy} and [b]cum[/b] for me.[/say]")
			saynn("Already so close, the command makes you...")
			
		# (subby version)
		if(npcVariation == "subby"):
			
			saynn("While {npc.nameS} grip is more of a suggestion, with your mind submerged in obedience all you can do is squirm.")
			saynn("[say=npc]I've heard you can even cum on command, completely hands-free. I wish I could do that...[/say]")
			saynn("Any suggestions you might have had die with the wave of pleasure that rolls through your body.")
			saynn("[say=npc]Ooh! You're certainly easy to please. Why don't you show me how it's done? I can see you're getting needier with every word...[/say]")
			saynn("You tense up and moan as wave after wave of phantom pleasure surges through you. Wrists secured behind your back, you can only lean forward as your building desire quickly brings you to the edge...")
			saynn("[say=npc]Okay, are you ready? You must be so close~ Feel the pleasure build, and build... [b]Cum[/b]![/say]")
			saynn("Already so close, the command makes you...")
		
		HypnokinkUtil.addHypnoButtons(self, "hands_free_orgasm_3", "hands_free_orgasm_3_selfdeny", ["Cum", "Orgasm", "Explode"], ["Resist", "Deny", "Stop"])
		
	if(state == "hands_free_orgasm_3"):
		playAnimation(StageScene.SexFreeStanding, "tease", {pc=npcID, npc="pc"})
		#oh, boy!
		var cumDesc = " orgasmic pleasure courses through you"
		var undiesDesc = null
		if(GM.pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom)):
			undiesDesc = (GM.pc.getInventory().getEquippedItem(InventorySlot.UnderwearBottom).getVisibleName().to_lower())
		elif(GM.pc.getInventory().hasSlotEquipped(InventorySlot.Body)):
			undiesDesc = (GM.pc.getInventory().getEquippedItem(InventorySlot.Body).getVisibleName().to_lower())
		if(GM.pc.hasPenis() and GM.pc.hasVagina()):
			cumDesc = "your "+(RNG.pick(["caged", "locked"]) if GM.pc.isWearingChastityCage() else "")+RNG.pick(["dick", "cock", "member"])
			if(not GM.pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom) and not GM.pc.getInventory().hasSlotEquipped(InventorySlot.Body)):
				 cumDesc += " dribbles out its load onto the ground"
			else:
				cumDesc += ""
			cumDesc += " and your spasming "+RNG.pick(["pussy", "pussy", "slit", "kitty"])
			if(not GM.pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom) and not GM.pc.getInventory().hasSlotEquipped(InventorySlot.Body)):
				 cumDesc += " drips your juices down your thighs"
			else:
				cumDesc += " make your "+undiesDesc+" all sticky and wet"
		elif(GM.pc.hasPenis()):
			cumDesc = "your "+(RNG.pick(["caged", "locked"]) if GM.pc.isWearingChastityCage() else "")+RNG.pick(["dick", "cock", "member"])+" dribbles out its load"
			if(not GM.pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom) and not GM.pc.getInventory().hasSlotEquipped(InventorySlot.Body)):
				 cumDesc += " onto the ground"
			else:
				cumDesc += " into your "+undiesDesc
		elif(GM.pc.hasVagina()):
			cumDesc = "your spasming "+RNG.pick(["pussy", "pussy", "slit", "kitty"])
			if(not GM.pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom) and not GM.pc.getInventory().hasSlotEquipped(InventorySlot.Body)):
				 cumDesc += " drips your juices down your thighs."
			else:
				cumDesc += " makes your "+undiesDesc+" all wet"
		
		saynn("With your hands secured out of reach, you can only desperately moan and hump the air as "+cumDesc+".")
		saynn("[say=pc]A-aah... Hff...[/say]")
		saynn("The orgasm is physically unsatisfying with no stimulation or sensation. But to your submissively obedient mind, the pleasure of cumming when commanded is the best feeling imaginable. Even the humiliation of is has you pleased and blushing.")
		
		if(!(npcVariation in ["mean", "kind", "subby"])):
			saynn("[say=npc]"+RNG.pick([
				"Not a bad party trick.",
				"I can feel you shivering~",
				"Hah, it worked. No kidding."
			])+"[/say]")
			
		if(npcVariation == "mean"):
			saynn("[say=npc]"+RNG.pick([
				"Easy, just like you are.",
				"Voice controlled fucktoy. I like it.",
				"Don't get used to it."
			])+"[/say]")
			
		if(npcVariation == "kind"):
			saynn("[say=npc]"+RNG.pick([
				"That's it, ride it out~",
				"Good {pc.boy}, {pc.name}! Very good!",
				"You look like you enjoyed that~",
			])+"[/say]")
			
		if(npcVariation == "subby"):
			saynn("[say=npc]"+RNG.pick([
				"That looks fun! I've got to learn how to do that.",
				"Aw, I'm jealous~",
				"I bet that feels real good...",
			])+"[/say]")
			
		saynn("{npc.Name} lets go of your wrists. Your arms shakily raise back above your head, and you...")
			
		HypnokinkUtil.addHypnoButtons(self, "pick_subscene", "resist", ["Calm down", "Relax"])
	if(state == "hands_free_orgasm_3_selfdeny"):
		playAnimation(StageScene.SexFreeStanding, "tease", {pc=npcID, npc="pc"})
		saynn("Even with spikes of pleasures threatening to push you over the edge, you somehow manage to find the willpower to deny yourself the sweet release of orgasm. Instead, desperate and horny, you stay on the edge as your body fakes going through the physical signs that'd usually accompany one.")	
		saynn("[say=pc]A-aah... Hff...[/say]")
		saynn("You quiver, and shake, and ride the edge for several agonizing moments.")
		
		if(!(npcVariation in ["mean", "kind", "subby"])):
			saynn("[say=npc]"+RNG.pick([
				"Not a bad party trick.",
				"I can feel you shivering~",
				"Hm. No kidding.",
				"What, all dry?"
			])+"[/say]")
			
		if(npcVariation == "mean"):
			saynn("[say=npc]"+RNG.pick([
				"Easy, just like you are.",
				"Voice controlled fucktoy. I like it.",
				"Don't get used to it.",
				"Did you even actually cum? Whatever, I don't care."
			])+"[/say]")
			
		if(npcVariation == "kind"):
			saynn("[say=npc]"+RNG.pick([
				"That's it, ride it out~",
				"Good {pc.boy}, {pc.name}! Very good!",
				"You look like you enjoyed that~",
				"Aw, a dry orgasm? That's okay, you'll get it right next time, I'm sure."
			])+"[/say]")
			
		if(npcVariation == "subby"):
			saynn("[say=npc]"+RNG.pick([
				"I've got to learn how to do that.",
				"Aw, I'm jealous~",
				"I bet that feels pretty good...",
				"Can't manage it either? You'll get there, I'm sure."
			])+"[/say]")
			
		saynn("{npc.Name} lets go of your wrists. Your arms shakily raise back above your head, and you...")
			
		HypnokinkUtil.addHypnoButtons(self, "pick_subscene", "resist", ["Calm down", "Relax"])
		
	if(state == "finale"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		
		if(!(npcVariation in ["mean", "kind", "subby"])):
			saynn("[say=npc]Okay, I think I'm done. You can lower your hands.[/say]")
			saynn("You let your hands drop.")
			if(gotStripped):
				saynn("[say=npc]Dunno about you but [i]I[/i] had fun. Here, put this back on.[/say]")
				saynn("{npc.He} {npc.verb('hand')} you your "+GM.pc.getInventory().getEquippedItemByID(strippedItemID).getVisibleName().to_lower()+".")
				saynn("With your thoughts still hazy, by the time you finish dressing yourself and look up, {npc.name} is already gone.")
			else:
				saynn("Your thoughts still hazy, by the time you look up, {npc.name} is already gone.")
				
			
		if(npcVariation == "mean"):
			saynn("[say=npc]I'm done here.[/say]")
			if(gotStripped):
				playAnimation(StageScene.Duo, "defeat", {npc=npcID})
				#not equipped here, hence not getEquippedItemByID
				saynn("{npc.He} {npc.verb('toss', 'tosses')} your "+GM.pc.getInventory().getFirstOf(strippedItemID).getVisibleName().to_lower()+" at your feet.")
				saynn("[say=npc]Pick it up.[/say]")
				saynn("You reach down to retrieve your things, only to get roughly grabbed by the back of your collar and shoved onto your knees.")
				saynn("[say=npc]Don't bother putting it back on. Advertise what you are. Understood?[/say]")
				saynn("All you manage is a shaky nod.")
			else:
				saynn("{npc.He} {npc.verb('shove')} you aside.")
			saynn("[say=npc]You're pathetic, but that just makes fucking with you more fun. I'll see you around, "+RNG.pick(["fucktoy", "slut", "whore", "bitch"])+".[/say]")
			
		if(npcVariation == "kind"):
			saynn("[say=npc]I've had fun, did you? Lower your hands, please?[/say]")
			saynn("You let your hands drop.")
			if(gotStripped):
				saynn("[say=npc]You wont mind if I...[/say]")
				saynn("{npc.He} {npc.verb('help')} you put your "+GM.pc.getInventory().getEquippedItemByID(strippedItemID).getVisibleName().to_lower()+" back on.")
			saynn("[say=npc]Thanks for playing with me! We should do this again sometime~[/say]")
			
		if(npcVariation == "subby"):
			saynn("[say=npc]I almost want to take you somewhere and have more fun, but...[/say]")
			saynn("{npc.He} gently {npc.verb('pull')} your arms back down.")
			saynn("[say=npc]I'd like you better fully aware and in charge~[/say]")
			if(gotStripped):
				saynn("[say=npc]Can I help you with these?[/say]")
				saynn("{npc.He} {npc.verb('hand')} you your "+GM.pc.getInventory().getEquippedItemByID(strippedItemID).getVisibleName().to_lower()+" and {npc.verb('help')} you put it back on.")		
			saynn("{npc.He} {npc.verb('sashay')} away, shaking {npc.his} hips for your benefit a few more times along the way.")
			saynn("[say=npc]Until then, see you around![/say]")
			
		addButton("Leave", "Time to go", "endthescene")
		
	if(state == "resist"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		saynn("[say=pc]"+RNG.pick(["St-stop...", "W-wait...", "I don't...", "I can't-", "No!", "Please, I..."])+"[/say]")
		saynn("You shudder, on the brink of breaking the spell.")
		
		if(!(npcVariation in ["mean", "kind", "subby"])):
			saynn("[say=npc]"+RNG.pick([
				"What?", 
				"What is it?", 
				"No, don't be like that..."
				])+"[/say]")
				
		if(npcVariation == "mean"):
			saynn("[say=npc]"+RNG.pick([
				"Know your place! Last chance.", 
				"How dare you.", 
				"Don't do something I'll make you regret."
				])+"[/say]")
			
		if(npcVariation == "kind"):
			saynn("[say=npc]"+RNG.pick([
				"Hm? Is there a problem?", 
				"Do you want to stop?", 
				"Did I push too hard?"
				])+"[/say]")
			
		if(npcVariation == "subby"):
			saynn("[say=npc]"+RNG.pick([
				"Aw, are we not playing anymore?", 
				"No, don't stop yet...", 
				"Let's have just a little more fun?"
				])+"[/say]")
			
		saynn("You've interrupted {npc.nameS} current plan of action. Now that you did, you really should just...")
		HypnokinkUtil.addHypnoButtons(self, "pick_subscene", "resist_2", [], ["Escape", "Get away", "Resist", "Break away"])
		
	if(state == "resist_2"):
		playAnimation(StageScene.Solo, "walk")
		saynn("Taking advantage of the element of surprise, you push {npc.name} aside and run for it.")
		addButton("Run", "", "endthescene")
			
func pickSubscene() -> String:
	if(iterations >= doneWhenIterations):
		setState("finale")
		return "finale"
	iterations += 1
	var options = []
	options.append(["bodywriting",1.0])
	if(GM.pc.getLustLevel() > 0.6 and iterations > 0):
		options.append(["hands_free_orgasm",2.0 * GM.pc.getLustLevel()])
	if(npcVariation == "mean"):
		options.append(["punch",1.0])
	if(npcVariation != "mean"):
		options.append(["hug",1.0])
	if(npcVariation == "subby"):
		options.append(["kneel",1.0])
	if(npcVariation != "subby"):
		options.append(["tease",1.0])
		if(not GM.pc.getInventory().hasSlotEquipped(InventorySlot.Wrists)):
			options.append(["cuffs_wrists", 1.0])
		if(not GM.pc.getInventory().hasSlotEquipped(InventorySlot.Ankles)):
			options.append(["cuffs_ankles", 1.0])
	var unusedOptions = []
	for optionPair in options:
		if(not optionsUsed.has(optionPair[0])):
			unusedOptions.append(optionPair)
	if(unusedOptions.size() == 0):
		setState("finale")
		return "finale"
	var option = RNG.pickWeightedPairs(unusedOptions)
	optionsUsed.append(option)
	setState(option)
	return option

func _react(_action: String, _args):
	var npc: BaseCharacter = GlobalRegistry.getCharacter(npcID)
	var pcInventory = GM.pc.getInventory()
	npc = npc #dont bother me godot
	
	if(doneWhenIterations == -1):
		doneWhenIterations = RNG.randi_range(2,4)
	
	if(_action == "pick_subscene"):
		_action = pickSubscene()
	
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == ""):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(2,6))
		GM.pc.addLust(RNG.randi_range(3,6))
		processTime(1 * 60)
			
	if(_action == "stripped"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(2,6))
		GM.pc.addLust(RNG.randi_range(3,6))
		processTime(1 * 60)
		strippedItemID = pcInventory.getEquippedItem(InventorySlot.Body).id
		pcInventory.unequipSlot(InventorySlot.Body)
		gotStripped = true

	if(_action == "cuffs_wrists_post"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(2,6))
		GM.pc.addLust(RNG.randi_range(3,6))
		processTime(1 * 60)
		var cuff
		if(npcVariation == "mean"):
			cuff = GlobalRegistry.createItem("inmatewristcuffs")   #meanies always use the real deal
		elif(npcVariation == "kind"):
			cuff = GlobalRegistry.createItem("ImaginaryWristCuffs") #kind inmates always fake it
		else:
			cuff = GlobalRegistry.createItem("inmatewristcuffs") if RNG.chance(35) else GlobalRegistry.createItem("ImaginaryWristCuffs")
		pcInventory.forceEquipStoreOther(cuff) #just in case, though its checked to be empty earlier.
		_action = pickSubscene()
		
	if(_action == "cuffs_ankles_post"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(2,6))
		GM.pc.addLust(RNG.randi_range(3,6))
		processTime(1 * 60)
		var cuff
		if(npcVariation == "mean"):
			cuff = GlobalRegistry.createItem("inmateanklecuffs")   #meanies always use the real deal
		elif(npcVariation == "kind"):
			cuff = GlobalRegistry.createItem("ImaginaryAnkleCuffs") #kind inmates always fake it
		else:
			cuff = GlobalRegistry.createItem("inmateanklecuffs") if RNG.chance(35) else GlobalRegistry.createItem("ImaginaryAnkleCuffs")
		pcInventory.forceEquipStoreOther(cuff) #just in case, though its checked to be empty earlier.
		_action = pickSubscene()

	if(_action == "bodywriting"):
		GM.pc.addLust(RNG.randi_range(3,6))
		
	if(_action == "bodywriting_2"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(5,10))
		GM.pc.addLust(RNG.randi_range(5,10))
		processTime(1 * 60)
		lastBodywritingZone = BodyWritingsZone.getRandomZone()
		if(npcVariation == "subby"):
			lastBodywritingID = RNG.pick(["cute","cutie","lessthanthree","cutefacesymbol"])
		elif(npcVariation == "kind"):
			lastBodywritingID = RNG.pick(["makemecum","publictoy","publicpet","submissive","subby","lessthanthree"])
		elif(npcVariation == ""):
			lastBodywritingID = RNG.pick(["useme","freeuse","stripme","slave","slut","publictoy","publicpet","submissive","subby","subbyslut"])
		elif(npcVariation == "mean"):
			lastBodywritingID = BodyWritings.getRandomWritingIDForZone(lastBodywritingZone)
		GM.pc.addBodywriting(lastBodywritingZone, lastBodywritingID)
		
	if(_action == "kneel"):
		GM.pc.addLust(RNG.randi_range(5,10))
		
	if(_action == "kneel_2"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(5,10))
		GM.pc.addLust(RNG.randi_range(5,10))
		processTime(1 * 60)
		
	if(_action == "punch"):
		GM.pc.addLust(RNG.randi_range(3,6))
		GM.pc.addPain(RNG.randi_range(4,10))
		
	if(_action == "punch_2"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(5,10))
		GM.pc.addLust(RNG.randi_range(3,6))
		GM.pc.addPain(RNG.randi_range(12,25))
		processTime(1 * 60)
	
	if(_action == "tease"):
		GM.pc.addLust(RNG.randi_range(5,10))
		
	if(_action == "tease_2"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(5,10))
		GM.pc.addLust(RNG.randi_range(5,10))
		processTime(1 * 60)

	if(_action == "hands_free_orgasm"):
		GM.pc.addLust(RNG.randi_range(10,15))
		
	if(_action == "hands_free_orgasm_2"):
		GM.pc.addLust(RNG.randi_range(15,20))
		
	if(_action == "hands_free_orgasm_3"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(20,30))
		GM.pc.cumOnFloor()
		GM.pc.addArousal(-1.0)
		GM.pc.addLust(-int(GM.pc.getLust()/2.0))
		processTime(2 * 60)
		
	if(_action == "hands_free_orgasm_3_selfdeny"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(10,20))
		GM.pc.addArousal(-0.1)
		GM.pc.addLust(-10)
	
	if(_action == "finale"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(2,6))
		processTime(2 * 60)
		if(gotStripped and npcVariation != "mean"):
			var item = pcInventory.getFirstOf(strippedItemID)
			pcInventory.equipItem(item)
		GM.pc.addSkillExperience(Skill.Hypnosis, 10)
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	pass
	
func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["npcVariation"] = npcVariation
	data["gotStripped"] = gotStripped
	data["strippedItemID"] = strippedItemID
	data["iterations"] = iterations
	data["doneWhenIterations"] = doneWhenIterations
	data["optionsUsed"] = optionsUsed
	data["lastBodywritingZone"] = lastBodywritingZone
	data["lastBodywritingID"] = lastBodywritingID

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npcVariation = SAVE.loadVar(data, "npcVariation", "")
	gotStripped = SAVE.loadVar(data, "gotStripped", false)
	strippedItemID = SAVE.loadVar(data, "strippedItemID", "")
	iterations = SAVE.loadVar(data, "iterations", 0)
	doneWhenIterations = SAVE.loadVar(data, "doneWhenIterations", -1)
	optionsUsed = SAVE.loadVar(data, "optionsUsed", [])
	lastBodywritingZone = SAVE.loadVar(data, "lastBodywritingZone", "")
	lastBodywritingID = SAVE.loadVar(data, "lastBodywritingID", "")
