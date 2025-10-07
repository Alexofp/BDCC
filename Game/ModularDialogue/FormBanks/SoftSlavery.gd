extends DialogueFormBank

func getForms() -> Dictionary:
	return {
		"SoftSlaveryIntro1": form("You're up? Good.", {main=CHAR, target=CHAR}),
		"SoftSlaveryIntro2": form("Hey. From this point on, you are now my {main.npcSlave}. Understand?", {main=CHAR, target=CHAR}),
		"SoftSlaveryIntro3": form("You will do as I say. Otherwise, we will have a problem.", {main=CHAR, target=CHAR}),
		"SoftSlaveryIntroEND": form("I will be checking on you ever so often. Don't forget who you belong to.", {main=CHAR, target=CHAR}),
		
		"SoftSlaveryChangeName": form("How should I call my {npc.npcSlave} then?", {main=CHAR, target=CHAR}),
		"SoftSlaveryChangeNameEND": form("Alright. You will now be my {npc.npcSlave}.", {main=CHAR, target=CHAR}),
		
		"SoftSlaveryAttackReaction": form("You're gonna regret it.", {main=CHAR, target=CHAR}),
		"SoftSlaveryAttackLost": form("Ugh.. so? You're still my {npc.npcSlave}.", {main=CHAR, target=CHAR}),
		"SoftSlaveryAttackWon": form("And now.. I'm gonna punish you.", {main=CHAR, target=CHAR}),
		
		"SoftSlaveryAskedFreedom": form("I guess I can. No point in me bugging you any further, you already know that you are my {npc.npcSlave}. Do you really want that though?", {main=CHAR, target=CHAR}),
		"SoftSlaveryAskedFreedomEND": form("Alright, well. Go away then.", {main=CHAR, target=CHAR}),
		
		"SoftSlaveryTalkStart": form("What do you want, {npc.npcSlave}?", {main=CHAR, target=CHAR}),
		
		"SoftSlaveryProtectedByFriendStart": form("Hey, what are you doing with {pc.name}?", {main=CHAR, target=CHAR}),
		"SoftSlaveryProtectedByFriendResponse": form("It's none of your business. Step aside.", {main=CHAR, target=CHAR}),
		"SoftSlaveryProtectedByFriendAllGoodResp": form("Alright. Whatever then.", {main=CHAR, target=CHAR}),
		"SoftSlaveryProtectedByFriendLost": form("Now go away while you still can.", {main=CHAR, target=CHAR}),
		"SoftSlaveryProtectedByFriendWonThank": form("You're welcome.", {main=CHAR, target=CHAR}),
		
		"SoftSlaveryChokeOutStart": form("I'm so fucking mad. I need a toy to abuse and you seem good enough, {npc.npcSlave}.", {main=CHAR, target=CHAR}),
		"SoftSlaveryChokeOutEndured": form("I feel so much better. Thanks, {npc.npcSlave}.", {main=CHAR, target=CHAR}),
		"SoftSlaveryChokeOutPCWon": form("Ugh. Why are you such a bitch?", {main=CHAR, target=CHAR}),
		"SoftSlaveryChokeOutPCLost": form("Such a weak {npc.npcSlave}. Can't even take some fucking abuse.", {main=CHAR, target=CHAR}),
		"SoftSlaveryChokeOutPCLostSex": form("Get over here.", {main=CHAR, target=CHAR}),
		
		"SoftSlaveryFuckStart": form("I wanna fuck my {npc.npcSlave}. Come here.", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckResultGood": form("Not bad for a {npc.npcSlave}. I will be back when I'm horny again.", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckResultOkay": form("That was okay. Can't you moan a little louder, {npc.npcSlave}? I will be back when I'm horny again.", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckResultBad": form("That was awful. Are you trying to make me mad, {npc.npcSlave}? Whatever, I will be back soon.", {main=CHAR, target=CHAR}),
		
		"SoftSlaveryFuckNemesisApproach": form("Well-well-well, what do we have here?", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckNemesisAsk": form("What's your problem?", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckNemesisAnswer": form("Your slave crossed me. Wanna punish {pc.him} together?", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckNemesisYes": form("Sure. Let's do it.", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckNemesisNo": form("No. {pc.He} {pc.isAre} mine.", {main=CHAR, target=CHAR}),
		
		"SoftSlaveryFuckJealousStart": form("Hey! That is my slave! The fuck are you doing with {pc.him}?", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckJealousFight": form("Huh? Go fuck yourself. This slave is my {npc.npcSlave}.", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckJealousOwnerWon": form("This is my {npc.npcSlave}. Do you understand that now?", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckJealousOwnerWonFuck": form("Shouldn't have come here. Now you're gonna be my fucktoy too.", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckJealousOwnerLostOffer": form("Hey! Hear me out. How about we.. share this {npc.npcSlave} together?", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckJealousOwnerLostOffer2": form("It's the slave's fault that {pc.he} didn't tell us about each other, right? So why not punish {pc.him} instead?", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckJealousOwnerLostOfferAgree": form("You might be right.", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckJealousOwnerLostOfferAgree2": form("Let's have some fun.", {main=CHAR, target=CHAR}),
		"SoftSlaveryFuckJealousOwnerLostOfferNope": form("Huh. You're funny. I think I will just fuck both of you.", {main=CHAR, target=CHAR}),
		
		"SoftSlaverySlutwallStart": form("Today I feel like fucking you in the slutwall. Stay still while I leash you.", {main=CHAR, target=CHAR}),
		"SoftSlaverySlutwallLocked": form("Let's have some fun.", {main=CHAR, target=CHAR}),
		
		"SoftSlaveryStocksStart": form("I decided what I wanna do. I'm gonna fuck you in the stocks while everyone is watching. Stay still.", {main=CHAR, target=CHAR}),
		"SoftSlaveryStocksLocked": form("Let's have some fun.", {main=CHAR, target=CHAR}),
		
		"SoftSlaveryGiveCreditsStart": form("I'm short on credits, I need exactly <CREDITS> right now. Be a good {npc.npcSlave} and give them to me.", {main=CHAR, target=CHAR}),
		"SoftSlaveryGiveCreditsTake": form("Thanks. Good {npc.npcSlave}.", {main=CHAR, target=CHAR}),
		"SoftSlaveryGiveCreditsShort": form("Bullshit. Guess I will just have to punish you.", {main=CHAR, target=CHAR}),
		"SoftSlavery": form("", {main=CHAR, target=CHAR}),
	}
