extends Object
class_name CharacterArchetype

const Top = "Top"
const ServiceTop = "ServiceTop"
const Bottom = "Bottom"
const PowerBottom = "PowerBottom"
const Dom = "Dom"
const Sub = "Sub"
const Switch = "Switch"
const RopeBunny = "RopeBunny"
const Rigger = "Rigger"
const Drugger = "Drugger"
const TestSubject = "TestSubject"
const Breeder = "Breeder"
const BreedingStock = "BreedingStock"

static func getAll():
	return [Top, ServiceTop, Bottom, PowerBottom, Dom, Sub, Switch, RopeBunny, Rigger, Drugger, TestSubject, Breeder, BreedingStock]
	
static func getFetishes(archType):
	match(archType):
		Top:
			return {
				Fetish.AnalSexGiving : FetishInterest.Loves,
				Fetish.VaginalSexGiving : FetishInterest.Loves,
				Fetish.OralSexReceiving : FetishInterest.Loves,
				Fetish.Tribadism : FetishInterest.ReallyLikes,
				
				Fetish.AnalSexReceiving : FetishInterest.Dislikes,
				Fetish.VaginalSexReceiving : FetishInterest.Dislikes,
				Fetish.OralSexGiving : FetishInterest.Dislikes,
			}
		ServiceTop:
			return {
				Fetish.AnalSexGiving : FetishInterest.Loves,
				Fetish.VaginalSexGiving : FetishInterest.Loves,
				Fetish.OralSexReceiving : FetishInterest.Likes,
				Fetish.OralSexGiving : FetishInterest.Loves,
				Fetish.Tribadism : FetishInterest.Loves,
				Fetish.DrugUse : FetishInterest.Likes,
			}
		Bottom:
			return {
				Fetish.AnalSexReceiving : FetishInterest.Loves,
				Fetish.VaginalSexReceiving : FetishInterest.Loves,
				Fetish.OralSexGiving : FetishInterest.Loves,
				Fetish.Tribadism : FetishInterest.Likes,
				
				Fetish.AnalSexGiving : FetishInterest.Dislikes,
				Fetish.VaginalSexGiving : FetishInterest.Dislikes,
			}
		PowerBottom:
			return {
				Fetish.AnalSexReceiving : FetishInterest.Loves,
				Fetish.VaginalSexReceiving : FetishInterest.Loves,
				Fetish.OralSexGiving : FetishInterest.Likes,
				Fetish.Tribadism : FetishInterest.Loves,
				Fetish.OralSexReceiving : FetishInterest.Likes,
				Fetish.DrugUse : FetishInterest.Likes,
			}
		Dom:
			return {
				Fetish.Bodywritings : FetishInterest.ReallyLikes,
				Fetish.UnconsciousSex : FetishInterest.Likes,
				Fetish.Condoms : FetishInterest.Likes,
				Fetish.Rigging : FetishInterest.Likes,
				Fetish.Sadism : FetishInterest.Loves,
				Fetish.Choking : FetishInterest.Likes,
				Fetish.FeetplayGiving : FetishInterest.SlightlyLikes,
				
				Fetish.Masochism : FetishInterest.Hates,
				Fetish.Bondage : FetishInterest.Hates,
			}
		Sub:
			return {
				Fetish.Bodywritings : FetishInterest.ReallyLikes,
				Fetish.UnconsciousSex : FetishInterest.Likes,
				Fetish.Condoms : FetishInterest.Likes,
				Fetish.Masochism : FetishInterest.Loves,
				Fetish.Bondage : FetishInterest.Likes,
				
				Fetish.Rigging : FetishInterest.Hates,
				Fetish.Sadism : FetishInterest.Hates,
			}
		Switch:
			return {
				Fetish.Bodywritings : FetishInterest.Likes,
				Fetish.UnconsciousSex : FetishInterest.Likes,
				Fetish.Condoms : FetishInterest.Likes,
				Fetish.Masochism : FetishInterest.Likes,
				Fetish.Bondage : FetishInterest.Likes,
				Fetish.Rigging : FetishInterest.Likes,
				Fetish.Sadism : FetishInterest.Likes,
				Fetish.DrugUse : FetishInterest.Likes,
				Fetish.Choking : FetishInterest.Likes,
			}
		RopeBunny:
			return {
				Fetish.Masochism : FetishInterest.Likes,
				Fetish.Bondage : FetishInterest.Loves,
				Fetish.Lactation : FetishInterest.Likes,
				
				Fetish.Rigging : FetishInterest.Hates,
			}
		Rigger:
			return {
				Fetish.Sadism : FetishInterest.Likes,
				Fetish.Rigging : FetishInterest.Loves,
				
				Fetish.Bondage : FetishInterest.Hates,
			}
		Drugger:
			return {
				Fetish.Sadism : FetishInterest.Likes,
				Fetish.UnconsciousSex : FetishInterest.Likes,
				Fetish.DrugUse : FetishInterest.Loves,
				Fetish.Lactation : FetishInterest.Likes,
			}
		TestSubject:
			return {
				Fetish.Masochism : FetishInterest.Likes,
				Fetish.UnconsciousSex : FetishInterest.Loves,
				Fetish.DrugUse : FetishInterest.Loves,
				Fetish.BeingBred : FetishInterest.Likes,
				Fetish.Choking : FetishInterest.Likes,
				Fetish.Lactation : FetishInterest.Likes,
			}
		Breeder:
			return {
				Fetish.Breeding : FetishInterest.Loves,
				Fetish.BeingBred : FetishInterest.Dislikes,
				Fetish.DrugUse : FetishInterest.Likes,
				Fetish.VaginalSexGiving : FetishInterest.Loves,
				Fetish.AnalSexGiving : FetishInterest.Likes,
				Fetish.Lactation : FetishInterest.Likes,
			}
		BreedingStock:
			return {
				Fetish.BeingBred : FetishInterest.Loves,
				Fetish.Breeding : FetishInterest.Dislikes,
				Fetish.VaginalSexReceiving : FetishInterest.Loves,
				Fetish.AnalSexReceiving : FetishInterest.Likes,
				Fetish.Lactation : FetishInterest.Likes,
			}
	
	return {}

