extends RecruitBase

func _init():
	id = "Rahi"
	charID = "rahi"
	difficulty = RecruitDifficulty.VeryEasy
	talkScene = "RahiRecTalk"
	nextStoryScene = "DomCh1RahiBreakAfterScene"
	choices = [
		{
			id = "tone",
			name = "Tone",
			desc = "What tone do you want to use while speaking with Rahi",
			options = [
				["gentle", "Gentle", "Use a very kind tone with Rahi", RecruitChoiceResult.Red],
				["strict", "Strict", "Use a strict tone with Rahi", RecruitChoiceResult.Yellow],
				["mean", "Mean", "Say mean and dirty things to Rahi", RecruitChoiceResult.Green],
			],
		},
		{
			id = "main",
			name = "Main action",
			desc = "What should the main action be",
			options = [
				["sex", "Sex", "Have sex with Rahi", RecruitChoiceResult.Yellow],
				["petplay", "Petplay", "Do some petplay with Rahi", RecruitChoiceResult.Green],
				["pain", "Painplay", "Make that can feel some pain", RecruitChoiceResult.Red],
			],
		},
		{
			id = "special",
			name = "Special kink",
			desc = "What special kink do you wanna incorporate",
			options = [
				["public", "In public", "Do it in public", RecruitChoiceResult.Yellow],
				["bondage", "Bondage", "Include a lot of bondage", RecruitChoiceResult.Green],
				["anal", "Anal-focus", "Put a huge focus on anal", RecruitChoiceResult.Red],
			],
		},
	]

func getExtraChoices(_choices:Array) -> Array:
	var result:Array = []
	if(_choices[1] == "sex"):
		if(GM.pc.hasReachablePenis()):
			result.append({
					id = "condom",
					name = "Condom",
					desc = "Pick which condom you want to use, if any",
					options = [
						["no", "No condom", "Don't use a condom"],
						["worst", "Worst condom", "Use the worst condom you have"],
						["best", "Best condom", "Use the best condom you have"],
					],
				})
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
	if(_choices[1] == "sex"):
		if(_choices[2] == "public"):
			return "RahiRecSceneSex"
		if(_choices[2] == "bondage"):
			return "RahiRecSceneSexBondage"
		if(_choices[2] == "anal"):
			return "RahiRecSceneSexAnal"
	if(_choices[1] == "petplay"):
		if(_choices[2] == "public"):
			return "RahiRecScenePetplayPublic"
		if(_choices[2] == "bondage"):
			return "RahiRecScenePetplayBondage"
		if(_choices[2] == "anal"):
			return "RahiRecScenePetplayAnal"
	if(_choices[1] == "pain"):
		if(_choices[2] == "public"):
			return "RahiRecScenePainPublic"
		if(_choices[2] == "bondage"):
			return "RahiRecScenePainBondage"
		if(_choices[2] == "anal"):
			return "RahiRecScenePainAnal"
	return "PlaceholderRecruitScene"
