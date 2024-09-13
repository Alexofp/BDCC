extends DialogueFiller

func _init():
	priority = 10

func getFormIDs() -> Array:
	return [
		"FightLostGeneric",
		"FightWonGeneric",
		"FightSurrender",
		"AttackStart",
		"AttackReact",
		
		"GuardCaughtOffLimits",
		"GuardCaughtOffLimitsFight",
		"GuardInmateSurrender",
		"GuardFrisk",
		"GuardFriskFound",
		"GuardFriskNoFound",
		"GuardGoAway",
		"GuardKeepMoving",
		"GuardFriskFailResist",
		
		"ReactBODYWRITINGS",
		"ReactTALLYMARKS",
		"ReactCOVERED_IN_CUM",
		"ReactCOVERED_IN_PISS",
		"ReactNAKED",
		"ReactCAN_GRAB_AND_FUCK",
		"ReactON_A_LEASH",
		"ReactGETTING_FUCKED",
		
		"ReactLEASHING_SOMEONE",
		"ReactFUCKING_SOMEONE",
		
		"AskKeyCanYouUnlock",
		"AskKeyDeny",
		"AskKeyGive",
		"AskKeyChallenge",
		"AskKeyChallengeUnlock",
		"AskKeyChallengeFail",
		"AskKeyChallengeRefuse",
		"AskKeyChallengeRefuseStay",
		
		"HelpRestraintsAsk",
		"HelpRestraintsAgree",
		"HelpRestraintsAltStart",
		"HelpRestraintsDeny",
		"HelpRestraintsFinished",
		"HelpRestraintsPaid",
		"HelpRestraintsRefusePay",
		"HelpRestraintsRefusePayWhatever",
		
		"SlutwallStealCredits",
		"SlutwallAddTip",
		"StocksShout",
		
		"ProstitutionStart",
		"ProstitutionOffer",
		"ProstitutionUsual",
		"ProstitutionServiceDom",
		"ProstitutionPricySlut",
		"ProstitutionDenied",
		"ProstitutionDeniedWhatever",
		"ProstitutionAccept",
		"ProstitutionDemandCreds",
		"ProstitutionRefuseReturnCreds",
		"ProstitutionScam",
		
		"PunishDecide",
		"PunishDecideStocks",
		"PunishAboutToStocks",
		"PunishLockIntoStocks",
		"PunishSex",
		"PunishSubSex",
		"PunishDecidedSlutwall",
		"PunishLockIntoSlutwall",
		
		"TalkChatWhat",
		"TalkChatCancel",
		"TalkChatLeaving",
		"TalkChatAgree",
		"TalkChatDisagree",
		"TalkChatWhatever",
		"TalkChatPickupLine",
		"TalkChatPickupLineFail",
		"TalkFlirtAccept",
		"TalkFlirtDeny",
		"TalkSexOffer",
		"TalkSexOfferAccept",
		"TalkSexOfferDeny",
		"TalkSexOfferSelf",
		"TalkSexOfferSelfAccept",
		"TalkSexOfferSelfDeny",
		"TalkGrabAndFuck",
		"TalkAboutToKidnap",
		"TalkAboutToKidnapReact",
		]

func canBeUsed(_id:String, _args:Dictionary, _form) -> bool:
	var guard = getChar(_args, _form.mainRole)
	var personality:Personality = guard.getPersonality()
	var meanness = personality.getStat(PersonalityStat.Mean)
	var subby = personality.getStat(PersonalityStat.Subby)
	
	if(meanness > 0.2):
		return false
	if(subby <= 0.5):
		return false
	
	return true

