extends Object
class_name SpeciesCompatibility

static func pregnancyChanceMod(motherSpecies: Array, fatherSpecies: Array) -> float:
	var motherIsHybrid = false
	var fatherIsHybrid = false
	var hasAtLeastOneSame = false
	var fullySame = true
	
	if(motherSpecies.size() > 1):
		motherIsHybrid = true
	if(fatherSpecies.size() > 1):
		fatherIsHybrid = true
	
	if(motherSpecies.size() != fatherSpecies.size()):
		fullySame = false
	
	for motherSpecie in motherSpecies:
		if(fatherSpecies.has(motherSpecie)):
			hasAtLeastOneSame = true
			if(!fullySame):
				break
		else:
			fullySame = false
			if(hasAtLeastOneSame):
				break
	
	if(fullySame):
		return 1.0
	
	if((motherIsHybrid && fatherIsHybrid) && hasAtLeastOneSame):
		return 0.3
	
	if((motherIsHybrid || fatherIsHybrid) && hasAtLeastOneSame):
		return 0.5
		
	return 0.2

static func generateChildSpecies(motherSpecies: Array, fatherSpecies: Array, allowHybrids: bool = true) -> Array:
	var possibleResults = []
	for mSpecies in motherSpecies:
		possibleResults.append([[mSpecies], 30.0/motherSpecies.size()])
	if(allowHybrids):
		possibleResults.append([motherSpecies, 10.0])
	
	for fSpecies in fatherSpecies:
		possibleResults.append([[fSpecies], 30.0/fatherSpecies.size()])
	if(allowHybrids):
		possibleResults.append([fatherSpecies, 10.0])

	if(allowHybrids):
		var permuationsAmount = motherSpecies.size() * fatherSpecies.size()
		for mSpecies in motherSpecies:
			for fSpecies in fatherSpecies:
				possibleResults.append([[mSpecies, fSpecies], 20.0 / permuationsAmount])

	var result = Util.uniqueElements(RNG.pickWeightedPairs(possibleResults))
	result.sort()

	return result
