extends Object
class_name BreastsSize

enum {
	FOREVER_FLAT = -1,
	FLAT = 0,
	A = 1,
	B = 2,
	C = 3,
	D = 4,
	DD = 5,
	E = 6,
	EE = 7,
	F = 8,
	FF = 9,
	G = 10,
	GG = 11,
}

static func getAll():
	return [FOREVER_FLAT, FLAT, A, B, C, D, DD, E, EE, F, FF, G, GG]

static func breastSizeToString(bsize):
	if(bsize == FOREVER_FLAT):
		return "Forever flat"
	if(bsize == FLAT):
		return "Flat"
	if(bsize == A):
		return "A"
	if(bsize == B):
		return "B"
	if(bsize == C):
		return "C"
	if(bsize == D):
		return "D"
	if(bsize == DD):
		return "DD"
	if(bsize == E):
		return "E"
	if(bsize == EE):
		return "EE"
	if(bsize == F):
		return "F"
	if(bsize == FF):
		return "FF"
	if(bsize == G):
		return "G"
	if(bsize == GG):
		return "GG"
	return "GG+"
