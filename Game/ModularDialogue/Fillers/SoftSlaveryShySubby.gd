extends DialogueFiller

func _init():
	priority = 10

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

func getFormIDs() -> Array:
	return [
		"SoftSlaveryIntro1",
		"SoftSlaveryIntro2",
		"SoftSlaveryIntro3",
		"SoftSlaveryIntroEND",
		
		"SoftSlaveryChangeName",
		"SoftSlaveryChangeNameEND",
		
		"SoftSlaveryAttackReaction",
		"SoftSlaveryAttackLost",
		"SoftSlaveryAttackWon",
		
		"SoftSlaveryAskedFreedom",
		"SoftSlaveryAskedFreedomPay",
		"SoftSlaveryAskedFreedomEND",
		
		"SoftSlaveryTalkStart",
		
		"SoftSlaveryProtectedByFriendStart",
		"SoftSlaveryProtectedByFriendResponse",
		"SoftSlaveryProtectedByFriendAllGoodResp",
		"SoftSlaveryProtectedByFriendLost",
		"SoftSlaveryProtectedByFriendWonThank",
		
		"SoftSlaveryChokeOutStart",
		"SoftSlaveryChokeOutEndured",
		"SoftSlaveryChokeOutPCWon",
		"SoftSlaveryChokeOutPCLost",
		"SoftSlaveryChokeOutPCLostSex",
		
		"SoftSlaveryFuckStart",
		"SoftSlaveryFuckResultGood",
		"SoftSlaveryFuckResultOkay",
		"SoftSlaveryFuckResultBad",
		
		"SoftSlaveryFuckNemesisApproach",
		"SoftSlaveryFuckNemesisAsk",
		"SoftSlaveryFuckNemesisAnswer",
		"SoftSlaveryFuckNemesisYes",
		"SoftSlaveryFuckNemesisNo",
		
		"SoftSlaveryFuckJealousStart",
		"SoftSlaveryFuckJealousFight",
		"SoftSlaveryFuckJealousOwnerWon",
		"SoftSlaveryFuckJealousOwnerWonFuck",
		"SoftSlaveryFuckJealousOwnerLostOffer",
		"SoftSlaveryFuckJealousOwnerLostOffer2",
		"SoftSlaveryFuckJealousOwnerLostOfferAgree",
		"SoftSlaveryFuckJealousOwnerLostOfferAgree2",
		"SoftSlaveryFuckJealousOwnerLostOfferNope",
		
		"SoftSlaverySlutwallStart",
		"SoftSlaverySlutwallLocked",
		
		"SoftSlaveryStocksStart",
		"SoftSlaveryStocksLocked",
		
		"SoftSlaveryGiveCreditsStart",
		"SoftSlaveryGiveCreditsTake",
		"SoftSlaveryGiveCreditsShort",
		
		"SoftSlaveryMarkingStart",
		"SoftSlaveryMarkingEnough",
		"SoftSlaveryMarkingAnother",
		"SoftSlaveryMarkingNoStart",
		"SoftSlaveryMarkingNo",
		"SoftSlaveryMarkingNoFail",
		"SoftSlaveryMarkingBegYes",
		"SoftSlaveryMarkingBegYes2",
		"SoftSlaveryMarkingBegNo",
		"SoftSlaveryMarkingBegNo2",
		"SoftSlaveryMarkingBegCredits",
		"SoftSlaveryMarkingBegCreditsGive",
		"SoftSlaveryMarkingBegCreditsGive2",
		"SoftSlaveryMarkingBegNoMarked",
		"SoftSlaveryMarkingBegFoot",
		"SoftSlaveryMarkingBegFootKiss",
		"SoftSlaveryMarkingBegFootKiss2",
		"SoftSlaveryMarkingBegHumiliation",
		"SoftSlaveryMarkingBegHumiliation2",
		"SoftSlaveryMarkingBegHumiliation3",
		"SoftSlaveryMarkingBegHumiliation4",
		"SoftSlaveryMarkingNotDone",
		"SoftSlaveryMarkingNotDoneStocks",
		"SoftSlaveryMarkingNotDoneStocks2",
		"SoftSlaveryMarkingNotDoneUrinal",
		"SoftSlaveryMarkingNotDoneUrinal2",
		
		"SoftSlaveryParadeAroundStart",
		"SoftSlaveryParadeAroundFirst",
		"SoftSlaveryParadeAroundMore",
		"SoftSlaveryParadeAroundLast",
		"SoftSlaveryParadeAroundFree",
		"SoftSlaveryParadeAroundEatGagged",
		"SoftSlaveryParadeAroundEat",
		"SoftSlaveryParadeAroundPlatform",
		"SoftSlaveryParadeAroundShower",
		
		"SoftSlaveryThreesomeStart",
		
		"SoftSlaveryPunishCredits",
		"SoftSlaveryPunishCredits2",
		
		"SoftSlaveryPunishRipClothes",
		
		"SoftSlaveryPunishRoughSex",
		"SoftSlaveryPunishRoughSexPCWon",
		"SoftSlaveryPunishRoughSexEnded",
		
		"SoftSlaveryPunishSlutwall",
		"SoftSlaveryPunishSlutwallLock",
		
		"SoftSlaveryPunishStocks",
		"SoftSlaveryPunishStocksLock",
		"SoftSlaveryPunishStocksAsk",
		"SoftSlaveryPunishStocksAskNope",
		"SoftSlaveryPunishStocksAskNoBuy",
		"SoftSlaveryPunishStocksAskNoBuy2",
		"SoftSlaveryPunishStocksAskNoBuy3",
		"SoftSlaveryPunishStocksAskSure",
		"SoftSlaveryPunishStocksAfterSex",
		"SoftSlaveryPunishStocksAfterBadSex",
		"SoftSlaveryPunishStocksAfterBadSex2",
		"SoftSlaveryPunishStocksOwnerLost",
		"SoftSlaveryPunishStocksOwnerLost2",
		"SoftSlaveryPunishStocksOwnerLost3",
		"SoftSlaveryPunishStocksOwnerWon",
		"SoftSlaveryPunishStocksOwnerWon2",
		"SoftSlaveryPunishStocksOwnerWon3",
		"SoftSlaveryPunishStocksOwnerWon4",
		
		"SoftSlaveryPunishSell",
		"SoftSlaveryPunishSell2",
		
		"SoftSlaveryPunishGB",
		"SoftSlaveryPunishGBGiveup",
		"SoftSlaveryPunishGBOffer",
		"SoftSlaveryPunishGBSure",
		"SoftSlaveryPunishGBFollow",
		"SoftSlaveryPunishGBSubOffer",
		"SoftSlaveryPunishGBSubOfferYes",
		"SoftSlaveryPunishGBSubOfferNo",
		"SoftSlaveryPunishGBSubOfferNoAw",
		"SoftSlaveryPunishGBNo",
		"SoftSlaveryPunishGBNoReact",
		"SoftSlaveryPunishGBStart",
		"SoftSlaveryPunishGBEnd",
		
		"SoftSlaveryResist",
		
		"SoftSlaveryFuckInStocksExtra",
		"SoftSlaveryFuckInStocksExtraYes",
		"SoftSlaveryFuckInStocksExtraNo",
		"SoftSlaveryFuckInStocksExtraNo2",
		"SoftSlaveryFuckInStocksExtraFree",
		"SoftSlaveryFuckInStocksExtraFreeLost",
		
		"SoftSlaveryParadeFuckOffer",
		"SoftSlaveryParadeFuckOfferYes",
		"SoftSlaveryParadeFuckOfferYesThree",
		"SoftSlaveryParadeFuckOfferNo",
		"SoftSlaveryParadeFuckOfferNo2",
		"SoftSlaveryParadeFuckOfferGood",
		"SoftSlaveryParadeFuckOfferFight",
		"SoftSlaveryParadeFuckOfferWon",
		"SoftSlaveryParadeFuckOfferLostWatch",
		"SoftSlaveryParadeFuckOfferLostBoth",
		
		"SoftSlaveryParadeGuard",
		"SoftSlaveryParadeGuardPunish",
		"SoftSlaveryParadeGuardPunish2",
		"SoftSlaveryParadeGuardProblem",
		"SoftSlaveryParadeGuardProblem2",
		"SoftSlaveryParadeGuardWon",
		"SoftSlaveryParadeGuardLost",
		
		"SoftSlaveryGB",
		"SoftSlaveryGBGiveup",
		"SoftSlaveryGBOffer",
		"SoftSlaveryGBSure",
		"SoftSlaveryGBFollow",
		"SoftSlaveryGBSubOffer",
		"SoftSlaveryGBSubOfferYes",
		"SoftSlaveryGBSubOfferNo",
		"SoftSlaveryGBSubOfferNoAw",
		"SoftSlaveryGBNo",
		"SoftSlaveryGBNoReact",
		"SoftSlaveryGBStart",
		"SoftSlaveryGBEnd",
		
		"SoftSlaveryLockRestraint",
		"SoftSlaveryLockRestraint2",
		"SoftSlaveryLockRestraint3",
		"SoftSlaveryOfferGearUnlock",
		"SoftSlaveryOfferGearUnlock2",
		"SoftSlaveryOfferGearUnlockKeep",
		"SoftSlaveryOfferGearUnlockKeep2",
		"SoftSlaveryNoticedNoGear",
		"SoftSlaveryNoticedNoGear2",
		
		"SoftSlaveryAskSex",
		"SoftSlaveryAskFuckOwner",
		"SoftSlaveryAskFuckOwnerBad",
		"SoftSlaveryAskFuckOwnerOkay",
		"SoftSlaveryAskFuckOwnerGood",
		#"SoftSlavery",
	]

