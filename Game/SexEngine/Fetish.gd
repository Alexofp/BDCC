extends Object
class_name Fetish

const VaginalSexGiving = "VaginalSexGiving"
const VaginalSexReceiving = "VaginalSexReceiving"
const AnalSexGiving = "AnalSexGiving"
const AnalSexReceiving = "AnalSexReceiving"
const OralSexGiving = "OralSexGiving"
const OralSexReceiving = "OralSexReceiving"
const Tribadism = "Tribadism"
const StraponSexVaginal = "StraponSexVaginal"
const StraponSexAnal = "StraponSexAnal"

const Bodywritings = "Bodywritings"

const Masochism = "Masochism"
const Sadism = "Sadism"
const Choking = "Choking"

const UnconsciousSex = "UnconsciousSex"
const DrugUse = "DrugUse"

const Breeding = "Breeding"
const BeingBred = "BeingBred"
const Condoms = "Condoms"
const Lactation = "Lactation"
const SeedMilking = "SeedMilking"

const Exhibitionism = "Exhibitionism"

const Bondage = "Bondage"
const Rigging = "Rigging"

const RimmingGiving = "RimmingGiving"
const RimmingReceiving = "RimmingReceiving"

const FeetplayGiving = "FeetplayGiving"
const FeetplayReceiving = "FeetplayReceiving"

const HypnosisHypnotist = "HypnosisHypnotist"
const HypnosisSubject = "HypnosisSubject"

const TFGiving = "TFGiving"
const TFReceiving = "TFReceiving"

static func getOppositeFetish(_theFetishID:String) -> String:
	if(_theFetishID == AnalSexGiving):
		return AnalSexReceiving
	if(_theFetishID == AnalSexReceiving):
		return AnalSexGiving
		
	if(_theFetishID == VaginalSexGiving):
		return VaginalSexReceiving
	if(_theFetishID == VaginalSexReceiving):
		return VaginalSexGiving
		
	if(_theFetishID == OralSexGiving):
		return OralSexReceiving
	if(_theFetishID == OralSexReceiving):
		return OralSexGiving
		
	if(_theFetishID == Sadism):
		return Masochism
	if(_theFetishID == Masochism):
		return Sadism
		
	if(_theFetishID == TFGiving):
		return TFReceiving
	if(_theFetishID == TFReceiving):
		return TFGiving
		
	if(_theFetishID == Breeding):
		return BeingBred
	if(_theFetishID == BeingBred):
		return Breeding
		
	if(_theFetishID == Bondage):
		return Rigging
	if(_theFetishID == Rigging):
		return Bondage
		
	if(_theFetishID == RimmingGiving):
		return RimmingReceiving
	if(_theFetishID == RimmingReceiving):
		return RimmingGiving
		
	if(_theFetishID == FeetplayGiving):
		return FeetplayReceiving
	if(_theFetishID == FeetplayReceiving):
		return FeetplayGiving
		
	if(_theFetishID == HypnosisHypnotist):
		return HypnosisSubject
	if(_theFetishID == HypnosisSubject):
		return HypnosisHypnotist
		
	return _theFetishID