func getText(_id:String, _args:Dictionary):
	if(_id == "FightLostGeneric"):
		return [
			"[[C_UGH]].. I’m sorry.. I lost..",
			"[[C_UGH]].. You’re stronger than me..",
			"[[C_UGH]].. I didn’t mean to upset you..",
			"[[C_UGH]].. I.. I couldn’t keep up..",
			"[[C_UGH]].. You win.. I’ll do better next time..",
			"[[C_UGH]].. I tried.. but you’re just too strong..",
		]
	if(_id == "FightWonGeneric"):
		return [
			"That was close.. I didn’t mean to hurt you..",
			"I wasn’t trying to win..",
			"I hope you’re okay..",
			"I didn’t mean to be too rough..",
			"I didn’t think I could do it..",
			"I’m sorry.. I didn’t want to fight..",
			"I wasn’t expecting that..",
			"I don’t like hurting people..",
			"I hope you’re not mad at me..",
			"I didn’t mean to go too far..",
			"Please don’t be upset..",
			"I feel bad about this..",
			"I’m sorry.. I didn’t mean it..",
		]
	if(_id == "FightSurrender"):
		return [
			"I-I give up.. Please don’t hurt me..",
			"P-Please, I surrender..",
			"Please, don’t hurt me.. I give up..",
			"I’m sorry.. I surrender..",
			"I-I give up.. Please don’t hit me..",
			"I can’t do this.. Please stop..",
		]
	if(_id == "AttackStart"):
		return [
			"I-I don’t want to hurt you.. but I have to..",
			"P-Please, don’t make me do this..",
			"I-I’m sorry, but I have to fight..",
			"I-I’m scared.. but I’ll defend myself..",
			"I-I don’t want to, but I’ll fight if I have to..",
			"I-I don’t want to do this.. but I must..",
		]
	if(_id == "AttackReact"):
		var attackerID = getCharID(_args, "target")
		var reacterID = getCharID(_args, "main")
		var affection:float = GM.main.RS.getAffection(attackerID, reacterID)
		var lust:float = GM.main.RS.getLust(attackerID, reacterID)
		
		if(affection > 0.1):
			return [
				"W-Why are you doing this?",
				"I-I don’t understand..",
				"I thought we were okay..",
				"W-What did I do wrong?",
				"P-Please stop.. It’s me..",
			]
		if(affection < 0.0 && lust >= 0.9):
			return [
				"Why are you so mean to me..?",
				"Y-You make me nervous..",
				"D-Did I upset you..?",
				"I’m.. I’m confused..",
			]
		if(affection <= -0.4):
			return [
				"I-I knew you didn’t like me..",
				"I guess you really hate me..",
				"Please don’t hurt me too much..",
				"I.. I’m scared..",
			]
		
		return [
			"P-Please, don’t do this..",
			"W-What’s wrong?",
			"W-What did I do?",
		]
		
	if(_id == "GuardCaughtOffLimits"):
		return [
			"H-Hey! You shouldn’t be here..",
			"Um, this isn’t where you’re supposed to be..",
			"Y-You’re not allowed here.. You know that, right?",
			"You c-can't be in this area.. It’s off-limits..",
			"This is a restricted area.. Y-You know that, right?..",
			"I don’t want you to get in trouble.. But you can't be here..",
		]
	if(_id == "GuardCaughtOffLimitsFight"):
		return [
			"Hey.. oh.. are we doing this?..",
			"Oh.. Don't make me hurt you..",
			"Why do you resist.. I wouldn't hurt you..",
			"Resisting?.. I guess I.. Um.. I guess we fight..",
		]
	if(_id == "GuardInmateSurrender"):
		return [
			"T-That’s a good choice..",
			"I’m glad you’re cooperating..",
			"T-This is for the best..",
			"You made the right decision..",
			"I-I’m relieved you surrendered..",
			"Thank you for not making this difficult..",
			"I’m glad you’re staying out of trouble..",
		]
	if(_id == "GuardFrisk"):
		return [
			"P-Please stand still.. I-I need to search you..",
			"T-This won’t take long, I promise..",
			"P-Please keep your hands where I can see them..",
			"Could you spread your legs a little? I-I need to check..",
			"Um, hands against the wall, please..",
			"Let’s just get this over with.. Please don’t move..",
			"I-I’m going to pat you down now..",
			"Please stay calm.. I-I have to do this..",
			"C-Could you keep your hands up? I’ll be quick..",
			"P-Please don’t make this harder.. Just stay still..",
		]
	if(_id == "GuardFriskFound"):
		return [
			"Oh.. I’m sorry, but I have to take this..",
			"T-This is contraband.. I need to confiscate it..",
			"S-Sorry, but this isn’t allowed..",
			"I have to take this from you.. I’m really sorry..",
			"Um.. This is against the rules, so I have to take it..",
			"P-Please understand, I need to follow the rules..",
			"I found something that isn’t allowed.. I’m sorry..",
			"Y-You shouldn’t have this.. I’ll take it now..",
			"Um.. I’m going to have to take this from you..",
			"T-This isn’t permitted.. I’ll have to confiscate it..",
			"I’m sorry, but this isn’t allowed here..",
			"P-Please don’t be mad.. I have to take this..",
			"I-I have to take this for safekeeping..",
		]
	if(_id == "GuardFriskNoFound"):
		return [
			"I-It looks like you’re clean..",
			"Alright.. Nothing here..",
			"S-Seems like you’re not hiding anything..",
			"N-No contraband found.. You’re good to go..",
			"You’re clear.. P-Please keep it that way..",
			"Nothing on you today.. That’s good..",
		]
	if(_id == "GuardGoAway"):
		return [
			"Um, you should go now.. Please..",
			"P-Please leave.. I don’t want any trouble..",
			"You should really get out of here..",
		]
	if(_id == "GuardKeepMoving"):
		return [
			"P-Please keep moving..",
			"Y-You need to keep walking..",
			"Don’t stop.. Just keep going..",
			"Keep moving, please..",
			"Please don’t slow down..",
			"Y-You should keep walking..",
		]
	if(_id == "GuardFriskFailResist"):
		return [
			"Ugh.. I-I give up..",
			"F-Fine.. But you’ll regret this..",
			"Y-You think you’re clever? W-We’ll see..",
			"W-Why can’t you just cooperate..?",
		]
	if(_id == "ReactBODYWRITINGS"):
		return [
			"Did you really let someone write on you like that..?",
			"T-Those markings.. they’re kind of.. um.. bold..",
			"I-I guess you don’t mind people knowing..",
			"Y-You must’ve really wanted those words on you..",
			"You wear those words so confidently..",
			"C-Can I write something too..?",
			"Oh wow.. You’re like a piece of art..",
			"A-Are those supposed to mean something..?",
			"I guess you’re proud of those.. huh..?",
		]
	if(_id == "ReactTALLYMARKS"):
		return [
			"Y-You’ve been busy.. haven’t you..?",
			"I-I guess you’ve lost count by now..",
			"Is that how you keep track of things..?",
			"T-That’s a lot of marks.. Are you keeping score..?",
			"Y-You must have a lot of stories behind those marks..",
			"Do you remember all of them..?",
			"You’re running out of space for more.. aren’t you..?",
			"I-Is it hard to keep track now..?",
			"You must have had a lot of experiences..",
		]
	if(_id == "ReactCOVERED_IN_CUM"):
		return [
			"Y-You’re really.. covered..",
			"T-That’s a lot.. Are you okay..?",
			"I-Is that all from.. um..",
			"D-Did you.. um.. not.. swallow..?",
			"L-Looks like you’ve had quite the time..",
			"Y-You’re really.. um.. marked..",
			"T-That’s a lot.. You must be tired..",
			"Y-You’re kind of.. a mess..",
			"S-Shouldn’t you clean up a bit..?",
			"P-Please don’t get too close.. um..",
		]
	if(_id == "ReactCOVERED_IN_PISS"):
		return [
			"D-Did you.. um.. get wet..?",
			"T-That’s.. um.. quite the smell..",
			"Y-You should probably clean up..",
			"I-Is that.. what I think it is..?",
			"How did this happen..?",
			"I-I can’t believe you’re okay with this..",
			"Y-You really let someone do that..?",
			"Um.. You should.. maybe.. take a shower..",
			"P-Please.. um.. don’t get too close..",
		]
	if(_id == "ReactNAKED"):
		return [
			"Y-You’re not wearing much..!",
			"T-That’s.. um.. bold..",
			"A-Aren’t you cold..?",
			"D-Do you want some clothes..?",
			"Y-You’re really confident..",
			"F-Forgot to get dressed..?",
			"T-That’s.. um.. quite a sight..",
			"Y-You’re really.. um.. exposed..",
			"Um.. Is this how you prefer to be..?",
		]
	if(_id == "ReactCAN_GRAB_AND_FUCK"):
		return [
			"Um, you're all tied up..",
			"Didn’t expect to see this..",
			"You're really helpless right now..",
			"I-I’m sorry that you're bound up..",
			"I hope they will be gentle with you..",
			"I-I hope this isn’t too much for you.",
		]
	if(_id == "ReactON_A_LEASH"):
		return [
			"I-I’m sorry, you're on a leash..",
			"I-I kinda want to be on a leash..",
			"Hope they don't drag you too harshly..",
			"I-I kinda hope I’d end up like this..",
			"Being on a leash feels so.. demeaning.",
			"Being led around like this is.. uncomfortable.. but nice..",
		]
	if(_id == "ReactGETTING_FUCKED"):
		return [
			"I-I didn’t expect this to be so public..",
			"Hope you're okay..",
			"This is a bit.. intimate.",
			"This is quite.. a display.",
			"So.. kinky..",
		]
	if(_id == "ReactLEASHING_SOMEONE"):
		return [
			"Oh, you’ve got someone on a leash. I-I hope they’re okay.",
			"Seems like you’re leading someone around.. I hope it’s not too harsh.",
			"That’s.. a leash. I hope they’re comfortable.",
			"Wow, I didn’t expect to see someone leashed like this.",
			"I-I hope you’re treating them kindly.",
			"Leashing someone.. I hope you’re not being too rough.",
			"That’s an interesting way to handle someone. I-I hope they’re okay.",
			"I didn’t think I’d see this today. I hope it’s not too harsh.",
			"I-I hope they’re okay on that leash.",
			"I didn’t expect to see someone being led around like that. Me next?..",
		]
	if(_id == "ReactFUCKING_SOMEONE"):
		return [
			"Oh, um, I didn’t expect this..",
			"Wow, this is quite.. public.",
			"I-I hope everything’s okay here.",
			"This is a bit awkward to watch..",
			"I didn’t think I’d see this here.",
			"This is a bit.. intimate.",
			"I-I didn’t expect to be a witness to this.",
			"I-I hope they’re comfortable.",
			"This is quite.. a display.",
			"Wow, this is more than I expected to see.",
		]
	if(_id == "AskKeyCanYouUnlock"):
		return [
			"Um, c-could you maybe unlock me? I-I’m feeling a bit stuck.",
			"I-I’d really appreciate it if you could unlock me.",
			"Could you please help me out of these restraints?",
			"Is there any chance you could unlock me? I-I’m struggling here.",
			"I-I really need to be let out. Can you help?",
			"Please, can you unlock me? I-I’m feeling so confined.",
			"I-I’m having trouble with these. Could you unlock me?",
			"Please, could you get me out of these? I-I’m feeling overwhelmed.",
			"Um, if it’s not too much trouble, could you unlock me?",
			"Could you please unlock me? I-I’m feeling really restricted.",
		]
	if(_id == "AskKeyDeny"):
		return [
			"I’m sorry, but I can’t right now.",
			"Maybe later, I’m a bit busy at the moment.",
			"You’ll have to wait a bit longer.",
			"I’m not able to help at the moment.",
			"Unfortunately, I can’t unlock you right now.",
			"Maybe another time, I’m not ready yet.",
			"I’m sorry, but you’ll have to stay like this for now.",
			"Not right now, but I’ll see what I can do later.",
			"I-I’m busy at the moment, sorry.",
			"Please wait a little longer.",
		]
	if(_id == "AskKeyGive"):
		return [
			"Alright, I’ll unlock you now..",
			"Okay, I’ll get those restraints off you..",
			"Sure, let’s get you out of those..",
			"I’ll unlock you, hold on a moment..",
			"Okay, I’ll help you out of those restraints..",
			"Alright, let me unlock you for you..",
			"Sure thing, let’s get you free..",
			"I’ll unlock you now, just a moment..",
			"Alright, let’s get you out of those..",
			"I’ll help you out, just a moment..",
		]
	if(_id == "AskKeyChallenge"):
		return [
			"Alright, but first, let’s have a little fun. Show me what you’ve got. Okay?..",
			"I’ll unlock you after you do something for me. If that's okay..",
			"How about you please me first, and then I’ll unlock you? Sounds f-fair?..",
			"First, let me see how well you can please me. I think that's fair?..",
			"Only if you can impress me first. Okay?..",
			"Show me you’re worth it, and then we’ll see about unlocking you. Or something..",
		]
	if(_id == "AskKeyChallengeUnlock"):
		return [
			"Wow.. That was amazing..",
			"Good job, wow.. Here’s the key..",
			"You did great, wow.. Let’s get you out of those restraints.",
			"You’ve earned your freedom, v-very much so.. Here’s the key.",
			"Good work, you can be unlocked now.. I think..",
			"That was impressive.. I think.. Here’s the key.",
			"You did well, very well.. You’re free now.",
			"You’ve earned this. I’ll unlock you now.. okay?..",
			"Great job, let’s get you out of those. Hope you won't be angry..",
			"That was satisfying. Here’s the key.. Don't move please..",
		]
	if(_id == "AskKeyChallengeFail"):
		return [
			"Maybe.. um.. m-maybe you could have done a little better?..",
			"That was.. I.. um.. I d-don't be mean.. but I d-didn't like it..",
			"That was.. slightly disappointing.. I'm sorry.",
			"I.. don't know.. sorry.. I'm sorry..",
			"Sorry.. but it was.. kinda weak.. I didn't like it..",
		]
	if(_id == "AskKeyChallengeRefuse"):
		return [
			"I'd rather.. maybe.. not.. if that's okay..",
			"What if I.. don't w-wanna do it..",
			"I kinda.. don't wanna.. do it..",
			"Is there something else I can do?.. I'm sorry..",
			"I.. don't.. I'm not.. no..",
			"I don't wanna do it.. sorry..",
			"I'm very sorry but I can't...",
		]
	if(_id == "AskKeyChallengeRefuseStay"):
		return [
			"Well.. um.. sorry then..",
			"Sorry.. I c-can't just g-give you the key..",
			"I guess.. key stays with me then.. if that's okay..",
		]
	if(_id == "HelpRestraintsAsk"):
		return [
			"Um, could you please help me with these restraints?",
			"Sorry to ask, but could you help me get out of these?",
			"I’m having trouble with these. Could you assist me?",
			"I really need some help with these. Would you mind?",
			"Would you be able to help me with these restraints, please?",
			"I could use some assistance with my gear. Can you help?",
		]
	if(_id == "HelpRestraintsAgree"):
		return [
			"Of course, I’ll see what I can do to help..",
			"Alright, I’ll try to help you out..",
			"Don’t worry, I’ll do my best to assist..",
			"Okay, let’s get these off you..",
			"I’ll help you. Just hang tight..",
			"Sure, I’ll help with that..",
		]
	if(_id == "HelpRestraintsAltStart"):
		return [
			"Hi, let me help you with those.. Please?..",
			"I’m can help with those restraints.. Please hold on.",
			"Let me take care of that for you. Don’t move, okay?..",
			"I’ll help you with your restraints. Just stay calm..",
			"Hang on, I’ll work on those restraints for you.. if that's okay..",
		]
	if(_id == "HelpRestraintsDeny"):
		return [
			"I-I’m sorry, but I can’t help with that right now.",
			"I-I’m afraid I can’t assist you. You’ll have to stay like this.",
			"I-I’m not able to help with those restraints.",
			"I’m sorry, but I can’t do anything about those.",
			"Unfortunately, I can’t help you get out of those right now.",
		]
	if(_id == "HelpRestraintsFinished"):
		return [
			"I’ve done all I can. I hope it helps..",
			"That’s as much as I can assist with..",
			"I-I’ve finished here. I hope that worked..",
			"I’ve done everything I can for now..",
			"That’s all I can manage. I hope it’s okay..",
		]
	if(_id == "HelpRestraintsPaid"):
		return [
			"Thank you for the payment. I’m leaving now..",
			"Alright, I’ve been paid. I’ll be going now..",
			"Thanks for the credits. I’ll head out now..",
			"That’s sufficient. I’ll take my leave now..",
			"Thanks for the payment. I’ll be on my way..",
			"Okay, that’s all settled. I’m leaving now..",
		]
	if(_id == "HelpRestraintsRefusePay"):
		return [
			"I-I don’t think I should pay. It doesn’t seem fair. Right?..",
			"I’m sorry, but I can’t pay.. It wasn’t much help.",
			"Sorry, but that payment doesn’t seem fair for the help provided..",
		]
	if(_id == "HelpRestraintsRefusePayWhatever"):
		return [
			"Fine, whatever. I’ll just forget it.",
			"Okay, if that’s how you want it.",
			"Alright, whatever. I’ll let it go.",
			"Whatever, I’m not going to argue about it.",
			"Okay, forget it. I don’t care anymore.",
		]
	if(_id == "SlutwallStealCredits"):
		return [
			"Y-You don’t need these credits. I’ll take them.. if that's okay..",
			"I-I’m going to take these. You don’t really need them.. I think..",
			"Y-You don’t deserve these credits. I’ll hold onto them.. okay?..",
		]
	if(_id == "SlutwallAddTip"):
		return [
			"Here’s a little something..",
			"Here.. t-thanks.. sorry..",
			"Sorry.. here is something for your trouble..",
			"I think you need it more than me..",
		]
	if(_id == "StocksShout"):
		return [
			"U-Um, could someone please help me out of this?..",
			"Is anyone around? I could use some help, please..",
			"I-I need assistance! Can someone help me?..",
			"H-Help! Is anyone out there?..",
			"Can someone please help me? I’m stuck!",
			"Hello? I need some help here!",
			"P-Please, I need help! Someone, please!",
			"U-Um, could anyone assist me? I’m stuck in these stocks..",
		]
	if(_id == "ProstitutionStart"):
		return [
			"Um, would you like to spend some time with me?",
			"I-I could use some company, if you're interested..",
			"I-I’m here if you want to have a little fun..",
			"Maybe we could have a nice time together?..",
			"I-I’m available if you’re looking for some company..",
			"Would you like to, um, have some fun with me?..",
			"I-I’m open to spending some time with you if you'd like..",
			"Maybe, um, we could enjoy a bit of pleasure together?",
		]
	if(_id == "ProstitutionOffer"):
		return [
			"W-What are you offering?..",
			"Um, what's your offer?..",
			"Wh-What do you have in mind?",
		]
	if(_id == "ProstitutionUsual"):
		var creds = str(getVar(_args, "credits", 0))
		return [
			"Um, just the usual.. You can have me for "+creds+" credits.",
			"I-I usually go for "+creds+" credits..",
			"F-For "+creds+" credits, I can offer you a good time..",
			"Y-You can fuck me for "+creds+" credits..",
			"Um, you can have it your way with me for "+creds+" credits..",
			"Y-You can get what you want for "+creds+" credits..",
		]
	if(_id == "ProstitutionServiceDom"):
		var creds = str(getVar(_args, "credits", 0))
		return [
			"I-I can be in charge and make you feel good for "+creds+" credits.. if that's okay..",
			"I-I’ll take control for "+creds+" credits.. if that's okay..",
			"I-I’ll be the one in charge, "+creds+" credits.. if that's okay..",
		]
	if(_id == "ProstitutionPricySlut"):
		var creds = str(getVar(_args, "credits", 0))
		return [
			"I-I’m a bit pricey, but you’ll enjoy it.. I think.. Just "+creds+" credits..",
			"I-I cost a little more, but I’m worth it.. I think.. "+creds+" credits.",
		]
	if(_id == "ProstitutionDenied"):
		return [
			"I-I’m not interested, sorry..",
			"I-I think I’ll pass on this..",
			"Um, I-I’ll have to decline..",
			"N-No thanks..",
			"I-I’m not up for it right now..",
			"I-I’m not in the mood..",
		]
	if(_id == "ProstitutionDeniedWhatever"):
		return [
			"U-Um, your loss, I guess..",
			"I-I suppose that’s fine. Your choice..",
			"Well, I-I’ll just move on then..",
			"I-I guess it’s not meant to be..",
			"F-Fine, if you say so..",
			"Y-Your choice, I suppose..",
			"I-I’ll just find someone else..",
		]
	if(_id == "ProstitutionAccept"):
		return [
			"O-Okay, let’s do this..",
			"Um, let’s get started?..",
			"I-I’m ready if you are..",
			"Okay, let’s see how this goes..",
			"Y-Yes, let’s get started..",
			"Let’s start then, alright?..",
		]
	if(_id == "ProstitutionDemandCreds"):
		return [
			"I-I wasn’t satisfied. I need my credits back, please..",
			"I-I’m sorry, but that wasn’t enough. I want a refund if that's okay..",
			"Um, I-I didn’t get what I expected. Could I have my credits back?..",
			"T-That wasn’t worth it. Can you give me my credits back?..",
			"I-I didn’t think it was fair. Can I have my credits back?..",
			"T-That didn’t meet my expectations. Can I get my credits back?..",
		]
	if(_id == "ProstitutionRefuseReturnCreds"):
		return [
			"I-I’m sorry, but I can’t give you anything back..",
			"Um, I-I can’t refund you. It’s final..",
			"Sorry, but I-I’m keeping the credits..",
			"I-I can’t return any credits. I’m afraid..",
			"Um, I-I’m not able to give refunds..",
			"Sorry, but no refunds. I-I’ve done my part..",
			"I-I’m not giving anything back. Please understand..",
			"Sorry, but I-I can’t give you a refund..",
		]
	if(_id == "ProstitutionScam"):
		return [
			"Um, I-I’ve decided to increase the price. It’s now 5 more credits.. sorry..",
			"I-I’m sorry, but I need 5 more credits now..",
			"T-The price has gone up. Please add 5 more credits..",
			"U-Um, I need an additional 5 credits now.. if that's okay..",
			"I-I’m sorry, but I need 5 more credits..",
			"I-I’ve raised the price. It’s an extra 5 credits.. sorry..",
			"Sorry, but I’m charging 5 more credits now.. sorry again..",
		]
	if(_id == "PunishDecide"):
		return [
			"I-I’m not sure what to do with you..",
			"Um.. what should I do with you?..",
			"I-I’m a bit unsure how to handle this..",
			"Let’s figure out what to do with you, okay?",
		]
	if(_id == "PunishDecideStocks"):
		return [
			"I think the stocks might be.. appropriate.",
			"I-I guess the stocks might be the best option..",
			"Um, the stocks could work for this situation.",
			"Maybe the stocks would be suitable for you..",
		]
	if(_id == "PunishAboutToStocks"):
		return [
			"I-I think it’s time for you to get in position..",
			"Um, could you bend over? I-I need to put you in the stocks.",
			"L-Let’s get you ready for the stocks now..",
		]
	if(_id == "PunishLockIntoStocks"):
		return [
			"All set.. I-I hope this isn’t too uncomfortable.",
			"You’re.. locked in now. I-I hope it’s okay.",
			"Um, you’re all locked up. I-I hope it’s alright.",
			"Locked in.. I hope you’re not too upset.",
		]
	if(_id == "PunishSex"):
		return [
			"I-I’m going to try to make this.. enjoyable..",
			"Um, let’s see how this goes..",
			"I-I hope you’re okay with this..",
			"Let’s.. let’s just see how it goes, alright?",
		]
	if(_id == "PunishSubSex"):
		return [
			"I-I changed my mind.. You can do what you want..",
			"Um, I guess you can take control this time..",
			"F-Fine, I-I’ll be your plaything if that’s what you want..",
			"I-I guess you can.. do what you like with me..",
		]
	if(_id == "PunishDecidedSlutwall"):
		return [
			"I-I think the slutwall might be.. fitting for you..",
			"Um, you might be.. used well in the slutwall..",
			"The slutwall.. it could work for you..",
			"I-I hope you don’t mind the slutwall..",
		]
	if(_id == "PunishLockIntoSlutwall"):
		return [
			"I-I hope you’re comfortable..",
			"Um, you’re.. all set for the slutwall..",
			"Enjoy your time.. I hope it’s not too bad..",
			"All locked in.. I-I hope you’re okay..",
		]
	if(_id == "TalkChatWhat"):
		return [
			"Um, w-what would you like to talk about?",
			"I-I’m here if you want to chat.",
			"Is there something on your mind?",
			"Uh, do you want to talk about something?",
			"I-I’m listening if you want to share.",
			"W-What’s up? I’m here to listen.",
		]
	if(_id == "TalkChatCancel"):
		return [
			"Oh, um, never mind.",
			"I-I changed my mind, sorry.",
			"Actually, it’s okay, forget it.",
			"Sorry, I-I don’t want to talk anymore.",
			"Never mind, I-I’m not up for it.",
			"I-I guess it’s not important, sorry.",
			"Forget I mentioned it, please.",
		]
	if(_id == "TalkChatLeaving"):
		return [
			"Um, I-I think I’ll just go now.",
			"I-I’m sorry, I’ll leave now.",
			"Maybe it’s best if I go.",
			"Okay, I-I’m going to head out.",
			"I-I’ll see you later, I guess.",
		]
	if(_id == "TalkChatAgree"):
		return [
			"Y-Yes, I agree with you.",
			"I-I think you’re right.",
			"Uh-huh, I agree.",
			"Yeah, I-I think you’re correct.",
			"Yes, I-I’m with you on that.",
			"I-I agree, definitely.",
			"Right, I-I agree with what you said.",
			"Yes, I-I’m on the same page.",
			"Absolutely, I-I agree.",
			"Yeah, I-I think you’re right.",
		]
	if(_id == "TalkChatDisagree"):
		return [
			"Uh, I-I don’t think I agree with that.",
			"I-I’m not sure about that, sorry.",
			"Um, I-I think I disagree.",
			"I-I don’t quite see it that way.",
			"Sorry, but I-I don’t agree.",
			"I-I have a different opinion.",
			"Uh, I-I don’t really agree.",
			"I-I’m not sure that’s right.",
			"Sorry, but I-I think you’re mistaken.",
			"Um, I-I don’t quite agree.",
		]
	if(_id == "TalkChatWhatever"):
		return [
			"Um, it’s okay, I guess.",
			"I-I don’t mind, honestly.",
			"Uh, it’s not a big deal to me.",
			"I-I’m fine with whatever.",
			"Meh, it doesn’t bother me much.",
			"Uh, it’s all right, I suppose.",
			"I-I’m indifferent about it.",
			"It’s okay with me, honestly.",
			"Whatever you decide, it’s fine.",
			"I-I’m okay with whatever happens.",
		]
	if(_id == "TalkChatPickupLine"):
		return [
			"Uh, are you a time traveler? Because I see you in my future.",
			"I-I must be dreaming, because you’re just too perfect.",
			"Do you have a map? Because I feel lost whenever you're around.",
			"I-I hope you don’t mind, but you’ve really caught my eye.",
			"Um, are you a magician? Because every time I look at you, everyone else disappears.",
			"Y-You must be tired, because you’ve been running through my mind all day.",
			"I-I think you’re really special, and I just had to tell you.",
			"Are you a star? Because your presence lights up my world.",
			"I-I hope this isn’t too forward, but I’d really like to get to know you better.",
			"Are you a dream? Because I can’t believe someone like you is real.",
		]
	if(_id == "TalkChatPickupLineFail"):
		return [
			"I-I’m sorry.. but that was awkward..",
			"Uh, yeah, that didn’t work.. sorry..",
			"Oh, that was a bit embarrassing..",
			"Um, that was really lame. I’m sorry..",
			"Wow, that was pretty bad.. oops, sorry..",
			"I’m sorry, that was a bit of a flop..",
		]
	if(_id == "TalkFlirtAccept"):
		return [
			"Y-You’re really sweet. I appreciate that.",
			"T-Thank you. That’s really kind of you.",
			"Y-You’re making me blush. Thank you.",
			"I-I didn’t expect that, but thank you.",
			"T-You’re pretty charming yourself.",
			"Y-You’re not so bad either. Thanks.",
			"I-I like the way you talk to me.",
			"T-That’s really nice of you to say.",
			"Y-You’re quite flattering. Thank you.",
			"I-I’m actually quite flattered.",
		]
	if(_id == "TalkFlirtDeny"):
		return [
			"I-I don’t think I’m really what you’re looking for.",
			"U-Um, I’m not really into that.",
			"S-Sorry, I’m not feeling it.",
			"Y-Yeah, I don’t think we’re quite a match.",
			"I-I appreciate the offer, but I’m going to pass.",
			"I-I’m sorry, but I’m not really interested.",
			"T-That’s sweet, but I’m not really into it.",
			"I-I think I’m going to pass on that.",
			"S-Sorry, I don’t think I’m the right person.",
			"I-I’m not really up for it right now.",
		]
	if(_id == "TalkSexOffer"):
		return [
			"Uh, w-would you like to.. maybe, you know..",
			"I-I was wondering if we could.. um..",
			"Would you like to.. do something together?",
			"I-I don’t mean to be forward, but maybe we could..",
			"I-I’m open to, you know, if you’re interested..",
			"Would you be interested in.. something more intimate?",
			"Um, if you’re up for it, maybe we could..",
			"I-I hope this isn’t too forward, but how about we..",
			"Y-You want to maybe, uh, do something together?",
			"Would you like to.. you know, spend some time together?",
		]
	if(_id == "TalkSexOfferAccept"):
		return [
			"Uh, sure. I-I’d be up for that.",
			"I-I’m okay with that, if you are.",
			"Y-Yeah, I can do that.",
			"I-I guess I’m up for it..",
			"Alright, I-I’m okay with that..",
			"Y-Yeah, let’s do it..",
		]
	if(_id == "TalkSexOfferDeny"):
		return [
			"I-I’d rather not, if that’s okay..",
			"U-Um, I think I’m going to pass..",
			"S-Sorry, I’m not really up for that..",
			"I-I don’t think I’m comfortable with that..",
			"Y-Yeah, I’m going to pass on that..",
			"I-I don’t think I’m the right person for that..",
			"Uh, I’m not really feeling up to it..",
			"I-I’m going to pass, sorry..",
			"S-Sorry, but I don’t think I can do that..",
			"I-I think I’ll pass on that offer..",
		]
	if(_id == "TalkSexOfferSelf"):
		return [
			"Uh, if you want, I-I’m here.. and I'm ready..",
			"Would you, um, like to spend some time with me?.. Like.. in me..",
			"I-I’m available if you’re interested.. right now..",
			"Y-You can, um, take me if you want.. right here..",
			"I-I’m here if you need someone.. to fuck..",
			"I-I’m open to, um, spending some time together.. inside each other..",
			"Uh, if you want, I-I’m willing.. right now..",
			"I-I’d be here if you want to, um, do something.. right now..",
		]
	if(_id == "TalkSexOfferSelfAccept"):
		return [
			"Y-Yeah, I-I’ll make sure to make it good..",
			"I-I’ll do my best for you..",
			"I-I’ll make sure it’s nice..",
			"I-I’ll make it worth your while..",
			"I-I’ll make sure it’s enjoyable..",
			"Y-Yes, I-I’ll do what you need..",
			"I-I’ll be sure to take care of you..",
		]
	if(_id == "TalkSexOfferSelfDeny"):
		return [
			"I-I don’t think I’m ready for that right now..",
			"S-Sorry, I-I’m not up for it at the moment..",
			"I-I think I’ll pass on that for now..",
			"I'm not a good dominant.. sorry..",
		]
	if(_id == "TalkGrabAndFuck"):
		return [
		"I'm sorry.. but I really want to do this..",
		"I'm deeply sorry.. but I can't stop myself..",
		"I'm extremely sorry.. but you look too hot..",
		]
	if(_id == "TalkAboutToKidnap"):
		return [
			"Y-You’re coming with me, alright?..",
			"I-I’m taking you with me now..",
			"Y-You belong to me now. Please understand..",
			"Uh, you’re mine now. Just follow along..",
			"I-I’m taking you with me, alright?..",
		]
	if(_id == "TalkAboutToKidnapReact"):
		return [
			"O-Okay.. I understand..",
			"Y-Yes, I’ll follow you..",
			"I-I’ll go with you..",
			"Uh, okay.. I understand.",
			"Y-Yes, I’ll come along..",
			"F-Fine.. I’ll go with you.. yay..",
		]
