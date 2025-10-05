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
		#"SoftSlavery": form("", {main=CHAR, target=CHAR}),
	}
