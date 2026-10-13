extends RecruitBase

func _init():
	id = "Eliza"
	charID = "eliza"
	difficulty = RecruitDifficulty.Medium
	talkScene = id+"RecTalk"
	nextStoryScene = "DomM4s4End"
	choices = [
		{
			id = "tone",
			name = "Tone",
			desc = "What tone do you want to use while speaking with Eliza",
			options = [
				["silent", "Silent", "Give Eliza a mostly silent treatment", RecruitChoiceResult.Red],
				["mean", "Mean", "Say mean and dirty things to Eliza", RecruitChoiceResult.Yellow],
				["degrade", "Degrading", "Use a degrading tone with Eliza", RecruitChoiceResult.Green],
			],
		},
		{
			id = "main",
			name = "Main action",
			desc = "What should the main action be",
			options = [
				["bloodplay", "Bloodplay", "Use a sharp edge to make Eliza bleed", RecruitChoiceResult.Green],
				["cuddling", "Cuddling", "Cuddle with Eliza", RecruitChoiceResult.Red],
				["sex", "Sex", "Fuck Eliza's pussy raw", RecruitChoiceResult.Yellow],
			],
		},
		{
			id = "special",
			name = "Special kink",
			desc = "What special kink do you wanna incorporate",
			options = [
				["druguse", "Drug-use", "Use Eliza's drugs against her", RecruitChoiceResult.Green],
				["choke", "Choking", "Play with Eliza's ability to breathe", RecruitChoiceResult.Yellow],
				["deny", "Orgasm denial", "Bring Eliza close but then deny her orgasm completely", RecruitChoiceResult.Red],
			],
		},
	]

func getExtraChoices(_choices:Array, _extras:Dictionary) -> Array:
	var result:Array = []
	if(_choices[1] == "sex"):
		if(GM.pc.hasReachablePenis()):
			pass
#			result.append({
#					id = "condom",
#					name = "Condom",
#					desc = "Pick which condom you want to use, if any",
#					options = [
#						["no", "No condom", "Don't use a condom"],
#						["worst", "Worst condom", "Use the worst condom you have"],
#						["best", "Best condom", "Use the best condom you have"],
#					],
#				})
		else:
			result.append({
					id = "strapon",
					name = "Strapon",
					desc = "Pick which strapon you wanna use.",
					options = getStraponOptions(),
				})
	return result

func isCombinationPossible(_choices:Array, _extras:Dictionary) -> Array:
	if(_extras.get("condom", "") in ["worst", "best"]):
		if(!GM.pc.hasCondoms()):
			return [false, "You don't have any condoms to do this"]
	
	return [true, ""]

func getSceneToPlay(_choices:Array, _extras:Dictionary) -> String:
	if(_choices[1] == "bloodplay"):
		if(_choices[2] == "druguse"):
			return "ElizaRecSceneBloodplayDruguse"
		if(_choices[2] == "choke"):
			return "ElizaRecSceneBloodplayBreathplay"
		if(_choices[2] == "deny"):
			return "ElizaRecSceneBloodplayOrgasmDenial"
	if(_choices[1] == "cuddling"):
		if(_choices[2] == "druguse"):
			return "ElizaRecSceneCuddlingDruguse"
		if(_choices[2] == "choke"):
			return "ElizaRecSceneCuddlingBreathplay"
		if(_choices[2] == "deny"):
			return "ElizaRecSceneCuddlingOrgasmDenial"
	if(_choices[1] == "sex"):
		if(_choices[2] == "druguse"):
			return "ElizaRecSceneSexDrugUse"
		if(_choices[2] == "choke"):
			return "ElizaRecSceneSexBreathplay"
		if(_choices[2] == "deny"):
			return "ElizaRecSceneSexOrgasmDenial"
	return "PlaceholderRecruitScene"

func getPresenterCharID() -> String:
	return "avy"

func getPresenterDialogue() -> String:
	return "Should I break this nerd bitch?"
