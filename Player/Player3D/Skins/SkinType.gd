extends Object
class_name SkinType

enum {
	Fur,
	SkinHuman,
	SkinAndFur,
	Scales,
}

static func getAll():
	return [Fur, SkinHuman, SkinAndFur, Scales]

static func getName(theSkinType):
	if(theSkinType == Fur):
		return "Fur"
	if(theSkinType == SkinHuman):
		return "Skin"
	if(theSkinType == SkinAndFur):
		return "Skin+Fur"
	if(theSkinType == Scales):
		return "Scales"
	
	return "Error"
