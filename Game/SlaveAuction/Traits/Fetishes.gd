extends AuctionTrait

func _init():
	ids = [
		"FetishSexBottom",#
		"FetishSexTop",#
		"FetishSexExotic",#
		
		"FetishBDSM",#
		"FetishMilking",#
		"FetishExhibitionism",#
		"FetishDrugUse",#
	]

func getTraitType(_id:String):
	return AuctionTraitType.Fetish

func getName(_id:String) -> String:
	if(_id == "FetishSexBottom"):
		return "Sextoy (Bottom)"
	if(_id == "FetishSexTop"):
		return "Sextoy (Top)"
	if(_id == "FetishSexExotic"):
		return "Sextoy (Exotic)"
		
	if(_id == "FetishBDSM"):
		return "BDSM fetish"
	if(_id == "FetishMilking"):
		return "Milking fetish"
	if(_id == "FetishExhibitionism"):
		return "Exhibitionist"
	if(_id == "FetishDrugUse"):
		return "Drug junkie"
	
	return "ERROR"

func calculateScore(_id:String, _char:BaseCharacter) -> float:
	if(_id == "FetishSexBottom"):
		var fetishes:Dictionary = {
			Fetish.AnalSexReceiving: 1.0,
			Fetish.OralSexReceiving: 1.0,
		}
		if(_char.hasAnyWomb()):
			fetishes[Fetish.BeingBred] = 1.0
		if(_char.hasVagina()):
			fetishes[Fetish.VaginalSexReceiving] = 1.0
		
		return calculateFetishScore(_char, fetishes)
	if(_id == "FetishSexTop"):
		var fetishes:Dictionary = {
			Fetish.AnalSexGiving: 1.0,
			Fetish.VaginalSexGiving: 1.0,
			Fetish.StraponSexAnal: 1.0,
			Fetish.StraponSexVaginal: 1.0,
			Fetish.OralSexGiving: 1.0,
		}
		return calculateFetishScore(_char, fetishes)
	if(_id == "FetishSexExotic"):
		var fetishes:Dictionary = {
			Fetish.FeetplayGiving: 1.0,
			Fetish.FeetplayReceiving: 1.0,
			Fetish.RimmingGiving: 1.0,
			Fetish.RimmingReceiving: 1.0,
			Fetish.Tribadism: 1.0,
			Fetish.UnconsciousSex: 1.0,
			Fetish.Condoms: 1.0,
		}
		return calculateFetishScore(_char, fetishes)
	if(_id == "FetishBDSM"):
		var fetishes:Dictionary = {
			Fetish.Bondage: 1.0,
			Fetish.Rigging: 1.0,
			Fetish.Bodywritings: 0.5,
			Fetish.Choking: 0.5,
			Fetish.Masochism: 1.0,
			Fetish.Sadism: 1.0,
			Fetish.HypnosisHypnotist: 0.3,
			Fetish.HypnosisSubject: 0.3,
		}
		return calculateFetishScore(_char, fetishes)
	if(_id == "FetishMilking"):
		var fetishes:Dictionary = {
			Fetish.SeedMilking: 1.0,
			Fetish.Lactation: 1.0,
		}
		return calculateFetishScore(_char, fetishes)
	if(_id == "FetishExhibitionism"):
		var fetishes:Dictionary = {
			Fetish.Exhibitionism: 1.0,
		}
		return calculateFetishScore(_char, fetishes)
	if(_id == "FetishDrugUse"):
		var fetishes:Dictionary = {
			Fetish.DrugUse: 1.0,
		}
		return calculateFetishScore(_char, fetishes)

	
	return 0.0

func getBidderOutbidReactions(_id:String, _char:BaseCharacter) -> Array:
	if(_id == "FetishSexBottom"):
		return [
			'I’ll break {slave.him} in properly.',
			'That ass will be mine to fuck.',
			'{slave.HeShe} will make a perfect fucktoy.',
			'I’ll fuck {slave.him} until {slave.he} begs.',
			'{slave.HeShe} is mine to breed.',
			'I’ll take care of {slave.his} holes personally.',
		]
	if(_id == "FetishSexTop"):
		return [
			'{slave.HeShe} will take charge in my bed.',
			'{slave.HeShe} can fuck me any time.',
			'I need {slave.him} on top of me.',
			'{slave.HeShe} will dominate me anytime I choose.',
			'{slave.HeShe} will make the perfect service top.',
			'I could use such a good breeder.',
		]
	if(_id == "FetishSexExotic"):
		return [
			'I’ll enjoy exploring every inch of {slave.him}.',
			'{slave.HeShe} is a one-of-a-kind treat.',
			'{slave.HeShe} belongs in my collection.',
			'{slave.HeShe} will satisfy my rare tastes.',
		]
		
	if(_id == "FetishBDSM"):
		return [
			'I’ll show {slave.him} real discipline.',
			'{slave.HeShe} will beg for more pain.',
			'{slave.HeShe} will be my personal masochist.',
			'Let’s see how much {slave.he} can endure.',
			'{slave.HeShe} will love the lash in my hands.',
			'I’ll train {slave.him} to crave the pain.',
		]
	if(_id == "FetishMilking"):
		return [
			'I’ll milk {slave.him} dry every day.',
			'{slave.HeShe} will be my personal dairy.',
			'I can’t wait to see {slave.him} leaking.',
			'{slave.HeShe} will be perfect for milking.',
			'I’ll turn {slave.him} into a milk machine.',
		]
	if(_id == "FetishExhibitionism"):
		return [
			'I’ll display {slave.him} for all to see.',
			'{slave.HeShe} will be the center of attention.',
			'I’ll make {slave.him} perform for everyone.',
			'{slave.HeShe} will be my public toy.',
			'{slave.HeShe} loves being watched, and I’ll make sure {slave.he} is.',
			'Everyone will see how much {slave.he} enjoys it.',
		]
	if(_id == "FetishDrugUse"):
		return [
			'I’ll keep {slave.him} hooked for life.',
			'I’ll keep {slave.his} addiction fed.',
			'{slave.HeShe} won’t last long without my supply.',
			'{slave.HeShe} will beg me for a fix every day.',
		]
		
	return []
