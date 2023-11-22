extends Object
class_name ItemTag

enum {
	Illegal,
	BDSMRestraint,
	CanBeForcedByGuards,
	CanBeForcedInStocks,
	Condom,
	SoldByGeneralVendomat,
	SoldByMedicalVendomat,
	SoldByUnderwearVendomat,
	SoldByTheAnnouncer,
	SoldByAlexRynard,
	ChastityCage,
	Strapon,
	BreastPump,
	BreastPumpUsableByNPC,
	SexEngineDrug,
	Hypnovisor,
	
	GuardUniform,
	NurseUniform,
	EngineerUniform,
	GeneralInmateUniform,
	HighSecurityInmateUniform,
	SexualDeviantInmateUniform,
	
	CanPeeInto,
	CanForceCumInto,
	PlasticBottle,
}

static func getName(tag):
	if(tag == Illegal):
		return "Illegal"
	if(tag == BDSMRestraint):
		return "Restraint"
	if(tag == Condom):
		return "Condom"
	return "error"
