extends Reference
class_name RestraintMaterial

enum {
	Leather,
	CheapLeather,
	Iron,
	Cloth,
	Rubber,
	Rope,
}

static func getVisibleName(material):
	if(material == Leather):
		return "leather"
	if(material == CheapLeather):
		return "cheap leather"
	if(material == Iron):
		return "iron"
	if(material == Cloth):
		return "cloth"
	if(material == Rubber):
		return "rubber"
	if(material == Rope):
		return "rope"
	
	return "Error?"

# more - harder to shake off
static func getMaterialTightness(material):
	if(material == CheapLeather):
		return 0.5
	if(material == Leather):
		return 1.0
	if(material == Cloth):
		return 0.9
	if(material == Rubber):
		return 1.5
	if(material == Rope):
		return 1.1
	if(material == Iron):
		return 0.8
	return 1

# more - harder to break
static func getMaterialDurability(material):
	if(material == CheapLeather):
		return 0.4
	if(material == Leather):
		return 1.0
	if(material == Cloth):
		return 0.3
	if(material == Rubber):
		return 0.9
	if(material == Rope):
		return 1.1
	if(material == Iron):
		return 2.0
	return 1

