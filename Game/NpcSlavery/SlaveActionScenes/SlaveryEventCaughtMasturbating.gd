extends SceneBase

var npcID = ""
var npc = null
var masType = "penis"
var didABrat = false

func _init():
	sceneID = "SlaveryEventCaughtMasturbating"

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

func _reactInit():
	var possible = []
	if(npc.hasReachablePenis()):
		possible.append("penis")
	if(npc.hasReachableVagina()):
		possible.append("vag")
	if(possible.size() <= 0):
		endScene()
		return
	masType = RNG.pick(possible)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		if (masType == "penis"):
			playAnimation(StageScene.Grope, "watchstroke", {pc=npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			saynn("You walk up to your slave.. and notice that {npc.he} {npc.isAre} stroking {npc.his} {npc.penis}. Quite eagerly too.")

		elif (masType == "vag"):
			playAnimation(StageScene.Grope, "watchrub", {pc=npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			saynn("You walk up to your slave.. and notice that {npc.he} {npc.isAre} rubbing {npc.his} {npc.pussyStretch} pussy. Quite eagerly too.")

		saynn("Encouraging might {npc.him} like you more.. but it also might spoil {npc.him}. If you don't want your slave to masturbate, maybe you can try cuffing {npc.his} hands.."+str(" Or putting a chastity cage on {npc.his} cock." if (masType == "penis") else "")+"")

		addButton("Encourage", "Let them orgasm", "do_encourage_check")
		addButton("Order to stop", "Order them to stop", "do_orderstop_check")
		addButtonWithChecks("Force to stop", "You can't let this happen no matter what", "force_stop_check", [], [[ButtonChecks.NotHandsBlocked], [ButtonChecks.NotArmsRestrained]])
		addButton("Offer yourself", "Offer them to fuck you instead", "do_offerself_check")
	if(state == "do_forcetostop_fail"):
		playAnimation(StageScene.Duo, "hurt", {npc=npcID, npcAction="shove"})
		saynn("You can't let that happen no matter what. So you don't even order your slave. Instead, you rush up to {npc.him} and forcibly wrench {npc.his} arms behind {npc.his} back.")

		saynn("But your slave manages to break free!")

		saynn("[say=npc]"+str(RNG.pick(["Fuck you! I must cum! I will cum!", "Screw you, I'm cumming today!", "Fuck off, I need it!"]))+"[/say]")

		saynn("Looks like it's a fight.")

		addButton("Fight", "Start the fight", "do_fight_slave")
	if(state == "lost_slavecums"):
		if (masType == "penis"):
			playAnimation(StageScene.Grope, "watchstroke", {pc=npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			saynn("{npc.name} won.. meaning {npc.he} gets to do what {npc.he} wants.")

			saynn("[say=npc]Screw you..[/say]")

			saynn("Your slave starts stroking {npc.his} member fast, swiftly bringing {npc.himself} to a climax. Better to stay slightly away and watch rather than risk getting yourself.. caught in the blast.")

			saynn("{npc.name} grunts and arches {npc.his} back as {npc.his} throbbing {npc.penis} shoots thick lines of {npc.cum}, making the floor all messy and sticky. Your slave is left panting and satisfied.")

		elif (masType == "vag"):
			playAnimation(StageScene.Grope, "watchrub", {pc=npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			saynn("{npc.name} won.. meaning {npc.he} gets to do what {npc.he} wants.")

			saynn("[say=npc]Screw you..[/say]")

			saynn("Your slave starts fingering {npc.his} slit fast, swiftly bringing {npc.himself} to a climax. Better to stay slightly away and watch rather than risk getting yourself.. caught in the blast.")

			saynn("{npc.name} moans and arches {npc.his} back as {npc.his} twitching {npc.pussyStretch} pussy releases a fountain of transparent {npc.girlcum}, making the floor all wet and sticky. Your slave is left panting and satisfied.")

		saynn("Looks like your slave has earned a punishment. Hopefully it was worth it for {npc.him}.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "won_antihornyfight"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcAction="defeat", npcBodyState={leashedBy="pc"}})
		saynn("You win. Your slave, {npc.name}, hits the floor, unable to continue fighting.")

		if (masType == "penis"):
			saynn("No stroking for {npc.him} looks like, {npc.he} {npc.isAre} forced to endure the strong desire without being able to satisfy it.")

		elif (masType == "vag"):
			saynn("No masturbating for {npc.him} looks like, {npc.he} {npc.isAre} forced to endure the strong desire without being able to satisfy it.")

		saynn("Your slave looks a bit more desperate than before. {npc.He} will surely trust you less too. Maybe you shouldn't trust {npc.him} too and cuff {npc.his} hands..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_forcetostop"):
		playAnimation(StageScene.Grope, "tease", {pc=npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
		saynn("You can't let that happen no matter what. So you don't even order your slave. Instead, you rush up to {npc.him} and forcibly wrench {npc.his} arms behind {npc.his} back.")

		saynn("[say=npc]"+str(RNG.pick(["H-hey!.. I was so close!", "No! Let me cum!", "No, don't do this, please!"]))+"[/say]")

		if (masType == "penis"):
			saynn("Nope. You force {npc.him} to watch as {npc.his} {npc.penis} starts to go soft without any stimulation.")

		elif (masType == "vag"):
			saynn("Nope. You force {npc.him} to watch as {npc.his} drippy pussy is left to dry up without any stimulation.")

		saynn("Crisis averted.. but your slave won't trust you much for doing this.. it will also affect {npc.his} mental health.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_orderstop"):
		playAnimation(StageScene.Grope, "tease", {pc=npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
		saynn("Your slave seems to be close.. but that won't stop you from denying {npc.him}.")

		saynn("[say=pc]Stop, right now. Or you're gonna regret it.[/say]")

		if (masType == "penis"):
			saynn("{npc.name} hears you.. {npc.his} hand stroking {npc.his} cock slower and slower as {npc.he} deliberates..")

			saynn("[say=npc]Yes, {npc.pcOwner}..[/say]")

			saynn("You can just feel the desperation in {npc.his} noises as {npc.he} denies {npc.himself} {npc.his} own orgasm, pulling {npc.his} hand away from {npc.his} hard leaky shaft.. and just letting it go soft.")

			saynn("Looks like your slave just dodged a bullet, there is nothing really to punish {npc.him} for.")

		elif (masType == "vag"):
			saynn("{npc.name} hears you.. {npc.his} hand rubbing {npc.his} pussy slower and slower as {npc.he} deliberates..")

			saynn("[say=npc]Yes, {npc.pcOwner}..[/say]")

			saynn("You can just feel the desperation in {npc.his} noises as {npc.he} denies {npc.himself} {npc.his} own orgasm, pulling {npc.his} hand away from {npc.his} slick drippy slit.. and just letting {npc.his} sensitive needy petals stay neglected.")

			saynn("Looks like your slave just dodged a bullet, there is nothing really to punish {npc.him} for.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_orderstop_fail"):
		saynn("Your slave seems to be close.. but that won't stop you from denying {npc.him}.")

		saynn("[say=pc]Stop, right now. Or you're gonna regret it.[/say]")

		if (masType == "penis"):
			playAnimation(StageScene.Grope, "watchstroke", {pc=npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			saynn("{npc.name} hears you.. {npc.his} hand stroking {npc.his} cock slower and slower as {npc.he} deliberates..")

			saynn("[say=npc]Screw you..[/say]")

			saynn("Rather than denying {npc.himself}, your slave decides to go against your words and starts stroking {npc.his} member fast, swiftly bringing {npc.himself} to a climax. Better to stay slightly away and watch rather than risk getting yourself.. caught in the blast.")

			saynn("{npc.name} grunts and arches {npc.his} back as {npc.his} throbbing {npc.penis} shoots thick lines of {npc.cum}, making the floor all messy and sticky. Your slave is left panting and satisfied.")

		elif (masType == "vag"):
			playAnimation(StageScene.Grope, "watchrub", {pc=npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			saynn("{npc.name} hears you.. {npc.his} hand rubbing {npc.his} pussy slower and slower as {npc.he} deliberates..")

			saynn("[say=npc]Screw you..[/say]")

			saynn("Rather than denying {npc.himself}, your slave decides to go against your words and starts fingering {npc.his} slit fast, swiftly bringing {npc.himself} to a climax. Better to stay slightly away and watch rather than risk getting yourself.. caught in the blast.")

			saynn("{npc.name} moans and arches {npc.his} back as {npc.his} twitching {npc.pussyStretch} pussy releases a fountain of transparent {npc.girlcum}, making the floor all wet and sticky. Your slave is left panting and satisfied.")

		saynn("Looks like your slave has earned a punishment. Hopefully it was worth it for {npc.him}.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_encourage"):
		saynn("You decide to just.. watch it unfold. {npc.name} notices your curious stare.. and keeps going as you give {npc.him} a silent permission to continue.")

		if (masType == "penis"):
			playAnimation(StageScene.Grope, "watchstroke", {pc=npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			saynn("Your gazes keep intersecting as your slave keeps sliding {npc.his} palm along {npc.his} shaft, the tip leaking plenty of pre. {npc.He} doesn't say anything back, just trying to enjoy the moment before you'd eventually decide to stop {npc.him}.")

		elif (masType == "vag"):
			playAnimation(StageScene.Grope, "watchrub", {pc=npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			saynn("Your gazes keep intersecting as your slave keeps rubbing {npc.his} pussy with {npc.his} digits, occasionally switching to the clit and giving it a few rubs too, {npc.his} sensitive folds looking slick. {npc.He} doesn't say anything back, just trying to enjoy the moment before you'd eventually decide to stop {npc.him}.")

		saynn("Judging from how {npc.name} is panting, {npc.he} must be close.")

		addButton("Just watch", "Let them cum", "do_encourage_cum")
		addButtonWithChecks("Help them", "Offer them a hand", "do_encourage_help", [], [[ButtonChecks.NotHandsBlocked], [ButtonChecks.NotArmsRestrained]])
	if(state == "do_encourage_help"):
		if (masType == "penis"):
			playAnimation(StageScene.Grope, "strokefast", {pc=npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			saynn("It looked so fun that you decided to join in and help your slave! Your hand displaces {npc.his} as you start stroking {npc.his} cock instead. Any protests are silenced with a quiet..")

			saynn("[say=pc]Tshh-h.. Just enjoy it.[/say]")

			saynn("And so {npc.he} does, {npc.his} balls tensing up already. You can feel {npc.his} shaft throbbing in your hand as you slide it along the length.. until a number of thick strings of seed bursts out of it!")

			if (didABrat):
				saynn("You weren't standing in the.. blast zone.. But your slave purposefully turned at the last second, giving you zero time to react before {npc.his} load lands on you! Wow!")

				saynn("[say=pc]HEY![/say]")

				saynn("All you hear back is moans and giggling. That surely deserves a [b]big[/b] punishment. You make sure to squeeze {npc.his} balls tightly to make {npc.him} shush.")

			else:
				saynn("You were standing slightly aside, making sure {npc.his} load doesn't land on you and hits the floor instead.")

				saynn("Looks like your slave received a good discharge. {npc.He} seems happy about it too, you notice a little smile."+str(" Hopefully that will help against {npc.his} depression a bit." if npc.getNpcSlavery().getDespair() > 0.6 else "")+"")

		elif (masType == "vag"):
			playAnimation(StageScene.Grope, "gropefast", {pc=npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			saynn("It looked so fun that you decided to join in and help your slave! Your hand displaces {npc.his} as you start playing with {npc.his} pussy instead. Any protests are silenced with a quiet..")

			saynn("[say=pc]Tshh-h.. Just enjoy it.[/say]")

			saynn("And so {npc.he} does, you can hear some of {npc.his} new cute moans already. Your thumb is focussed on rubbing that little bean while the two digits spread the folds and start fingering that pussy hole fast.. until an entire fountain of juices bursts out of it!")

			if (didABrat):
				saynn("You weren't standing in the.. blast zone.. But your slave purposefully turned at the last second, giving you zero time to react before {npc.his} {npc.girlcum} lands on you! Wow!")

				saynn("[say=pc]HEY![/say]")

				saynn("All you hear back is moans and giggling. That surely deserves a [b]big[/b] punishment. You start by gently slapping {npc.his} pussy to make {npc.him} shush.")

			else:
				saynn("You were standing slightly aside, making sure {npc.his} {npc.girlcum} doesn't land on you and hits the floor instead.")

				saynn("Looks like your slave received a good discharge. {npc.He} seems happy about it too, you notice a little smile."+str(" Hopefully that will help against {npc.his} depression a bit." if npc.getNpcSlavery().getDespair() > 0.6 else "")+"")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_encourage_cum"):
		if (masType == "penis"):
			playAnimation(StageScene.Grope, "watchstroke", {pc=npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			saynn("You watch how your slave starts grunting and moaning, {npc.his} balls tensing up, the cock in {npc.his} hands throbbing.. until a number of thick strings of seed bursts out of it!")

			if (didABrat):
				saynn("You weren't standing in the.. blast zone.. But your slave purposefully turned at the last second, giving you zero time to react before {npc.his} load lands on you! Wow!")

				saynn("[say=pc]HEY![/say]")

				saynn("All you hear back is moans and giggling. That surely deserves a [b]big[/b] punishment.")

			else:
				saynn("You were standing slightly aside, making sure {npc.his} load doesn't land on you and hits the floor instead.")

				saynn("Looks like your slave received a good discharge. {npc.He} seems happy about it too, you notice a little smile."+str(" Hopefully that will help against {npc.his} depression a bit." if npc.getNpcSlavery().getDespair() > 0.6 else "")+"")

		elif (masType == "vag"):
			playAnimation(StageScene.Grope, "watchrub", {pc=npcID, npc="pc", bodyState={exposedCrotch=true, hard=true}})
			saynn("You watch how your slave starts to squirm a bit and let out cute moans, {npc.his} hand motions become all shaky and stuttery, {npc.his} pussy slit clenching.. until an entire fountain of juices bursts out of it!")

			if (didABrat):
				saynn("You weren't standing in the.. blast zone.. But your slave purposefully turned at the last second, giving you zero time to react before {npc.his} {npc.girlcum} lands on you! Wow!")

				saynn("[say=pc]HEY![/say]")

				saynn("All you hear back is moans and giggling. That surely deserves a [b]big[/b] punishment.")

			else:
				saynn("You were standing slightly aside, making sure {npc.his} {npc.girlcum} doesn't land on you and hits the floor instead.")

				saynn("Looks like your slave received a good discharge. {npc.He} seems happy about it too, you notice a little smile."+str(" Hopefully that will help against {npc.his} depression a bit." if npc.getNpcSlavery().getDespair() > 0.6 else "")+"")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_encourage_fail"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		saynn("You decide to just.. watch it unfold. {npc.name} notices your curious stare.. and stops.")

		saynn("[say=npc]"+str(RNG.pick(["..what?", "Why are you looking?", "Need something?", "Can't you see I'm horny over here?"]))+"[/say]")

		saynn("[say=pc]Keep going.[/say]")

		if (masType == "penis"):
			saynn("{npc.He} strokes {npc.his} members a few more times.. but then stops.")

		else:
			saynn("{npc.He} rubs {npc.his} pussy a few more times.. but then stops.")

		saynn("[say=npc]Look away![/say]")

		saynn("Wow, you don't plan on listening to your slave's orders. Instead, you put on stern eyes.")

		saynn("[say=npc]Well, then I won't do it..[/say]")

		saynn("Looks like {npc.he} earned {npc.himself} a small punishment too.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "offerself_toosubby"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		saynn("{npc.He} seems to be having fun.. alone. Why not offer {npc.him} to have some fun with you?")

		saynn("[say=pc]Why don't you fuck me instead. Just this one time.[/say]")

		saynn("Your slave notices your interest and instantly stops.")

		saynn("[say=npc]"+str(RNG.pick(["Oh, uhh..", "Oh fuck.."]))+"[/say]")

		saynn("[say=pc]C'mon, it will be fun.[/say]")

		saynn("{npc.He} lowers {npc.his} head.")

		saynn("[say=npc]Sorry.. I don't think I have it in me..[/say]")

		saynn("Looks like your slave is too subby for this! Oh well.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "offerself_nofetish"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		saynn("{npc.He} seems to be having fun.. alone. Why not offer {npc.him} to have some fun with you?")

		saynn("[say=pc]Why don't you fuck me instead. Just this one time.[/say]")

		saynn("Your slave notices your interest and instantly stops.")

		saynn("[say=npc]"+str(RNG.pick(["Oh, uhh..", "Oh fuck.."]))+"[/say]")

		saynn("[say=pc]C'mon, it will be fun.[/say]")

		saynn("{npc.He} shrugs.")

		saynn("[say=npc]I'm not into sex much, you know.[/say]")

		saynn("Weird, huh. Looks like your slave is lacking interest in most sex activities.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_offerself"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		saynn("{npc.He} seems to be having fun.. alone. Why not offer {npc.him} to have some fun with you?")

		saynn("[say=pc]Why don't you fuck me instead. Just this one time.[/say]")

		saynn("Your slave notices your interest and instantly stops.")

		saynn("[say=npc]"+str(RNG.pick(["Huh?", "What?", "Are your serious?"]))+"[/say]")

		saynn("[say=pc]C'mon, it will be fun.[/say]")

		saynn("{npc.He} checks you out.. and bites {npc.his} lip.")

		saynn("[say=npc]Alright, don't complain later.[/say]")

		addButton("Continue", "See what happens next", "start_sex")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_encourage_check"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		var failChance = (npcSlavery.personalityScore({PersonalityStat.Coward: 1.0, PersonalityStat.Brat: 1.0}) - 0.2 )* 30.0 + 30.0 - npcSlavery.getObedience() * 30.0 + npcSlavery.fetishScore({Fetish.Exhibitionism:-1.0}) * 40.0
		
		if(!RNG.chance(failChance)):
			setState("do_encourage")
		else:
			setState("do_encourage_fail")
			npcSlavery.deservesPunishment(1)
		return

	if(_action == "do_orderstop_check"):
		processTime(6*60)
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		var failChance = (npcSlavery.personalityScore({PersonalityStat.Coward: -1.0, PersonalityStat.Brat: 1.0, PersonalityStat.Impatient: 1.0}) + 0.2 )* 40.0 * (1.0 - npcSlavery.getObedience()*1.5)
		
		if(!RNG.chance(failChance)):
			setState("do_orderstop")
			npcSlavery.addDespair(0.01)
			npcSlavery.addAwareness(0.05)
			npcSlavery.addLove(-0.05)
			npcSlavery.addTrust(0.02)
			npcSlavery.addSpoiling(-0.1)
			npcSlavery.addNeediness(0.5)
		else:
			npcSlavery.addObedience(-0.02)
			npcSlavery.addDespair(-0.03)
			npcSlavery.addLove(-0.02)
			setState("do_orderstop_fail")
			npcSlavery.deservesPunishment(2)
			npcSlavery.addSpoiling(0.05)
			npc.orgasmFrom(npcID)
		return

	if(_action == "force_stop_check"):
		processTime(6*60)
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		var failChance = (npcSlavery.personalityScore({PersonalityStat.Coward: -1.0, PersonalityStat.Brat: 1.0, PersonalityStat.Impatient: 1.0}) + 0.2 )* 20.0 * (1.0 - npcSlavery.getObedience()*0.5)
		failChance = max(10, failChance)
		
		if(!RNG.chance(failChance)):
			setState("do_forcetostop")
			npcSlavery.addDespair(0.04)
			npcSlavery.addAwareness(-0.02)
			npcSlavery.addTrust(-0.05)
			npcSlavery.addSpoiling(-0.1)
			npcSlavery.addNeediness(0.5)
		else:
			setState("do_forcetostop_fail")
		return

	if(_action == "do_offerself_check"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		npcSlavery.addBrokenSpirit(-0.05)
		npcSlavery.addTrust(0.05)
		var subbyness = npcSlavery.personalityScore({PersonalityStat.Subby: 1.0})
		
		if(subbyness > 0.15):
			setState("offerself_toosubby")
			return
		var needsAtLeastOneFetish = [Fetish.AnalSexGiving, Fetish.AnalSexReceiving, Fetish.VaginalSexGiving, Fetish.VaginalSexReceiving, Fetish.OralSexGiving, Fetish.OralSexReceiving, Fetish.RimmingGiving, Fetish.RimmingReceiving, Fetish.FeetplayGiving, Fetish.FeetplayReceiving]
		for theFetish in needsAtLeastOneFetish:
			if(npcSlavery.fetishScore({theFetish:1.0}) >= 0.0):
				setState("do_offerself")
				return
		setState("offerself_nofetish")
		return

	if(_action == "do_fight_slave"):
		runScene("FightScene", [npcID], "antihornyfight")
		return

	if(_action == "do_encourage_cum"):
		processTime(5*60)
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		npcSlavery.addLove(0.05)
		npcSlavery.addAwareness(0.02)
		npcSlavery.addSpoiling(0.05)
		npcSlavery.addDespair(-0.05)
		if(RNG.chance(npcSlavery.getBratScore() * 40.0)):
			didABrat = true
			if(masType == "penis"):
				GM.pc.cummedOnBy(npcID)
			if(masType == "vag"):
				GM.pc.cummedOnBy(npcID, FluidSource.Vagina)
			npcSlavery.deservesPunishment(3)
		npc.orgasmFrom(npcID)

	if(_action == "do_encourage_help"):
		processTime(5*60)
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		npcSlavery.addLove(0.03)
		npcSlavery.addAwareness(0.02)
		npcSlavery.addObedience(0.02)
		npcSlavery.addSpoiling(0.05)
		npcSlavery.addDespair(-0.05)
		if(RNG.chance(npcSlavery.getBratScore() * 40.0)):
			didABrat = true
			if(masType == "penis"):
				GM.pc.cummedOnBy(npcID)
			if(masType == "vag"):
				GM.pc.cummedOnBy(npcID, FluidSource.Vagina)
			npcSlavery.deservesPunishment(3)
		npc.orgasmFrom("pc")

	if(_action == "start_sex"):
		runScene("GenericSexScene", [npcID, "pc"], "sex_with_slave")
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "antihornyfight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(battlestate == "win"):
			setState("won_antihornyfight")
			addExperienceToPlayer(10)
			npcSlavery.afterBeatenUp()
			npcSlavery.addDespair(0.04)
			npcSlavery.addAwareness(0.02)
			npcSlavery.addTrust(-0.05)
			npcSlavery.addSpoiling(-0.1)
			npcSlavery.addNeediness(0.5)
		else:
			setState("lost_slavecums")
			npcSlavery.addObedience(-0.02)
			npcSlavery.addDespair(-0.1)
			npcSlavery.addBrokenSpirit(-0.1)
			npcSlavery.addLove(0.02)
			npcSlavery.deservesPunishment(2)
			npc.orgasmFrom(npcID)

	if(_tag == "sex_with_slave"):
		endScene()
		return

func saveData():
	var data = .saveData()

	data["npcID"] = npcID
	data["npc"] = npc
	data["masType"] = masType
	data["didABrat"] = didABrat

	return data

func loadData(data):
	.loadData(data)

	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
	masType = SAVE.loadVar(data, "masType", "penis")
	didABrat = SAVE.loadVar(data, "didABrat", false)
