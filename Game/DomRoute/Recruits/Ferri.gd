extends RecruitBase

func _init():
	id = "Ferri"
	charID = "ferri"
	difficulty = RecruitDifficulty.Easy
	talkScene = id+"RecTalk"
	nextStoryScene = "DomM2s3"
	choices = [
		{
			id = "tone",
			name = "Tone",
			desc = "What tone do you want to use while speaking with Ferri",
			options = [
				["strict", "Strict", "Use a strict tone with Ferri", RecruitChoiceResult.Green],
				["mean", "Mean", "Say mean and dirty things to Ferri", RecruitChoiceResult.Yellow],
				["degrade", "Degrading", "Use a degrading tone with Ferri", RecruitChoiceResult.Red],
			],
		},
		{
			id = "main",
			name = "Main action",
			desc = "What should the main action be",
			options = [
				["petplay", "Petplay", "Do some petplay with Ferri", RecruitChoiceResult.Yellow],
				["milking", "Milking", "Force Ferri to lactate and then milk her", RecruitChoiceResult.Green],
				["oralsex", "Oral sex", "Make Ferri blow you or lick your pussy", RecruitChoiceResult.Red],
			],
		},
		{
			id = "special",
			name = "Special kink",
			desc = "What special kink do you wanna incorporate",
			options = [
				["deny", "Orgasm denial", "Bring Ferri close to an orgasm but then deny her", RecruitChoiceResult.Red],
				["sadism", "Sadism", "Be sadistic with Ferri, make it hurt", RecruitChoiceResult.Yellow],
				["overstim", "Overstimulation", "Overstimulate Ferri's senses or make her cum a lot", RecruitChoiceResult.Green],
			],
		},
	]

func getExtraChoices(_choices:Array, _extrasRaw:Dictionary) -> Array:
	var result:Array = []
	if(_choices[1] == "oralsex"):
		var strapCheck:bool = false # A HAACK
		var variantsList:Array = []
		if(GM.pc.hasReachablePenis()):
			variantsList.append([
				"bj", "Blowjob", "Fuck Ferri's mouth with your cock!",
			])
		else:
			variantsList.append([
				"strapon", "Blowjob (Strapon)", "Fuck Ferri's mouth with a strapon!",
			])
			strapCheck = true
		if(GM.pc.hasReachableVagina()):
			variantsList.append([
				"vaginal", "Pussy-licking", "Make Ferri lick you out!",
			])
		result.append({
				id = "variant",
				name = "Variant",
				desc = "Pick what kind of oral sex do you want",
				options = variantsList,
			})
		
		if(strapCheck && _extrasRaw.get("variant", "") == "strapon"):
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
	if(_choices[1] == "milking"):
		if(_choices[2] == "overstim"):
			return "FerriRecSceneMilkingOverstim"
		if(_choices[2] == "sadism"):
			return "FerriRecSceneMilkingSadism"
		if(_choices[2] == "deny"):
			return "FerriRecSceneMilkingDeny"
	if(_choices[1] == "petplay"):
		if(_choices[2] == "overstim"):
			return "FerriRecScenePetplayOverstim"
		if(_choices[2] == "sadism"):
			return "FerriRecScenePetplaySadism"
		if(_choices[2] == "deny"):
			return "FerriRecScenePetplayDeny"
	if(_choices[1] == "oralsex"):
		if(_choices[2] == "overstim"):
			return "FerriRecSceneOralOverstim"
		if(_choices[2] == "sadism"):
			return "FerriRecSceneOralSadism"
		if(_choices[2] == "deny"):
			return "FerriRecSceneOralDeny"
	return "PlaceholderRecruitScene"