func getText(_id:String, _args:Dictionary):
	if(_id == "SoftSlaveryIntro1"):
		return [
			"Um.. you're awake?",
			"Sorry to bother you.. but you should open your eyes. Oh, you did already?",
			"Hello. Are you feeling okay?",
			"Hello.. time to wake up. Oh, you're up already.",
			"Could you open your eyes for me? Oh, I see.",
			"Please wake up.. Oh, hey.",
			"You're finally awake.. Uh.",
			"Just checking if you're breathing.. Looks like you are.",
			"Good.. you're awake. I was getting a bit worried..",
			"I see you're awake now.. Probably wondering what is happening.",
			"Your eyes are open.. that's good. Yeah?",
			"You were sleeping for a while.. Glad you're up.",
			"There you are.. I was getting worried.",
			"You're back with us.. with me, I mean.",
		]
	if(_id == "SoftSlaveryIntro2"):
		return [
			"From now on.. you're my {npc.npcSlave}.. is that okay? No.. I mean.. you have no choice.",
			"I guess this means you're my {npc.npcSlave} now. I hope that's okay.. well.. yeah.",
			"You'll be my {npc.npcSlave}.. if that's alright.. I mean.. I don't care what you think, totally..",
			"So.. you're my {npc.npcSlave} now. I hope that's clear enough.. Yeah.",
			"This means you're my {npc.npcSlave}.. if you don't mind. Yeah.",
			"I think.. you belong to me now.. as my {npc.npcSlave}.. from now on.",
		]
	if(_id == "SoftSlaveryIntro3"):
		return [
			"Please do as I say. I don't want any trouble.. I mean.. you.. shit..",
			"If you obey.. everything will be fine.. otherwise.. I might have to punish.",
			"I'd really prefer if you just listened to me.. You know? Otherwise.. I might have to do something? Like.. punish..",
			"I hope you won't make me punish you.. I know that I sound.. soft.. but I will..",
			"Please don't resist. I don't like conflict.. but I will if I have to.",
			"I might have to punish you if you don't obey.. but I'd rather not..",
			"Just do what I ask.. it's easier that way. Otherwise.. I will have to learn how to punish you..",
			"I really don't want to hurt you.. or make you sad.. so please obey..",
			"It would be better if you just said yes to everything I order you to do.. I don't wanna punish..",
		]
	if(_id == "SoftSlaveryIntroEND"):
		return [
			"I'll check on you sometimes.. if that's alright.",
			"I'll be watching over you.. don't forget about me.",
			"I'll visit occasionally.. hope that's okay.",
			"I'll stop by now and then.. just to see how you're doing.. maybe more.",
			"I'll check in regularly.. if you don't mind.",
			"I'll come see you sometimes.. please be ready.",
			"I'll be around often.. hope that's not a problem.",
			"I'll check on my {npc.npcSlave} frequently.. is that okay? Yeah..",
			"You'll see me often.. I hope you don't mind.",
			"I'll visit regularly.. please be prepared to help me.",
		]

	if(_id == "SoftSlaveryChangeName"):
		return [
			"Um.. what would you like me to call you..?",
			"Do you.. have a name you prefer, {npc.npcSlave}..?",
			"I.. I can call you something else if you want..",
			"Please.. tell me what name you'd like..",
		]
	if(_id == "SoftSlaveryChangeNameEND"):
		return [
			"Okay.. you'll be my {npc.npcSlave} then..",
			"I'll try to remember that.. my {npc.npcSlave}..",
			"So.. you're my {npc.npcSlave} now..",
		]

	if(_id == "SoftSlaveryAttackReaction"):
		return [
			"Please don't.. I don't want trouble.. I guess I have to fight back.",
			"Why would you do that..",
			"That really hurt.. Emotionally.. Okay.",
			"I don't like fighting.. But now I have to..",
			"You didn't have to do this.. but now I have to fight back.",
			"I'm not going to fight back.. well.. I guess I have to.",
		]
	if(_id == "SoftSlaveryAttackLost"):
		return [
			"I didn't mean to disappoint you.. am I still your owner? I think I am..",
			"Ow.. That hurt. You win this time..",
			"I shouldn't have tried.. I'm sorry..",
			"Ouch.. okay, you win this time..",
			"You won.. can you maybe obey now?..",
		]
	if(_id == "SoftSlaveryAttackWon"):
		return [
			"I'm sorry it came to this..",
			"Please don't make me get mad at you..",
			"I wish you hadn't made me do this..",
			"I don't want to punish you.. but I have to..",
			"This is for your own good.. I hope you understand..",
			"Please accept your punishment.. it's for the best..",
		]

	if(_id == "SoftSlaveryAskedFreedom"):
		return [
			"I could let you go.. if that's what you really want.. But are you sure, {npc.npcSlave}?",
			"Oh.. um.. I suppose I could free you.. But do you really want that?",
			"I.. I don't mind if you leave.. I want to support you.. But are you certain?",
			"I guess I could stop claiming you.. if that's what you want.. But the station can be scary without protection..",
			"Maybe.. I could let you go.. But are you sure you want to give up being my {npc.npcSlave}?",
			"I.. I understand if you want freedom.. But think about what you're leaving behind.. Are you sure?",
		]
	if(_id == "SoftSlaveryAskedFreedomPay"):
		return [
			"I.. I could let you go.. but I'd need <CREDITS> first.. if that's okay..",
			"Maybe.. if you pay <CREDITS>.. I could set you free..",
			"I was thinking.. <CREDITS> might be fair for your freedom.. if you want..",
			"Um.. freedom would cost <CREDITS>.. only if you're sure you want to leave..",
			"I need <CREDITS> to let you go.. sorry..",
			"Maybe.. <CREDITS>? For your freedom.. if that's what you really want..",
		]
	if(_id == "SoftSlaveryAskedFreedomEND"):
		return [
			"Okay.. you're free now.. I hope you'll be happy.",
			"I'll miss you.. but you can go.",
			"Goodbye then.. take care of yourself.",
			"I understand.. you're free to leave.",
			"Well.. this is it then.. be safe out there.",
			"I hope I was good to you.. goodbye, {npc.npcSlave}.",
			"You can go now.. I'll be okay.",
			"Farewell.. I hope you find what you're looking for.",
		]

	if(_id == "SoftSlaveryTalkStart"):
		return [
			"Um.. what did you need, {npc.npcSlave}?",
			"Yes..? What is it, {npc.npcSlave}?",
			"Hey there.. Want something, {npc.npcSlave}?",
			"Hi there.. How is it going, my {npc.npcSlave}?",
			"You want to ask something? Feel free..",
		]

	if(_id == "SoftSlaveryProtectedByFriendStart"):
		return [
			"Um.. please don't hurt {pc.name}.. {pc.He} {pc.isAre} my friend.",
			"Could you.. leave {pc.name} alone? {pc.He} {pc.isAre} my friend.",
			"I don't think you should be doing that to {pc.name}.. {pc.He} {pc.isAre} my friend.",
			"Please.. let {pc.name} go.. {pc.He} {pc.isAre} my friend.",
			"Maybe.. you shouldn't be touching {pc.him}.. {pc.He} {pc.isAre} my friend.",
		]
	if(_id == "SoftSlaveryProtectedByFriendResponse"):
		return [
			"{pc.He} {pc.isAre} my {npc.npcSlave}.. I can do anything I want.. technically.",
			"Please don't make this difficult.. don't intervene..",
			"I don't want trouble with you.. but.. you know.. you're asking for it.",
			"You shouldn't.. bother. {pc.He} {pc.isAre} my {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryProtectedByFriendAllGoodResp"):
		return [
			"Okay.. I see.. sorry..",
			"Ohhh. Right. That makes sense.",
			"Okay, I won't both you two.",
			"Sorry.. I'm sorry..",
		]
	if(_id == "SoftSlaveryProtectedByFriendLost"):
		return [
			"I'm sorry.. but you will have to leave..",
			"Okay.. now you should leave..",
			"I don't wanna hurt you.. Please go..",
			"I didn't mean to do this.. but now you gotta leave.",
			"I'll just.. ask you to leave.. now.",
		]
	if(_id == "SoftSlaveryProtectedByFriendWonThank"):
		return [
			"You're welcome..",
			"I'm just glad I could help..",
			"Of course.. anytime..",
			"I was happy to help..",
			"Don't mention it.. really..",
		]

	if(_id == "SoftSlaveryChokeOutStart"):
		return [
			"I'm really upset.. I need someone and you're here, {npc.npcSlave}.. sorry..",
			"I'm so angry right now.. and you're nearby, {npc.npcSlave}.. I'm sorry..",
			"I need to let this out.. please don't make it harder, {npc.npcSlave}.. I'm very sorry..",
			"I have all this tension.. you'll help me, right {npc.npcSlave}? I'm very sorry..",
		]
	if(_id == "SoftSlaveryChokeOutEndured"):
		return [
			"I feel a bit better now.. you helped, {npc.npcSlave}..",
			"I'm calmer.. you can go now, {npc.npcSlave}..",
			"That helped me.. thank you for helping..",
			"I needed that.. you can leave, {npc.npcSlave}..",
			"I feel better.. you were good for me, {npc.npcSlave}.."
		]
	if(_id == "SoftSlaveryChokeOutPCWon"):
		return [
			"Oh.. why did you have to fight back..",
			"You're stronger than I thought..",
			"I guess you won.. please don't hurt me..",
			"Okay, you won.. but I still need you, {npc.npcSlave}..",
			"Please don't be angry with me..",
		]
	if(_id == "SoftSlaveryChokeOutPCLost"):
		return [
			"You passed out.. I went too far..",
			"I made you faint.. I'm sorry, {npc.npcSlave}..",
			"You couldn't stay awake.. I was too rough..",
		]
	if(_id == "SoftSlaveryChokeOutPCLostSex"):
		return [
			"Let me just..",
			"I shouldn't.. but maybe we should..",
			"I want to try something..",
			"Might as well, right?..",
		]

	if(_id == "SoftSlaveryFuckStart"):
		return [
			"I was thinking.. maybe we could.. you know..",
			"Um.. if it's okay with you.. I'd like to be close..",
			"Could we.. maybe.. try something.. {npc.npcSlave}?",
			"I'm feeling.. warm.. would you come here..?",
			"I need you.. if that's alright..",
			"Please come closer.. I want to feel you..",
			"Would it be okay.. if we..?",
			"I feel shy asking.. but I want you..",
		]
	if(_id == "SoftSlaveryFuckResultGood"):
		return [
			"That was.. really nice.. thank you..",
			"You made me feel so good.. {npc.npcSlave}..",
			"I hope you enjoyed it too.. that was wonderful..",
			"You're amazing.. I feel so happy right now..",
			"That was perfect.. you're perfect..",
			"I feel so close to you.. thank you..",
			"You were so good to me.. {npc.npcSlave}..",
			"That was better than I imagined..",
		]
	if(_id == "SoftSlaveryFuckResultOkay"):
		return [
			"That was okay.. maybe we can try again sometime..",
			"Thank you.. I enjoyed being with you.. mostly..",
			"It was okay.. I hope you felt good too..",
			"I liked it.. but I get nervous sometimes..",
			"I hope it was okay for you too.. {npc.npcSlave}..",
			"Maybe we can practice more.. if you'd like..",
			"It was comfortable.. in a nice way..",
		]
	if(_id == "SoftSlaveryFuckResultBad"):
		return [
			"I'm sorry.. this wasn't that good..",
			"That was a bit.. meh.. to be honest.",
			"Maybe you could have.. tried? Just a bit more.",
			"It was a bit.. you know.. bad..",
		]

	if(_id == "SoftSlaveryFuckNemesisApproach"):
		return [
			"Oh.. um.. hello.. wow..",
			"I didn't expect to see you here.. interesting..",
			"This is a bit awkward.. And ironic.",
			"Um.. hi there.. Interesting..",
		]
	if(_id == "SoftSlaveryFuckNemesisAsk"):
		return [
			"Is something wrong..?",
			"Did you need something from me..?",
			"I'm sorry if I'm in your way..",
			"Um.. what is it..?",
		]
	if(_id == "SoftSlaveryFuckNemesisAnswer"):
		return [
			"I was thinking.. maybe we could.. um.. both deal with {pc.name}.. {pc.He} did some bad things to me..",
			"Your slave was kind of mean to me.. maybe we could.. you know..",
			"I don't like causing trouble but.. {pc.name} did bad things to me.. Can we maybe?..",
			"Maybe we could.. um.. punish {pc.name} together.. if that's okay.. {pc.He} did some bad things to me..",
		]
	if(_id == "SoftSlaveryFuckNemesisYes"):
		return [
			"Okay.. if you're sure..",
			"Um.. alright then..",
			"I guess we could try.. together..",
			"Okay.. I'll help you with my {npc.npcSlave}..",
		]
	if(_id == "SoftSlaveryFuckNemesisNo"):
		return [
			"No.. {pc.He} {pc.isAre} mine..",
			"I'll handle {pc.him} myself.. Sorry..",
			"No.. {pc.He} {pc.isAre} mine to deal with. Sorry.",
			"I won't share {npc.him}. {pc.He} {pc.isAre} mine.. sorry.",
		]

	if(_id == "SoftSlaveryFuckJealousStart"):
		return [
			"Um.. that's my {npc1.npcSlave}.. what are you doing..",
			"Oh.. please don't touch my {npc1.npcSlave}..",
			"Excuse me.. that {npc1.npcSlave} belongs to me..",
			"Could you please.. not do that with my {npc1.npcSlave}..",
			"I don't want trouble.. but that's my {npc1.npcSlave}..",
		]
	if(_id == "SoftSlaveryFuckJealousFight"):
		return [
			"Please.. just go away.. This {npc.npcSlave} is mine..",
			"I don't want to fight.. but this {npc.npcSlave} belongs to me..",
			"Could you please leave.. this {npc.npcSlave} is mine..",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerWon"):
		return [
			"See.. {npc.npcSlave} is mine.. please understand..",
			"I told you.. {pc.he} {pc.isAre} mine.. remember that..",
			"So you see.. {npc.npcSlave} stays with me..",
			"{pc.He} {pc.verb('belong')} to me.. is that clear now..",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerWonFuck"):
		return [
			"You shouldn't have come here.. now you'll have to serve me too..",
			"This is what you get.. I'll have to take care of both of you now..",
			"Wrong time to show up.. but I can't let you go now.. come here both..",
			"You made a mistake.. now you'll be my second.. along with my {npc.npcSlave}..",
			"You interfered.. so now you'll both have to help me with this..",
			"I need some relief.. and both of you will have to provide it.."
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOffer"):
		return [
			"Wait.. maybe we could.. share {npc.npcSlave} together..",
			"Please.. before anything else.. what if we shared {npc.npcSlave}..",
			"Hold on.. maybe {npc.npcSlave} could serve both of us.. if that's okay..",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOffer2"):
		return [
			"It's {pc.his} fault for not telling us.. maybe we should punish {pc.him} instead..",
			"My {npc.npcSlave} never mentioned you.. so perhaps we should make {pc.him} pay for that..",
			"That {npc.npcSlave} kept secrets from us.. maybe we should teach {pc.him} a lesson together..",
			"Since {npc.npcSlave} wasn't honest.. maybe we should make {pc.him} regret it..",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOfferAgree"):
		return [
			"Maybe you're right..",
			"That seems fair..",
			"I suppose that could work..",
			"That makes sense..",
			"Perhaps your way is better..",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOfferAgree2"):
		return [
			"Let's try to have some fun then..",
			"We should teach {npc.npcSlave} a lesson..",
			"Okay.. let's do it..",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOfferNope"):
		return [
			"Oh.. I think I'll just have to take both of you then..",
			"Your pleading.. it just makes me want to play with you both..",
			"Begging won't help.. I'll have to make use of you both..",
			"Interesting idea.. but I think I'll just play with both of you..",
		]

	if(_id == "SoftSlaverySlutwallStart"):
		return [
			"I was thinking maybe we could use the slutwall today.. I use you I mean.. if that's okay..",
			"The slutwall is waiting for us.. please hold still, {npc.npcSlave}..",
			"Come here.. I'm going to put you in the slutwall now.. please don't struggle..",
			"You'll be my toy in the slutwall today.. could you show me your neck..",
			"I thought we might try the slutwall.. please hold still for me, {npc.npcSlave}..",
			"Could you be good and come with me to the slutwall.. I thought we might try it..",
		]
	if(_id == "SoftSlaverySlutwallLocked"):
		return [
			"You're locked in now.. I hope this is okay..",
			"This is a nice view.. I hope you're comfortable..",
			"You look a bit exposed like this.. I like it.",
			"Now that you're secure.. we can begin.. if you're ready..",
		]
	if(_id == "SoftSlaveryStocksStart"):
		return [
			"I was thinking about the stocks today.. with others watching.. if that's alright.. please hold still..",
			"I wanna try you in stocks.. please hold still, {npc.npcSlave}..",
			"Come here.. I'm going to put you in the stocks.. please don't struggle too much..",
			"You'll be with me in the stocks today.. and people might watch.. could you show me your neck..",
			"I thought we might use the stocks while others are watching.. please hold still, {npc.npcSlave}..",
			"Could you be good and come with me to the stocks.. I wanna use you in them.",
		]
	if(_id == "SoftSlaveryStocksLocked"):
		return [
			"Please don't try to move too much.. I hope this is okay..",
			"You're locked in..",
			"You look a bit exposed like this.. I kinda like it.",
			"Now that you're secured.. we can start.",
		]
	if(_id == "SoftSlaveryGiveCreditsStart"):
		return [
			"I'm a bit short on credits.. I need <CREDITS> if you could help..",
			"I need <CREDITS> soon.. like.. right now. If you could spare them, {npc.npcSlave}..",
			"Would you be able to give me <CREDITS>.. if it's not too much trouble..",
			"I was hoping for <CREDITS> from you.. if you don't mind..",
			"Could you give me <CREDITS>.. I really need them.",
			"I thought maybe you could help with <CREDITS>.. if that's okay..",
		]
	if(_id == "SoftSlaveryGiveCreditsTake"):
		return [
			"Thank you.. that helps a lot.",
			"That's kind of you.",
			"I appreciate this.. it's nicer when you help willingly.",
			"Okay.. I'll make sure they're used well.",
			"Thanks.. I probably need them more anyway.",
			"I appreciate that.. it's nice when you're helpful.",
			"Thank you.. I'll remember this.",
		]
	if(_id == "SoftSlaveryGiveCreditsShort"):
		return [
			"Oh.. I get a feeling that you're lying to me. I don't like that feeling.",
			"Really.. I was hoping you could help. But now I have to punish you?",
			"You don't have enough.. that's disappointing. I will have to punish you.",
			"I see.. I thought you might be able to help.. but now I have to punish you."
		]

	if(_id == "SoftSlaveryMarkingStart"):
		return [
			"I think I should mark my {npc.npcSlave}. Please stand still for me.",
			"Could you hold still? This is so people know you're mine..",
			"Please don't flinch.. I just want to leave some marks on my {npc.npcSlave}.",
			"If you could stay still.. I want everyone to know who you belong to.",
			"Look at me and try not to move.. I wanna write some stuff on you.",
			"Come closer and stay quiet.. I want to write something on you."
		]
	if(_id == "SoftSlaveryMarkingEnough"):
		return [
			"That should be enough.. It looks nice.",
			"Good.. That should work.",
			"Perfect.. You look good like this.",
			"Enough for now. It looks okay, right..?",
			"Done. I think it looks nice.",
			"The lines are clear. It suits a {npc.npcSlave} like you..",
		]
	if(_id == "SoftSlaveryMarkingAnother"):
		return [
			"Maybe another one..?",
			"Should I add more..? I think I will.",
			"Do you think that's enough..? I don't really.",
			"I think I want to add another.",
			"You want another..? I do too. Please stay still.",
			"I could keep going. I think I will.",
			"These writings make you look so nice.. Let's add another.",
			"You moved a bit.. So I should add another.",
			"You squirmed.. I guess I need to write some more words.",
			"One more probably won't hurt.. Please stay still.",
			"Bodywritings are kind of nice.. So you're getting another one.",
		]
	if(_id == "SoftSlaveryMarkingNoStart"):
		return [
			"Okay.. I guess I won't mark you right now..",
			"Fine.. I'll leave you unmarked for now..",
			"Not today then.. You're lucky, I suppose..",
			"Alright.. No writings this time.. But you still belong to me, {npc.npcSlave}..",
			"Maybe another day.. You're still mine though..",
			"I'm not really feeling it today.. Be glad..",
		]
	if(_id == "SoftSlaveryMarkingNo"):
		return [
			"Alright. This should be enough for now.",
			"Fine.. We're done for now. You look properly marked.",
			"Enough for today.. If you behave, I might not add more.",
			"That should do. It looks perfect..",
			"I'm done, I guess.. I hope people notice these.",
			"Okay.. For now, you're marked enough."
		]
	if(_id == "SoftSlaveryMarkingNoFail"):
		return [
			"Please don't make me angry.. My {npc.npcSlave} needs these marks.",
			"Don't test me, {npc.npcSlave}.. You're getting marked or I'll have to punish you..",
			"If you keep testing me, I'll have to punish you. Please stand still and accept this..",
			"Please be quiet.. It's my decision. You need to be marked.",
		]
	if(_id == "SoftSlaveryMarkingBegYes"):
		return [
			"Oh.. okay. Since you asked so nicely.",
			"Your begging is so sincere.. I can't say no.",
			"I suppose I can be lenient.. just this once.",
			"Alright.. since you're pleading so earnestly.",
		]
	if(_id == "SoftSlaveryMarkingBegYes2"):
		return [
			"That should be enough then.",
			"I think we can stop now.",
			"You can stop begging.. I'll be merciful.",
			"Okay.. that's sufficient.",
		]
	if(_id == "SoftSlaveryMarkingBegNo"):
		return [
			"Maybe.. if you were kneeling while asking?",
			"Could you please beg on your knees?",
			"I think it would mean more if you'd be kneeling..",
			"Proper begging is done kneeling.. if you don't mind?",
		]
	if(_id == "SoftSlaveryMarkingBegNo2"):
		return [
			"Please kneel?",
			"Could you kneel for me?",
			"I'd really prefer if you'd kneel..",
			"Kneel.. please..",
		]
	if(_id == "SoftSlaveryMarkingBegCredits"):
		return [
			"Maybe.. 5 credits would make me reconsider?",
			"I could stop for 5 credits.. that's the price.",
			"5 credits might convince me to stop..",
			"Perhaps 5 credits would change my mind..",
		]
	if(_id == "SoftSlaveryMarkingBegCreditsGive"):
		return [
			"Thank you.. this means a lot.",
			"I appreciate this.. really.",
			"These will be helpful. Thank you.",
			"That's very considerate of you..",
		]
	if(_id == "SoftSlaveryMarkingBegCreditsGive2"):
		return [
			"I suppose that's enough then.",
			"We will stop here.",
			"I think we're done for now.",
			"Perhaps we should end this.",
		]
	if(_id == "SoftSlaveryMarkingBegNoMarked"):
		return [
			"I'm sorry it came to this..",
			"I wish you had cooperated..",
			"This wasn't my first choice..",
			"I really didn't want to do this..",
			"Maybe next time you'll listen..",
			"I hope these aren't too embarrassing..",
			"This makes me uncomfortable too..",
			"Perhaps now you'll understand.."
		]
	if(_id == "SoftSlaveryMarkingBegFoot"):
		return [
			"Maybe.. you could kiss my {npc.foot} now?",
			"Would you consider kissing my {npc.foot}? To avoid the markings?",
			"Perhaps showing respect to my {npc.foot} would convince me to stop?",
			"I'd rather you kissed my {npc.foot} than get marked.. if that's okay?",
		]
	if(_id == "SoftSlaveryMarkingBegFootKiss"):
		return [
			"That's.. actually quite nice.",
			"You're better at this than I expected..",
			"This feels.. surprisingly good.",
			"Maybe keep going? If you want to..",
			"You're doing well..",
		]
	if(_id == "SoftSlaveryMarkingBegFootKiss2"):
		return [
			"I think that's enough for now.",
			"Maybe we should stop here.",
			"I suppose that will do..",
			"Perhaps we're finished.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation"):
		return [
			"Could you please admit you're my {npc.npcSlave}?",
			"Maybe say you belong to me? If that's alright.. I really wanna hear it.",
			"Would you mind stating that you're my {npc.npcSlave}?",
			"Perhaps you could acknowledge being my property? I wanna hear that.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation2"):
		return [
			"Could you say that a bit louder?",
			"Maybe speak up just a little?",
			"I can barely hear you..",
			"Once more, but clearer?",
			"Try saying it with feeling?",
			"Could you repeat that more confidently?",
			"A little more volume, please?",
			"Maybe put more heart into it?",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation3"):
		return [
			"That was better.. thank you.",
			"Much more sincere.. I appreciate that.",
			"That sounded genuine..",
			"You're getting better at this.",
			"Thank you for trying harder..",
			"I believe you mean it now.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation4"):
		return [
			"I think we're finished here.",
			"Maybe that's enough for today.",
			"I suppose we can stop now.",
			"Perhaps we should end this.",
		]
	if(_id == "SoftSlaveryMarkingNotDone"):
		return [
			"Um.. actually.. I'm not quite done with you..",
			"Wait, please.. there's one more thing.. Yeah.",
			"Now that I'm thinking.. I kinda wanna do one more thing with you. Sorry.",
			"Oh, wait. If you don't mind.. there's something else I'd like to try..",
		]
	if(_id == "SoftSlaveryMarkingNotDoneStocks"):
		return [
			"This is just.. so you feel more secure..",
			"I hope this doesn't seem like too much..",
			"I thought this might help you stay comfortable..",
			"This will help you stay still for me.. if that's alright.",
			"I just want to make sure everything goes smoothly.",
		]
	if(_id == "SoftSlaveryMarkingNotDoneStocks2"):
		return [
			"Oh.. it looks.. nice.",
			"I think.. it suits a {npc.npcSlave} like you.",
			"It turned out.. better than I expected.",
			"I hope you like how it looks.",
			"It's.. um.. exactly what I hoped for. Yes.",
		]
	if(_id == "SoftSlaveryMarkingNotDoneUrinal"):
		return [
			"I was thinking.. we could try marking you this way..",
			"This is how I'd like to mark you.. if that's okay..",
			"Would it be alright.. to mark you like this?",
			"I feel like this is a.. proper way to mark someone..",
		]
	if(_id == "SoftSlaveryMarkingNotDoneUrinal2"):
		return [
			"You're being so good for me, {npc.npcSlave}..",
			"Oh.. you look.. very marked now..",
			"I hope that was.. okay for you..",
			"You wear it so well..",
			"It looks.. right on you..",
		]

	if(_id == "SoftSlaveryParadeAroundStart"):
		return [
			"I was thinking.. maybe we could walk around the prison? So others can see you.",
			"Um, I need to put this leash on you.. for our walk around the station.",
			"We should probably go for a walk now.. so people can see my {npc.npcSlave}.",
			"I'm going to take you around the prison.. if that's okay? Please show your neck, {npc.npcSlave}.",
			"Could we.. parade around a bit today? I want to show you off, just a little.",
		]
	if(_id == "SoftSlaveryParadeAroundFirst"):
		return [
			"Is this.. okay so far? We've only just started.",
			"How are you feeling, {npc.npcSlave}? This is just the beginning..",
			"People are looking.. but we don't have to go far if it's too much.",
			"Are you handling the attention alright? We can take it slow.",
			"This is just the first part.. try to pace yourself.",
		]
	if(_id == "SoftSlaveryParadeAroundMore"):
		return [
			"Okay.. let's keep going.",
			"We should probably continue.. Let's go.",
			"Are you getting tired? There's just a few more places to see..",
			"People are still watching us.. I like that. Let's continue.",
			"I think.. maybe you're getting used to this?",
			"It's kind of nice.. showing you off like this.",
			"Getting some fresh air.. it's nice, isn't it? Let's do more.",
		]
	if(_id == "SoftSlaveryParadeAroundLast"):
		return [
			"Just one more stop.. I'm sure you can manage it.",
			"Last stop left.. you've been doing so well.",
			"Almost finished.. just try to look proud for a moment longer?",
			"One last place to visit.. you can rest soon.",
			"One final stop left.. please don't be too embarrassed.",
			"We're nearly done.. just a bit more.",
		]
	if(_id == "SoftSlaveryParadeAroundFree"):
		return [
			"That was good.. you can be free for now, {npc.npcSlave}.",
			"Okay.. you're free to go. For a little while.",
			"That's enough walking for today.. you're free until I need you again.",
			"Good job.. you can go now. Just remember your place?",
			"You're done for now.. please try to stay out of trouble.",
			"You're free.. until next time.",
		]
	if(_id == "SoftSlaveryParadeAroundEatGagged"):
		return [
			"Sorry you can't eat right now.. I'll have something though.",
			"Um.. you'll have to wait while I eat. Those are the rules..",
			"Could you just.. sit and watch me eat? Maybe later you can have something.",
			"I wish you could eat too.. but you'll have to wait.",
		]
	if(_id == "SoftSlaveryParadeAroundEat"):
		return [
			"Let's take a break.. you should eat something, {npc.npcSlave}.",
			"Maybe you should sit and eat what they gave you..",
			"Time to rest for a bit.. please eat your food.",
			"Here's your portion.. don't waste it, okay?",
			"You should eat now.. we'll need to move again soon.",
		]
	if(_id == "SoftSlaveryParadeAroundPlatform"):
		return [
			"I might have to.. put you in one of these if you misbehave.",
			"These stocks look.. intimidating, don't they?",
			"This is where you could end up.. if I have to discipline you.",
			"If you don't behave.. I might need to use one of these.",
			"Do you like these? I'm just curious.",
		]
	if(_id == "SoftSlaveryParadeAroundShower"):
		return [
			"We should probably clean you up.. if that's okay.",
			"You need a wash.. please don't struggle.",
			"I want you to look presentable.. just a quick wash.",
			"Could you stand under the water? I need to clean you..",
		]

	if(_id == "SoftSlaveryThreesomeStart"):
		return [
			"Uhm.. there's someone else with me today. You'll need to.. please both of us.",
			"I hope it's okay.. I brought a friend. We both need you.",
			"Sorry for the surprise.. you'll be servicing two of us now.",
			"Is this alright..? You'll be taking care of both of us today.",
		]
	if(_id == "SoftSlaveryPunishCredits"):
		return [
			"I'm going to have to take some of this..",
			"Please don't be mad.. I need to take some for your disobedience.",
			"This is mine now.. I'm sorry, but you left me no choice.",
			"I wish you wouldn't make me do this.. I'm taking some credits.",
			"Your credits would be safer if you just behaved..",
			"This should help you remember to obey next time..",
			"It hurts me more than it hurts you.. taking these.",
		]
	if(_id == "SoftSlaveryPunishCredits2"):
		return [
			"If you won't obey.. I might have to do something worse than this..",
			"This is just a warning.. next time will be much more serious.",
			"I really don't want to hurt you.. just please start obeying.",
			"Please behave.. I don't want to have to do worse things next time.",
		]
	if(_id == "SoftSlaveryPunishRipClothes"):
		return [
			"Please start obeying before this gets worse.",
			"Now please behave before I really lose my temper.",
			"I'm sorry but I had to do this. Let's not make this harder.",
			"Still feeling brave? Please don't make me do something we'll both regret.",
			"Now let's try obeying instead, okay?",
		]
	if(_id == "SoftSlaveryPunishRoughSex"):
		return [
			"Oh.. I guess we have to do this the hard way then.",
			"I wish you would just obey.. now I have to be firm.",
			"You're not giving me a choice.. please don't struggle.",
			"This hurts me more than it hurts you.. but you left me no choice.",
			"I really didn't want to do this.. but you forced my hand.",
			"Your resistance just makes this so much harder for both of us..",
			"Should have obeyed when you had the chance.. now we have to do this.",
			"You're not making this easy for either of us, {npc.npcSlave}.",
			"I don't enjoy this.. but you need to learn your place.",
			"Please.. just accept this. Fighting will only make it worse.",
			"I wish you wouldn't make me do this.. it's for your own good.",
		]
	if(_id == "SoftSlaveryPunishRoughSexPCWon"):
		return [
			"Ouch.. this isn't over, you know.",
			"I'm not finished with you yet..",
			"You're just making things harder for yourself..",
			"This was a mistake.. for both of us.",
			"Nothing has changed.. you're still mine.",
		]
	if(_id == "SoftSlaveryPunishRoughSexEnded"):
		return [
			"Please obey next time.. I don't want to have to do worse.",
			"Let this be a lesson.. my patience isn't endless.",
			"Consider yourself warned.. I have my limits too.",
			"That was just a sample.. next time will be more serious.",
			"Remember how this felt.. it can get much more uncomfortable.",
			"You got off easy this time.. please don't test me.",
			"That was just a taste of what happens when you disobey..",
		]
	if(_id == "SoftSlaveryPunishSlutwall"):
		return [
			"Please walk to the slutwall.. I don't want to have to drag you.",
			"We're going to the slutwall. Understand? Yeah..",
			"Please follow me to the slutwall.. or I'll have to make you.",
			"Follow me willingly.. I don't want to hurt you.",
			"The slutwall is waiting.. let's not make this difficult.",
			"Come along quietly.. I don't want this to be any harder.",
			"Please don't fight me on this.. just walk.",
		]
	if(_id == "SoftSlaveryPunishSlutwallLock"):
		return [
			"I hope you.. enjoy being used. This is your punishment.",
			"You'll be available for public use now.. This is your punishment.",
			"Try to make yourself useful.. This is your punishment.",
			"This is what you're good for.. being used. This is your punishment.",
			"At least you're serving some purpose here.. This is your punishment.",
			"Maybe this will help you behave better.. This is your punishment.",
		]

	if(_id == "SoftSlaveryPunishStocks"):
		return [
			"Please follow me.. I don't want to have to force you.",
			"Could you please walk? I'd rather not drag you..",
			"Let's just go to the stocks quietly, okay?",
			"Please come along.. I don't want to make this harder than it has to be.",
		]
	if(_id == "SoftSlaveryPunishStocksLock"):
		return [
			"I'm.. I'm not sure what to do with you right now. Maybe others will know better.",
			"You're not really listening to me.. perhaps others can get through to you.",
			"Since you won't obey me.. maybe you'll respond better to strangers.",
			"Your behavior means you'll be available for anyone to use.. I'm sorry.",
			"Since you won't behave for me.. perhaps you'll learn from others.",
		]
	if(_id == "SoftSlaveryPunishStocksAsk"):
		return [
			"Is {pc.he} available for use?",
			"Um.. is this one free to use?",
			"Could I.. use your slave?",
			"Would you mind if I used your slave?",
			"Your slave looks like {pc.he} needs attention.. may I?",
			"Could I have a turn with your slave?",
			"Is your slave available?",
		]
	if(_id == "SoftSlaveryPunishStocksAskNope"):
		return [
			"Um.. no. It's <CREDITS> credits first, then you can use {pc.him}.",
			"Not for free, sorry.. <CREDITS> credits first.",
			"Everything has a price.. <CREDITS> and {pc.he} {pc.isAre} yours.",
			"<CREDITS> credits and you can.. do whatever you want with {pc.him}.",
			"Pay <CREDITS> credits and you can use {pc.him} as you like.",
			"I can't just give {pc.him} away.. it's <CREDITS> credits for use.",
		]
	if(_id == "SoftSlaveryPunishStocksAskNoBuy"):
		return [
			"What if I don't want to pay?",
			"I'm not sure I want to pay for used goods..",
			"That seems expensive for damaged property..",
			"That's more than this slave is worth, I think..",
			"I don't want to pay that much for a disobedient slave..",
			"Your slave doesn't seem worth that much..",
			"This one looks pretty used already.. why should I pay?",
			"I'd rather just.. take {pc.him} than pay..",
		]
	if(_id == "SoftSlaveryPunishStocksAskNoBuy2"):
		return [
			"Then please go away..",
			"Um.. no credits, no use. Please leave.",
			"Then please stop wasting my time.. you should go.",
			"Could you please leave if you can't pay?",
			"Maybe come back when you have credits..",
			"Then you get nothing.. please leave.",
		]
	if(_id == "SoftSlaveryPunishStocksAskNoBuy3"):
		return [
			"I don't really want to do that either..",
			"I'm not sure I want to leave empty-handed..",
			"Maybe I'll just.. take what I want?",
			"Your slave looks tempting enough to risk it..",
			"I think I'll just help myself anyway..",
			"Your property looks like it needs proper use..",
			"Maybe I'll use {pc.him} and let you watch..",
			"I don't really take no for an answer..",
			"This slave is going to get used one way or another..",
		]
	if(_id == "SoftSlaveryPunishStocksAskSure"):
		return [
			"Okay..",
			"That's fine..",
			"Here you go..",
			"Here.. this should be enough.",
			"This should be good..",
		]
	if(_id == "SoftSlaveryPunishStocksAfterSex"):
		return [
			"Please obey next time.. I mean it. Thanks for being.. useful. Enjoy your stay.",
			"See how much better things are when you're useful? Now please stay put and think about your place.",
			"That's what you're good for.. Remember this when you consider disobeying.",
			"You served your purpose.. Maybe public use suits you better?",
			"See? You can be obedient when properly motivated.. Enjoy the stocks.",
			"Good {npc.npcSlave}.. Now stay locked up and think about how obedience feels better.",
		]
	if(_id == "SoftSlaveryPunishStocksAfterBadSex"):
		return [
			"That wasn't very good.. Could I have my credits back?",
			"Worst sex I've ever paid for.. Refund please?",
			"Your slave isn't very good.. I want my credits back.",
			"This slave isn't worth the credits.. Could you return them?",
			"Your slave fights too much.. Not worth the price.",
			"This one seems broken.. Could I have my credits back?",
			"Waste of good credits.. Your slave is useless.",
			"Terrible service.. I think I deserve a refund.",
		]
	if(_id == "SoftSlaveryPunishStocksAfterBadSex2"):
		return [
			"That's not really how it works.. You used my {npc.npcSlave}, now please go.",
			"No refunds, sorry.. You got what you paid for.",
			"You used my {npc.npcSlave}.. No refunds.",
			"My {npc.npcSlave} served you.. Please deal with it.",
			"You paid for access, not satisfaction..",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerLost"):
		return [
			"That was.. pathetic.",
			"You fight like a slave yourself..",
			"Is that really the best you can do?",
			"All that struggling for nothing..",
			"You're even weaker than I thought..",
			"All that anger, but so little strength..",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerLost2"):
		return [
			"Much better.. Enjoy yourselves. Both of you.",
			"Two slaves, both in stocks.. Much better.",
			"Both slaves are now in stocks.. This seems right.",
			"Learn your place alongside your slave..",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerLost3"):
		return [
			"Much better.. And now your slave will watch as I punish you.",
			"Good.. Now your property gets to see what happens to disobedient owners.",
			"Perfect.. Your slave will learn from your mistakes.",
			"Much better.. Your slave will remember this.",
			"Good.. Your slave gets to see proper punishment.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerWon"):
		return [
			"Please learn your place..",
			"You're so weak.. Please learn your place.",
			"Pathetic display.. Please learn your place.",
			"You're not very smart or strong.. Please learn your place.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerWon2"):
		return [
			"You too.. You're on very thin ice, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerWon3"):
		return [
			"And now you're going to learn your place..",
			"You're so weak.. And now you're going to learn your place.",
			"Pathetic display.. And now you're going to learn your place.",
			"You're not very smart or strong.. And now you're going to learn your place.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerWon4"):
		return [
			"And you watch.. You're on very thin ice, {npc.npcSlave}.",
			"Pay attention, {npc.npcSlave}.. This is what happens when you're disobedient.",
		]

	if(_id == "SoftSlaveryPunishSell"):
		return [
			"I just can't do this anymore.. I'm going to have to let go of you.",
			"I'm not strong enough to handle you.. I think it's time I stop trying.",
			"This isn't working out.. Guess I will just have to give up.",
			"I tried my best with you, but I'm just not cut out for this..",
		]
	if(_id == "SoftSlaveryPunishSell2"):
		return [
			"Good luck. Maybe someone else will be better at handling you..",
			"I hope your new owner, whoever that is, is gonna take better care of you..",
			"Best of luck to you. You will need it. I'm sorry..",
			"I wasn't strict enough.. maybe someone else can do better with you. Take care.",
			"This is for the best.. you need someone more capable than me.",
			"I hope I'm making the right choice.. Even a small amount of credits is better than all this pain.",
		]


	if(_id == "SoftSlaveryPunishGB"):
		return [
			"Um.. I think we need to teach you a lesson with a gangbang.. I just have no other choice.",
			"You haven't been very good.. not good at all. Maybe I should let everyone use you? I guess I have to.",
			"You're so disobedient.. I guess a huge gangbang might help to put you on the right track.",
			"You keep saying no to me.. I guess I should invite others. You won't be able to say no to everyone.",
			"Your attitude needs some serious fixing.. or breaking even. I'm gonna try to break you.",
			"You need to remember your place.. a gangbang should help with that..",
		]
	if(_id == "SoftSlaveryPunishGBGiveup"):
		return [
			"Oh.. I guess there aren't enough people around. I guess this is it then.",
			"Nobody seems to want to.. um.. fuck you right now. Lucky.",
			"Nobody's available to help me today.. you're lucky..",
		]
	if(_id == "SoftSlaveryPunishGBOffer"):
		return [
			"Um.. excuse me? Would you like to help punish my {npc.npcSlave}?",
			"Could you.. help me gangbang my disobedient {npc.npcSlave}?",
			"Want to help teach my {npc.npcSlave} {pc.his} proper place? To gangbang {pc.him}?",
			"My {npc.npcSlave} needs.. to be gangbanged.. could you help?",
			"This {npc.npcSlave} needs to remember they're just holes.. interested?",
			"Would you like to join a gangbang? My {npc.npcSlave} deserves it..",
		]
	if(_id == "SoftSlaveryPunishGBSure"):
		return [
			"Okay.. I can do that..",
			"I suppose I could help..",
			"I'll join.. yeah.",
			"Count me in.. I guess.",
			"I'll help.. yeah.",
		]
	if(_id == "SoftSlaveryPunishGBFollow"):
		return [
			"Please follow me then..",
			"This way.. let's find a spot..",
			"Follow me, please..",
			"Come along..",
			"Follow me.. we should start soon..",
		]
	if(_id == "SoftSlaveryPunishGBSubOffer"):
		return [
			"Um.. maybe I could be punished too?",
			"I'd rather be the one getting used, actually..",
			"Could I join as another hole to be filled?",
			"Would you mind if I was on the receiving end instead?",
			"I'm more interested in being the one getting gangbanged..",
			"Actually, I'd prefer to be the punishment toy..",
			"Mind if I switch places with your slave? Or be an extra..",
			"I want to be the gangbang slut, not one of the participants..",
		]
	if(_id == "SoftSlaveryPunishGBSubOfferYes"):
		return [
			"I guess we could use an extra.. um.. slut..",
			"Okay.. more holes might be better..",
			"Sure, why not? Two might be better than one..",
			"Okay.. double the fun, I suppose..",
			"We can use both of you then..",
			"Works for me.. more bodies to play with..",
		]
	if(_id == "SoftSlaveryPunishGBSubOfferNo"):
		return [
			"We already have enough.. um.. sluts..",
			"No thanks, we've got enough holes to fill..",
			"This is about punishing my {npc.npcSlave}, not you..",
			"We don't need another slut right now..",
			"Sorry, this punishment is reserved for my {npc.npcSlave}..",
		]
	if(_id == "SoftSlaveryPunishGBSubOfferNoAw"):
		return [
			"Aw.. that's too bad..",
			"That's disappointing.. maybe next time..",
			"Damn.. I really wanted to be used..",
			"Too bad.. I love being gangbang material..",
			"Disappointing.. I enjoy being fucked raw..",
			"Shame.. nothing better than being used by multiple people..",
		]
	if(_id == "SoftSlaveryPunishGBNo"):
		return [
			"I think I'll pass..",
			"Not really interested, thanks..",
			"No thanks, not really my thing..",
			"No, I'm good, thanks..",
			"Not for me, sorry..",
			"I'll pass on that..",
		]
	if(_id == "SoftSlaveryPunishGBNoReact"):
		return [
			"Oh.. okay then..",
			"Your choice, I suppose..",
			"Okay, no problem.",
		]
	if(_id == "SoftSlaveryPunishGBStart"):
		return [
			"Time to teach you a lesson..",
			"I hope you're ready for your punishment..",
			"Let's see how much you can take..",
		]
	if(_id == "SoftSlaveryPunishGBEnd"):
		return [
			"You're on very thin ice from now on, {npc.npcSlave}..",
			"This is what happens to disobedient slaves..",
			"Your holes are mine to share.. please don't make me do this again..",
		]

	if(_id == "SoftSlaveryResist"):
		return [
			"Oh.. please don't make this difficult, my {npc.npcSlave}.",
			"Do we have to fight? Can't we just.. talk? Fine.",
			"I really wish you wouldn't resist.. Fine.",
			"I don't want to force you.. but now I have to.",
			"I'm not good at this.. please just obey? Okay..",
		]
	if(_id == "SoftSlaveryFuckInStocksExtra"):
		return [
			"Um.. is it okay if I join you?",
			"That looks.. nice. Can I join?",
			"Sorry to interrupt.. but can I join?",
			"I'd like to.. join.. if that's okay with you.",
			"Hey. Could I possibly.. join in?",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraYes"):
		return [
			"Sure.. let's do it together.",
			"Yes.. you can help me with my {npc.npcSlave}.",
			"I'd like that.. let's make sure {pc.he} {pc.isAre} secure.",
			"Yes please.. I could use some help restraining {pc.him}.",
			"I'd appreciate the help.. let's make {pc.him} comfortable.",
			"Sure.. we should make sure {pc.he} {pc.isAre} properly locked in.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraNo"):
		return [
			"Um.. I'd rather not share my {npc.npcSlave}.",
			"Sorry.. but my {npc.npcSlave} is just for me.",
			"I prefer to be alone with my {npc.npcSlave}..",
			"Maybe another time? I like having my {npc.npcSlave} to myself.",
			"Sorry.. I get nervous with others watching.",
			"I'd rather it just be me and my {npc.npcSlave}..",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraNo2"):
		return [
			"I was about to leave.. But now I'm kinda angry.",
			"You're making me very upset. I guess I have to take what I want with force.",
			"I'm sorry but your fucktoy is too tempting. I ain't leaving.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraFree"):
		return [
			"You can go now.. if you want.",
			"I think we're done for today.. you're free.",
			"That's all for today.. you're free for now.",
			"I think that's enough.. you may go.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraFreeLost"):
		return [
			"Remember.. you're still my {npc.npcSlave}, okay?",
			"Just so you know.. nothing has changed between us.",
			"Please don't forget who takes care of you..",
			"This doesn't mean you're free.. just so you know.",
		]

	if(_id == "SoftSlaveryParadeFuckOffer"):
		return [
			"Um.. your slave looks really nice.. Could I maybe.. you know..",
			"Your slave is so pretty.. Is it okay if I touch {pc.him}? Or more..",
			"I.. I was wondering if I could borrow your slave for some.. sex?",
			"Your property is so tempting.. Would you mind sharing?",
			"That's a lovely toy you have.. Would it be alright if I played with it?",
		]
	if(_id == "SoftSlaveryParadeFuckOfferYes"):
		return [
			"Oh.. okay.. Please be nice to {pc.him}..",
			"Alright.. Just.. be gentle with {pc.him}..",
			"I suppose.. Please don't hurt {pc.him} too much..",
			"Okay.. Just.. don't break {pc.him}..",
			"I guess so.. Please don't make {pc.him} scream too loud..",
			"Alright.. I'll watch to make sure {pc.he} {pc.isAre} okay..",
		]
	if(_id == "SoftSlaveryParadeFuckOfferYesThree"):
		return [
			"Um.. maybe I should join too.. to make sure {pc.he} {pc.isAre} okay..",
			"I think.. I'll participate as well.. if that's alright.",
			"I'll join.. but let's be careful with {pc.him}.",
			"Okay.. I'll show you how {pc.he} likes to be touched.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferNo"):
		return [
			"I'm sorry.. but no.",
			"Um.. I'd rather not share.. Maybe find another?",
			"I don't think so.. My {npc.npcSlave} isn't for public use..",
			"Please don't ask.. This {npc.npcSlave} is just for me.",
			"I'd rather you didn't.. Sorry.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferNo2"):
		return [
			"Oh.. okay.",
			"I understand..",
			"That's fine..",
			"Sorry. I see.",
			"Maybe another time..",
			"Your choice.",
			"Alright then.",
			"No problem.",
			"Okay.. sorry.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferGood"):
		return [
			"You did well.. Let's keep going now.",
			"See? You can handle it.. Now let's move along..",
			"Good.. Now we should probably keep walking.",
			"Okay.. Time to continue our walk..",
			"Alright.. Let's move along now.",
			"I think we should keep going.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferFight"):
		return [
			"You are making it very difficult..",
			"I really wish you wouldn't say that..",
			"I would go away.. but I don't want to.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferWon"):
		return [
			"I'm glad that's over..",
			"Maybe now people will leave us alone..",
			"Let's just go before anyone else tries anything..",
			"People shouldn't try to take what isn't theirs..",
		]
	if(_id == "SoftSlaveryParadeFuckOfferLostWatch"):
		return [
			"I won.. I guess I can do whatever I want now.. come here.",
			"Somehow, I managed to win. I get to do anything, right? Yeah..",
			"Now I get to do anything I want..",
		]
	if(_id == "SoftSlaveryParadeFuckOfferLostBoth"):
		return [
			"I won.. does this mean I can have fun with both of you? Yeah..",
			"Now I get to do anything I want.. with the both of you..",
			"Somehow, I managed to win. I really wanna play with both of you now..",
		]

	if(_id == "SoftSlaveryParadeGuard"):
		return [
			"Um.. excuse me? What's going on here?",
			"Sorry to bother you.. but can you explain this?",
			"Pardon me.. is everything alright?",
			"I.. I need to ask what's happening.",
			"Hey. Could you please explain what you are doing?",
			"I'm not sure this is allowed..",
			"Um.. why is the inmate leashed like that?",
			"Stop. Is this.. normal?",
		]
	if(_id == "SoftSlaveryParadeGuardPunish"):
		return [
			"I'm just.. trying to correct this {npc.npcSlave}.",
			"I'm teaching this {npc.npcSlave} discipline..",
			"It's just standard procedure.. Nothing to worry about.",
			"This {npc.npcSlave} wasn't being cooperative.. Now I'm punishing {pc.him}.",
		]
	if(_id == "SoftSlaveryParadeGuardPunish2"):
		return [
			"Oh.. okay then.",
			"I understand.. sorry for interrupting.",
			"Right.. I'll just let you continue.",
			"Okay.. carry on then.",
			"I see.. sorry to bother you.",
			"Alright.. I'll leave you to it.",
			"Makes sense. Sorry.. I didn't mean to interrupt.",
		]
	if(_id == "SoftSlaveryParadeGuardProblem"):
		return [
			"This.. this is private actually.",
			"I'd rather not discuss this..",
			"It's kind of personal..",
			"Maybe you shouldn't get involved..",
			"This doesn't really concern you..",
			"I think it's better if you don't know..",
			"Please.. just pretend you didn't see this.",
			"I'd prefer to handle this alone..",
		]
	if(_id == "SoftSlaveryParadeGuardProblem2"):
		return [
			"Are you sure about this? I guess I gotta take measures..",
			"I see. This isn't going to end well for you..",
			"I was hoping we could avoid this.. I guess we can't.",
		]
	if(_id == "SoftSlaveryParadeGuardWon"):
		return [
			"I didn't want to hurt anyone.",
			"Let's just continue now.",
			"Come along, {npc.npcSlave}.. we should go.",
			"I hope nobody else tries to stop us.",
			"Let's get back to what we were doing.",
			"I'm glad that's over.",
		]
	if(_id == "SoftSlaveryParadeGuardLost"):
		return [
			"You can go, inmate..",
			"You're free now, inmate. Please leave.",
			"Please leave, inmate. You can go.",
			"You can go now, inmate. You're free.",
		]


	if(_id == "SoftSlaveryGB"):
		return [
			"Um.. I was thinking we could have a gangbang with you today.. and anyone who's interested. You might even get some credits, {npc.npcSlave}.",
			"I'm.. trying to arrange a gangbang for you. I hope you're okay with being shared.. You could earn a little, {npc.npcSlave}.",
			"Your body is going to be the center of attention today.. a gangbang. You might get some credits from it, {npc.npcSlave}.",
			"I thought.. we could try to earn some credits with your body today. I'm organizing a gangbang.. if you don't mind, my {npc.npcSlave}.",
			"You're going to be the main focus today.. for everyone. I hope that's okay. You could earn something from it, my {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryGBGiveup"):
		return [
			"Oh.. I guess it's not happening today. Maybe some other day..",
			"It seems like.. no one is available right now. Sorry.",
			"Nobody seems interested today.. that's a shame.",
		]
	if(_id == "SoftSlaveryGBOffer"):
		return [
			"Um, excuse me.. would you like to join a gangbang for my {npc.npcSlave}? It's for a fair price..",
			"Hi.. are you interested in using my slave? I'm putting together a gangbang..",
			"Maybe.. you'd like to gangbang my {npc.npcSlave}? {pc.He} {pc.isAre} available right now..",
			"I'm looking for people for a gangbang with my {npc.npcSlave}.. if you're interested? Won't cost you much.",
			"My {npc.npcSlave} could use some.. gangbanging. Would you like to be part of it?",
			"Interested in some fun? My {npc.npcSlave} is up for a gangbang..",
			"Um.. I need people to help use my {npc.npcSlave}. {pc.He} can handle a few partners..",
		]
	if(_id == "SoftSlaveryGBSure"):
		return [
			"Okay.. that sounds alright.",
			"Yes, I'll join..",
			"I think so.. I could use the distraction.",
			"Um, yes.. whenever you're ready.",
			"Okay..",
			"Alright, I'll come..",
			"That sounds.. nice, yes.",
			"Mhm.. okay. Let's try.",
		]
	if(_id == "SoftSlaveryGBFollow"):
		return [
			"Please follow me..",
			"This way.. we should find a spot.",
			"Follow me, please..",
			"Come with me..",
			"Follow me.. we can start soon.",
		]
	if(_id == "SoftSlaveryGBSubOffer"):
		return [
			"Um.. maybe I could be the one gangbanged instead? I can pay..",
			"I think.. I'd rather be the one used, actually. I can pay even.",
			"Could I maybe.. be an extra hole? I, uh, can pay.",
			"Would it be okay if I was on the receiving end? Even if it costs me..",
			"I'm more comfortable being the one getting gangbanged.. I can pay.",
			"I'd prefer to be the one taking all the.. attention. I can pay even.",
			"Maybe I could be fucked instead? Or just an extra. I can pay!",
			"I want to be the gangbang slut.. not one of the users. I have credits.",
		]
	if(_id == "SoftSlaveryGBSubOfferYes"):
		return [
			"I guess we could use another person..",
			"Okay.. the more the merrier, I suppose.",
			"Um, why not? There's room for another.",
			"Alright.. get ready to be used.",
			"Okay by me.. you'll take what we give.",
			"That works.. another person to join.",
			"Sure.. I hope you can handle it.",
			"Okay.. you'll be used too.",
		]
	if(_id == "SoftSlaveryGBSubOfferNo"):
		return [
			"We already have enough people..",
			"No thank you, we have enough participants.",
			"We don't need another person right now..",
			"We have all the people we need..",
		]
	if(_id == "SoftSlaveryGBSubOfferNoAw"):
		return [
			"Aw.. okay then.",
			"That's too bad.. maybe next time.",
			"Alright then..",
			"Okay.. I'll find someone else to use me.",
			"Okay.. I'll just watch then.",
			"Alright.. maybe I can join another time.",
		]
	if(_id == "SoftSlaveryGBNo"):
		return [
			"I'll pass..",
			"Not really interested..",
			"No thank you..",
			"I'll sit this one out..",
			"Not for me today..",
			"Maybe another time..",
			"I'll pass for now..",
			"It's not really my thing..",
			"No, I'm okay..",
			"Not right now..",
		]
	if(_id == "SoftSlaveryGBNoReact"):
		return [
			"Oh, okay then..",
			"That's your choice..",
			"Okay.. more for others, I guess.",
			"Okay then..",
			"Missing out, but that's okay..",
			"Your decision.. we'll have fun anyway.",
			"Okay.. we'll find someone else.",
			"That's alright.. plenty of others.",
		]
	if(_id == "SoftSlaveryGBStart"):
		return [
			"Time to start.. I hope this is okay.",
			"Is everyone ready? We can begin..",
			"Time to put this {npc.npcSlave} to use..",
			"Let's see how much you can take..",
			"I hope you're ready for this..",
			"Time to earn your keep..",
			"Let's see what this {npc.npcSlave} can handle..",
			"Everyone can take a turn.. please be careful.",
		]
	if(_id == "SoftSlaveryGBEnd"):
		return [
			"Was that.. satisfying? Here's your share, {npc.npcSlave}.",
			"Did everyone have enough? Good. Here's your part, {npc.npcSlave}.",
			"That was.. wow. You earned this, {npc.npcSlave}.",
			"I hope it wasn't too much. Here's your cut.",
			"You did well today. This is yours, {npc.npcSlave}.",
			"You handled that well. Here's your share.",
			"Is everyone done? Okay. This is for you, {npc.npcSlave}.",
			"That was quite intense. You've earned this, {npc.npcSlave}.",
			"You did good. Here's your cut for being cooperative.",
			"You served well. This is your reward, {npc.npcSlave}.",
		]


	if(_id == "SoftSlaveryLockRestraint"):
		return [
			"I was thinking.. maybe I could put something on you today.",
			"I kind of want to see you in some restraints..",
			"Your body looks.. bare. Maybe I should lock something onto you.",
			"I was thinking.. Maybe you need some bondage.. I want to put something on you.",
			"I own you.. so I think I'll lock something on you. I want to.",
			"Your body looks like it needs some.. accessories."
		]
	if(_id == "SoftSlaveryLockRestraint2"):
		return [
			"Which one do you prefer? I'll let you choose..",
			"Tell me which toy you'd like me to lock on you..",
			"Which one makes you feel.. things? You don't have to hide it.",
			"You can pick one.. I'm letting you choose.",
		]
	if(_id == "SoftSlaveryLockRestraint3"):
		return [
			"I'll keep the key.. Please don't try to remove it, {npc.npcSlave}.",
			"I have the only key.. Please don't try to escape.",
			"I have the key.. Don't think about getting free, okay?",
			"The key is with me.. I hope the restraint is comfortable.",
			"It will stay on for a while.. I hope you get used to it.",
		]
	if(_id == "SoftSlaveryOfferGearUnlock"):
		return [
			"You've been locked up for a while.. Ready to be free?",
			"Has that gear been on too long? Do you want it off?",
			"Are you tired of being restrained? Maybe I can free you.. for now.",
			"Is the metal uncomfortable? Do you need relief?",
			"Have you been good? Maybe you deserve some freedom from the bondage..",
		]
	if(_id == "SoftSlaveryOfferGearUnlock2"):
		return [
			"There.. that feels better, right? But I'm not finished with you yet..",
			"Freedom must feel nice.. but now I wanna do something else with you.",
			"Enjoy that feeling.. I want to do something else now.",
		]
	if(_id == "SoftSlaveryOfferGearUnlockKeep"):
		return [
			"Keep it? Okay.. it does suit you.",
			"You want to stay locked? That's.. nice.",
			"You enjoy being restrained? I thought you might..",
			"You like being locked up? Good.. it's where you should be.",
			"You prefer the restraints? Maybe you're accepting this..",
			"Keep the gear on? I'm glad my property knows its place..",
			"Stay locked up? You're becoming a good slave..",
		]
	if(_id == "SoftSlaveryOfferGearUnlockKeep2"):
		return [
			"Now, I still want to do something else with you..",
			"Now let's do what I had in mind..",
			"Now let's see what we can do while you're like this..",
			"Now that you're staying locked, let's do something..",
			"Good choice.. now let me enjoy my bound property."
		]
	if(_id == "SoftSlaveryNoticedNoGear"):
		return [
			"Wait.. Didn't I lock something on you? I'm sure I did. Where is it, {npc.npcSlave}?",
			"You're not wearing what I locked onto you.. Can you explain, {npc.npcSlave}?",
			"I don't see the gear I put on you.. Where did it go, {npc.npcSlave}?",
			"You're supposed to be restrained.. Where is my stuff, {npc.npcSlave}?",
			"You're missing something.. Where are your locks?",
			"Someone isn't wearing their restraints.. Can you explain?"
		]
	if(_id == "SoftSlaveryNoticedNoGear2"):
		return [
			"You know what this means.. I have to punish you.",
			"This means.. I need to punish you.",
			"You've earned a punishment, {npc.npcSlave}.",
			"Time for a punishment.."
		]

	if(_id == "SoftSlaveryAskSex"):
		return [
			"Okay.. but please get on your knees first.",
			"Alright.. let's do this. Please kneel.",
			"Okay.. but I might not be very good. Please kneel.",
			"Good {npc.npcSlave}.. Now assume the position.",
			"You'll take what I give.. okay? Now kneel.",
		]
	if(_id == "SoftSlaveryAskFuckOwner"):
		return [
			"Um.. okay. But only because I want to..",
			"Alright.. but please make it good.",
			"Don't get too used to this.. but yes.",
			"Please don't disappoint me, {npc.npcSlave}.",
			"Okay.. try to impress me, my {npc.npcSlave}.",
			"Interesting.. try your best, please.",
			"You have permission.. please don't make me regret this.",
		]
	if(_id == "SoftSlaveryAskFuckOwnerBad"):
		return [
			"That was.. not very good. Even I can do better..",
			"Not great.. You can't really take charge well.",
			"Not very good.. Don't expect to be on top again.",
			"That was awkward to experience.. You're not good at this.",
			"Do you know what you're doing? It doesn't seem like it..",
			"Please don't ask to top again after that..",
			"Wow.. That was.. not good.",
		]
	if(_id == "SoftSlaveryAskFuckOwnerOkay"):
		return [
			"That was okay, I guess.. Are you sure about topping?",
			"Not bad, but not great either.. You need practice.",
			"Not terrible, but not impressive either..",
			"You didn't completely embarrass yourself, I suppose..",
			"Passable.. Maybe you can improve.",
			"Not the worst I've had, but not the best..",
			"You weren't completely useless.. surprising.",
			"You managed okay.. but don't get too proud.",
		]
	if(_id == "SoftSlaveryAskFuckOwnerGood"):
		return [
			"Not bad.. that helped. Thanks, {npc.npcSlave}.",
			"Surprisingly good.. You can ask to do that again sometime.",
			"Well done.. You actually know how to use your body.",
			"Impressive.. I might let you take charge more often.",
			"You earned your keep today.. Good job.",
			"You pleased me.. Well done, {npc.npcSlave}.",
			"That was good service.. Well done.",
			"You did better than I expected.. I'm satisfied.",
			"Finally, you show some skill.. Good.",
		]