const Brat = "Brat"
const Mean = "Mean"
const Subby = "Subby"
const Impatient = "Impatient"
const Naive = "Naive"
const Coward = "Coward"

static func getPersonalityChanges(archType):
	match(archType):
		Top:
			return {
				PersonalityStat.Mean: 0.7,
				PersonalityStat.Brat: 0.2,
				PersonalityStat.Subby: -0.5,
				PersonalityStat.Impatient: 0.5,
				PersonalityStat.Naive: -0.1,
				PersonalityStat.Coward: -0.2,
			}
		ServiceTop:
			return {
				PersonalityStat.Mean: -0.3,
				PersonalityStat.Brat: -0.2,
				PersonalityStat.Subby: 0.5,
				PersonalityStat.Impatient: -0.2,
				PersonalityStat.Naive: 0.1,
				PersonalityStat.Coward: 0.1,
			}
		Bottom:
			return {
				PersonalityStat.Mean: -0.1,
				PersonalityStat.Brat: -0.2,
				PersonalityStat.Subby: 0.7,
				PersonalityStat.Impatient: -0.1,
				PersonalityStat.Naive: 0.4,
				PersonalityStat.Coward: 0.3,
			}
		PowerBottom:
			return {
				PersonalityStat.Mean: 0.2,
				PersonalityStat.Brat: 0.7,
				PersonalityStat.Subby: -0.3,
				PersonalityStat.Impatient: 0.2,
				PersonalityStat.Naive: -0.2,
				PersonalityStat.Coward: 0.2,
			}
		Dom:
			return {
				PersonalityStat.Mean: 0.5,
				PersonalityStat.Brat: -0.2,
				PersonalityStat.Subby: -0.7,
				PersonalityStat.Impatient: -0.1,
				PersonalityStat.Naive: -0.1,
				PersonalityStat.Coward: -0.1,
			}
		Sub:
			return {
				PersonalityStat.Mean: -0.5,
				PersonalityStat.Brat: -0.2,
				PersonalityStat.Subby: 0.8,
				PersonalityStat.Impatient: -0.3,
				PersonalityStat.Naive: 0.5,
				PersonalityStat.Coward: 0.5,
			}
		Switch:
			return {
				PersonalityStat.Mean: 0.1,
				PersonalityStat.Brat: 0.3,
				PersonalityStat.Subby: 0.05,
				PersonalityStat.Impatient: 0.1,
				PersonalityStat.Naive: -0.1,
				PersonalityStat.Coward: 0.1,
			}
		RopeBunny:
			return {
				PersonalityStat.Brat: 0.2,
				PersonalityStat.Subby: 0.3,
				PersonalityStat.Impatient: 0.2,
				PersonalityStat.Naive: 0.3,
				PersonalityStat.Coward: 0.2,
			}
		Rigger:
			return {
				PersonalityStat.Subby: -0.2,
				PersonalityStat.Naive: -0.3,
			}
		Drugger:
			return {
				PersonalityStat.Mean: 0.6,
				PersonalityStat.Naive: -0.3,
			}
		TestSubject:
			return {
				PersonalityStat.Subby: 0.4,
				PersonalityStat.Impatient: 0.1,
				PersonalityStat.Naive: 0.6,
				PersonalityStat.Coward: 0.1,
			}
		Breeder:
			return {
				PersonalityStat.Impatient: 0.1,
			}
		BreedingStock:
			return {
				PersonalityStat.Brat: -0.2,
				PersonalityStat.Subby: 0.3,
			}
	
	return {}
