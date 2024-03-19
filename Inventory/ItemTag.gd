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
	PenisPump,
	PenisPumpUsableByNPC,
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
	
	PortalPanties,
	
	AllowsEnslaving,
	ReturnsToPCIfSlaveReleased,
}

static func getName(tag):
	if(tag == Illegal):
		return "Illegal"
	if(tag == BDSMRestraint):
		return "Restraint"
	if(tag == Condom):
		return "Condom"
	return "error"
