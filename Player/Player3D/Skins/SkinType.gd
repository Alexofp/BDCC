extends Object
class_name SkinType

enum {
	Fur,
	Skin,
	SkinAndFur,
	Scales,
}

static func getAll():
	return [Fur, Skin, SkinAndFur, Scales]

static func getName(theSkinType):
	if(theSkinType == Fur):
		return "Fur"
	if(theSkinType == Skin):
		return "Skin"
	if(theSkinType == SkinAndFur):
		return "Skin+Fur"
	if(theSkinType == Scales):
		return "Scales"
	
	return "Error"
